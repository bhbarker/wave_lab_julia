
# TODO::Is there a Beep off equivalent in Julia? Do we care enough to do it?


# Parameters


p = Parameter(1, 0, 'off')

#Numerical Infinity

s = Infinity(12, 12, -12)

# set wavelab structures to local default values

s, e, m, c = emcset(s, 'front', [1, 1], 'default')   # default for Burgers is reg_reg_polar

# preimage contour
