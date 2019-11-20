FROM alpine:3.10.3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories \
  && apk add --no-cache ca-certificates openssl bash gettext gomplate curl jq

RUN curl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator \
  && chmod +x /usr/local/bin/aws-iam-authenticator

ARG HELM_VERSION=v3.0.0
RUN curl https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -o /tmp/helm.tar.gz \
  && tar -zxf /tmp/helm.tar.gz -C /tmp \
  && mv /tmp/linux-amd64/helm /usr/local/bin/helm \
  && chmod +x /usr/local/bin/helm \
  && rm -rf /tmp/*

ARG KUBE_VERSION=v1.16.3
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl
