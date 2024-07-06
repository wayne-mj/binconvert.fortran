program binconvert
    implicit none
    integer :: n,decimal, ierr
    character(len=128) :: binary
    character(len=100) :: arg

    n = 0
    decimal = 0
    binary = ""

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

        print *, "Binary: ", binary

    end if
end program binconvert