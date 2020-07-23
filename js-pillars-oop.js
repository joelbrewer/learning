class Animal {
  constructor(name) {
    this.name = name;
  }

  introduce() {
    console.log('name :', this.name);
  }
}

class Dog extends Animal {
  constructor(name) {
    super(name);
  }

  talk() {
    console.log('woof!');
  }
}

class Cat extends Animal {
  constructor(name) {
    super(name);
  }

  talk() {
    console.log('meow!');
  }
}

let lucille = new Cat("Lucille");
lucille.introduce();
lucille.talk();

// Abstraction in JavaScript

class Abstraction {
  constructor(param1, param2) {
    this.param1 = param1;
    this.param2 = param2;
  }

  get params() {
    return [this.param1, this.param2];
  }

  static staticMethod() {
    console.log('HELLO STATIC!');
  }
}

a = new Abstraction('joel', 'tanya');
console.log(a.params);
console.log(Abstraction.staticMethod());
