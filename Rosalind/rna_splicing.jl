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

path = "C:\\Users\\vsger\\Downloads\\rosalind_splc.txt"
fasta,dna = readdata(path)

dna_string = dna[1]
introns = dna[2:end]

DNACodonTable = Dict("TTT" => "F", "CTT" => "L", "ATT" => "I",
                       "GTT" => "V", "TTC" => "F", "CTC" => "L",
                       "ATC" => "I", "GTC" => "V", "TTA" => "L",
                       "CTA" => "L", "ATA" => "I", "GTA" => "V",
                       "TTG" => "L", "CTG" => "L", "ATG" => "M",
                       "GTG" => "V", "TCT" => "S", "CCT" => "P",
                       "ACT" => "T", "GCT" => "A", "TCC" => "S",
                       "CCC" => "P", "ACC" => "T", "GCC" => "A",
                       "TCA" => "S", "CCA" => "P", "ACA" => "T",
                       "GCA" => "A", "TCG" => "S", "CCG" => "P",
                       "ACG" => "T", "GCG" => "A", "TAT" => "Y",
                       "CAT" => "H", "AAT" => "N", "GAT" => "D",
                       "TAC" => "Y", "CAC" => "H", "AAC" => "N",
                       "GAC" => "D", "TAA" => "stop", "CAA" => "Q",
                       "AAA" => "K", "GAA" => "E", "TAG" => "stop",
                       "CAG" => "Q", "AAG" => "K", "GAG" => "E",
                       "TGT" => "C", "CGT" => "R", "AGT" => "S",
                       "GGT" => "G", "TGC" => "C", "CGC" => "R",
                       "AGC" => "S", "GGC" => "G", "TGA" => "stop",
                       "CGA" => "R", "AGA" => "R", "GGA" => "G",
                       "TGG" => "W", "CGG" => "R", "AGG" => "R",
                       "GGG" => "G")



function translate(dna)
	prot = ""
	for i in 1:3:(length(dna)-2)
		if DNACodonTable[dna[i:(i+2)]] != "stop"
			prot *= DNACodonTable[dna[i:(i+2)]]
		else
			break
		end
	end
	return prot
end

function splice(d,intron)
	l = length(intron)
	d = replace(d,intron => "")
	return d
end

function main()
	DNA = dna_string
	for i in introns
		DNA = splice(DNA,i)
	end
	protein = translate(DNA)
	return protein
end
main()

