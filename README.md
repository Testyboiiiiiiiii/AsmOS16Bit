# 16 Bit Assembly (intel) OS
## How to download!
first make sure you have NASM **(my comment saying "i learned linkers" is misleading. i only learned how to cat my files together.)**
then run
({} is for replacing it with the file you are assembling)
nasm -f bin {}.asm (the files are in .asm) -o (if you want, change this).bin

THEN stitch the files together like this
cat (bootfile) (kernel) > os.bin 
### MAKE SURE THE BOOTLOADER IS IN THE FIRST SPOT
# KEEP IN MIND THAT THIS ONLY RUNS ON FLOPPIES OR BIN IMAGES
# How to Test (if you arent a dinosaur)
use a QEMU based emulator
(search up a tutorial, i didnt install it either)
or if you dont want to install a VM app, go to copy.sh/v86 and add the "floppy" (bin)
### if you are a dinosaur, dont ask me to help, but if you collected them SURELY you know how to write to them! (also dont forget to pad it to 1,474,560 (1.44MB) bytes)

# PROGRESS
**RELEASE 1**
░░░░░░░ to release 2
**view in Beta**
