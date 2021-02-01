path = "C:\\Users\\vsger\\Downloads\\rosalind_lexf (1).txt"
a = readlines(path)
alphabet = a[1]
l = parse(Int64,a[2])

a = sort(join.(vcat(Iterators.product(ntuple(_ -> split(alphabet," "),l)...)...)))
for i in a
	println(i)
end
