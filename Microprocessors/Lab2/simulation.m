
%--Πίνακας αληθείας--%
%  A  B  C  E  F: D  %
%  0  0  0  0  0: 0  %
%  0  0  1  0  0: 0  %
%  0  1  0  0  1: 0  %
%  0  1  1  0  0: 0  %
%  1  0  0  0  1: 0  %
%  1  0  1  0  0: 0  %
%  1  1  0  1  1: 1  %
%  1  1  1  1  0: 0  %



function s = simulation(A, B, C)
  A
  B
  C
  %Gate And first one%
  E = AND(A, B)
  %Gate Not%
  F = NOT(C)
  %Gate And second one%
  D = AND(E, F)
endfunction

function s=AND(A, B)
  s = A * B;
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction

function s=NOT(C)
  s = 1 - C;
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction
