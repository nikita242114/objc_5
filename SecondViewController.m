#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)sendDataButtonPressed:(id)sender {
    NSString *param1 = self.textField1.text;
    NSString *param2 = self.textField2.text;
    
    NSURL *url = [NSURL URLWithString:@"https://api.example.com/post"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    NSString *postString = [NSString stringWithFormat:@"param1=%@&param2=%@", param1, param2];
    request.HTTPBody = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        // Обработка ответа, если необходимо
    }];
    
    [task resume];
}

@end