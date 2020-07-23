function factorial(n) {
  if (n == 0) {
    return 1;
  } else {
    return factorial(n-1) * n;
  }
}
console.log(factorial(8));

// Side effect
// A side effect is any state change that is observable outside
// of the function itself, other than its return value.

// Binding functions in React

// class MyComponent extends React.Component {
//   // `this` in these methods will be bound to the current class instance
//   // This syntas was introduced in the ES6 class field declarations proposal
//   coolMethod = () => { }
//   anotherCoolMethod = () => { }
// }

// `this` in JavaScript
// - In most cases, `this` is determined by how a function is called (runtime binding)
// - Cannot be set by assignment during execution
// - May be different each time the function is called
// - ES5 introduced the bind() method to set `this` regardless of how the function is called
// - ES2015 introduced arrow functions, which don't provide their own `this` binding
// - In global execution, this refers to the global object, whether in strict mode or not

// this - global context
this.hi = "hello";
console.log("this : ", this);

const test = {
  prop: 42,
  func: function() {
    return this.prop;
  },
};
console.log(test.func());

// this - function context - not strict
function f1() {
  return this;
}
// console.log("f1() ", f1());
//
// this - function context - strict
function f2() {
  'use strict';
  return this;
}
console.log("f2() ", f2());

// To set the value of this to a particular value when called a function
// use call() or apply()

var obj = { a: 'Joel' };

var a = 'Global';

function whatsThis() {
  return this.a; // The value of `this` is dependent on how the function is called
}

console.log(whatsThis());
console.log(whatsThis.call(obj));
console.log(whatsThis.apply(obj));

function add(c, d) {
  return this.a + this.b + c + d;
}

var o = { a: 1, b: 3 };

console.log(add.call(o, 5, 7));
console.log(add.apply(o, [10, 20]));

// Currying

const addMe = (a) => (b) => {
  return a + b;
}

console.log(addMe(1)(2));

const multiplyMe = a => b => {
  return a * b;
}

console.log(multiplyMe(4)(5))


for(let i=0;i<9;i++){
  console.log(Array(i).join("#"));
}

// for(let i=1;i<101;i++) {
//   if (i % 3 === 0 && i % 5 === 0) {
//     console.log(`FizzBuzz ${i}`);
//   } else {
//     if (i % 3 === 0) {
//       console.log(`Fizz ${i}`);
//     } else if (i % 5 === 0) {
//       console.log(`Buzz ${i}`);
//     } else {
//       console.log(i);
//     }
//   }
// }

// FizzBuzz
for(let i=1;i<101;i++) {
  if (i%15 === 0) console.log("FizzBuzz");
  else if (i%3 === 0) console.log("Fizz");
  else if (i%5 === 0) console.log("Buzz");
  else console.log(i);
}

// Chess
function generateGrid(bounding) {
  let string = "";
  for(let i = 0; i<bounding; i++) {
    for(let j= 0; j<bounding; j++) {
      if (j % bounding === 0) {
        string += "\n";
        if (i % 2 === 0) {
          string += " ";
        }
      } else if (j%2 === 0) {
        string += " ";
      } else {
        string += "#";
      }
    }
  }
  return string;
}

console.log(generateGrid(15));
