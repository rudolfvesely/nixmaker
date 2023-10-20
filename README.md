# nixmaker

Nixmaker derives all NixOS hosts from a flake and compresses the resulting files.

* List hosts
```
nixmaker list --flake sample/ --directory /tmp
```
* Build tarballs
```
nixmaker build --flake sample/ --directory /tmp
```
