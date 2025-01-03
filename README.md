### Description
POC for quickly spinning up a kubernetes cluster using ansible and terraform.
Creates one control-plane and one worker node on Hetzner debian-based instances, 
using kubeadm with CRI-O and Cilium. The point was to see how fast you 
can spin up an almost-production-ready kubernetes cluster. For me this took less
than 3 minutes, including the time it took to install Cilium:

```bash
time ./fastkube.sh

...

./fastkube.sh  6.12s user 1.54s system 5% cpu 2:22.21 total
```

### How to use

To spin up the instances, and create the kubernetes cluster, [create an api token for your hetzner project](https://docs.hetzner.com/cloud/api/getting-started/generating-api-token/) and run the following script:

```bash
# should be set to the api token you just created
export HCLOUD_TOKEN="..."

./fastkube.sh
```

The script will create a local `./kubeconfig` file that you can use to connect to your cluster.

```
KUBECONFIG=kubeconfig kubectl get node
```

```
NAME            STATUS   ROLES           AGE    VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                         KERNEL-VERSION   CONTAINER-RUNTIME
control-plane   Ready    control-plane   110s   v1.31.2   x.xx.xxx.xx   <none>        Debian GNU/Linux 12 (bookworm)   6.1.0-26-amd64   cri-o://1.30.6
worker1         Ready    <none>          97s    v1.31.2   x.xx.xx.xxx   <none>        Debian GNU/Linux 12 (bookworm)   6.1.0-26-amd64   cri-o://1.30.6
```

To tear everything down, run:

```bash
./destroy_infra.sh
```

### Notes

- The Hetzner instances are currently based in the `us-west` region. You might want to change this to a region closer to you.
- The Hetzner instances never took longer than a minute to spin up for me, but you may need to tune the configuration of the `wait for nodes to start` step in `./ansible/playbook.yml` if your servers take a particularly long time to spin up.
- In order to avoid interactive events interrupting the `./fastkube.sh` command, `ANSIBLE_HOST_KEY_CHECKING` is set to false while running the ansible playbook (to stop the host key approval prompt from popping up), and the `-auto-approve` flag is turned on when running `terraform apply`.
