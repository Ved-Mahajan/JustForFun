function duffing(du,u,p,t)
	x = u[1]
	dx = u[2]
	du[1] = dx
	du[2] = -p[3]*dx - p[1]*x - p[2]*x^3 + p[4]*cos(p[5]*t)
end
parameters = [-1.0,1.0,0.3,0.2,1.2] #[alpha,beta,delta,gamma,omega]
tspan = (0.0,10.0)
dx0 = 0.0
x0 = 1.0
prob = ODEProblem(duffing,[x0,dx0],tspan,parameters)
sol = solve(prob)
sol = sol(0.0:0.001:10.0)
X = getindex.(sol.u,1)
Y = getindex.(sol.u,2)

plot(X,Y,label = false)
