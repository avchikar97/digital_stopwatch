# Equipment

Written for: Bays 3 Artix-7 FPGA board

# Specifications

Reset = left button

Start/Pause = right button

Mode select = Switches {R2, T1}

Initial value set = Switches {W13, W14, V15, W15}, {W17, W16, V16, V17}

# Use instructions

There are 4 different modes slsected by using the corresponding binary number

0) Count up from 00.00 to 99.99
1) Count up from a preloaded second value to 99.99
2) Count down from 99.99 to 00.00
3) Count down from a proloaded second value to 00.00

Each set of initial value switches sets one of the second digits. The decisecond and centisecond digits cannot be preset.

The mode can only be changed after a reset.
