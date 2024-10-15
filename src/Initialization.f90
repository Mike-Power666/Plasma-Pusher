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

module Initialization_Module

    use Constants_and_Kinds_Module
    use Global_Variables_Module
    use Ini_File_Parser_Module

    implicit none
    
contains

    subroutine Initialization()
        integer :: n

        ! Read in the simulation parameters as global variables by parsing the input file.
        call read_ini_file('input.ini', 'simulation')

        ! Validate user input and handle error conditions.
        if (N_max < 0) then
            print *, 'Error: Number of time steps (N_max) cannot be negative.'
            stop 1
        elseif (delta_t < 0.0_dp) then
            print *, 'Error: Time step (delta_t) cannot be negative.'
            stop 2
        elseif (N_max == 0 .and. delta_t == 0.0_dp) then
            print *, 'Error: You must set either N_max or delta_t, but not both.'
            stop 3
        elseif (N_max /= 0 .and. delta_t /= 0.0_dp) then
            print *, 'Error: You have set both N_max and delta_t. Only set one.'
            stop 4
        endif
        
        ! Calculate delta_t if N_max is set, or N_max if delta_t is set.
        if (N_max /= 0 .and. delta_t == 0.0_dp) then
            delta_t = (t_final - t_initial) / real(N_max, dp)  ! Ensure division is performed in double precision.
        elseif (N_max == 0 .and. delta_t /= 0.0_dp) then
            N_max = int(ceiling((t_final - t_initial) / delta_t))  ! Calculate N_max, use ceiling and make it an integer.
        endif

        ! With the initial simulation parameters set, allocate all arrays.
        allocate(x(N_dim, N_max), x_half(N_dim, N_max))              ! Position arrays.
        allocate(u(N_dim, N_max), u_half(N_dim, N_max))              ! Spatial 4-velocity arrays.
        allocate(a(N_dim, N_max), a_half(N_dim, N_max))              ! Acceleration arrays.
        allocate(E(N_dim, N_max), B(N_dim, N_max))                   ! Electric and Magnetic field arrays.
        allocate(lorentz(N_max), lorentz_half(N_max))                ! Lorentz factor arrays.
        allocate(Momentum(N_dim, N_max))                             ! Momentum array.
        allocate(Distance(N_max), Speed(N_max))                      ! Scalar arrays.
        allocate(Scalar_Momentum(N_max), Energy(N_max))              ! Scalar arrays.
        allocate(t(N_max), t_half(N_max))                            ! Time arrays.

        ! Read in dynamical parameters as global variables by parsing the input file.
        call read_ini_file('input.ini', 'dynamical_variables')

        ! Calculate the time arrays.
        do n = 1, N_max
            t(n) = t_initial + real((n-1), dp) * delta_t
            t_half(n) = 1.5_dp * t_initial + real(n-1, dp) * delta_t
        end do

    end subroutine Initialization
    
end module Initialization_Module