# Example of a row table

module Test1
    using Test, Tables, BinaryTraits

    struct NamedTable
        name::String
        rows::Vector{NamedTuple}
    end

    @assign NamedTable with Tables.RowTable
    Tables.rows(t::NamedTable) = t.rows

    @assign NamedTuple with ColumnAccess
    Tables.getcolumn(row::NamedTuple, i::Int) = row[i] 
    Tables.getcolumn(row::NamedTuple, s::Symbol) = row[s]
    Tables.columnnames(row::NamedTuple)  

    function test()
        check(NamedTable)
        check(NamedTuple)
    end

end # module

using .Test1
Test1.test()
