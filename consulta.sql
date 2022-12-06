select m.model_name, b.brand_name, h.holding_name, v.dt_purchase, v.vehicle_plate, c.color_name, v.total_km, ic.insurance_com_name, ip.policy_number
	from liseth_apollini.models m
	join liseth_apollini.brands b on m.id_brand = b.id_brand
	join liseth_apollini.holdings h on h.id_holding = b.id_holding 
	join liseth_apollini.vehicles v on v.id_model = m.id_model 
	join liseth_apollini.colors c on v.id_color = c.id_color
	join liseth_apollini.insurance_policies ip on ip.id_vehicle = v.id_vehicle
	join liseth_apollini.insurance_companies ic on ic.id_insurance_com = ip.id_insurance_com 
	