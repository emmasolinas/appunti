import("stdfaust.lib");
panpot = vslider("[1]panpot [style:knob]", 0.5, 0.0, 1.0, 0.01);
vmeter(x)= attach (x, envelop(x) : vbargraph("[99][unit:dB]", -70, +5))
with{ 
    envelop= abs : max ~ -(1.0/ma.SR) : max(ba.db2linear(-70)) : ba.linear2db ; 
} ;
process = _ <: _,_ : *(1-panpot), *(panpot) : hgroup ("meters (2)" , vmeter , vmeter);
// cos'è attach: attach(x,y) x*1 y*0 sdoppiamento dei due canali x e y e uno lo manda lo manda in uscita e l'altro lo processa
