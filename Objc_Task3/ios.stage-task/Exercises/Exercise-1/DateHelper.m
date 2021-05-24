#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    if (monthNumber < 1 || monthNumber > 12) {
        return  nil;
    }
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *startComponents = [[NSDateComponents alloc] init];
    startComponents.month = monthNumber;

    NSDate *date = [gregorian dateFromComponents: startComponents];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setLocalizedDateFormatFromTemplate:@"MMMM"];

    return [dateFormatter stringFromDate: date];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    
    NSDate *newDate = [dateFormatter dateFromString: date];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    long monthday = [gregorianCalendar component:NSCalendarUnitDay fromDate:newDate];
    
    return monthday;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *dateformatter = [NSDateFormatter new];
    dateformatter.dateFormat = @"E";
    dateformatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
        
    return [dateformatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSDate *todayDate = [NSDate date];
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    if ([gregorianCalendar component:NSCalendarUnitWeekOfYear fromDate:todayDate] == [gregorianCalendar component:NSCalendarUnitWeekOfYear fromDate:date]) {
        return  YES;
    } else {
    return NO;
    }
}

@end
