! Project Euler problem 7 - 10,001st prime
! By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
!  that the 6th prime is 13.
! What is the 10 001st prime number?
!

subroutine Fib(target, f)
  integer, intent(in)  :: target     ! input
  integer              :: f1,f2,f3,i ! dummy variables
  integer, intent(out) :: f          ! output

  i = 1
  f1 = 0
  f2 = 1

  do
    f3 = f2 + f1
    f1 = f2
    f2 = f3
    i = i + 1
    if(i .eq. target) then
      !print *, 'Fibonacci number at (I5, A, $)', i
      !print *, ' = ', f1
      f = f1
      exit
    end if
  end do
end subroutine Fib


!
program pe07
  implicit none
  integer :: t, f

  t = 6
  call Fib(t, f)
  print *, f

end program pe07
