#!/usr/bin/env bash
ARCH=${ARCH:-amd64}
DOCKER_REGISTRY=${DOCKER_REGISTRY:-docker-snapshot.otlabs.fr}
VERSION=${VERSION:-1.14.2}

printf "ARCH = %s\nDOCKER REGISTRY = %s\nVARSION = %s\n" "$ARCH" "$DOCKER_REGISTRY" "$VERSION"

#printf "Pulling %s image ...\n" "gcr.io/google_containers/k8s-dns-dnsmasq-${ARCH}:${VERSION}"
#docker pull gcr.io/google_containers/k8s-dns-dnsmasq-${ARCH}:${VERSION}
#printf "Starting %s container ..." "gcr.io/google_containers/k8s-dns-dnsmasq-${ARCH}:${VERSION}"
#docker run -d --name=kube-dns-masq --entrypoint=tail gcr.io/google_containers/k8s-dns-dnsmasq-${ARCH}:${VERSION} -f /dev/stderr
#printf "Copying dnsma"
#docker cp kube-dns-masq:/usr/sbin/dnsmasq .
#docker stop kube-dns-masq
#docker rm kube-dns-masq
#docker rmi gcr.io/google_containers/k8s-dns-dnsmasq-${ARCH}:${VERSION}

printf "Building image %s\n" "${DOCKER_REGISTRY}/infra/docker-dnsmasq-${ARCH}:${VERSION}"
docker build -t ${DOCKER_REGISTRY}/infra/docker-dnsmasq-${ARCH}:${VERSION} .

#docker push ${DOCKER_REGISTRY}/infra/docker-dnsmasq-${ARCH}:${VERSION}
#docker rmi ${DOCKER_REGISTRY}/infra/docker-dnsmasq-${ARCH}:${VERSION}