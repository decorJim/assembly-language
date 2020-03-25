
#include <stdio.h>

unsigned int Decryption_fct(unsigned int le)
{
	unsigned int be;

	/*
	 * Remplacez le code suivant par de l'assembleur en ligne
	 * en utilisant le moins d'instructions possible
	 
	 be = (le & 0xff000000) | (le&0xff) << 16  | (le & 0xff00) | (le & 0xff0000) >> 16;
	 */
	

	asm volatile (
		// instructions...
        "movl %1, %0;" // place le dans be
        "bswap %0;"  // inversement des 2
        "ror $8, %0;" // rotation vers la droite de 1 Byte
        
		:"=s"(be) // sorties (s'il y a lieu)
		:"b"(le) // entrées
	);

	return be;
}

int main()
{
	unsigned int data = 0xeeaabbff;

	printf("Représentation crypte en little-endian:   %08x\n"
	       "Représentation decrypte en big-endian:    %08x\n",
	       data,
	       Decryption_fct(data));

	return 0;
}
