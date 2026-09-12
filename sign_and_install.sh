set -e

IPA_PATH="./Application/Astrix.ipa"
if [ ! -f "$IPA_PATH" ]; then
    IPA_PATH="./Application/Dopamine.ipa"
fi

zsign -k ./.sign/pkey.p12 -p 1234 -m ./.sign/development.cer -b $1 -m ./.sign/profile.mobileprovision -o ./.sign/Astrix.signed.ipa "$IPA_PATH"
ideviceinstaller install ./.sign/Astrix.signed.ipa