#import <Foundation/Foundation.h>

@interface Fraction: NSObject
{
    int numerator;
    int denominator;
}

@property int numerator, denominator;

-(void) print;
-(void) setNumerator: (int) n setDenominator: (int) d;

@end

@implementation Fraction

@synthesize numerator, denominator;

-(void) print
{
    NSLog(@"%i/%i",numerator,denominator);
}

-(void) setNumerator:(int)n setDenominator:(int)d
{
    numerator = n;
    denominator = d;
}

@end

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    Fraction *myFraction;
    myFraction = [Fraction alloc];
    myFraction = [myFraction init]; //Fraction *myFraction = [[Fraction alloc] init]; would also work
    
    [myFraction setNumerator: 2 setDenominator: 5];
    [myFraction print];
    [myFraction release];
    int x = 10;
    int y = 25;

    NSLog(@"Sum of x + y = %i", (x+y));

    [pool drain];
    return 0;
}
