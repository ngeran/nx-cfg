{ pkgs, ... }: {
  networking.wg-quick.interfaces = let
    server_ip = "18.19.23.66";
  in {
     # "wg0" is the network interface name. You can name the interface arbitrarily
    wg0 = {
    # Determines the IP/IPv6 address and subnet of the client's end of the tunnel interface
    # IP address of this machine in the *tunnel network*
      address = [ "100.96.5.249/32" ];
    # The port that WireGuard listens to - recommended that this be changed from default
    # To match firewall allowedUDPPorts (without this wg
    # uses random port numbers).
      listenPort = 51820;

      # Path to the private key file.
      privateKeyFile = "/etc/mullvad-vpn.key";

      # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
      postUp = ''
        ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.0.0.1/24 -o eth0 -j MASQUERADE
        ${pkgs.iptables}/bin/ip6tables -A FORWARD -i wg0 -j ACCEPT
        ${pkgs.iptables}/bin/ip6tables -t nat -A POSTROUTING -s fdc9:281f:04d7:9ee9::1/64 -o eth0 -j MASQUERADE
      '';

      # Undo the above
      preDown = ''
        ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.0.0.1/24 -o eth0 -j MASQUERADE
        ${pkgs.iptables}/bin/ip6tables -D FORWARD -i wg0 -j ACCEPT
        ${pkgs.iptables}/bin/ip6tables -t nat -D POSTROUTING -s fdc9:281f:04d7:9ee9::1/64 -o eth0 -j MASQUERADE
      '';

      peers = [{
        # [Peer 0] section -> PublicKey
        publicKey = "1493vtFUbIfSpQKRBki/1d0YgWIQwMV4AQAvGxjCNVM=";
        # [Peer 0] section -> AllowedIPs
        allowedIPs = [ "0.0.0.0/0" ];
        # [Peer 0] section -> Endpoint:port
        endpoint = "${server_ip}:51820";
        persistentKeepalive = 25;
      }];
    };
  };
}
