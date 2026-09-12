.PHONY: all clean build_clean

all: Astrix.tipa

Astrix.tipa: build/Build/Products/Debug-iphoneos/Dopamine.app
	@echo Ad-Hoc signing Astrix
	xattr -rc build/Build/Products/Debug-iphoneos/Dopamine.app
	ldid -SDopamine/Dopamine.entitlements build/Build/Products/Debug-iphoneos/Dopamine.app/Dopamine
	ldid -s build/Build/Products/Debug-iphoneos/Dopamine.app
	rm -rf Payload Astrix.ipa Astrix.tipa Dopamine.ipa Dopamine.tipa
	mkdir Payload
	cp -r build/Build/Products/Debug-iphoneos/Dopamine.app Payload/Dopamine.app
	zip -Ar Astrix.ipa Payload
	rm -rf Payload
	cp Astrix.ipa Astrix.tipa
	cp Astrix.ipa Dopamine.ipa
	cp Astrix.ipa Dopamine.tipa

ifeq ($(NIGHTLY), 1)
build/Build/Products/Debug-iphoneos/Dopamine.app: FORCE
	xcodebuild -scheme Dopamine -derivedDataPath build -destination 'generic/platform=iOS' CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO GCC_PREPROCESSOR_DEFINITIONS='NIGHTLY=1 COMMIT_HASH=\"$(COMMIT_HASH)\"'
else
build/Build/Products/Debug-iphoneos/Dopamine.app: FORCE
	xcodebuild -scheme Dopamine -derivedDataPath build -destination 'generic/platform=iOS' CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
endif

clean:
	rm -rf build Payload Astrix.ipa Astrix.tipa Dopamine.ipa Dopamine.tipa

build_clean:
	rm -rf Payload build

FORCE: ;