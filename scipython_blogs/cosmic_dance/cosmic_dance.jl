function make_plot(R,r,T,t)
	years = 9
	data_pts = 900
	ti = LinRange(0,years*T,data_pts)
	thetaR = (2*pi/T) .* ti
	thetar = (2*pi/t) .* ti
	
	XR,YR = R.*cos.(thetaR),R.*sin.(thetaR)
	Xr,Yr = r.*cos.(thetar),r.*sin.(thetar)
	ti = LinRange(0,years*T,data_pts)
	X,Y = R .* cos.(0:0.01:2*pi),R .* sin.(0:0.01:2*pi)
	x,y = r .* cos.(0:0.01:2*pi),r .* sin.(0:0.01:2*pi)
	plot(X,Y,linecolor = :green,lw = 2,labels = false)
	plot!(x,y,linecolor = :blue,lw = 2,labels = false)
	plot!([XR[1],Xr[1]],[YR[1],Yr[1]],labels = false,linecolor = :red)
	
	for i in 2:length(ti)
		#scatter([XR[i]],[YR[i]],markercolor = :red,markersize = 8)
		#scatter!([XR[i]],[YR[i]],markercolor = :green,markersize = 5)
		plot!([XR[i],Xr[i]],[YR[i],Yr[i]],labels = false,linecolor = :red,aspect_ratio = :equal,grid = false,showaxis = false,ticks = false,xlim = (-R,R),ylim = (-R,R),linealpha = 0.4,dpi =  300)
	end
	savefig("earth_venus.png")
end
make_plot(1,0.72,365.25,224.7)
		