docker:
	docker build -t ${DOCKER_LOGIN}/go-chat-backend:${TAG} -f Dockerfile .

push: docker
	echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_LOGIN}" --password-stdin; \
	docker push ${DOCKER_LOGIN}/go-chat-backend:${TAG}