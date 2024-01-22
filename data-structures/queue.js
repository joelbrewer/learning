// [null,null,null,null]
// ^H
// ^T
class Queue {
  constructor(length) {
    this.head = 0
    this.tail = 0
    this.array = new Array(length);
  }

  enqueue(elem) {
    if ((this.tail -1) === this.head) {
      throw "Queue overflow";
    }
    this.array[this.tail] = elem;
    this.tail -= 1;
    if (this.tail < 0) {
      this.tail = this.array.length + this.tail;
    }
  }

  dequeue() {
    if (this.isEmpty()) {
      throw "Queue underflow";
    }
    this.previousHead = this.head;
    this.head -= 1;
    if (this.head < 0) {
      this.head = this.array.length + this.head;
    }
    return this.array[this.previousHead];
  }

  isEmpty() {
    return this.head === this.tail;
  }
}

//q = new Queue(4);
//q.enqueue(5);
//q.enqueue(4);
//q.enqueue(3);
//console.log(q.dequeue());
//console.log(q.dequeue());
//console.log(q.dequeue());
//q.enqueue(1);
//q.enqueue(2);
//console.log(q.dequeue());
//q.enqueue(8);
//q.enqueue(9);
//console.log(q.dequeue());

