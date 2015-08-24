# ios-swift-sample



## AlertSample
UIAlertController 사용

## AnimationSample
```swift

UIView.animateWithDuration(1.0, animations: { () -> Void in
    self.move(self.block)
})

func move(view : UIView) -> Void {
    let width = self.view.frame.width - view.frame.width
    let height = self.view.frame.height - view.frame.height - 64

    var x = arc4random_uniform(UInt32(width))
    var y = arc4random_uniform(UInt32(height))

    println("width : \(width) ,height \(height)")
    println("x : \(x) ,y \(y)")
    view.center = CGPointMake(CGFloat(x), CGFloat(y))
}

func scale(view : UIView) -> Void {
    let length = arc4random_uniform(200) + 100
    println("length : \(length)")
    view.frame.size = CGSizeMake(CGFloat(length), CGFloat(length))
}


```


## CartAndCatalog

> 기능 미완. ( 다른 section에 item 추가하기 )

UITableView

UITableViewDataSource

Custom Cell & Delegate ( protocol )

```swift
func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
```

## CustomViewSample
drawRect
init(frame: CGRect)

## DrawingViewSample
custom view 

UIBezierPath

touchesBegan / touchesMoved


## KeyboardAndTextField
becomeFirstResponder / resignFirstResponder


NSNotificationCenter.defaultCenter().addObserver()

UITapGestureRecognizer


### find firstResponder

```swift
func findFirstResponder(view :UIView) -> UIResponder? {
    for v in view.subviews {
        if (v as? UIControl != nil) {
            if v.isFirstResponder() {
                return (v as! UIResponder)
            }
        } else {
            if v.subviews.count > 0 {
                return findFirstResponder(v as! UIView)
            }
        }
    }
    return nil
}
```


## LoadImageInUIImageView
UIImageView

```swift
UIImage(named: "bamssong.png")
```

```swift
if let filePath = NSBundle.mainBundle().pathForResource("bamssong", ofType: "png") {
    if let image2 = UIImage(contentsOfFile:filePath) {
        imageView2.image = image2
    }
}
```

```swift
if let imageUrl = NSURL(string: "http://cfile25.uf.tistory.com/image/2334C24F54697A5A242502") {
    if let imageData = NSData(contentsOfURL: imageUrl) {
        if let image3 = UIImage(data: imageData) {
            imageView3.image = image3
        }
    }
}
```

## ModalSceneSample
페이지 전환 방법 : modal scene.


## PagingPhotoScrollView

> bug : 페이지 이동 시 PageContrll 갱신이 안되는 현상.

UIScrollViewDelegate

PageControll


## PhotoViewer
UIButton : target-action

UIImageView : named



## SingleTouchSample
```swift
override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
	...
	CGRectContainsPoint(imageView.frame, point) 
}

override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
	...
}
```

## ThreeViewsByCode
```swift
let greenView = UIView()
greenView.frame = CGRectMake(40, 150, 150, 200)
greenView.backgroundColor = UIColor.greenColor()
greenView.alpha = 0.8

self.view.addSubview(greenView)
```
## UIDynamicsSample
```swift
self.animator = UIDynamicAnimator(referenceView: self.view)

gravityBehavior = UIGravityBehavior()
self.animator.addBehavior(gravityBehavior)

boundCollision = UICollisionBehavior()
boundCollision.setTranslatesReferenceBoundsIntoBoundaryWithInsets(UIEdgeInsetsZero)

self.animator.addBehavior(boundCollision)
```
## UpDownGame
up / down game.

UISegmentedControll

```swift
stateCountProgress.setProgress(Float(questionCount)/Float(MAX_QUESTION_COUNT), animated: true)

let dialog = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
```
