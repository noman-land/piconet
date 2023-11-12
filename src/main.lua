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
	poke(0x5f80, frame)
	listen_for_reset()
end

function listen_for_reset()
	-- Listen to the final array slot
	if (peek(0x5fff) == 1) then
		run()
		resets+=1
	end
end

function _draw()
	cls(bg_color)
	print("frame: "..frame)
	print("reloads: "..peek(0x5f81))
end