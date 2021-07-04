using Markdown
using InteractiveUtils

# ╔═╡ 1a400f10-b665-11eb-1587-1de964d06c22
using HTTP

# ╔═╡ 4ce39ef0-b665-11eb-0849-fd5f12da1a61
using JSON

# ╔═╡ 51890b20-b665-11eb-272c-595b48f38f2b
using DataFrames

# ╔═╡ 63e30210-b93c-11eb-39dd-2fbfe53b009c
using Dates

# ╔═╡ 192b43b2-b665-11eb-11f6-4b33fd155638
begin
	function jsontodf(a)
		ka=union([keys(r) for r in a]...)
		cd=DataFrame(;Dict(Symbol(k)=>get.(a,k,missing) for k in ka)...)
		return cd
	end
end

# ╔═╡ e0fc5770-b8b4-11eb-0baa-d9c28aad8b30
function check(x)
	
	r1 = HTTP.get( "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?district_id=320&date="* string(x) *"-05-2021")
	
	str1 = String(r1.body)
	jobj1 = JSON.parse(str1)
	if length(jobj1["sessions"]) == 0
		return -1
	end
	state1=jsontodf(jobj1["sessions"])
	
	dose_one1=0
	for i in 1:nrow(state1)
		if occursin("NALKHEDA",state1[!,:name][i]) == true && state1[!,:min_age_limit][i] == 18
			dose_one1=state1[!,:available_capacity_dose1][i]

		end
		
		
	end
	return dose_one1
		
end

# ╔═╡ b3bdf7f0-b8cd-11eb-183a-e54a9758d4ac
string(check(21))*",,,"*string(check(23))

# ╔═╡ 41858210-b946-11eb-2fb9-45b17d599467


# ╔═╡ c372f3c0-b8c9-11eb-3193-5d715a804237
function slot(x)
	as=0
	while check(x) <=0  
		println("searcf")
		as+=1
		println(as)
		println(Dates.Time(Dates.now()))
		sleep(3)
	end
	println("OPEN_OPEN_OPEN_OPEN_OPEN_OPEN_OPEN_OPEN_OPEN_OPEN")
	println(string(check(x))*",,,"*string(check(x)))
end

# ╔═╡ fc235cb0-b945-11eb-10ad-5787fc4be851


# ╔═╡ 1fc486c0-ba2d-11eb-2160-f54578dace6a
slot(22)

# ╔═╡ a0362992-b8ce-11eb-07b3-d94a38e6abf1


# ╔═╡ Cell order:
# ╠═1a400f10-b665-11eb-1587-1de964d06c22
# ╠═4ce39ef0-b665-11eb-0849-fd5f12da1a61
# ╠═51890b20-b665-11eb-272c-595b48f38f2b
# ╠═192b43b2-b665-11eb-11f6-4b33fd155638
# ╠═e0fc5770-b8b4-11eb-0baa-d9c28aad8b30
# ╠═b3bdf7f0-b8cd-11eb-183a-e54a9758d4ac
# ╟─41858210-b946-11eb-2fb9-45b17d599467
# ╠═63e30210-b93c-11eb-39dd-2fbfe53b009c
# ╠═c372f3c0-b8c9-11eb-3193-5d715a804237
# ╟─fc235cb0-b945-11eb-10ad-5787fc4be851
# ╠═1fc486c0-ba2d-11eb-2160-f54578dace6a
# ╠═a0362992-b8ce-11eb-07b3-d94a38e6abf1
