ROOT="${PWD}"
REPOSITORIES=(
    'build'
    'frameworks/base'
    'frameworks/native'
    'packages/apps/Contacts'
    'packages/apps/ContactsCommon'
    'packages/apps/Dialer'
    'packages/apps/ExactCalculator'
    'packages/apps/PhoneCommon'
    'packages/apps/Settings'
    'system/sepolicy'
    'vendor/sm'
)

for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

    git am --keep-cr "${ROOT}/vendor/extra/patches/${repository}"/*

    cd "${ROOT}"
done
