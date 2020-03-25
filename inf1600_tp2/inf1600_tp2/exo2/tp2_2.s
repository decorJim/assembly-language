.global func_s

func_s:
	
flds b;
flds d;
fmulp;
fstps b; //b=(bd)
flds b;
flds c;
fsubp;
fstps b; //b=(bd)-c
flds f;
fstps a; //a=f
flds g;
fstps d; //d=g
flds f;
flds g;
fsubp;
fstps f; //f=f-g
flds b;
flds f;
fdivp;
fstps b; //b=((bd)-c)/(f-g)
flds e;
fstps g; //g=e
flds e;
flds b;
faddp;
fstps b; //b=e+(((bd)-c)/(f-g))
flds d;
flds g;
fsubp;
fstps d; //d=g-e
flds a;
flds d;
fdivp;
fstps a; //a=(g-e)/f
flds a;
flds b;
fmulp;
fstps a; //a=((g-e)/f)(e+(((bd)-c)/(f-g))


	ret
