### Description
POC for quickly spinning up a kubernetes cluster using ansible and terraform.
Creates one control-plane and one worker node on Hetzner debian-based instances, 
usign kubeadm and the cri-o container runtime

### How to use

To spin up the instances and create the kubernetes cluster run:

```bash
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
