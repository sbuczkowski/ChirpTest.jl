"""
Extend Base.getindex to work with the AWS Chirp Zarr datastore
"""
function Base.getindex(s::Zarr.AbstractStore, p, i::CartesianIndex)
    zarray = JSON.parse(String(s[string(p, "/.zarray")]))
    sep = get!(zarray, "dimension_separator", ".")
    citostring(i::CartesianIndex) = join(reverse((i - oneunit(i)).I), sep)
    citostring(::CartesianIndex{0}) = "0"
    s[p, citostring(i)]
end
