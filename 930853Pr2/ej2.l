 //Autores : Javier Martínez Virto  NIP : 930853 ; Víctor Marteles Martínez NIP : 928927

 /*Soluciones declaradas para que flex las procese*/
T_SOLUCION RTv((r|RT)v)*TR((V|vTv((r|RT)v)*T)R)*T|RTv((r|RT)v)*TR((V|vTv((r|RT)v)*T)R)*Tv((r|(((R|Tv(rv)*R)Tv((r|RT)v)*T|Tv(rv)*TR(VR)*vTv((r|RT)v)*T)R|Tv(rv)*TR(VR)*T(R|(V|v(rv)*RTv((r|RT)v)*T)R))((V|vTv((r|RT)v)*T)R)*T)v)*(r|(((R|Tv(rv)*R)Tv((r|RT)v)*T|Tv(rv)*TR(VR)*vTv((r|RT)v)*T)R|Tv(rv)*TR(VR)*T(R|(V|v(rv)*RTv((r|RT)v)*T)R))((V|vTv((r|RT)v)*T)R)*T)?
t_SOLUCION rtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*tr((v|Vtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*t)r)*t|rtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*tr((v|Vtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*t)r)*tr((v|(V|tV(RV)*r|tV(RV)*tr(vr)*V)tr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*tr((v|Vtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*t)r)*t)r)*(v|(V|tV(RV)*r|tV(RV)*tr(vr)*V)tr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*tr((v|Vtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*t)r)*t)?
%%
^{T_SOLUCION}\n	{ printf("++%s",yytext);}
^{t_SOLUCION}\n	{ printf("--%s",yytext);}
^[TtVvRr]+\n	{ printf("**%s",yytext);}
. 	{ printf(yytext);}
	
%%

