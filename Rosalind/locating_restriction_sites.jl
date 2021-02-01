path = "C:\\Users\\vsger\\Downloads\\rosalind_revp.txt"

function readdata()
	a = readlines(path)
	dna = ""
	for i in 2:length(a)
		dna *= a[i]
	end
	return dna
end

function complement(a)
	if a == "A"
		return "T"
	elseif a == "T"
		return "A"
	elseif a == "G"
		return "C"
	elseif a == "C"
		return "G"
	end
end

function isreversepallindrome(s)
	a = join(map(x->complement(x),reverse(split(s,""))))
	return s == a
end

function main()
	dna = readdata()
	i = 1
	j = 4
	
	while i < length(dna)
		while j <= min(12,length(dna)-i+1)
			
			if isreversepallindrome(dna[i:(i+j-1)])
				println(i," ",j)
			end
			j += 1
		end
		j = 4
		i += 1
	end
end
main()
			

