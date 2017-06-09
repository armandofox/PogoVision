sub Main()
    showChannelSGScreen()
end sub

sub showChannelSGScreen()
	print "in showChannelSGScreen"
	screen = CreateObject("roSGScreen")
	m.port = CreateObject("roMessagePort")
	screen.setMessagePort(m.port)

        screen.getGlobalNode().addFields({ json: [], counter: 0 })
        screen.getGlobalNode().json = FetchJSON()

	scene = screen.CreateScene("ScrollingPixScene")

	screen.show()
	while(true)
		msg = wait(0, m.port)
		msgType = type(msg)
		if msgType = "roSGScreenEvent"
			if msg.isScreenClosed() then return
		end if
	end while
end sub

function FetchJSON() as object
    print "Fetching..."
    url = "http://scrollpix.herokuapp.com/?n=100"
    xfer = CreateObject("roURLTransfer")
    xfer.SetURL(url)
    data = xfer.GetToString()
    print "complete"
    json = ParseJSON(data)
    return json
end function
