$fn=90;

distance = 30;
flens = 10;

module led( c ) {
	color( c )
		translate( [ 0, 0, -8 ] )
			cylinder( d = 5, h = 10 );
}

module plug( c ) {
	color( c )
		cylinder( d = 10, h = 20 );
}

module both( c ) {
	plug( "black" );
	translate( [ 0, 19, 0 ] ) plug( c );
	translate( [ 0, 19+25, 0 ] ) led( c );
} 

module versiering() {
both( "yellow" );
translate( [ distance, 0, 0 ] ) both( "red" );
translate( [ -distance, 0, 0 ] ) plug( "green" );
}

*versiering();

module paneel() {
	translate( [ -150 + 2*distance, -2*distance/3, -5 ] )
		difference() { 
			hull() { 
				translate( [ 10, 10, 0 ] ) cylinder( r = 10, h = 5 );
				translate( [ 150 - 10, 10, 0 ] ) cylinder( r = 10, h = 5 );
				translate( [ 150 - 10, 100 - 10, 0 ] ) cylinder( r = 10, h = 5 );
				translate( [ 10, 100 - 10, 0 ] ) cylinder( r = 10, h = 5 );
 			}
			hull() { 
				translate( [ 10+flens, 10+flens, -.5 ] ) cylinder( r = 10, h = 6 );
				translate( [ 150 - 10-flens, 10+flens, -.5 ] ) cylinder( r = 10, h = 6 );
				translate( [ 150 - 10-flens, 100 - 10-flens, -.5 ] ) cylinder( r = 10, h = 6 );
				translate( [ 10+flens, 100 - 10-flens, -.5 ] ) cylinder( r = 10, h = 6 );
	 		}
		}
}

projection( cut = true ) 
	translate( [ 0, 0, 1 ] ) 
		paneel();