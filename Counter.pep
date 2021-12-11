;a program that asks the user about number, takes it in decimal number as input and then outputs the entered value followed by a count down

BR main ;branch straight to main

;declaring variable number, message and a variable used to print new line
number: .BLOCK 2
reqmsg: .ASCII "Enter a decimal number: \x00"
newline: .ASCII "\n\x00"

         ;print request message, read the input, print it out in new line and load the number
main:    STRO reqmsg,d 
         DECI number,d 
         DECO number,d 
         STRO newline,d 
         LDWA number,d 

         BRGT poslp ;if input>0 branch to positive loop (poslp)

         BRLT neglp ;if input<0 branch to negative loop (neglp)
   
         ;the positive loop - subtracts 1 from the input, stores it and prints it out in new line, the cycle repeats until the number reaches 0
poslp:   BREQ done ;if number reaches 0 branch to done
         SUBA 0x0001,i 
         STWA number,d  
         DECO number,d  
         STRO newline,d 
         BR poslp ;branch to the beginnig of the poslp loop

         ;the pnegative loop - adds 1 to the input (as it is negative and we want to reach 0), stores it 
         ;and prints it out in new line, the cycle repeats until the number reaches 0
neglp:   BREQ done ;if number reaches 0 branch to done
         ADDA 0x0001,i 
         STWA number,d 
         DECO number,d 
         STRO newline,d
         BR neglp ;branch to the beginnig of the neglp loop

done:    STOP ;stop the program

.END

