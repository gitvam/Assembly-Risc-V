#(i)
#ASCII char	ACSII hex	ASCII bin
#-----------    -----------     -----------
#a		00000061	00000000000000000000000001100001
#b		00000062	00000000000000000000000001100010
#c		00000063	00000000000000000000000001100011
#...		...			        ...
#o	        0000006f	00000000000000000000000001101111
#p		00000070	00000000000000000000000001110000
#...		...			        ...
#x		00000078	00000000000000000000000001111000
#y		00000079	00000000000000000000000001111001
#z		0000007a	00000000000000000000000001111010

#A	        00000041	00000000000000000000000001000001
#...		...			        ...
#Z		0000005a	00000000000000000000000001011010

#0	        00000030	00000000000000000000000000110000
#1		00000031	00000000000000000000000000110001
#2		00000032	00000000000000000000000000110010
#...		...			    	...
#9		00000039	00000000000000000000000000111001

#To 'a' sto dekaeksadiko einai to 00000061.
#Ta upoloipa grammata einai to 'a' + tin apostash tou grammatos apo to 'a'.
#Paromoiws an theloume na vroume thn duadikh anaparastash kapoiou grammatos ston pinaka ASCII
#arkei na metatrepsoume thn apostash tou apo to 'a'(to opoio einai to 
#00000000000000000000000001100001)apo dekadikh se duadikh.

#(ii)
#little-endian:
#mem		 | z | y | x |
#hex		  7a  79  78
#dec		 (7*16^5)+(10*16^4)+(7*16^3)+(9*16^2)+(7*16^1)+8 = 8026488
#-----------------------------------
#big-endian:
#mem	        | x | y | z |
#hex		 78  79  7a
#dec		(7*16^5)+(8*16^4)+(7*16^3)+(9*16^2)+(7*16^1)+10= 7895418


#(iii)
#Tupwnetai to 8026488 opws perimename na ginei.

.data
str_xyz: .asciz "xyz"

.text


main:

  addi x17, x0, 1
  la x15, str_xyz
  lw x10 ,0(x15)
  ecall
