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

stack = new Stack(4);
stack.push(5);
stack.push(6);
stack.push(7);
stack.push(8);
console.log(stack.pop());
console.log(stack.pop());
console.log(stack.pop());
