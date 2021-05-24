#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *result = [[NSMutableString alloc] init];
    
    while (string1.length != 0 && string2.length != 0) {
        NSString *symbol1 = [string1 substringToIndex:1];
        NSString *symbol2 = [string2 substringToIndex:1];
        if ([symbol1 compare:symbol2] == NSOrderedAscending || [symbol1 compare:symbol2] == NSOrderedSame) {
            [result appendString:symbol1];
            string1 = [string1 substringFromIndex:1];
        } else {
            [result appendString:symbol2];
            string2 = [string2 substringFromIndex:1];
        }
        
        if (string1.length == 0) {
            [result appendString:string2];
        } else if (string2.length == 0) {
            [result appendString:string1];
        }
    }
    return result;
}

@end
