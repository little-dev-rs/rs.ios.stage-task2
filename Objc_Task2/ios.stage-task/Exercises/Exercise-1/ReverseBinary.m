#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    
    // get first binary
    NSLog(@"number %hhu", n);
    NSMutableString * string = [[NSMutableString alloc] init];
        int spacing = pow( 2, 3 );
        int width = ( sizeof( n ) ) * spacing;
        int binaryDigit = 0;
        int integer = n;
    
        while( binaryDigit < width ) {
            binaryDigit++;
            [string insertString:( (integer & 1) ? @"1" : @"0" )atIndex:0];
            if( binaryDigit % spacing == 0 && binaryDigit != width ) {
                [string insertString:@" " atIndex:0];
            }
            integer = integer >> 1;
        }
    NSLog(@"string %@", string);
    
     // reverse string
    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [string length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[string substringWithRange:subStrRange]];
    }
    NSLog(@"reversedString %@", reversedString);
    
    // convert to int
    const char* utf8String = [reversedString UTF8String];
    const char* endPtr = NULL;
    long int final = strtol(utf8String, &endPtr, 2);
    
    return final;
}
