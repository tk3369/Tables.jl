# -----------------------------------------------------------------------------
# Proof of concept - using BinaryTraits to define a RowTable trait
# -----------------------------------------------------------------------------
using BinaryTraits

# export trait related types
export AbstractTable, AbstractRowTable
export RowTable, IsRowTable, NotRowTable
export ColumnAccess, HasColumnAccess, NoColumnAccess

# export interface functions
export rows, getcolumn, columnnames

# -----------------------------------------------------------------------------
# Proof of concept - using BinaryTraits to define Tables.jl interface
# -----------------------------------------------------------------------------
abstract type AbstractTable end

# -----------------------------------------------------------------------------
# StandardRowTable - uses default row access method
# -----------------------------------------------------------------------------
@trait RowTable as AbstractTable prefix Is,Not

# "Return an object that presents IsIterable and HasColumnAccess traits."
@implement IsRowTable by rows()

# -----------------------------------------------------------------------------
# "ColumnAccess trait is needed for any row returned by the `rows` function."
# -----------------------------------------------------------------------------
@trait ColumnAccess prefix Has,No

# "Retrieve cell value by column index"
@implement HasColumnAccess by getcolumn(::Int)

# "Retrieve cell value by column name"
@implement HasColumnAccess by getcolumn(::Symbol)

# "Retrieve column names"
@implement HasColumnAccess by columnnames()

