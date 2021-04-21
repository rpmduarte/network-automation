# Output for VPN Gateway
#output vpn_gateway_info { value = google_compute_ha_vpn_gateway.*.vpn_interfaces.ip_address }

# Outputs for Secondary tunnel and BGP peer
output vpn_tun0_psk { value = random_password.PEER0_PSK.*.result }
output vpn_tun0_gcp_ip { value = google_compute_router_interface.ROUTER_INTERFACE0.*.ip_range }

# Outputs for Secondary tunnel and BGP peer
output vpn_tun1_psk { value = random_password.PEER1_PSK.*.result }
output vpn_tun1_gcp_ip { value = google_compute_router_interface.ROUTER_INTERFACE0.*.ip_range }

