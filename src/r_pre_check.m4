#
route[r_pre_check] {
	if (!mf_process_maxfwd_header(10)) {
		send_reply(E_LOOPED_CODE,"E_LOOPED_DESC");
		exit;
	}
}
