all:
	cd LINK; \
		gcc -x c -o LINK -IINCLUDE -I../ *.C
	cd RGBFIX; \
		gcc -x c -o RGBFIX -I../ MAIN.C
	cd ASM; \
		cat YACCPRT1.Y > ASMY.Y; \
		cat GAMEBOY/YACCPRT2.Y >> ASMY.Y; \
		cat YACCPRT3.Y >> ASMY.Y; \
		cat GAMEBOY/YACCPRT4.Y >> ASMY.Y; \
		bison -d -o GAMEBOY/ASMY.C ASMY.Y; \
		patch INCLUDE/OUTPUT.H ../patch; \
		gcc -x c -o ASM -DGAMEBOY=1 -I../ -IINCLUDE -IGAMEBOY GAMEBOY/asmy.c MAIN.C FSTACK.C GLOBLEX.C LEXER.C MATH.C OUTPUT.C RPN.C SYMBOL.C GAMEBOY/LOCALLEX.C
	mkdir rgbds
	mv LINK/LINK rgbds/link
	mv RGBFIX/RGBFIX rgbds/rgbfix
	mv ASM/ASM rgbds/asm
	chmod u+x rgbds/*
	tar -cvf rgbds.tar rgbds
