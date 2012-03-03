all:
	mkdir rgbds
	
	cd LINK; \
		gcc -x c -o link -IINCLUDE -I../ *.C; \
		mv link ../rgbds
		
	cd RGBFIX; \
		gcc -x c -o rgbfix -I../ MAIN.C; \
		mv rgbfix ../rgbds
		
	cd LIB; \
		gcc -x c -o lib -I../ -IINCLUDE *.C; \
		mv lib ../rgbds
		
	cd ASM; \
		cat YACCPRT1.Y > ASMY.Y; \
		cat GAMEBOY/YACCPRT2.Y >> ASMY.Y; \
		cat YACCPRT3.Y >> ASMY.Y; \
		cat GAMEBOY/YACCPRT4.Y >> ASMY.Y; \
		bison -d -o GAMEBOY/ASMY.C ASMY.Y; \
		patch INCLUDE/OUTPUT.H ../patch; \
		gcc -x c -o asm -DGAMEBOY=1 -I../ -IINCLUDE -IGAMEBOY GAMEBOY/asmy.c MAIN.C FSTACK.C GLOBLEX.C LEXER.C MATH.C OUTPUT.C RPN.C SYMBOL.C GAMEBOY/LOCALLEX.C; \
		mv asm ../rgbds
		
	chmod u+x rgbds/*
	tar -cvf rgbds.tar rgbds
