///array = perlin_1d(size, octaves);
/*    
    returns an array of given size filled with perlin noise after
    'octaves' number of iterations (negative value or very large value
    will iterate until the frequency is as high as the array is big).
    values will range between 0 and 1
*/

var size = argument0;
var n = argument1;

//initialize array
var array = 0;
array[size-1] = 0;

//initialize amplitude and first "low frequency" step size
var amp = 0.5;
var step = size div 2;

while(n != 0 and step > 0 ) {

    var x1 = random(amp);
    var x2 = random(amp);
    for (var i = 0; i < size; i += step) {
        var i2 = i + step;            
        for (var j = i; j < i2 and j < size; j++) {
            array[j] += lerp(x1, x2, (j-i)/step);
        }
        x1 = x2;
        x2 = random(amp);
    }

    amp /= 2;
    step = step div 2;
    n--;    
}

return array;
 
