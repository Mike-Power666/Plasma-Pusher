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


module Vector_Operations_Module

    use Constants_and_Kinds_Module
    implicit none

contains
    ! Function to compute the dot product of two 3D vectors
    function Dot(vector_1, vector_2) result(dot_result)
        real(dp), intent(in) :: vector_1(3), vector_2(3)   ! Input vectors
        real(dp) :: dot_result                             ! Output scalar result

        ! Calculate the dot product
        dot_result = vector_1(1) * vector_2(1) + vector_1(2) * vector_2(2) + vector_1(3) * vector_2(3)
    end function Dot

    ! Function to compute a specific component of the cross product of two 3D vectors
    function Cross(vector_1, vector_2, component) result(cross_component)
        real(dp), intent(in) :: vector_1(3), vector_2(3)    ! Input vectors
        integer, intent(in) :: component                    ! Component index (1 for x, 2 for y, 3 for z)
        real(dp) :: cross_component                         ! Output scalar result for the specified component

        ! Calculate the specified component of the cross product
        select case (component)
            case (1)
                cross_component = vector_1(2) * vector_2(3) - vector_1(3) * vector_2(2)  ! x-component
            case (2)
                cross_component = vector_1(3) * vector_2(1) - vector_1(1) * vector_2(3)  ! y-component
            case (3)
                cross_component = vector_1(1) * vector_2(2) - vector_1(2) * vector_2(1)  ! z-component
            case default
                print *, 'Error: Invalid component index. Must be 1, 2, or 3.'
                stop 1
        end select
    end function Cross

end module Vector_Operations_Module