include("Aadj.jl")
include("Akadj.jl")

# TODO:: Figure out a better name for this struct so that it makes more sense
struct M
    n
    damping
    method
    options
    ode_fun
end


# TODO:: Figure out a better name for this struct so that it makes more sense
struct C
    LA
    RA
    stats
    refine
    tol
    ksteps
    lambda_steps
    basisL
    basisR
    evans
    epsl
    espr
    Lproj
    Rproj
end


# TODO:: Figure out a better name for this struct so that it makes more sense
struct E
    evans
    LA
    kl
    kr
    NL
    NR
end


# TODO:: Fix the default arguments for func and compound_func to reflect MATLAB behavior

function emcset(s, shock_type, eLR, Evan_type = "default", func = "0", compound_func = "0")
    
    #     function [e,m,c] = emcset(shock_type,eL,eR,Evan_type)
    #
    # Sets the values of the STABLAB structures e, m, and c to 
    # default values. Takes as input a string, shock_type, which is either
    # "front" or "periodic". The input eL and eR are respectively the 
    # dimension of the left and right eigenspaces of the Evans matrix.
    # The input Evan_type is an optional string. If not specified, Evan_type
    # will be assigned the most advantageous polar coordinate method.
    # Evan_type has the following options when shock_type = 'front':
    # 
    # reg_reg_polar
    # reg_adj_polar
    # adj_reg_polar
    # reg_adj_compound
    # adj_reg_compound
    # 
    # when shock_type = 'periodic', the choices are:
    # 
    # regular_periodic
    # balanced_periodic
    # balanced_polar_scaled_periodic
    # balanced_polar_periodic
    # balanced_scaled_periodic


    eL = eLR[1];
    eR = eLR[2];

    # TODO:: Figure out how to make the func and compound_func default to A and Ak where those are files that are in the current directory or path like in MATLAB

    if cmp(shock_type, "front") == 0
        e, m, c = initialize_front(s, eL, eR, Evan_type, func, compound_func)


    
    end

    #TODO:: Modify return function when function is finished
    return 0, 0, 0, 0
end


function initialize_front(s, kL, kR, Evan_type, func, compound_func)

    n = kL + kR

    if cmp(Evan_type, "default") == 0

        if kL > n / 2
            e_evans = "adj_reg_polar"

        elseif kL < n/2
            e_evans = "reg_adj_polar"

        else
            e_evans = "reg_reg_polar"

        end

    else
        e_evans = Evan_type
    end

    if cmp(e_evans, "reg_adj_polar") == 0
        c_LA = func
        e_LA = c_LA
        c_RA = Aadj
        e_RA = c_RA
        e_kl = kL
        e_kr = n - kR

    elseif cmp(e_evans, "reg_reg_polar") == 0
        c_LA = func
        e_LA = c_LA
        c_RA = func
        e_RA = c_RA
        e_kl = kL
        e_kr = kR

    elseif cmp(e_evans, "adj_reg_polar") == 0
        c_LA = Aadj
        e_LA = Aadj
        c_RA = func
        e_RA = func
        e_kl = n - kL
        e_kr = kR

    elseif cmp(e_evans, "reg_adj_compound") == 0
        c_LA = func
        e_LA = compound_func
        c_RA = Aadj
        e_RA = Akadj
        e_kl = kL
        e_kr = kR

    elseif cmp(e_evans, "adj_reg_compound") == 0
        c_LA = Aadj
        e_LA = Akadj
        c_RA = func
        e_RA = compound_func
        e_kl = kL
        e_kr = kR

    elseif cmp(e_evans, "reg_reg_cheby") == 0
        c_LA = func
        e_LA = c_LA
        c_RA = func
        e_RA = c_RA
        e_kl = kL
        e_kr = kR
        e_NL = 60
        e_NR = 60

    end

    c_stats = "off"
    c_refine = "off"
    c_tol = 0.2
    c_ksteps = 2^5
    c_lambda_steps = 0
    c_basisL = 
    #TODO:: Modify return function when function is finished
    return 0, 0, 0

end

    