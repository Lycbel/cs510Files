: '
when compile sophia 
kcc cant use the gcc defined functions like __sync_lock_test_and_set in atomic 
maybe should do something about it
this is a minimized input for it
'

kcc lock.c
