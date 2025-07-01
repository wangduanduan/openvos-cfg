m4_changequote(<<,>>)m4_dnl
m4_changecom(<</*>>, <<*/>>)m4_dnl
# openvos-cfg my_version
# build at my_build_time

m4_include(<<src/define_env.m4>>)m4_dnl
m4_include(<<src/define_const.m4>>)m4_dnl
m4_include(<<src/define_fun.m4>>)m4_dnl
m4_include(<<src/define_status.m4>>)m4_dnl
m4_include(<<src/global_params.m4>>)m4_dnl
m4_include(<<src/modules.m4>>)m4_dnl

m4_include(<<src/r_pre_check.m4>>)m4_dnl
m4_include(<<src/r_seq_request.m4>>)m4_dnl

route{
    route(r_pre_check);

	if (has_totag()) {
        route(r_seq_request);
	}

	if (is_method("CANCEL")) {
		if (t_check_trans())
			t_relay();
		exit;
	}

	# absorb retransmissions, but do not create transaction
	t_check_trans();

	if ( !(is_method("REGISTER")) ) {
		
		if (is_myself("$fd")) {
					
		} else {
			# if caller is not local, then called number must be local
			
			if (!is_myself("$rd")) {
				send_reply(E_FORBIDDEN_CODE,"E_FORBIDDEN_DESC");
				X_ERR(X_BAN_IP);
				exit;
			}
		}

	}

	# preloaded route checking
	if (loose_route()) {
		X_LOG(preload route)

		if (!is_method("ACK"))
			send_reply(E_FORBIDDEN_CODE,"E_FORBIDDEN_DESC");
		exit;
	}

	# record routing
	if (!is_method("REGISTER|MESSAGE"))
		record_route();

	# account only INVITEs
	if (is_method("INVITE")) {
		
		do_accounting("log");
	}

	
	if (!is_myself("$rd")) {
		append_hf("P-hint: outbound\r\n"); 
		
		route(relay);
	}

	# requests for my domain
	


	if (is_method("REGISTER")) {
		# store the registration and generate a SIP reply
		if (!save("location"))
			xlog("failed to register AoR $tu\n");

		exit;
	}

	if ($rU==NULL) {
		# request with no Username in RURI
		send_reply(484,"Address Incomplete");
		exit;
	}

	# do lookup with method filtering
	if (!lookup("location","method-filtering")) {
		t_reply(404, "Not Found");
		exit;
	}

	# when routing via usrloc, log the missed calls also
	do_accounting("log","missed");
	route(relay);
}


route[relay] {
	# for INVITEs enable some additional helper routes
	if (is_method("INVITE")) {
		t_on_branch("per_branch_ops");
		t_on_reply("handle_nat");
		t_on_failure("missed_call");
	}

	if (!t_relay()) {
		send_reply(500,"Internal Error");
	}
	exit;
}




branch_route[per_branch_ops] {
	xlog("new branch at $ru\n");
}


onreply_route[handle_nat] {
	xlog("incoming reply\n");
}


failure_route[missed_call] {
	if (t_was_cancelled()) {
		exit;
	}

	# uncomment the following lines if you want to block client 
	# redirect based on 3xx replies.
	##if (t_check_status("3[0-9][0-9]")) {
	##t_reply(404,"Not found");
	##	exit;
	##}

	
}



