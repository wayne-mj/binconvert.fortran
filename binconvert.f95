program binconvert
    implicit none
    integer :: n,decimal, ierr, i
    character(len=32) :: binary, binary2, reversed
    character(len=100) :: arg

    n = 0
    decimal = 0
    binary = "00000000000000000000000000000000"
    binary2 = ""
    i = 1

    print *, "Binary to Decimal Converter"

    ! Read from the command line an integer value
    call get_command_argument(1, arg, STATUS=ierr)
    if (ierr .ne. 0) then
        print *, "Usage: binconvert <decimal number>"
        stop
    else
        ! Convert the string to an integer and fail gracefully if it's not an integer
        read(arg, '(I20)', iostat=ierr) decimal
        if (ierr .ne. 0) then
            print *, "The decimal number must be an integer"
            stop
        end if

        ! If the decimal number is negative, print an error message and stop
        if (decimal < 0) then
            print *, "The decimal number must be a positive integer"
            stop
        end if

        ! If the decimal number is 0, print the binary representation and stop
        if (decimal == 0) then
            binary = "00000000000000000000000000000000"
        end if

        ! Convert the decimal number to binary (reverse order)
        do while (decimal .gt. 0 .and. i .le. 32)
            if (mod(decimal, 2) .eq. 0) then
                binary(i:i) = "0"
            else
                binary(i:i) = "1"
            end if
        
            decimal = decimal / 2
            i =i +1
        end do

        ! Reverse the binary string
        do i = 1,len_trim(binary)
            reversed(i:i) = binary(len_trim(binary)-i+1:len_trim(binary)-i+1)
        end do

        ! Print the binary representation
        print *, "Binary: ", reversed(1:8), " ", reversed(9:16), " ", reversed(17:24), " ", reversed(25:32)

    end if
end program binconvert