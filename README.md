# kube-deploy

Automatic build of a Docker image containing:
* `kubectl` in the version specified by the image's tag
* Some basic templating tools: `envsubst` and [`gomplate`](https://github.com/hairyhenderson/gomplate)
* [`aws-iam-authenticator`](https://github.com/kubernetes-sigs/aws-iam-authenticator) to authenticate with EKS clusters
* [Helm 3](https://helm.sh/)
