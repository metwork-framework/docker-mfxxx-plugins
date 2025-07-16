/bin/bash: :wq: command not found





#set -eu
set -x

BRANCH="${PAYLOAD_BRANCH}"
REPO="${PAYLOAD_REPO}"
ROCKY="rocky${PAYLOAD_ROCKY_VERSION}"
ROCKY_NUMBER="${PAYLOAD_ROCKY_VERSION}"
IMAGE="metwork/${PAYLOAD_REPO}-rocky${PAYLOAD_ROCKY_VERSION}:${PAYLOAD_TAG}"

echo "branch=${BRANCH}" >> ${GITHUB_OUTPUT}
echo "repo=${REPO}" >> ${GITHUB_OUTPUT}
echo "image=${IMAGE}" >> ${GITHUB_OUTPUT}
echo "rocky=${ROCKY}" >> ${GITHUB_OUTPUT}
echo "rocky_number=${ROCKY_NUMBER}" >> ${GITHUB_OUTPUT}
