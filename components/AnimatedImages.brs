function init()
  m.animation = m.top.FindNode("floatUp0")
  m.animation.control = "start"
  m.animation.observeField("state", "reuseAnimationContainer")
  print "Animation starting, state = " ; m.animation.state
end function

sub reuseAnimationContainer()
  m.global.counter = (m.global.counter + 1) MOD (m.global.json.count())
  props = m.global.json[ m.global.counter]
  ' Set new image properties: width,height,translation,uri
  m.image = m.top.FindNode("img0")
  m.image.width = props.width
  m.image.height = props.height
  m.image.translation = props.translation
  m.image.uri = props.uri

  ' Set new animation properties: translation vector and key
  m.animation = m.top.FindNode("floatUp0")
  m.animation.duration = props.duration
  m.vec = m.top.FindNode("floatUpVec0")
  m.vec.key = props.animation_vector_key
  m.vec.keyValue = props.animation_vector_key_value

  print "Restarting animation duration " ; m.animation.duration ; " xpos " ; props.translation
  m.animation.control = "start"           
end sub
