using LinearAlgebra

function projection2(matrix, posneg, eps)

    # Returns a projector P and spanning set Q1 of the invariant subspace
    # associated with the given matrix and specified subspace.
    #
    # Input "matrix" is the matrix from which the eigenprojection comes,
    # "posneg" is 1,-1, or 0 if the unstable, stable, or center space is
    # sought. The input eps gives a bound on how small the eigenvalues sought
    # can be, which is desirable when a zero mode should be avoided.

    # Uses Schur decomposition to get a basis for the generalized eigenspace

    F = Schur{Complex}(schur(matrix))

    U = F.vectors
    T = F.Schur
    E = F.values



    return 0,0 
end