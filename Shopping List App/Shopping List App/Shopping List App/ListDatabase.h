

#import <Foundation/Foundation.h>

@interface ListDatabase : NSObject {
    
}

+ (NSMutableArray *)loadListDocs;
+ (NSString *)nextListDocPath;
+ (NSMutableArray *)importableListDocs;

@end