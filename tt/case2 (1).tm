; i = 0; while i^2 < tape 1, ++i; if i^2 == tape 1: accept, else reject
#Q = {square,cmp,sq_add,sq_bak_lm,sq_bak_x,restore,restore1,restore2,restore3,add,add1,accept,acc_cls,acc_t,acc_r,acc_u,acc_e,reject,rej_cls,rej_f,rej_l,rej_a,rej_s,rej_e,halt,rej_halt}
#S = {1}
#G = {1,x,t,r,u,e,f,a,l,s,_}
#q0 = square
#F = {halt}
#N = 3
#B = _

; `i` is on the tape 2
; square the `i` to tape3
square *1_ *x_ *** sq_bak_lm
; compare the tape 1 and tape 3
square *__ *__ *ll cmp
;; go to the left most of tape 1
sq_bak_lm *__ *__ *r* sq_add
sq_bak_lm **_ **_ *l* sq_bak_lm
;; perform the multiplication
sq_add *__ *__ *l* sq_bak_x
sq_add **_ **1 *rr sq_add
;; go to the `x`
sq_bak_x *x_ *1_ *r* square
sq_bak_x **_ **_ *l* sq_bak_x

cmp 1*1 1*_ r*l cmp
; tape 1 > tape 3
cmp 1*_ 1*_ *** restore
; tape 1 = tape 3
cmp _*_ _*_ *** accept
; tape 1 < tape 3
cmp _*1 _*1 *** reject

restore *** *** *** restore1
; index the head 1 on the left end of tape 1
restore1 1** 1** l** restore1
restore1 _** _** r** restore2
; index the head 2 on the left end of tape 2
restore2 *1* *1* *l* restore2
restore2 *_* *_* *r* restore3
; index the head 3 to 0
restore3 **_ **_ **r add

; add 1 to `i`
add *1* *1* *l* add1
add *_* *1* *** square
; start the next loop
add1 *_* *1* *** square

accept _** _** l** acc_cls
acc_cls 1** _** l** acc_cls
acc_cls _** _** r** acc_t
acc_t _** t** r** acc_r
acc_r _** r** r** acc_u
acc_u _** u** r** acc_e
acc_e _** e** r** halt

reject _** _** l** rej_cls
rej_cls 1** _** l** rej_cls
rej_cls _** _** r** rej_f
rej_f _** f** r** rej_a
rej_a _** a** r** rej_l
rej_l _** l** r** rej_s
rej_s _** s** r** rej_e
rej_e _** e** r** rej_halt
