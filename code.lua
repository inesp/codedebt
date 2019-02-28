    
    -- title:  simple collision detection
    -- author: Bear Thorne
    -- desc:   Detecting Collision for Grid Movement
    -- script: lua
    
    --VARIABLES
    
    --sprite vars
    FLOOR=1  --the floor sprite will be stored in the 1 slot
    WALL=224  --the wall sprite will be stored in the 17 slot
    DUDE=16  --the player sprite will be stored in the 33 slot
    
    --game constants
    SCREEN_X=29
    SCREEN_Y=16
    MOVEMENT_SPEED=15
    MOVEMENT_DELAY=60
    
    --player object
    p={
     x=3, --center of screen x
     y=1} --center of screen y
    	
    --FUNCTIONS    

    --player movement
    --we'll use the btnp() function to detect a single button press
    function move()
    	x=p.x
    	y=p.y
        --player presses "up"
        if btnp(0,MOVEMENT_DELAY,MOVEMENT_SPEED) then 
         y=p.y-1 
        
        end
        --player presses "down"
    	if btnp(1,MOVEMENT_DELAY,MOVEMENT_SPEED) then 
         y=p.y+1 
        
        end
        --player presses "left"
    	if btnp(2,MOVEMENT_DELAY,MOVEMENT_SPEED) then 
         x=p.x-1 
        
        end
        --player presses "right"
    	if btnp(3,MOVEMENT_DELAY,MOVEMENT_SPEED) then 
         x=p.x+1 
        end

        if mget(x,y)~=224 then
        	p.x=x
        	p.y=y
        end
    end
    
    --draw screen graphics
    function draw()
     cls()
     map(0,0,SCREEN_X+1,SCREEN_Y+1)
	
     --multiplying the player coors by 8 (the size of the map cells)
     --gives us grid movement
     spr(DUDE,p.x*8,p.y*8,8)
    end
    
    function TIC()
        move()
    	draw()
    end