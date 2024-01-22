class Deque {

  constructor(size) {
    this.size = size;
    this.array = new Array(size);
    this.front = 2;
    this.back = 1;
  }

  insertFront(e) {
    this.front += 1;
    this.array[this.front - 1] = e;
  }

  deleteFront() {
    this.front -= 1;
    return this.array[this.front + 1];
  }

  insertBack(e) {
    this.back -= 1;
    this.array[this.back + 1] = e;
  }

  deleteBack() {
    this.back += 1;
    return this.array[this.back - 1];
  }

  log() {
    console.log('');
    console.log('=== : array : ', this.array.toString());
    console.log('=== : front : ', this.front, ' value : ', this.array[this.front]);
    console.log('=== : back : ' ,  this.back, ' value : ', this.array[this.back]);
  }
}
d = new Deque(6);
d.insertFront(4);
d.insertFront(3);
d.insertBack(2);
d.log();
