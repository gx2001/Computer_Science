function mydct(f)
    N = length(f); # Set N
    F = zeros(1, N); # Set F(u)
    # Create the extended sequence g(x) 
    g = zeros(1, 2 * N); 
    g(1:N) = f;
    g(N+1:2*N) = fliplr(f);
    
    # Calculate the DFT of g_x using FFT
    G = fft(g);
    
    # Calculate the DCT F(u) combined G(u)
  
    for u = 1:N
        w = sqrt(1/N);
        if u > 1
            w = sqrt(2/N);
        end
        F(u) = w * G(u)*exp((-1j*pi*u)/(2*N));
    end
    display(real(F));
    #plot(real(F))
end