class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'thread-crash'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    button = UIButton.alloc.initWithFrame(CGRectMake(100, 100, 150, 50))

    button.setTitle("Crash it", forState:UIControlStateNormal)
    button.setTitleColor(UIColor.blackColor, forState: UIControlStateNormal)

    rootViewController.view.addSubview(button)

    button.addTarget(self, action: "crash_it", forControlEvents:UIControlEventTouchUpInside)

    rootViewController

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end

  def applicationDidReceiveMemoryWarning(app)
    puts "MEMORY WARNING"
  end

  def crash_it
    200.times do
      Thread.new do
        puts "This will crash it"
      end
    end
  end
end
