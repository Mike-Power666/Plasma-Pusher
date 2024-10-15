!------------------------------------------------------------------------------
! Canadian Institute for Theoretical Astrophysics, PhD Student
!------------------------------------------------------------------------------
!
! MODULE:  Plasma Solver
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

program Plasma_Solver

    use Constants_and_Kinds_Module
    use Double_Leap_Frog_Module
    use Initialization_Module
    use Plot_and_Save_Module

    implicit none

    ! Call the initialization routine to read in all of the initial variables from the 
    ! user's file. Also, allocate all arrays.
    print *, 'Calling Initialization...'
    call Initialization()
    print *, 'Successfully loaded initial conditions.'

    ! Call the double leap frog algorithm. This will solve all of the physics for the 
    ! initialized problem.
    print *, 'Entering the double leap frog solver...'
    call Double_Leap_Frog()
    print *, 'Plasma solver complete.'

    ! Call the routines to calculate other quantities and output the data.
    print *, 'Plotting and saving data...'
    call Plot_and_Save()
    print *, 'Complete.'
    
    ! Deallocate all arrays.
    deallocate(x, x_half)                  ! Position arrays.
    deallocate(u, u_half)                  ! Spatial 4-velocity arrays.
    deallocate(a, a_half)                  ! Acceleration arrays.
    deallocate(E, B)                       ! Electric and Magnetic field arrays.
    deallocate(lorentz, lorentz_half)      ! Lorentz factor arrays.
    deallocate(Momentum)                   ! Momentum array.
    deallocate(Distance, Speed)            ! Scalar arrays.
    deallocate(Scalar_Momentum, Energy)    ! Scalar arrays.
    deallocate(t, t_half)                  ! Time arrays.

end program Plasma_Solver