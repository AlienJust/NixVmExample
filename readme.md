# Simple VM

## Build
``nixos-rebuild build-vm --flake .#test``

or

``nix build .#nixosConfigurations.test.config.system.build.vm``


## Run
``export QEMU_NET_OPTS="hostfwd=tcp::2221-:22"``

``result/bin/run-nixos-vm``


## SSH into VM
``ssh -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no admin@localhost -p 2221``