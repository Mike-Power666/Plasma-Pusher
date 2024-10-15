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

module Get_Unit_Number_Module
    implicit none
contains

    ! Subroutine to get an available unit number for file operations
    subroutine Get_Unit_Number(unit_num)
        integer, intent(out) :: unit_num  ! Output variable to hold the available unit number
        logical :: logic_dummy            ! Logical variable to check if the unit is opened
        integer :: i                      ! Loop variable

        ! Determine a unit number for the file, from 10 to 99
        do i = 10, 99
            inquire(unit=i, opened=logic_dummy)
            if (.not. logic_dummy) then
                unit_num = i
                exit  ! Exit the loop if the unit number is not in use
            end if
        end do

        ! Idiot proofing: check if too many files are already open
        if (i == 99 .and. logic_dummy) then
            print *, "Error: Too many files are open. Could not find an available unit number."
            stop
        end if
    end subroutine Get_Unit_Number

end module Get_Unit_Number_Module