# UITableViewLeak
A UITableView bug in UIKit?

Could this be a memory leak issue in UITableViewController, when you delete a UITableViewCell by swiping?

Run the project, open the table by pressing the button, press back. All 6 cells will be deallocated.

Now open the table again, delete a row by swiping from right to left, then go back.

5 cells will be deallocated. The deleted one will hang around forever.

You can test at any time. The deleted cell's pointer address will be printed into the log.

So pause the execution and type "po xxxxxxxxx" into the lldb prompt. It will always return the deleted cell.
