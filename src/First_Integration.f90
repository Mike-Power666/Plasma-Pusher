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

module First_Integration_Module

    use Constants_and_Kinds_Module
    use External_Fields_Module
    use Global_Variables_Module
    use Vector_Operations_Module

    implicit none
    
contains
    subroutine First_Integration()
        integer :: i

        select case (first_int)
            case(1) ! Explicit integration.
                call Electromagnetic_Field(x(1,1), x(2,1), x(3,1), t(1))
                lorentz(1) = sqrt( 1.0_dp + Dot(u(:,1), u(:,1)) )
                do i = 1, N_dim
                    x_half(i,1) = x(i,1) + ( u(i,1) / lorentz(1) ) * ( delta_t / 2.0_dp )
                    a(i,1) = ( charge / rest_mass ) * ( E(i,1) + Cross( u(:,1) / lorentz(1), B(:,1), i) )
                    u_half(i,1) = u(i,1) + a(i,1) * ( delta_t / 2.0_dp )
                end do
            case(2) ! Multiple explicit integrations.
                !Stuff
            case(3) ! Iterative integration.
                !Stuff
            case default
                print *, 'Error: Invalid first_int index. Must be 1, 2, or 3.'
                stop 1
        end select

    end subroutine First_Integration
    
end module First_Integration_Module