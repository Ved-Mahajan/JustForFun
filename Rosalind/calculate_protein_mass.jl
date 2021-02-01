a = readlines("mass_table.txt")
a = split.(a,"   ")
mass_dict = Dict()
for i in a
	mass_dict[i[1]] = parse(Float64,i[2])
end
protein = readlines("rosalind_prtm.txt")[1]
mass = sum(map(x->mass_dict[x],split(protein,"")))
round(mass,digits = 3)