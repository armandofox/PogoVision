function init()
  print "Animation starting"
  m.animation = m.top.FindNode("floatUp0")
  m.animation.control = "start"
  m.animation.observeField("state", "reuseAnimationContainer")
end function

sub reuseAnimationContainer()
  print "In reuseAnimationContainer"
  state = m.appState
  m.image = m.top.FindNode("img0")
  m.global.counter = (m.global.counter + 1) MOD (m.global.json.count())
  props = m.global.json[ m.global.counter]
  m.image.uri = props.uri
  m.image.width = props.width
  m.image.height = props.height
  m.animation.control = "start"           
end sub
