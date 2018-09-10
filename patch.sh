ROOT="${PWD}"
PATCH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $PATCH

REPOSITORIES=(
    'build/make'
    'frameworks/base'
    'packages/apps/Settings'
    'system/sepolicy'
)

for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"
    git am --keep-cr "${PATCH}/patches/${repository}"/*.patch
    cd "${ROOT}"
done
