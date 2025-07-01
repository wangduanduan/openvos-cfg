#
route[r_pre_check] {
	if (!mf_process_maxfwd_header(10)) {
		send_reply(E_LOOPED_CODE,"E_LOOPED_DESC");
		exit;
	}

	if (is_method("PUBLISH|SUBSCRIBE")) {
		send_reply(E_NOT_SUPPORT_CODE, "E_NOT_SUPPORT_DESC");
		exit;
	}
}
