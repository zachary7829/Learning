#import <Foundation/Foundation.h>

@interface Person: NSObject{
    int age;
    int weight;
}
-(void) print;
-(void) setAge: (int) a;
-(void) setWeight: (int) w;
@end

@implementation Person
-(void) print{
    NSLog(@"I am %d years old and weigh %d.",age,weight);
}
-(void) setAge: (int) a{
    age=a;
}
-(void) setWeight: (int) w{
    weight=w;
}
@end

int main(int argc, char *argv[]){
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc]init];
    Person *bucky;
    
    bucky = [Person alloc];
    bucky = [bucky init];
    
    [bucky setAge: 23];
    [bucky setWeight: 350];
    [bucky print];
    [bucky release];
    
    [pool drain];
    return 0;
}
