function readdata(path::AbstractString)
	a = readlines(path)
	if a[1][1] == '>'
		fasta = []
		dna = []
		for i in a
			if i[1] == '>'
				push!(fasta,i)
				push!(dna,"")
			else 
				dna[end] *= i
			end
		end
		return fasta,dna
	else
		entity = ""
		for i in a
			entity *= i
		end
		return entity
	
	end
end
		
			
	
	