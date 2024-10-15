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
!>  This module should be included in essentially every subroutine, function, 
!>  module, and program. It contains all kind parameters and every physical
!>  constant which a code may need (this will be updated as I require more).
!>  I've included both the MKS and CGS systems.
!
! REVISION HISTORY:
! 08/10/2024 - Initial Version
! TODO_dd_mmm_yyyy - TODO_describe_appropriate_changes - TODO_name
!------------------------------------------------------------------------------

module Constants_and_Kinds_Module
    implicit none
  
    ! Define kinds for precision
    integer, parameter :: sp = selected_real_kind(6, 37)     ! Single precision (6 decimal digits)
    integer, parameter :: dp = selected_real_kind(15, 307)   ! Double precision (15 decimal digits)
    integer, parameter :: qp = selected_real_kind(33, 4931)  ! Quadruple precision (33 decimal digits)
  
    ! --- Mathematical Constants ---
    real(dp), parameter :: pi           = 3.141592653589793238_dp     ! Pi
    real(dp), parameter :: euler_number = 2.718281828459045235_dp     ! Euler's number (e)
    real(dp), parameter :: golden_ratio = 1.618033988749894848_dp     ! Golden ratio (phi)
  
    ! --- Physical constants in MKS (SI units) ---
    real(dp), parameter :: c_mks     = 2.99792458e8_dp         ! Speed of light (m/s)
    real(dp), parameter :: G_mks     = 6.67430e-11_dp          ! Gravitational constant (m^3/kg/s^2)
    real(dp), parameter :: h_mks     = 6.62607015e-34_dp       ! Planck's constant (J·s)
    real(dp), parameter :: k_b_mks   = 1.380649e-23_dp         ! Boltzmann constant (J/K)
    real(dp), parameter :: e_mks     = 1.602176634e-19_dp      ! Elementary charge (Coulombs)
    real(dp), parameter :: sigma_mks = 5.670374419e-8_dp       ! Stefan-Boltzmann constant (W/m^2/K^4)
    real(dp), parameter :: eps_0_mks = 8.8541878128e-12_dp     ! Vacuum permittivity (F/m)
    real(dp), parameter :: mu_0_mks  = 1.25663706212e-6_dp     ! Vacuum permeability (N/A^2)
    real(dp), parameter :: m_p_mks   = 1.67262192369e-27_dp    ! Proton mass (kg)
    real(dp), parameter :: m_e_mks   = 9.1093837015e-31_dp     ! Electron mass (kg)
    real(dp), parameter :: r_sun_mks = 6.96342e8_dp            ! Solar radius (m)
    real(dp), parameter :: l_sun_mks = 3.828e26_dp             ! Solar luminosity (W)
    real(dp), parameter :: m_sun_mks = 1.98847e30_dp           ! Solar mass (kg)
    real(dp), parameter :: au_mks    = 1.495978707e11_dp       ! Astronomical Unit (m)
    real(dp), parameter :: pc_mks    = 3.08567758149e16_dp     ! Parsec (m)
  
    ! --- Physical constants in CGS units ---
    real(dp), parameter :: c_cgs     = 2.99792458e10_dp        ! Speed of light (cm/s)
    real(dp), parameter :: G_cgs     = 6.67430e-8_dp           ! Gravitational constant (cm^3/g/s^2)
    real(dp), parameter :: h_cgs     = 6.62607015e-27_dp       ! Planck's constant (erg·s)
    real(dp), parameter :: k_b_cgs   = 1.380649e-16_dp         ! Boltzmann constant (erg/K)
    real(dp), parameter :: e_cgs     = 4.80320427e-10_dp       ! Elementary charge (statcoulombs)
    real(dp), parameter :: sigma_cgs = 5.670374419e-5_dp       ! Stefan-Boltzmann constant (erg/cm^2/s/K^4)
    real(dp), parameter :: eps_0_cgs = 8.8541878128e-12_dp     ! Vacuum permittivity (dimensionless)
    real(dp), parameter :: mu_0_cgs  = 1.0_dp                  ! Vacuum permeability (dimensionless)
    real(dp), parameter :: m_p_cgs   = 1.67262192369e-24_dp    ! Proton mass (g)
    real(dp), parameter :: m_e_cgs   = 9.1093837015e-28_dp     ! Electron mass (g)
    real(dp), parameter :: r_sun_cgs = 6.96342e10_dp           ! Solar radius (cm)
    real(dp), parameter :: l_sun_cgs = 3.828e33_dp             ! Solar luminosity (erg/s)
    real(dp), parameter :: m_sun_cgs = 1.98847e33_dp           ! Solar mass (g)
    real(dp), parameter :: au_cgs    = 1.495978707e13_dp       ! Astronomical Unit (cm)
    real(dp), parameter :: pc_cgs    = 3.08567758149e18_dp     ! Parsec (cm)
  
    ! --- Additional constants ---
    real(dp), parameter :: avogadro_number      = 6.02214076e23_dp     ! Avogadro's number (mol^-1)
    real(dp), parameter :: rydberg_constant_mks = 1.0973731568160e7_dp ! Rydberg constant (1/m)
    real(dp), parameter :: rydberg_constant_cgs = 1.0973731568160e5_dp ! Rydberg constant (1/cm)
    real(dp), parameter :: m_hydrogen_mks       = 1.6735575e-27_dp     ! Mass of hydrogen atom (kg)
    real(dp), parameter :: m_hydrogen_cgs       = 1.6735575e-24_dp     ! Mass of hydrogen atom (g)
  
  end module Constants_and_Kinds_Module