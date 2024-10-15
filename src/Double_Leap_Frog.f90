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

module Double_Leap_Frog_Module

    use Constants_and_Kinds_Module
    use External_Fields_Module
    use First_Integration_Module
    use Global_Variables_Module
    use Vector_Operations_Module
    
    implicit none
    
contains
    subroutine Double_Leap_Frog()
        integer :: i, n

        ! To begin the double leap frog algorithm, one needs to determine the value of the dynamical variables
        ! at the very first half step, since the initial conditions are given at the very first non-staggered 
        ! step. This can be accomplished in a multitude of ways, the easiest of course being a single explicit 
        ! integration step. However, one may also do iterative methods, or multiple explicit steps which are 
        ! far more accurate than a singular explicit step. The user should select the method in the initial
        ! data file.

        ! Call the first integration routine.
        call First_Integration()

        do n = 1, N_max

            ! Determine the electric field configuration at the half-step, for use in the first set of
            ! leap frog equations. Do the same for the Lorentz factor. Note, the dot product vector operation
            ! is used for the Lorentz factor. 
            call Electromagnetic_Field(x_half(1,n), x_half(2,n), x_half(3,n), t_half(n))
            lorentz_half(n) = sqrt( 1.0_dp + Dot(u_half(:,n), u_half(:,n)) ) ! Units of c=1.

            ! Compute the first set of leap frog equations. Note that the cross product operation is used to 
            ! compute the acceleration.
            do i = 1, N_dim
                x(i,n+1) = x(i,n) + u_half(i,n) * delta_t / lorentz_half(n)
                a_half(i,n) = ( charge / rest_mass ) * ( E(i,n) + Cross( u_half(:,n) / lorentz_half(n), B(:,n), i) )
                u(i,n+1) = u(i,n) + a_half(i,n) * delta_t
            end do

            ! Determine the electric field configuration at the half-step, for use in the second set of
            ! leap frog equations. Do the same for the Lorentz factor. Note, the dot product vector operation
            ! is used for the Lorentz factor. 
            call Electromagnetic_Field(x(1,n+1), x(2,n+1), x(3,n+1), t(n+1))
            lorentz(n+1) = sqrt( 1.0_dp + Dot(u(:,n+1), u(:,n+1)) ) ! Units of c=1.
    
            ! Compute the second set of leap frog equations. Note that the cross product operation is used to 
            ! compute the acceleration.
            do i = 1, N_dim
                x_half(i,n+1) = x_half(i,n) + u(i,n) * delta_t / lorentz(n)
                a(i,n+1) = ( charge / rest_mass ) * ( E(i,n) + Cross( u(:,n+1) / lorentz(n+1), B(:,n), i) )
                u_half(i,n+1) = u_half(i,n) + a(i,n+1) * delta_t
            end do
            if (mod(n, 1000) == 0) then
                print *, 'Completed loop ', n, ' of ', N_max
            endif
        end do
        
    end subroutine Double_Leap_Frog
    
end module Double_Leap_Frog_Module