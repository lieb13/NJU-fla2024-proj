; perform $a^m b^n$ -> $c^{m+n}$ by recursion: $f(a^m b^n) = c^n f(a^{m-1} b^n)$
#Q = {chk_a,chk_b,chk_back,mul_start,mul_find_b,mul_c,mul_back,res_cp,earse_1l,earse_1r,reject,rej_ers_l,rej_res_i1,rej_res_i2,rej_res_l1,rej_res_l2,rej_res_l3,rej_res_e,rej_res_g,rej_res_a,rej_res__,rej_res_n,rej_res_p,rej_res_u,rej_res_t,rej_halt,halt}
#S = {a,b}
#G = {a,b,c,i,l,e,g,a,n,p,u,t,_}
#q0 = chk_a
#F = {halt}
#N = 2
#B = _
; chk_*: check the input is of the form 'a...ab...b'
;; 'a's segment
chk_a a_ a_ r* chk_a
chk_a *_ *_ ** chk_b
;; 'b's segment
chk_b b_ b_ r* chk_b
;; illigal input
chk_b a_ a_ ** reject
;; head back
chk_b __ __ l* chk_back

; mul_*: perform the multiplication
chk_back __ __ r* mul_start
chk_back *_ *_ l* chk_back
;; find 'b's
mul_start a_ __ r* mul_find_b
mul_find_b a_ a_ r* mul_find_b
;; find 'b's, start to get 'c's
mul_find_b b_ b_ ** mul_c
;; could not find 'b's, earse 'a's on the left
mul_find_b __ __ l* earse_1l
mul_c b_ bc rr mul_c
;; head back to perform next recursion
mul_c __ __ l* mul_back
;; perform the next recursion
mul_back __ __ r* mul_start
mul_back *_ *_ l* mul_back

; finish the multiplication, start to copy the result to tape 1
mul_start *_ *_ *l res_cp
res_cp *c cc rl res_cp

; earse the content on tape 1 on the right of the head
res_cp *_ __ r* earse_1r
earse_1r __ __ ** halt
earse_1r *_ __ r* earse_1r

earse_1l a_ __ l* earse_1l
earse_1l __ __ ** halt

; reject the input
reject *_ *_ l* reject
reject __ __ r* rej_ers_l
rej_ers_l *_ __ r* rej_ers_l
rej_ers_l __ __ r* rej_res_i1
rej_res_i1 __ i_ r* rej_res_l1
rej_res_l1 __ l_ r* rej_res_l2
rej_res_l2 __ l_ r* rej_res_e
rej_res_e __ e_ r* rej_res_g
rej_res_g __ g_ r* rej_res_a
rej_res_a __ a_ r* rej_res_l3
rej_res_l3 __ l_ r* rej_res__
rej_res__ __ __ r* rej_res_i2
rej_res_i2 __ i_ r* rej_res_n
rej_res_n __ n_ r* rej_res_p
rej_res_p __ p_ r* rej_res_u
rej_res_u __ n_ r* rej_res_t
rej_res_t __ t_ r* rej_halt
