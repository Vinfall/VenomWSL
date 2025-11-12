OUT_ZIP=Venom.zip
LNCR_EXE=Venom.exe

DLR=curl
DLR_FLAGS=--silent --location
BASE_URL_SYSV="https://nc.abetech.es/index.php/s/QX2taybWRBnyLFS/download?path=%2F&files=venomlinux-rootfs-sysv-x86_64.tar.xz"
BASE_URL_S6="https://nc.abetech.es/index.php/s/mtpAqi7BBPDXEPB/download?path=%2F&files=venomlinux-rootfs-s6-x86_64.tar.xz"
LNCR_ZIP_URL=https://github.com/yuk7/wsldl/releases/download/`curl https://api.github.com/repos/yuk7/wsldl/releases/latest -s | jq .name -r`/icons.zip
LNCR_ZIP_EXE=Venom.exe

all: $(OUT_ZIP)

zip: $(OUT_ZIP)
$(OUT_ZIP): ziproot
	@echo -e '\e[1;31mBuilding $(OUT_ZIP)\e[m'
	cd ziproot; bsdtar -a -cf ../$(OUT_ZIP) *
	sha512sum $(OUT_ZIP) > $(OUT_ZIP).sha512

ziproot: Launcher.exe rootfs.tar.xz
	@echo -e '\e[1;31mBuilding ziproot...\e[m'
	mkdir ziproot
	cp Launcher.exe ziproot/${LNCR_EXE}
	cp rootfs.tar.xz ziproot/

exe: Launcher.exe
Launcher.exe: icons.zip
	@echo -e '\e[1;31mExtracting Launcher.exe...\e[m'
	unzip icons.zip $(LNCR_ZIP_EXE)
	mv $(LNCR_ZIP_EXE) Launcher.exe

icons.zip:
	@echo -e '\e[1;31mDownloading icons.zip...\e[m'
	$(DLR) $(DLR_FLAGS) $(LNCR_ZIP_URL) -o icons.zip

rootfs.tar.xz:
	@echo -e '\e[1;31mDownloading rootfs...\e[m'
	$(DLR) $(DLR_FLAGS) $(BASE_URL_S6) -o rootfs.tar.xz

clean:
	@echo -e '\e[1;31mCleaning files...\e[m'
	-rm -r ziproot
	-rm Launcher.exe
	-rm icons.zip
	-rm rootfs.tar.xz

help: ## show this help
	@echo "Specify a command:"
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[0;36m%-12s\033[m %s\n", $$1, $$2}'
	@echo ""
.PHONY: help
