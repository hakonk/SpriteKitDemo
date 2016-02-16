import SpriteKit
import XCPlayground

struct Constants{
    static let ScreenWidth: CGFloat = 1024
    static let ScreenHeight: CGFloat = 768
}

let twoPi = CGFloat(M_PI * 2)
let actionDuration: NSTimeInterval = 2
let centerPosition = CGPointMake(Constants.ScreenWidth / 2, Constants.ScreenHeight / 2)

// View frame
let liveViewFrame = CGRectMake(0, 0, Constants.ScreenWidth, Constants.ScreenHeight)
let spriteKitView = SKView(frame: liveViewFrame)
spriteKitView.backgroundColor = SKColor.whiteColor()
XCPlaygroundPage.currentPage.liveView = spriteKitView

// demonstrate scene
let sceneSize = CGSizeMake(Constants.ScreenWidth, Constants.ScreenHeight)
let scene = SKScene(size: sceneSize)
scene.scaleMode = .AspectFit
scene.backgroundColor = SKColor.whiteColor()
spriteKitView.presentScene(scene)


let texture = SKTexture(imageNamed: "EPS_RGB_PURPLE_10")

let netlightLogo = SKSpriteNode(texture: texture)
//let netlightLogo = SKSpriteNode(imageNamed: "EPS_RGB_PURPLE_10")
let logoHeightWidthRatio = netlightLogo.size.height / netlightLogo.size.width
netlightLogo.size.width = Constants.ScreenWidth
netlightLogo.size.height = Constants.ScreenWidth * logoHeightWidthRatio
netlightLogo.physicsBody = {
    (texture: SKTexture, size: CGSize) -> SKPhysicsBody in
    let physicsBody = SKPhysicsBody(texture: texture, alphaThreshold: 0.4, size: size)
    physicsBody.affectedByGravity = false
    physicsBody.categoryBitMask = 1
    return physicsBody
}(texture, netlightLogo.size)

netlightLogo.position = centerPosition
netlightLogo.lightingBitMask = 1

scene.addChild(netlightLogo)

let halfScreenSize = SKAction.resizeToWidth(Constants.ScreenWidth / 2, height: Constants.ScreenWidth / 2 * logoHeightWidthRatio, duration: actionDuration)
let fitScreenSize = SKAction.resizeToWidth(Constants.ScreenWidth, height: Constants.ScreenWidth*logoHeightWidthRatio, duration: actionDuration)
let resizeSequence = SKAction.sequence([fitScreenSize,halfScreenSize])

let rotateAction = SKAction.rotateByAngle(twoPi, duration: actionDuration)

let actionGroup = SKAction.group([resizeSequence, rotateAction])
netlightLogo.runAction(SKAction.repeatActionForever(actionGroup))


func createLightNode() -> SKLightNode{
    let lightNode = SKLightNode()
    lightNode.position = centerPosition
    lightNode.lightColor = UIColor.whiteColor()
    lightNode.ambientColor = UIColor.whiteColor()
    lightNode.enabled = true
    lightNode.zPosition = 10.0
    return lightNode
}
scene.addChild(createLightNode())

