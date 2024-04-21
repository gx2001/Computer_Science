function mydct2(f)
    [M, N] = size(f);
    F = zeros(M, N);
    #1D DCT rows
    for i = 1:M
        F(:, i) = mydct(f(:, i));
    endfor
    #1D DCT columns
    for i = 1:N
        F(i, :) = mydct(F(i, :));
    endfor
    disp(real(F));
    #plot(real(F));
end
#mydct from previous question
function F = mydct(f)
    N = length(f); 
    F = zeros(1, N); 
    g = zeros(1, 2 * N);
    g(1:N) = f;
    g(N+1:2*N) = fliplr(f);
    G = fft(g);
    for u = 1:N
        w = sqrt(1/N);
        if u > 1
            w = sqrt(2/N);
        end
        F(u) = w * G(u) * exp((-1j * pi * u) / (2 * N));
    end
   
    % display(real(F));
end