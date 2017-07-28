# Snake

这是一个仿 Masonry 的项目, 用于学习, 会逐步实现 Masonry 的核心功能, 但不会考虑各种边角情况.

#### 1.0.0

* [x] make
* [ ] remake
* [ ] update

* [x] equalTo
* [ ] greaterThanOrEqualTo
* [ ] lessThanOrEqualTo

* [x] left
* [x] top
* [x] right
* [x] bottom
* [x] width
* [x] height
* [x] centerX
* [x] centerY
* [ ] baesline
* [ ] edges
* [ ] size
* [ ] ceneter

#### example

```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.box1 = [[UIView alloc] init];
    self.box1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.box1];
    
    self.box2 = [[UIView alloc] init];
    self.box2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.box2];
    
    [self.box1 sn_makeConstraints:^(SNConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(20);
        make.top.equalTo(self.view).with.offset(20);
        make.height.equalTo(@100);
    }];
    
    [self.box2 sn_makeConstraints:^(SNConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-20);
        make.top.equalTo(self.view).with.offset(20);
        make.height.equalTo(self.box1);
        make.width.equalTo(self.box1);
        make.left.equalTo(self.box1.sn_right).with.offset(20);
    }];
}
```

