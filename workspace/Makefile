IMAGE=ghcr.io/zephirdev/turbo/workspace:2024.1.0

build:
	cd docker && docker build --progress=plain -t $(IMAGE) .

push:
	docker push $(IMAGE)

setup-workspace:
	sudo mkdir -p "/mnt/turbo/workspace/cache"
	sudo chown 1000:1000 -R /mnt/turbo
	sudo snap install microk8s --classic
	/snap/bin/microk8s helm upgrade turbo-workspace ./helm --namespace turbo-workspace --create-namespace --install --set "docker_config=$$(cat $(HOME)/.docker/config.json | base64 -w 0)" --debug
