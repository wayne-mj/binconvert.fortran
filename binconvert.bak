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
        read(arg, '(I20)', iostat=ierr) decimal
        if (ierr .ne. 0) then
            print *, "The decimal number must be an integer"
            stop
        end if

        if (decimal < 0) then
            print *, "The decimal number must be a positive integer"
            stop
        end if

        if (decimal == 0) then
            binary = "0"
        end if

        do while (decimal .gt. 0 .and. i .le. 32)
            if (mod(decimal, 2) .eq. 0) then
                !binary = "0" // binary
                !n = len_trim(binary) + 1
                !print *, "n: ", n
                !binary(n:) = "0"
                binary(i:i) = "0"
                !print *, "Binary: ", binary
                ! !binary(len_trim(binary)+1:) = "0"
            else
                !binary = "1" // binary
                !n = len_trim(binary) + 1
                !print *, "n: ", n
                !binary(n:) = "1"
                binary(i:i) = "1"
                !print *, "Binary: ", binary
                ! !binary(len_trim(binary)+1:) = "1"
            end if
        
            decimal = decimal / 2
            i =i +1
        end do

        do i = 1,len_trim(binary)
            reversed(i:i) = binary(len_trim(binary)-i+1:len_trim(binary)-i+1)
        end do

        !print *, "Reversed: ", reversed

        !n = len_trim(adjustl(reversed))

        !print *, "n: ", n
        !print *, "Reversed: ", reversed, "*"
        !do i = 1,128-n
        !    binary2(i:i) = "0"
        !end do

        !print *, "Binary2: ", binary2

        !binary2(len_trim(binary2)-n+1:) = trim(reversed)
        !print *, "Binary: ", binary2(1:8), " ", binary2(9:16), " ", binary2(17:24), " ", binary2(25:32)
        print *, "Binary: ", reversed(1:8), " ", reversed(9:16), " ", reversed(17:24), " ", reversed(25:32)

    end if
end program binconvert