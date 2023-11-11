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
end

function _update()
	frame=(frame+1)%30
	poke(0x5f80, frame)
	listen_for_reset()
end

function listen_for_reset()
	-- Listen to the final array slot
	if (peek(0x5fff) == 1) run()
end

function _draw()
	cls(0)
	print(frame)
	print(peek(0x5fff))
end