#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    //as first iterate in two dim array
    NSMutableArray *stringsArray = [NSMutableArray new];
    NSMutableArray *intArray = [NSMutableArray new];
    NSMutableArray *finalArray = [NSMutableArray new];
     
        for(NSArray* innerArray in array){
            // if two dim array
            if  ([innerArray isKindOfClass:[NSArray class]]) {
                for(id element in innerArray){
                    if ([element isKindOfClass:[NSString class]]) {
                        [stringsArray addObject:element];
                    }
                    if ([element isKindOfClass:[NSNumber class]]) {
                        [intArray addObject:element];
                    }
                }
                // if one dim array
            } else {
                finalArray = [[NSMutableArray alloc] initWithArray: @[]];
            }
        }
    
    // sorting for arrays
    NSArray *sortedStrings = [stringsArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSLog(@"sortedStrings: %@", sortedStrings);
    
    NSArray *sortedNumbers = [intArray sortedArrayUsingComparator: ^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2];
    }];
 
    // if not empty then append into multidim array
    if  ((sortedNumbers.count != 0) && (sortedStrings.count != 0)) {
        [finalArray addObject:sortedNumbers];
        [finalArray addObject:sortedStrings];
    }
    if  ((sortedNumbers.count != 0) && (sortedStrings.count == 0)) {
        finalArray = [[NSMutableArray alloc] initWithArray:sortedNumbers];
    }
    if  ((sortedNumbers.count == 0) && (sortedStrings.count != 0)) {
        finalArray = [[NSMutableArray alloc] initWithArray:sortedStrings];
    }
    if  ( array == nil) {
        finalArray = [[NSMutableArray alloc] initWithArray: @[]];
    }
    
    return finalArray;
}

@end
