!------------------------------------------------------------------------------
! Canadian Institute for Theoretical Astrophysics, PhD Student
!------------------------------------------------------------------------------
!
! MODULE:  Double Leap Frog
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

module External_Fields_Module

    use Constants_and_Kinds_Module
    use Global_Variables_Module
    use Ini_File_Parser_Module
    implicit none
    
contains
    subroutine Electromagnetic_Field(x1_position, x2_position, x3_position, time)
        ! Calculates the electric and magnetic field configurations at a given position and time.
        real(dp), intent(in) :: x1_position, x2_position, x3_position, time
        integer :: i, n

        ! Read in the field parameters as global variables by parsing the input file. 
        ! If the fields are not simple constants, one would have to edit this subroutine to deifne the
        ! fields as a function of space and time. For now, only read in the fields on the initial time
        ! setp. Otherwise, do nothing.
        if ( time == t(1) ) then

            call read_ini_file('input.ini', 'fields')

            do i = 1, N_dim
                do n = 1, N_max
                    E(i,n) = E(i,1)
                    B(i,n) = B(i,1)
                end do
            end do

        else 
            return
        end if
    
    end subroutine Electromagnetic_Field

end module External_Fields_Module