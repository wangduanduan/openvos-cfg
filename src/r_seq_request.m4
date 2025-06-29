route[r_seq_request] {
    # handle hop-by-hop ACK (no routing required)
    if ( is_method("ACK") && t_check_trans() ) {
        t_relay();
        exit;
    }

    # sequential request within a dialog should
    # take the path determined by record-routing
    if ( !loose_route() ) {
        # we do record-routing for all our traffic, so we should not
        # receive any sequential requests without Route hdr.
        send_reply(E_NOT_FOUND_CODE,"E_NOT_FOUND_DESC");
        exit;
    }

    if (is_method("BYE")) {
        # do accounting even if the transaction fails
        do_accounting("log","failed");
    }

    # route it out to whatever destination was set by loose_route()
    # in $du (destination URI).
    route(relay);
    exit;
}
