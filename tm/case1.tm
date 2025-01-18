#Q = {0,cpa,cpb,illegal,cp_finish,multi0,multi1,accept,iiprint0,iiprint1,iiprint2,iiprint3,iiprint4,iiprint5,iiprint6,iiprint7,iiprint8,iiprint9,iiprintA,iiprintB,iiprintC,iiprintD}

#S = {a,b}

#G = {a,b,c,_,i,l,e,g,a,n,p,u,t,X}

#q0 = 0

#B = _

#F = {accept,iiprintD}

#N = 3

; State 0: start state
0 a__ Xa_ rr* cpa
0 b__ X__ *** illegal
0 ___ ___ *** illegal

; State cpa: copy all a to the 2nd tape
cpa a__ Xa_ rr* cpa
cpa b__ X_b r*r cpb
cpa ___ ___ *** illegal

; State cpb: copy all b to the 3rd tape
cpb b__ X_b r*r cpb
cpb ___ ___ lll cp_finish
cpb a__ X__ *** illegal

; State cp_finish : finish copying, prepare for multi
cp_finish *** _** lll cp_finish
cp_finish *_* __* l*l cp_finish
cp_finish **_ _*_ ll* cp_finish
cp_finish *__ ___ l** cp_finish
cp_finish ___ ___ rrr multi0

; State multi0: compute a \times B
multi0 _ab cab r*r multi0
multi0 _a_ _a_ **l multi1
multi0 __b __b ll* accept 

; State multi1: compute a \times B
multi1 _ab _ab **l multi1
multi1 _a_ _a_ *rr multi0

; State accept: accept

; State illegal: illegal input
illegal *__ *__ l** illegal
illegal ___ ___ r** iiprint0

; State ii_print: print "illegal input"
iiprint0 *__ ___ r** iiprint0
iiprint0 ___ i__ r** iiprint1
iiprint1 ___ l__ r** iiprint2
iiprint2 ___ l__ r** iiprint3
iiprint3 ___ e__ r** iiprint4
iiprint4 ___ g__ r** iiprint5
iiprint5 ___ a__ r** iiprint6
iiprint6 ___ l__ r** iiprint7
iiprint7 ___ ___ r** iiprint8
iiprint8 ___ i__ r** iiprint9
iiprint9 ___ n__ r** iiprintA
iiprintA ___ p__ r** iiprintB
iiprintB ___ u__ r** iiprintC
iiprintC ___ t__ r** iiprintD

