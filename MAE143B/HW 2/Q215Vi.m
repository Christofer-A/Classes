syms s
ilaplace(200/(s*(s+4)))
f = @(t) 50 - 50*exp(-4*t)