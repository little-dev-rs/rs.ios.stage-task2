#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    // empty array
    if (numbersArray.count == 0) {
        return @"";
    }
    
    // more than 4
    if (numbersArray.count > 4) {
        return false;
    }
    
    // not full address
    NSMutableArray *myArray = [NSMutableArray arrayWithArray:numbersArray];
    if (myArray.count < 4) {
        for (int n = 1; n < 4; n++) {
            [myArray addObject:@(0)];
            NSLog(@"myArray %@", myArray);
        }
        NSString *joinedComponents = [myArray componentsJoinedByString:@"."];
        return joinedComponents;
    }
    
    // @"Negative numbers are not valid for input."
    // @"The numbers in the input array can be in the range from 0 to 255.")
    for (int n = 0; n < numbersArray.count; n++) {
        id arr2n = [numbersArray objectAtIndex: n];
        NSNumber *num2n = (NSNumber*)arr2n;
        float floatValue2n = [num2n floatValue];
        int int2n = (int) floatValue2n;

        if (int2n > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        
        if (int2n < 0) {
            return @"Negative numbers are not valid for input.";
        }
    }
    NSString *joinedComponents = [numbersArray componentsJoinedByString:@"."];
    return joinedComponents;
}

@end
