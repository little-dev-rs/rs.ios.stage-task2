#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger num = [number integerValue];
    
    int count = 0;
    for (int n = 0; n < [array count]; n++) {
        id arr2n = [array objectAtIndex: n];
        NSNumber *num2n = (NSNumber*)arr2n;
        float floatValue2n = [num2n floatValue];
        int int2n = (int) floatValue2n;
        
        for (int k = n+1; k < [array count]; k++) {
            id arr1k = [array objectAtIndex: k];
            NSNumber *num1k = (NSNumber*)arr1k;
            float floatValue1k = [num1k floatValue];
            int int1k = (int) floatValue1k;
            int compare1 = int2n - int1k;
            int compareModule = abs(compare1);
            if (compareModule == num) {
                count++;
            }
        }
    }
    return count;
}

@end
