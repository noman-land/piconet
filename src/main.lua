fps=60
colors=16
pins={
	frame=0x5f80,
	reloads=0x5f81,
	-- xx=0x5f82,
	-- ...
	-- xx=0x5ffe,
	reload=0x5fff,
}
btns=0
reloads=0

function pressed(s)
	for pos in all(s) do
		if((btns>>_ENV[pos])&1==0)return
	end
	return true
end

function _init()
	frame=0
	bg_color=flr(rnd()*colors)
end

function reload()
	poke(pins.reloads,peek(pins.reloads)+1)
	run()
end

function listen_for_reload()
	if (pressed"❎" or peek(pins.reload)==1) then
		reload()
	end
end

function _update60()
	btns=btn()
	frame=(frame+1)%fps
	poke(pins.frame,frame)
	listen_for_reload()
end

function _draw()
	cls(bg_color)
	print("frame: "..frame)
	print("reloads: "..peek(pins.reloads))
	print("press ❎ to reload")
end