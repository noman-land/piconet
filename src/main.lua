pins={
	frame=0x5f80,
	reloads=0x5f81,
	-- xx=0x5f82,
	-- ...
	-- xx=0x5ffe,
	reload=0x5fff,
}

function butn(t,n)
	return band(t,n)==n
end

function pressed(...)
	local check=0
	for b in all({...}) do check|=b end
	return (btn() & check) == check
end

function _init()
	frame=0
	bg_color=flr(rnd()*16)
end

function _update60()
	frame=(frame+1)%60
	poke(pins.frame,frame)
	listen_for_reset()
end

function listen_for_reset()
	if (peek(pins.reload)==1) then
		run()
		resets+=1
	end
end

function _draw()
	cls(bg_color)
	print("frame: "..frame)
	print("reloads: "..peek(pins.reloads))
end