function init()
  print "Animation starting"
  m.animation = m.top.FindNode("floatUp0")
  m.animation.control = "start"
  m.animation.observeField("state", "reuseAnimationContainer")
end function

function reuseAnimationContainer() as void
  m.image = m.top.FindNode("img0")
  m.image.uri = "pkg:/images/img1.jpg"
  m.animation.control = "start"           
end function
