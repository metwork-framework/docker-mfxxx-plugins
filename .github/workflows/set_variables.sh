/bin/bash




#set -eu
set -x

case "${GITHUB_EVENT_NAME}" in
    repository_dispatch)
        BRANCH=${PAYLOAD_BRANCH}
        REPO=${PAYLOAD_REPO}
        ROCKY=rocky${PAYLOAD_ROCKY_VERSION}
        ROCKY_NUMBER=${PAYLOAD_ROCKY_VERSION}
        IMAGE=metwork/${PAYLOAD_REPO}-rocky${PAYLOAD_ROCKY_VERSION}:${PAYLOAD_TAG};;
    workflow_dispatch)
        BRANCH=${WORKFLOW_BRANCH}
        REPO=${WORKFLOW_REPO}
        ROCKY=rocky${WORKFLOW_ROCKY_VERSION}
        ROCKY_NUMBER=${WORKFLOW_ROCKY_VERSION}
        IMAGE=metwork/${WORKFLOW_REPO}-rocky${WORKFLOW_ROCKY_VERSION}:${WORKFLOW_TAG};;
esac

echo "branch=${BRANCH}" >> ${GITHUB_OUTPUT}
echo "repo=${REPO}" >> ${GITHUB_OUTPUT}
echo "image=${IMAGE}" >> ${GITHUB_OUTPUT}
echo "rocky=${ROCKY}" >> ${GITHUB_OUTPUT}
echo "rocky_number=${ROCKY_NUMBER}" >> ${GITHUB_OUTPUT}
