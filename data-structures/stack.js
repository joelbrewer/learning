//  0          1          2          3
// [undefined, undefined, undefined, undefined]

class Stack {
  constructor(length) {
    this.length = length;
    this.array = new Array(length);
    this.top = -1;
  }

  pop() {
    if (this.isEmpty()) {
      throw "Stack underflow";
    }
    this.top -= 1;
    return this.array[this.top + 1];
  }

  push(elem) {
    this.top += 1;
    if (this.top > this.length - 1) {
      throw "Stack overflow";
    }
    this.array[this.top] = elem;
  }

  isEmpty() {
    return this.top === -1;
  }
}

// Implementation of two stacks using one array
class DoubleStack {
  constructor(length) {
    this.length = length;
    this.array = new Array(length+1);
    this.t1 = 0;
    this.t2 = this.length +1;
  }

  pop1() {
    if (this.isEmpty1()) {
      throw "Stack Underflow";
    }
    this.t1 -= 1;
    return this.array[this.t1+1];

  }

  push1(elem) {
    if (this.t1 + 1 === this.t2) {
      throw "Stack Overflow";
    }
    this.t1 += 1;
    this.array[this.t1] = elem;
  }

  pop2() {
    if (this.isEmpty2()) {
      throw "Stack Underflow";
    }
    this.t2 += 1;
    return this.array[this.t2-1];
  }

  push2(elem) {
    if (this.t2 - 1 === this.t1) {
      throw "Stack Overflow";
    }
    this.t2 -= 1;
    this.array[this.t2] = elem;
  }

  isEmpty1() {
    this.t1 === 0;
  }

  isEmpty2() {
    this.t2 === this.array.length +1;
  }

  log() {
    console.log('array : ', this.array.toString());
    console.log('array length: ', this.array.length);
    console.log('t1 : ', this.t1, 'value at t1 : ', this.array[this.t1]);
    console.log('t2 : ', this.t2, 'value at t2 : ', this.array[this.t2]);
    console.log('');
  }
}

ds = new DoubleStack(5);
ds.push1(5);
ds.push2(6);
ds.push2(7);
ds.push1(3);
ds.log();
console.log(ds.pop1());
console.log(ds.pop2());
ds.log();
ds.push2(100);
ds.push2(200);
ds.push2(300);
ds.pop2();
ds.pop2();
ds.push1(50);
ds.push1(75);
ds.log();

