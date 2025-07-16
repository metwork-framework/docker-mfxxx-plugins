/bin/bash




#set -eu
set -x

case "${GITHUB_EVENT_NAME}" in
    repository_dispatch)
	if [[ ${PAYLOAD_TAG} == v* ]]; then
	  TAG=${PAYLOAD_TAG##v}
	else
	  TAG=${PAYLOAD_TAG}
	fi
        BRANCH=${PAYLOAD_BRANCH}
        REPO=${PAYLOAD_REPO}
        ROCKY=rocky${PAYLOAD_ROCKY_VERSION}
        ROCKY_NUMBER=${PAYLOAD_ROCKY_VERSION}
        IMAGE=metwork/${PAYLOAD_REPO}-rocky${PAYLOAD_ROCKY_VERSION}:${TAG};;
    workflow_dispatch)
	if [[ ${WORKFLOW_TAG} == v* ]]; then
	  TAG=${WORKFLOW_TAG##v}
	else
	  TAG=${WORKFLOW_TAG}
	fi
        BRANCH=${WORKFLOW_BRANCH}
        REPO=${WORKFLOW_REPO}
        ROCKY=rocky${WORKFLOW_ROCKY_VERSION}
        ROCKY_NUMBER=${WORKFLOW_ROCKY_VERSION}
        IMAGE=metwork/${WORKFLOW_REPO}-rocky${WORKFLOW_ROCKY_VERSION}:${TAG};;
esac

echo "branch=${BRANCH}" >> ${GITHUB_OUTPUT}
echo "repo=${REPO}" >> ${GITHUB_OUTPUT}
echo "image=${IMAGE}" >> ${GITHUB_OUTPUT}
echo "rocky=${ROCKY}" >> ${GITHUB_OUTPUT}
echo "rocky_number=${ROCKY_NUMBER}" >> ${GITHUB_OUTPUT}
