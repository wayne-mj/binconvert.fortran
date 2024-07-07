program binconvert
    implicit none
    integer :: n,decimal, ierr, i
    character(len=32) :: binary, binary2
    character(len=100) :: arg

    n = 0
    decimal = 0
    binary = ""
    binary2 = ""

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

        do while (decimal .gt. 0)
            if (mod(decimal, 2) .eq. 0) then
                binary = "0" // binary
            else
                binary = "1" // binary
            end if
        
            decimal = decimal / 2
        end do

        n = len_trim(binary)
        do i = 1,128-n
            binary2(i:i) = "0"
        end do

        binary2(len_trim(binary2)-n+1:) = binary
        print *, "Binary: ", binary2(1:8), " ", binary2(9:16), " ", binary2(17:24), " ", binary2(25:32)

    end if
end program binconvert