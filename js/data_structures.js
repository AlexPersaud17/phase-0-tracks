var color = ["red","blue","purple","green"];
var names = ["speed","barry","allen","zoom"];

// console.log(color);
// color.push("yellow");
// console.log(color);

// console.log(names);
// names.push("peter");
// console.log(names);

var horse = {};

if (color.length == names.length){
	for(var i = 0; i < color.length; i++){
		horse[names[i]]= color[i];
	}
}

console.log(horse);

function Car(brand, year, model) {
  console.log("Creating your car...");
  
  this.brand = brand;
  this.year = year;
  this.model = model;
  
  this.drive = function(){console.log("Vroom.");};
}

var newCar = new Car("BMW",2016,"m6");
console.log(newCar);
console.log(newCar.drive());

var anotherCar = new Car("Honda",2016,"civic");
console.log(anotherCar);
console.log(anotherCar.drive());