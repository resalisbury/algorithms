var testArray = [
  1,
  2,
  3,
  4,
  6,
  100,
  10000
]


function binarySearch(array, element) {
    var mid = Math.floor(array.length / 2);
    var arrayLength = array.length

    if (array[mid] === element) {
        return mid;
    } else if (array[mid] < element && arrayLength > 1) {
        // console.log(mid)
        return mid + binarySearch(array.splice(mid, arrayLength), element);
    } else if (array[mid] > element && arrayLength > 1) {
        return binarySearch(array.splice(0, mid), element);
    } else {
        console.log('not here');
        return -1;
    }

}

console.log(binarySearch(testArray, 6));

function binarySearch2(array, key) {
    var lo = 0,
        hi = array.length - 1,
        mid,
        element;
    while (lo <= hi) {
        mid = Math.floor((lo + hi) / 2, 10);
        element = array[mid];
        if (element < key) {
            lo = mid + 1;
        } else if (element > key) {
            hi = mid - 1;
        } else {
            return mid;
        }
    }
    return -1;
}

console.log(binarySearch2(testArray, 100));
