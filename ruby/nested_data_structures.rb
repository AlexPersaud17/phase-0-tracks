family_cars = {
	alex_car: {
		type: {
			color: 'Electric Red',
			year: '2002',
			make: 'BMW',
			model: '325ci'
		},
		drivers_ages: [['Alex', '22'], ['Chris', '29'], ['Dad', '62']],
		transmission: 'manual'
	},
	chris_car: {
		type: {
			color: 'black',
			year: '2013',
			make: 'Honda', 
			model: 'Accord'
		},
		drivers_ages: [['Chris', '22'], ['Dad', '62']],
		transmission: 'automatic'
	},
	shivaun_car: {
		type: {
			color: 'gold',
			year: '2006',
			make: 'Infiniti',
			model: 'G35x'
		},
		drivers_ages: [['Shivaun', '31'], ['Mom', '56']],
		transmission: 'tiptronic'
	},
	parents_car: {
		type: {
			color: 'white',
			year: '2016',
			make: 'Infiniti',
			model: 'Qx60'
		},
		drivers_ages: [['Mom', '56'], ['Dad', '62']],
		transmission: 'tiptronic'
	}
}
puts family_cars[:alex_car][:drivers_ages][0][0]
puts family_cars[:parents_car][:type][:model]
puts family_cars[:chris_car][:transmission]