QRENCODE=./third_party/libqrencode/qrencode 

all: libqrencode genqrcode compile

libqrencode:
	if [ ! -f $(QRENCODE) ]; then git submodule update --init; cd third_party/libqrencode/; mkdir -p m4; ./autogen.sh; ./configure; make; fi;

genqrcode: libqrencode
	mkdir -p img/;
	$(QRENCODE) -o ./img/qrcode.png "`./third_party/vcard.sh`";

compile: genqrcode
	mkdir -p out;
	TEXINPUTS="./src/:" lualatex --output-directory=out cv.tex

clean:
	rm -rf out/
	rm img/qrcode.png
	cd third_party/libqrencode; make clean; 

.PHONY: libqrencode genqrcode
