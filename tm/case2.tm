#Q = {0,minus,add_two0,add_two1,add_two_back,accept,reject,true1,true2,true3,true4,false1,false2,false3,false4,false5}

#S = {1}

#G = {1,_,t,r,u,e,f,a,l,s}

#q0 = 0

#B = _

#F = {true4,false5}

#N = 2

; State 0: start state
0 1_ 11 ** minus
0 __ _1 ** reject ; empty input

; State minus  : minus now odd number
minus 11 _1 rr minus
minus 1_ 1_ ** add_two0
minus _1 _1 ** reject
minus __ __ ** accept

; State add_two: add two to odd number
add_two0 1_ 11 *r add_two1
add_two1 1_ 11 *l add_two_back
add_two_back 11 11 *l add_two_back
add_two_back 1_ 1_ *r minus

; State accept: print true
accept __ t_ r* true1
true1 __ r_ r* true2
true2 __ u_ r* true3
true3 __ e_ ** true4

; State reject: print false
reject _1 f1 r* false1
false1 _1 a1 r* false2
false2 _1 l1 r* false3
false3 _1 s1 r* false4
false4 _1 e1 ** false5