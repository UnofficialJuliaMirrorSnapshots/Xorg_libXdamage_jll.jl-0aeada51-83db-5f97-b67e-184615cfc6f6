# Autogenerated wrapper script for Xorg_libXdamage_jll for i686-linux-musl
export libXdamage

using Xorg_damageproto_jll
using Xorg_libXfixes_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libXdamage`
const libXdamage_splitpath = ["lib", "libXdamage.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libXdamage_path = ""

# libXdamage-specific global declaration
# This will be filled out by __init__()
libXdamage_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libXdamage = "libXdamage.so.1"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Xorg_damageproto_jll.PATH_list, Xorg_libXfixes_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Xorg_damageproto_jll.LIBPATH_list, Xorg_libXfixes_jll.LIBPATH_list,))

    global libXdamage_path = abspath(joinpath(artifact"Xorg_libXdamage", libXdamage_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libXdamage_handle = dlopen(libXdamage_path)
    push!(LIBPATH_list, dirname(libXdamage_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

