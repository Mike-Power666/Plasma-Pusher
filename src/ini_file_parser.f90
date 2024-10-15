!------------------------------------------------------------------------------
! Canadian Institute for Theoretical Astrophysics, PhD Student
!------------------------------------------------------------------------------
!
! MODULE:  Initialization
!
!> @mike-power666
!> Michael T. Power
!
! DESCRIPTION: 
!>  Short module description
!
! REVISION HISTORY:
! 07/10/2024 - Initial Version
! TODO_dd_mmm_yyyy - TODO_describe_appropriate_changes - TODO_name
!------------------------------------------------------------------------------

module Ini_File_Parser_Module
    implicit none
    
contains
    subroutine read_ini_file(filename, sections_to_parse)

        use Constants_and_Kinds_Module
        use Global_Variables_Module
        use Get_Unit_Number_Module

        implicit none
        integer :: unit_num
        character(len=*), intent(in) :: filename
        character(len=*), intent(in) :: sections_to_parse  ! Specifies which sections to parse (e.g., "simulation, dynamical_variables").

        ! Local variables.
        character(len=100) :: line, section, keyword
        real(dp) :: value
        integer :: ios, pos, i, j
        logical :: parse_section = .false.
        character(len=100), allocatable :: sections_array(:)

        ! Split the sections_to_parse string into an array of individual sections.
        call split_string(sections_to_parse, ',', sections_array)

        call Get_Unit_Number(unit_num)

        ! Open the INI file for reading.
        open(unit=unit_num, file=filename, status='old', iostat=ios)
        if (ios /= 0) then
            ! If the file could not be opened, print an error message and stop the program.
            print *, 'Error: Unable to open input file.'
            stop 1
        end if

        ! Initialize section to an empty string.
        section = ''
        do
            ! Read each line from the file.
            read(10, '(A)', iostat=ios) line
            if (ios /= 0) exit  ! Exit the loop if the end of file is reached or an error occurs.

            ! Trim leading/trailing whitespace from the line.
            line = trim(adjustl(line))
            ! Skip blank lines or comment lines (starting with ';').
            if (len_trim(line) == 0 .or. line(1:1) == ';') cycle

            ! Detect section headers (e.g., [simulation]).
            if (line(1:1) == '[') then
                ! Extract the section name by trimming the content between '[' and ']'.
                section = adjustl(line(2:index(line, ']')-1))

                ! Determine if the current section matches any of the specified sections in sections_array.
                parse_section = any(trim(section) == sections_array) .or. trim(sections_to_parse) == 'all'
                cycle  ! Skip the rest of the loop and continue reading the next line.
            endif

            ! If the current section is not in sections_to_parse, skip parsing this line.
            if (.not. parse_section) cycle

            ! Find the position of the '=' character in the line.
            pos = index(line, '=')
            if (pos > 0) then
                ! Extract the keyword (left-hand side of '='), removing extra spaces.
                keyword = trim(adjustl(line(1:pos-1)))
                ! Read the value (right-hand side of '='), which could be a number.
                read(line(pos+1:), *) value

                ! Check which section we're in and assign values to the appropriate variables.
                if (section == 'simulation') then
                    ! Handle simulation parameters.
                    if (keyword == 't_initial') then
                        t_initial = value
                    elseif (keyword == 't_final') then
                        t_final = value
                    elseif (keyword == 'N_max') then
                        N_max = int(value)
                    elseif (keyword == 'N_dim') then
                        N_dim = int(value)
                    elseif (keyword == 'delta_t') then
                        delta_t = value
                    elseif (keyword == 'first_int') then
                        first_int = int(value)
                    elseif (keyword == 'rest_mass') then
                        rest_mass = value
                    elseif (keyword == 'charge') then
                        charge = value
                    endif
                elseif (section == 'dynamical_variables') then
                    ! Parse indices from keywords like "x(1,1)".
                    read(keyword(index(keyword, ',')-1:), '(I1)', iostat=ios) i
                    read(keyword(index(keyword, ',')+1:), '(I1)', iostat=ios) j

                    ! Assign values to the appropriate dynamical variables.
                    if (keyword(1:1) == 'x') then
                        x(i, j) = value
                    elseif (keyword(1:1) == 'u') then
                        u(i, j) = value
                    endif
                elseif (section == 'fields') then
                    ! Parse indices from keywords like "B(1,1)".
                    read(keyword(index(keyword, ',')-1:), '(I1)', iostat=ios) i
                    read(keyword(index(keyword, ',')+1:), '(I1)', iostat=ios) j

                    ! Assign values to the appropriate dynamical variables.
                    if (keyword(1:1) == 'E') then
                        E(i, j) = value
                    elseif (keyword(1:1) == 'B') then
                        B(i, j) = value
                    endif
                endif
            endif
        end do

        ! Close the file after reading all lines.
        close(unit_num)
    end subroutine read_ini_file

    subroutine split_string(input_string, delimiter, output_array)
        implicit none
        character(len=*), intent(in) :: input_string
        character(len=*), intent(in) :: delimiter
        character(len=100), dimension(:), allocatable, intent(out) :: output_array
    
        integer :: i, num_delimiters, pos_start, pos_end
    
        ! Count the number of delimiters in the input_string.
        num_delimiters = count([index(input_string, delimiter) > 0])
    
        ! Allocate the output array based on the number of delimiters found.
        allocate(output_array(num_delimiters + 1))
    
        ! Split the input_string into substrings based on the delimiter.
        pos_start = 1
        do i = 1, num_delimiters
            pos_end = index(input_string(pos_start:), delimiter)
            output_array(i) = trim(adjustl(input_string(pos_start:pos_end-1)))  ! Trim whitespace around the substring.
            pos_start = pos_start + pos_end
        end do
    
        ! Get the last substring, trimming any extra spaces.
        output_array(num_delimiters + 1) = trim(adjustl(input_string(pos_start:)))
    end subroutine split_string
    
end module Ini_File_Parser_Module