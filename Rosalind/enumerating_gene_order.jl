
p = collect(permutations(1:6))
io = open("output.txt","w")
write(io,string(length(p))*"\n")
for i in p
	write(io,join(string.(i)," ")*"\n")
end
close(io)