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

module Global_Variables_Module

    use Constants_and_Kinds_Module
    implicit none
    real(dp), allocatable :: x(:,:), x_half(:,:), u(:,:), u_half(:,:)
    real(dp), allocatable :: a(:,:), a_half(:,:)
    real(dp), allocatable :: lorentz(:), lorentz_half(:)
    real(dp), allocatable :: E(:,:), B(:,:)
    real(dp), allocatable :: Momentum(:,:)
    real(dp), allocatable :: Distance(:), Speed(:), Scalar_Momentum(:), Energy(:)
    real(dp), allocatable :: t(:), t_half(:)
    real(dp) :: delta_t, t_initial, t_final, charge, rest_mass
    integer :: N_max, N_dim, first_int
    
end module Global_Variables_Module