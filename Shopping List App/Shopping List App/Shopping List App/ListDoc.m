#import "ListDoc.h"
#import "ListData.h"
#import "ListDatabase.h"
#import "NSData+CocoaDevUsersAdditions.h"

#define kDataKey        @"Data"
#define kDataFile       @"data.plist"

@implementation ListDoc
@synthesize data;
@synthesize docPath;

- (id)init {
    if ((self = [super init])) {
    }
    data = [[ListData alloc] init];

    return self;
}

- (id)initWithDocPath:(NSString *)docPath {
    if ((self = [super init])) {
        docPath = [docPath copy];
    }
    return self;
}

- (id)initWithTitle:(NSString*)title list:(NSMutableArray*)list
{
    if ((self = [super init])) {
        data = [[ListData alloc] init];
        data.title = title;
        data.list = list;
    }
    return self;
}

- (void)dealloc
{
    data = nil;
    docPath = nil;
}

- (BOOL)createDataPath {
    
    if (docPath == nil) {
        self.docPath = [ListDatabase nextListDocPath];
    }
    
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:docPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (!success) {
        NSLog(@"Error creating data path: %@", [error localizedDescription]);
    }
    return success;
    
}

- (ListData *)data
{
    
    if (data != nil) return data;
    
    NSString *dataPath = [docPath stringByAppendingPathComponent:kDataFile];
    NSData *codedData = [[NSData alloc] initWithContentsOfFile:dataPath];
    if (codedData == nil) return nil;
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
    data = [unarchiver decodeObjectForKey:kDataKey];
    [unarchiver finishDecoding];    
    return data;
}

- (void)saveData
{
    
    if (data == nil) return;
    
    [self createDataPath];
    
    NSString *dataPath = [docPath stringByAppendingPathComponent:kDataFile];
    NSMutableData *localData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:localData];
    [archiver encodeObject:data forKey:kDataKey];
    [archiver finishEncoding];
    [localData writeToFile:dataPath atomically:YES];
    NSLog(@"save DataPath = %@", dataPath);
    NSLog(@"data.title = %@", data.title);
}

- (void)deleteDoc {
    
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:docPath error:&error];
    if (!success)
    {
        NSLog(@"Error removing document path: %@", error.localizedDescription);
    }
    
}

- (NSString *)getExportFileName {
    NSString *fileName = data.title;
    NSString *zippedName = [fileName stringByAppendingString:@".sbz"];
    return zippedName;
}

- (NSData *)exportToNSData {
    NSError *error;
    NSURL *url = [NSURL fileURLWithPath:docPath];
    NSFileWrapper *dirWrapper = [[NSFileWrapper alloc] initWithURL:url options:0 error:&error];
    if (dirWrapper == nil) {
        NSLog(@"Error creating directory wrapper: %@", error.localizedDescription);
        return nil;
    }
    
    NSData *dirData = [dirWrapper serializedRepresentation];
    NSData *gzData = [dirData gzipDeflate];
    return gzData;
}

- (BOOL)exportToDiskWithForce:(BOOL)force {
    
    [self createDataPath];
    
    // Figure out destination name (in public docs dir)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *zippedName = [self getExportFileName];
    NSString *zippedPath = [documentsDirectory stringByAppendingPathComponent:zippedName];
    
    // Check if file already exists (unless we force the write)
    if (!force && [[NSFileManager defaultManager] fileExistsAtPath:zippedPath]) {
        return FALSE;
    }
    
    // Export to data buffer
    NSData *gzData = [self exportToNSData];
    if (gzData == nil) return FALSE;
    
    // Write to disk
    [gzData writeToFile:zippedPath atomically:YES];
    return TRUE;
    
}

- (BOOL)importData:(NSData *)zippedData {
    
    // Read data into a dir Wrapper
    NSData *unzippedData = [zippedData gzipInflate];
    NSFileWrapper *dirWrapper = [[NSFileWrapper alloc] initWithSerializedRepresentation:unzippedData];
    if (dirWrapper == nil) {
        NSLog(@"Error creating dir wrapper from unzipped data");
        return FALSE;
    }
    
    // Calculate desired name
    NSString *dirPath = [ListDatabase nextListDocPath];
    NSURL *dirUrl = [NSURL fileURLWithPath:dirPath];
    NSError *error;
    BOOL success = [dirWrapper writeToURL:dirUrl options:NSFileWrapperWritingAtomic originalContentsURL:nil error:&error];
    if (!success) {
        NSLog(@"Error importing file: %@", error.localizedDescription);
        return FALSE;
    }
    
    // Success!
    self.docPath = dirPath;
    return TRUE;
    
}

- (BOOL)importFromPath:(NSString *)importPath {
    
    // Read data into a dir Wrapper
    NSData *zippedData = [NSData dataWithContentsOfFile:importPath];
    return [self importData:zippedData];
    
}

- (BOOL)importFromURL:(NSURL *)importURL {
    
    // Read data into a dir Wrapper
    NSData *zippedData = [NSData dataWithContentsOfURL:importURL];
    return [self importData:zippedData];
    
}

@end