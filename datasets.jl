using RDatasets
using DataFrames, Statistics

# RDatasets.datasets()
iris = dataset("datasets", "iris")
typeof(iris)

println(names(iris))
println(size(iris))

last(iris, 10)
first(iris, 10)

# Row count grouped by SPECIES
#by(iris, :Species, nrow)
grupamentos = combine(groupby(iris, :Species), nrow)

typeof(grupamentos)

#=
USO DE ESTATÍSTICAS
=#
#describe(iris)
describe(iris, :q25, :q75, :first, :last)

mean(iris[!, :SepalLength])
median(iris[!, :SepalLength])

for x in names(iris)[1:end-1]
    for y in names(iris)[1:end-1]
        println("$x \t $y $(cor(iris[!, x], iris[!, y]))")
    end
    println("-------------------")
end


SepalArray = Array(rand(iris[!, :SepalLength], 5))

A = convert.(Float64, iris.SepalLength)
B = convert.(Float64, iris.SepalWidth)
C = convert.(Float64, iris.PetalLength)
D = convert.(Float64, iris.PetalWidth)

matriz = [A B C D]

