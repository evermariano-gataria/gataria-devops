FROM ubuntu:22.04
COPY config /usr/src/app/
WORKDIR /usr/src/app
RUN apt update && apt install curl -y
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \
    && chmod +x get_helm.sh && ./get_helm.sh
ENV KUBECONFIG=/usr/src/app/config