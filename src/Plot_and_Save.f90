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

module Plot_and_Save_Module

    use Constants_and_Kinds_Module
    use Global_Variables_Module
    use Get_Unit_Number_Module
    use Vector_Operations_Module

    implicit none
    
contains
    subroutine Plot_and_Save()
        integer :: i, n, unit_num, iostat_val

        ! Calculate the distance.
        do n = 1, N_max
            Distance(n) = sqrt( Dot(x(:,n), x(:,n)) )
        end do

        ! Calculate the speed.
        do n = 1, N_max
            Speed(n) = sqrt( Dot(u(:,n), u(:,n)) )
        end do

        ! Calculate the relativistic momentum.
        do i = 1, N_dim
            do n = 1, N_max
                Momentum(i,n) = rest_mass * u(i,n)
            end do
        end do

        ! Calculate the magnitude of the momentum.
        do n = 1, N_max
            Scalar_Momentum(n) = sqrt( Dot(Momentum(:,n), Momentum(:,n)) )
        end do
        
        ! Calculate the relativistic energy.
        do n = 1, N_max
            Energy(n) = Dot( Momentum(:,n), Momentum(:,n) )**2 + rest_mass**4
        end do

        ! Get a unit number to open a file by calling the subroutine.
        call Get_Unit_Number(unit_num)

        ! Open the file for writing.
        open(unit=unit_num, file='Plasma_Solver_Output.txt', status='new', action='write', iostat=iostat_val)
        if (iostat_val /= 0) then
            print *, "Error opening the file: ", 'Plasma_Solver_Output.txt'
            stop 1
        end if

        ! Write a simple header line to the file
        write(unit_num, '(A)') 'Time, x1, x2, x3, Distance, u1, u2, u3, Speed, &' // &
                               'Momentum1, Momentum2, Momentum3, Scalar_Momentum, Energy'

        ! Loop over n to write the data for each time step
        do n = 1, N_max
            write(unit_num, '(F24.15, 3F24.15, F24.15, 3F24.15, F24.15, 3F24.15, F24.15, F24.15)') &
                t(n), x(1, n), x(2, n), x(3, n), Distance(n), u(1, n), u(2, n), u(3, n), &
                Speed(n), Momentum(1, n), Momentum(2, n), Momentum(3, n), Scalar_Momentum(n), Energy(n)
        end do

        ! Close the file
        close(unit_num)
        
    end subroutine Plot_and_Save
    
end module Plot_and_Save_Module