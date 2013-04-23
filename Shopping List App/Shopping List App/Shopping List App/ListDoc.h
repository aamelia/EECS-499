#import <Foundation/Foundation.h>

@class ListData;

@interface ListDoc : NSObject
{
        ListData *data;
        NSString *docPath;
}

@property (nonatomic, strong) ListData *data;
@property (copy) NSString *docPath;

- (id)init;
- (id)initWithDocPath:(NSString *)docPath;
- (id)initWithTitle:(NSString*)title list:(NSMutableArray*)list;
- (void)saveData;
- (void)saveImages;
- (void)deleteDoc;
- (NSString *)getExportFileName;
- (NSData *)exportToNSData;
- (BOOL)exportToDiskWithForce:(BOOL)force;
- (BOOL)importFromPath:(NSString *)importPath;
- (BOOL)importFromURL:(NSURL *)importURL;

@end