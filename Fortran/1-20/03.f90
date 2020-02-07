! Project Euler 3
!  Largest prime factor
!   The prime factors of 13195 are 5, 7, 13 and 29.
!   What is the largest prime factor of the number 600851475143 ?
! ---------------------------------------------------------------
program PE3

  integer, parameter :: last_number = 600851475143
  integer, dimension(last_number) :: numbers
  integer :: i, n_primes, ac

  write(*,*) ''
  write(*,*) 'PE3'
  write(*,*) 'What is the largest prime factor of the number 600851475143?'

  !  Initialize numbers array to 0, 2, 3, ..., last_number--
  !  Zero instead of 1 because 1 is a special case.
  ! numbers = (/ 0, (ac, ac = 2, last_number) /)

  do ac = 2, last_number
    numbers(ac) = ac
  end do

  do i = 2, last_number
    if (numbers(i) /= 0) then              ! if this number is prime
      numbers(2*i : last_number : i) = 0   ! eliminate all multiples
    endif
  enddo

  !  Count the primes.
  number_of_primes = count (numbers /= 0)

  !  Gather them into the front of the array.
  numbers(1:number_of_primes) = pack(numbers, numbers /= 0)

  !  Print them
  print *, "There are ", number_of_primes, &
           " prime numbers less than", last_number
  print "(5i7)", numbers(1:number_of_primes)

end program PE3
