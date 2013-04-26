#import <Foundation/Foundation.h>

@class ListData;

@interface ListDoc : NSObject
{
    ListData *_data;
    NSString *_docPath;
}

@property (nonatomic, retain) ListData *data;
@property (copy) NSString *docPath;

- (id)init;
- (id)initWithDocPath:(NSString *)docPath;
- (id)initWithTitle:(NSString*)title items:(NSMutableArray*)items;
- (void)saveData;
- (void)deleteDoc;
- (NSString *)getExportFileName;
- (NSData *)exportToNSData;
- (BOOL)exportToDiskWithForce:(BOOL)force;
- (BOOL)importFromPath:(NSString *)importPath;
- (BOOL)importFromURL:(NSURL *)importURL;

@end
