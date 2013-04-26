#import "ListDatabase.h"
#import "ListDoc.h"

@implementation ListDatabase

+ (NSString *)getPrivateDocsDir
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"Private Documents"];
    
    NSError *error;
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    
    return documentsDirectory;
}

+ (NSMutableArray *)loadListDocs
{
    // Get private docs dir
    NSString *documentsDirectory = [ListDatabase getPrivateDocsDir];
    //NSLog(@"Loading lists from %@", documentsDirectory);
    
    // Get contents of documents directory
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];
    if (files == nil)
    {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return nil;
    }
    
    // Create ListDoc for each file
    NSMutableArray *retval = [NSMutableArray arrayWithCapacity:files.count];
    for (NSString *file in files) {
        if ([file.pathExtension compare:@"list" options:NSCaseInsensitiveSearch] == NSOrderedSame)
        {
            NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:file];
            ListDoc *doc = [[ListDoc alloc] initWithDocPath:fullPath];
            [retval addObject:doc];
        }
    }
    return retval;
}

+ (NSString *)nextListDocPath
{
    
    // Get private docs dir
    NSString *documentsDirectory = [ListDatabase getPrivateDocsDir];
    
    // Get contents of documents directory
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];
    if (files == nil)
    {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return nil;
    }
    
    // Search for an available name
    int maxNumber = 0;
    for (NSString *file in files) {
        if ([file.pathExtension compare:@"list" options:NSCaseInsensitiveSearch] == NSOrderedSame)
        {
            NSString *fileName = [file stringByDeletingPathExtension];
            maxNumber = MAX(maxNumber, fileName.intValue);
        }
    }
    
    // Get available name
    NSString *availableName = [NSString stringWithFormat:@"%d.list", maxNumber+1];
    return [documentsDirectory stringByAppendingPathComponent:availableName];
}

+ (NSMutableArray *)importableListDocs
{
    
    NSMutableArray *retval = [NSMutableArray array];
    
    // Get public docs dir
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *publicDocumentsDir = [paths objectAtIndex:0];
    
    // Get contents of documents directory
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:publicDocumentsDir error:&error];
    if (files == nil)
    {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return retval;
    }
    
    // Add all sbzs to a list
    for (NSString *file in files)
    {
        if ([file.pathExtension compare:@"sbz" options:NSCaseInsensitiveSearch] == NSOrderedSame)
        {
            NSString *fullPath = [publicDocumentsDir stringByAppendingPathComponent:file];
            [retval addObject:fullPath];
        }
    }
    return retval;
}

@end
