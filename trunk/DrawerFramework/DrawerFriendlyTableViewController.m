/**
 * Copyright (c) 2013 Ephraim Tekle genzeb@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
 * associated documentation files (the "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
 * following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial
 * portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
 * LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
 * NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


/**
 THE ONLY purpose of this class is to show you how to properly implement UITableViewController subclass
 in order for the top view in a drawer not to scroll with the table view. The only bits of code you need
 in your own custom tableviewcontroller is the part that is surrounded from top-right-bottom with //
 
 Alternatley, you can just subclass UIViewController like:
        MyTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
 
 and add your own custom UITableView. No matter what you do, you do NOT want the root view of the drawer
 viewcontroller to be a scroll view.
 
 */
#import "DrawerFriendlyTableViewController.h"

@implementation DrawerFriendlyTableViewController

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
@synthesize tableView; ////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////
    self.tableView = (UITableView *)self.view; /////////////////////
    self.view = [[UIView alloc] initWithFrame:self.view.frame]; ////
    self.tableView.frame = self.view.bounds; ///////////////////////
    [self.view addSubview:self.tableView]; /////////////////////////
    ////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////
} 

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:CellIdentifier];
    cell.textLabel.text = @"Hello World";
    
    return [cell autorelease];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
