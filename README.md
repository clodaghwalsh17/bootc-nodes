Instructions to generate an image to boot a device with a basic bootc based operating system.

1. sudo podman pull quay.io/fedora/fedora-bootc:40
2. mkdir output
3. Copy sample-config.toml to config.toml and populate with your credentials to log into the system once booted
4. sudo podman run --rm  -it --privileged --pull=newer --security-opt label=type:unconfined_t -v $(pwd)/config.toml:/config.toml:ro -v $(pwd)/output:/output -v /var/lib/containers/storage:/var/lib/containers/storage quay.io/centos-bootc/bootc-image-builder:latest --local --type qcow2 --rootfs xfs quay.io/fedora/fedora-bootc:40

Specify the ip of the host to boot with the `HOST` environment variable. The `IMAGE` variables point to a hosted image that uses bootc as the base image and includes the app logic. After running the switch script the machine runs the app described in the Containerfile as a native OS app. Run the `switch` script to remotely execute the switch command and boot into the system running the app. 

```shell
export HOST=127.0.0.1
export IMAGE=quay.io/user/image:tag
./switch.sh
```

If the error belows occurs this means that the image cant be found most likely because the image tag was not specified.

```shell
ERROR Switching: Pulling: Creating importer: Failed to invoke skopeo proxy method OpenImage: remote error: reading manifest latest in quay.io/clwalsh/bootc-example: manifest unknown
```