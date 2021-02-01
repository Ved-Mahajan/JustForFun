# n,m = map(x->parse(Int64,x),split(readline("rosalind_fibd.txt")," "))


function mortal_fibb(n::Int64,m::Int64)::Array{Int64,1}
	#initialse array
	rabbits = zeros(Int64,m)
	rabbits[end] = 1
	#println(rabbits)
	for _ in 2:n
		newborns = sum(rabbits[1:(end-1)])
		rabbits[1:(end-1)] = rabbits[2:end]
		rabbits[end] = newborns
		#println(rabbits)
	end
	return rabbits

end

sum(mortal_fibb(6,3))


	
