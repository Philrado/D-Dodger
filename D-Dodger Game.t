%"D-Dodger" Game
%By Philip Radojcic
%Started  December 13, 2012, Finished Janurary 16, 2013.
%(A defence dodging game where you have a ship and avoid projectiles.)

%Variables.
var Tfont : int
Tfont := Font.New ("Arial:30")
var SUPERTfont : int
SUPERTfont := Font.New ("Forte:90")
var BigTfont : int
BigTfont := Font.New ("Forte:35")
var BiggerTfont : int
BiggerTfont := Font.New ("Forte:60")
var MediumTfont : int
MediumTfont := Font.New ("Forte:25")
var STfont : int
STfont := Font.New ("Calibri:20")
var font, PositionX, PositionY, screen, buttonNumber, buttonPressed : int
screen := 0;
%var chars : array char of boolean
var xCo, yCo : int
xCo := 499
yCo := 55


%Pictures.
var BackgroundPic : int
BackgroundPic := Pic.FileNew ("Space4edit6.jpg")
BackgroundPic := Pic.Scale (BackgroundPic, 1010, 695)


setscreen ("Graphics:1010;695,nobuttonbar")
%colorback (black)

loop
    %=====================================================MAIN MENU=============================START==========================
    %Titles and background.
    if (screen = 0) then
	colorback (black)
	cls
	setscreen ("Graphics:1010;695")

	var BackgroundSprite1 : int
	BackgroundSprite1 := Pic.FileNew ("EnemyShip.bmp")
	BackgroundSprite1 := Pic.Scale (BackgroundSprite1, 90, 90)
	Pic.Draw (BackgroundSprite1, 710, 520, picMerge)
	var BackgroundSprite2 : int
	BackgroundSprite2 := Pic.FileNew ("EnemyShip.bmp")
	BackgroundSprite2 := Pic.Scale (BackgroundSprite2, 90, 90)
	Pic.Draw (BackgroundSprite2, 240, 520, picMerge)

	Draw.Text ("Welcome to D-Dodger", 320, 550, Tfont, brightcyan)
	Draw.ThickLine (20, 10, 20, 670, 4, brightcyan) %Left
	Draw.ThickLine (990, 10, 990, 670, 4, brightcyan) %Right
	Draw.ThickLine (20, 670, 990, 670, 4, brightcyan) %Top
	Draw.ThickLine (20, 10, 990, 10, 4, brightcyan) %Bottom
	%Storyline.
	Draw.Text ("You were a prisoner. You had just broken out of your", 230, 440, STfont, brightcyan)
	Draw.Text ("prison in the dark empire of Tyrantris. As you go to", 235, 400, STfont, brightcyan)
	Draw.Text ("escape and high-jack a ship, the empire starts a", 255, 360, STfont, brightcyan)
	Draw.Text ("lockdown, and you get cut off from your fellow", 260, 320, STfont, brightcyan)
	Draw.Text ("prisoners. You now need to escape by yourself", 260, 280, STfont, brightcyan)
	drawfillbox (720, 75, 890, 140, brightcyan)
	drawfillbox (725, 80, 885, 135, brightblue)
	Draw.Text ("Controls", 760, 100, STfont, brightcyan)
	drawfillbox (110, 75, 280, 140, brightcyan)
	drawfillbox (115, 80, 275, 135, brightblue)
	Draw.Text ("Quit", 170, 100, STfont, brightcyan)
	drawfillbox (410, 75, 590, 140, brightcyan)
	drawfillbox (415, 80, 585, 135, brightblue)
	Draw.Text ("Level Selection", 420, 100, STfont, brightcyan)

	%--------------------------------------------------------------------------------------------------------------------------




	%==================================================CONTROLS=================================START==========================
    elsif (screen = 1) then
	cls
	setscreen ("Graphics:1010;695")
	%CONTROLS.
	drawfillbox (400, 525, 610, 650, brightblue)
	drawfillbox (410, 535, 600, 640, black)
	Draw.Text ("D-Dodger", 420, 600, Tfont, brightcyan)
	Draw.Text ("[Controls]", 420, 555, Tfont, brightcyan)
	Draw.Text ("[Controls]", 420, 555, Tfont, brightcyan)
	Draw.Text ("(UP_ARROW_KEY) = Move the ship up.", 300, 390, STfont, brightcyan)
	Draw.Text ("(DOWN_ARROW_KEY) = Move the ship down.", 270, 330, STfont, brightcyan)
	Draw.Text ("(LEFT_ARROW_KEY) = Move the ship left.", 295, 270, STfont, brightcyan)
	Draw.Text ("(RIGHT_ARROW_KEY) = Move the ship right.", 280, 210, STfont, brightcyan)
	%Draw.Text ("(SPACEBAR_KEY) = The ship shoots a missile.", 280, 180, STfont, brightcyan)
	drawfillbox (420, 25, 585, 100, brightblue)
	drawfillbox (425, 30, 580, 95, black)
	Draw.Text ("Go back To", 440, 70, STfont, brightcyan)
	Draw.Text ("Main Menu", 440, 40, STfont, brightcyan)
	%--------------------------------------------------------------------------------------------------------------------------


    elsif (screen = 2) then
	cls
	setscreen ("Graphics:1010;695")
	%LEVEL MENU.
	drawfillbox (100, 545, 890, 670, brightblue)
	drawfillbox (110, 555, 870, 660, black)
	Draw.Text ("Select A Level", 150, 570, SUPERTfont, brightcyan)
	drawfillbox (160, 335, 385, 420, brightblue)
	drawfillbox (170, 345, 375, 410, black)
	Draw.Text ("Level #1", 190, 360, BigTfont, brightcyan)
	drawfillbox (160, 195, 385, 285, brightblue)
	drawfillbox (170, 205, 375, 275, black)
	Draw.Text ("Level #2", 190, 220, BigTfont, brightcyan)
	drawfillbox (160, 65, 385, 150, brightblue)
	drawfillbox (170, 75, 375, 140, black)
	Draw.Text ("Level #3", 190, 90, BigTfont, brightcyan)
	Draw.Text ("Level Difficulty", 490, 450, BigTfont, brightcyan)
	Draw.Text ("Easy", 600, 370, MediumTfont, brightcyan)
	Draw.Text ("Normal", 580, 230, MediumTfont, brightcyan)
	Draw.Text ("Hard", 600, 90, MediumTfont, brightcyan)
	if PositionX > 170 and PositionX < 375 and PositionY > 345 and PositionY < 410 and screen = 2 then
	    screen := 3
	    Music.PlayFileLoop ("Metroid Timeline.mp3")
	end if
	if PositionX > 170 and PositionX < 375 and PositionY > 205 and PositionY < 275 and screen = 2 then
	    screen := 4
	    Music.PlayFileLoop ("Metroid- Zero Mission Music - Brinstar Theme.mp3")
	end if
	if PositionX > 170 and PositionX < 375 and PositionY > 75 and PositionY < 140 and screen = 2 then
	    screen := 5
	    Music.PlayFileLoop ("Metroid- Other M Music - Final Mission Resolve.mp3")
	end if
	

				     %%%%%%%%%%%%%%%%%%%%%%%
				     %%%%%%%%%%%%%%%%%%%%%%%
							 %%%
							 %%%
							 %%%
							 %%%
							 %%%
				     %%%%%%%%%%%%%%%%%%%%%%%
				     %%%%%%%%%%%%%%%%%%%%%%%
							 %%%
							 %%%
							 %%%
							 %%%
							 %%%
				     %%%%%%%%%%%%%%%%%%%%%%% 
				     %%%%%%%%%%%%%%%%%%%%%%%  

	
	
	%==================================================PLAY====================================START==========================
    elsif (screen = 3) then
	cls
	setscreen ("Graphics:1010;695,offscreenonly")
	%LEVEL #1

	var delayTime : int := 5

	%MainShip.
	var mainShip : int := Pic.FileNew ("MainShipFinal.bmp")    %
	var mainShipSprite : int
	var dead : boolean := false
	mainShip := Pic.Scale (mainShip, 60, 60)
	mainShipSprite := Sprite.New (mainShip)
	Sprite.SetHeight (mainShipSprite, 1)

	Pic.Draw (BackgroundPic, 0, 0, picMerge)
	var chars : array char of boolean

	%EnemyShip.
	var enemyShip : int := Pic.FileNew ("EnemyShip.bmp")    %
	enemyShip := Pic.Scale (enemyShip, 90, 90)
	var amountOfEnemies : int := 1 %The amount of enemies
	var rechargeTime : array 1 .. amountOfEnemies of int % how long it takes before the next shot is shot.
	var rechargeTimer : array 1 .. amountOfEnemies of int % how long left until it can shoot again.
	var enemyShipX : array 1 .. amountOfEnemies of int
	var enemyShipY : array 1 .. amountOfEnemies of int
	var enemyShipSprites : array 1 .. amountOfEnemies of int %Sprites representing the enemy ships.
	enemyShipX (1) := 500
	enemyShipY (1) := 660

	for i : 1 .. amountOfEnemies   %Initialization for the enemy ships.
	    enemyShipSprites (i) := Sprite.New (enemyShip)
	    rechargeTimer (i) := 200 %Initialized value before it can shoot again.
	    rechargeTime (i) := 300
	    Sprite.Show (enemyShipSprites (i)) %Shows enemy ships.
	    Sprite.SetPosition (enemyShipSprites (i), enemyShipX (i), enemyShipY (i), true)
	end for

	var plasmaShotPic : int := Pic.FileNew ("laserblob.bmp")
	var amountOfLasers : int := 60 %How many plasmaShots can be on the screen at once.
	var lastLaser : int := 1 %index of the last plasmaShot fired.
	var newIndex : int := 0
	var plasmaShotX : array 1 .. amountOfLasers of real
	var plasmaShotY : array 1 .. amountOfLasers of real
	var plasmaShotXdiff : array 1 .. amountOfLasers of real
	var plasmaShotYdiff : array 1 .. amountOfLasers of real
	var plasmaShotSpeed : int := 5 %speed of the plasmaShot.
	var plasmaShotSprites : array 1 .. amountOfLasers of int
	var nextLaser : array 1 .. amountOfLasers of int
	var previousLaser : array 1 .. amountOfLasers of int
	var plasmaShotActive : array 1 .. amountOfLasers of boolean
	plasmaShotPic := Pic.Scale (plasmaShotPic, 30, 30)
	for i : 1 .. amountOfLasers
	    plasmaShotY (i) := -200
	    plasmaShotX (i) := -1000
	    plasmaShotSprites (i) := Sprite.New (plasmaShotPic)
	    plasmaShotActive (i) := false
	    Sprite.Hide (plasmaShotSprites (i))
	end for

	nextLaser (1) := 1
	previousLaser (1) := 2
	nextLaser (2) := 1
	previousLaser (2) := 1
	plasmaShotActive (1) := true
	plasmaShotActive (2) := true
	View.Update
	%3 2 1 Start!
	var Num3pic, Num3Sprite : int
	Num3pic := Pic.FileNew ("#3.bmp")
	Num3pic := Pic.Scale (Num3pic, 90, 90)
	Num3Sprite := Sprite.New (Num3pic)
	Sprite.Show (Num3Sprite)
	Sprite.SetPosition (Num3Sprite, 495, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (Num3Sprite)
	var Num2pic, Num2Sprite : int
	Num2pic := Pic.FileNew ("#2.bmp")
	Num2pic := Pic.Scale (Num2pic, 90, 90)
	Num2Sprite := Sprite.New (Num2pic)
	Sprite.Show (Num2Sprite)
	Sprite.SetPosition (Num2Sprite, 495, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (Num2Sprite)
	var Num1pic, Num1Sprite : int
	Num1pic := Pic.FileNew ("#1.bmp")
	Num1pic := Pic.Scale (Num1pic, 90, 90)
	Num1Sprite := Sprite.New (Num1pic)
	Sprite.Show (Num1Sprite)
	Sprite.SetPosition (Num1Sprite, 495, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (Num1Sprite)
	var Startpic, StartSprite : int
	Startpic := Pic.FileNew ("Start!.bmp")
	Startpic := Pic.Scale (Startpic, 180, 90)
	StartSprite := Sprite.New (Startpic)
	Sprite.Show (StartSprite)
	Sprite.SetPosition (StartSprite, 490, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (StartSprite)


	var start : int        %Time counter starts.
	start := Time.Elapsed
	loop

	    Sprite.Show (mainShipSprite)
	    Sprite.SetPosition (mainShipSprite, xCo, yCo, true)
	    var End : int
	    End := Time.Elapsed



	    %===================================================================================================================================
	    % SHIP MOVEMENT                      ________   S    ________   S    ________    S     ________     S   ________     S     ________
	    Input.KeyDown (chars)
	    if chars (KEY_UP_ARROW) then
		yCo := yCo + 6
	    end if
	    if chars (KEY_RIGHT_ARROW) then
		xCo := xCo + 6
	    end if
	    if chars (KEY_LEFT_ARROW) then
		xCo := xCo - 6
	    end if
	    if chars (KEY_DOWN_ARROW) then
		yCo := yCo - 6
	    end if
	    % SHIP MOVEMENT                      ________   E    ________   E    ________    E     ________    E    ________     E     ________
	    %===================================================================================================================================



	    %===================================================================================================================================
	    %LASER FIRE FORMULA                  ________   S    ________   S    ________    S     ________     S   ________     S     ________
	    %xCo > 495 and xCo < 505 and
	    for eNo : 1 .. amountOfEnemies % for the number of enemies
		if rechargeTimer (eNo) = 0 then % if the recharge time for a ship to fire is 0 then.
		    rechargeTimer (eNo) := rechargeTime (eNo)
		    loop
			newIndex := newIndex mod amountOfLasers + 1
			exit when plasmaShotActive (newIndex) = false or newIndex = lastLaser
		    end loop
		    nextLaser (newIndex) := nextLaser (lastLaser)
		    previousLaser (nextLaser (newIndex)) := newIndex
		    nextLaser (lastLaser) := newIndex
		    previousLaser (newIndex) := lastLaser
		    lastLaser := newIndex
		    var xDiff : int := xCo - enemyShipX (eNo)
		    var yDiff : int := yCo - enemyShipY (eNo) + 20
		    plasmaShotXdiff (newIndex) := plasmaShotSpeed * xDiff / sqrt (xDiff * xDiff + yDiff * yDiff) %fire value same speed in any direction.
		    plasmaShotYdiff (newIndex) := plasmaShotSpeed * yDiff / sqrt (xDiff * xDiff + yDiff * yDiff) %fire value same speed in any direction.
		    plasmaShotY (newIndex) := enemyShipY (eNo) - 20
		    plasmaShotX (newIndex) := enemyShipX (eNo)
		    plasmaShotActive (newIndex) := true
		    Sprite.Show (plasmaShotSprites (newIndex))
		end if
		if rechargeTimer (eNo) > 0 then
		    rechargeTimer (eNo) := max (rechargeTimer (eNo) - delayTime, 0)
		end if
	    end for
	    var i := lastLaser
	    loop
		i := nextLaser (i)
		if plasmaShotY (i) > -20 and plasmaShotY (i) < 715 and plasmaShotX (i) > -20 and plasmaShotX (i) < 1030 then
		    plasmaShotY (i) := plasmaShotY (i) + plasmaShotYdiff (i)
		    plasmaShotX (i) := plasmaShotX (i) + plasmaShotXdiff (i)
		    if Math.Distance (plasmaShotX (i), plasmaShotY (i), xCo, yCo) <= 40  then                  % YOU DIED!
			dead := true
		    end if
		    Sprite.SetPosition (plasmaShotSprites (i), round (plasmaShotX (i)), round (plasmaShotY (i)), true)
		else
		    nextLaser (previousLaser (i)) := nextLaser (i)
		    previousLaser (nextLaser (i)) := previousLaser (i)
		    lastLaser := nextLaser (i)
		    Sprite.Hide (plasmaShotSprites (i))
		    plasmaShotActive (i) := false
		end if
		exit when i = lastLaser
	    end loop
	    % LASER FIRE FORMULA                ________   E    ________   E    ________    E     ________    E    ________     E     ________
	    %===================================================================================================================================



	    %===================================================================================================================================
	    % SHIP HITBOX                       ________   S    ________   S    ________    S     ________     S   ________     S     ________

	    %MAP BORDERS
	    if xCo <= 29 then
		xCo := 30
	    elsif xCo >= 983 then
		xCo := 982
	    end if
	    if yCo >= 664 then
		yCo := 663
	    elsif yCo <= 29 then
		yCo := 30
	    end if

	    % SHIP HITBOX                       ________   E    ________   E    ________    E     ________    E    ________     E     ________
	    %===================================================================================================================================

	    delay (delayTime)

	    %============================================YOU ARE DEAD====================================START==========================
	    if dead then
		delay (100)
		i := lastLaser
		loop
		    Sprite.Hide (plasmaShotSprites (i))
		    i := nextLaser (i)
		    exit when i = lastLaser
		end loop
		Sprite.Hide (mainShipSprite)
		for eNo : 1 .. amountOfEnemies
		    Sprite.Hide (enemyShipSprites (eNo))
		end for
		cls
		colour (white)
		Music.PlayFileStop
		Draw.Text ("Statistics", 370, 620, BiggerTfont, brightred)
		locate (16, 60)
		Draw.Text ("Time Survived:", 430, 490, MediumTfont, brightred)
		var timeSurvived : real := (End - start) / 1000
		put timeSurvived, " seconds."
		var timeSurvivedInt := timeSurvived div 1
		var countScore : real := 0
		for count : 0 .. timeSurvivedInt by 5
		    countScore := countScore + 10
		end for
		countScore := countScore - 10
		var finalscore : real := countScore
		locate (25, 61)
		Draw.Text ("Total Score:", 440, 350, MediumTfont, brightred)
		put finalscore, " points."
		drawfillbox (390, 25, 630, 110, white)
		drawfillbox (395, 30, 625, 105, black)
		Draw.Text ("Double Click (Anywhere)", 300, 190, Tfont, brightred)
		Draw.Text ("To Go back To", 430, 140, STfont, brightred)
		Draw.Text ("Main Menu", 415, 55, Tfont, brightred)
		buttonwait ("down", PositionX, PositionY, buttonNumber, buttonPressed)
		if PositionX > 395 and PositionX < 625 and PositionY > 30 and PositionY < 105 and screen = 4 then
		    screen := 0    %Back to Main Menu BUTTON
		end if
		screen := 0
		xCo := 499
		yCo := 55
	    end if
	    %--------------------------------------------------------------------------------------------------------------------------

	    View.Update
	    exit when screen = 0
	end loop
				     
	
				     %%%                 %%%
				     %%%                 %%%
				     %%%                 %%%
				     %%%                 %%%
				     %%%                 %%%
				     %%%                 %%%             
				     %%%%%%%%%%%%%%%%%%%%%%%
				     %%%%%%%%%%%%%%%%%%%%%%%
							 %%%
							 %%%
							 %%%
							 %%%
							 %%%
							 %%% 
							 %%%

	

	%==================================================PLAY====================================START==========================
    elsif (screen = 4) then
	cls
	setscreen ("Graphics:1010;695,offscreenonly")
	%LEVEL #2

	var delayTime : int := 5

	%MainShip.
	var mainShip : int := Pic.FileNew ("MainShipFinal.bmp")    %
	var mainShipSprite : int
	var dead : boolean := false
	mainShip := Pic.Scale (mainShip, 60, 60)
	mainShipSprite := Sprite.New (mainShip)
	Sprite.SetHeight (mainShipSprite, 1)

	Pic.Draw (BackgroundPic, 0, 0, picMerge)
	var chars : array char of boolean

	%EnemyShip.
	var enemyShip : int := Pic.FileNew ("EnemyShip.bmp")    %
	enemyShip := Pic.Scale (enemyShip, 90, 90)
	var amountOfEnemies : int := 3 %The amount of enemies
	var rechargeTime : array 1 .. amountOfEnemies of int % how long it takes before the next shot is shot.
	var rechargeTimer : array 1 .. amountOfEnemies of int % how long left until it can shoot again.
	var enemyShipX : array 1 .. amountOfEnemies of int
	var enemyShipY : array 1 .. amountOfEnemies of int
	var enemyShipSprites : array 1 .. amountOfEnemies of int %Sprites representing the enemy ships.
	enemyShipX (1) := 500
	enemyShipY (1) := 660
	enemyShipX (2) := 40
	enemyShipY (2) := 660
	enemyShipX (3) := 975
	enemyShipY (3) := 660

	for i : 1 .. amountOfEnemies   %Initialization for the enemy ships.
	    enemyShipSprites (i) := Sprite.New (enemyShip)
	    rechargeTimer (i) := 200 %Initialized value before it can shoot again.
	    rechargeTime (i) := 300
	    Sprite.Show (enemyShipSprites (i)) %Shows enemy ships.
	    Sprite.SetPosition (enemyShipSprites (i), enemyShipX (i), enemyShipY (i), true)
	end for

	var plasmaShotPic : int := Pic.FileNew ("laserblob.bmp")
	var amountOfLasers : int := 100 %How many plasmaShots can be on the screen at once.
	var lastLaser : int := 1 %index of the last plasmaShot fired.
	var newIndex : int := 0
	var plasmaShotX : array 1 .. amountOfLasers of real
	var plasmaShotY : array 1 .. amountOfLasers of real
	var plasmaShotXdiff : array 1 .. amountOfLasers of real
	var plasmaShotYdiff : array 1 .. amountOfLasers of real
	var plasmaShotSpeed : int := 4 %speed of the plasmaShot.
	var plasmaShotSprites : array 1 .. amountOfLasers of int
	var nextLaser : array 1 .. amountOfLasers of int
	var previousLaser : array 1 .. amountOfLasers of int
	var plasmaShotActive : array 1 .. amountOfLasers of boolean
	plasmaShotPic := Pic.Scale (plasmaShotPic, 30, 30)
	for i : 1 .. amountOfLasers
	    plasmaShotY (i) := -200
	    plasmaShotX (i) := -1000
	    plasmaShotSprites (i) := Sprite.New (plasmaShotPic)
	    plasmaShotActive (i) := false
	    Sprite.Hide (plasmaShotSprites (i))
	end for

	nextLaser (1) := 1
	previousLaser (1) := 2
	nextLaser (2) := 1
	previousLaser (2) := 1
	plasmaShotActive (1) := true
	plasmaShotActive (2) := true
	View.Update
	
	%3 2 1 Start!
	var Num3pic, Num3Sprite : int
	Num3pic := Pic.FileNew ("#3.bmp")
	Num3pic := Pic.Scale (Num3pic, 90, 90)
	Num3Sprite := Sprite.New (Num3pic)
	Sprite.Show (Num3Sprite)
	Sprite.SetPosition (Num3Sprite, 495, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (Num3Sprite)
	var Num2pic, Num2Sprite : int
	Num2pic := Pic.FileNew ("#2.bmp")
	Num2pic := Pic.Scale (Num2pic, 90, 90)
	Num2Sprite := Sprite.New (Num2pic)
	Sprite.Show (Num2Sprite)
	Sprite.SetPosition (Num2Sprite, 495, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (Num2Sprite)
	var Num1pic, Num1Sprite : int
	Num1pic := Pic.FileNew ("#1.bmp")
	Num1pic := Pic.Scale (Num1pic, 90, 90)
	Num1Sprite := Sprite.New (Num1pic)
	Sprite.Show (Num1Sprite)
	Sprite.SetPosition (Num1Sprite, 495, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (Num1Sprite)
	var Startpic, StartSprite : int
	Startpic := Pic.FileNew ("Start!.bmp")
	Startpic := Pic.Scale (Startpic, 180, 90)
	StartSprite := Sprite.New (Startpic)
	Sprite.Show (StartSprite)
	Sprite.SetPosition (StartSprite, 490, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (StartSprite)

	var start : int        %Time counter starts.
	start := Time.Elapsed
	loop

	    Sprite.Show (mainShipSprite)
	    Sprite.SetPosition (mainShipSprite, xCo, yCo, true)
	    var End : int
	    End := Time.Elapsed

	    %===================================================================================================================================
	    % SHIP MOVEMENT                      ________   S    ________   S    ________    S     ________     S   ________     S     ________
	    Input.KeyDown (chars)
	    if chars (KEY_UP_ARROW) then
		yCo := yCo + 6
	    end if
	    if chars (KEY_RIGHT_ARROW) then
		xCo := xCo + 6
	    end if
	    if chars (KEY_LEFT_ARROW) then
		xCo := xCo - 6
	    end if
	    if chars (KEY_DOWN_ARROW) then
		yCo := yCo - 6
	    end if
	    % SHIP MOVEMENT                      ________   E    ________   E    ________    E     ________    E    ________     E     ________
	    %===================================================================================================================================



	    %===================================================================================================================================
	    %LASER FIRE FORMULA                  ________   S    ________   S    ________    S     ________     S   ________     S     ________
	    %xCo > 495 and xCo < 505 and
	    for eNo : 1 .. amountOfEnemies % for the number of enemies
		if rechargeTimer (eNo) = 0 then % if the recharge time for a ship to fire is 0 then.
		    rechargeTimer (eNo) := rechargeTime (eNo)
		    loop
			newIndex := newIndex mod amountOfLasers + 1
			exit when plasmaShotActive (newIndex) = false or newIndex = lastLaser
		    end loop
		    nextLaser (newIndex) := nextLaser (lastLaser)
		    previousLaser (nextLaser (newIndex)) := newIndex
		    nextLaser (lastLaser) := newIndex
		    previousLaser (newIndex) := lastLaser
		    lastLaser := newIndex
		    var xDiff : int := xCo - enemyShipX (eNo)
		    var yDiff : int := yCo - enemyShipY (eNo) + 20
		    plasmaShotXdiff (newIndex) := plasmaShotSpeed * xDiff / sqrt (xDiff * xDiff + yDiff * yDiff) %fire value same speed in any direction.
		    plasmaShotYdiff (newIndex) := plasmaShotSpeed * yDiff / sqrt (xDiff * xDiff + yDiff * yDiff) %fire value same speed in any direction.
		    plasmaShotY (newIndex) := enemyShipY (eNo) - 20
		    plasmaShotX (newIndex) := enemyShipX (eNo)
		    plasmaShotActive (newIndex) := true
		    Sprite.Show (plasmaShotSprites (newIndex))
		end if
		if rechargeTimer (eNo) > 0 then
		    rechargeTimer (eNo) := max (rechargeTimer (eNo) - delayTime, 0)
		end if
	    end for
	    var i := lastLaser
	    loop
		i := nextLaser (i)
		if plasmaShotY (i) > -20 and plasmaShotY (i) < 715 and plasmaShotX (i) > -20 and plasmaShotX (i) < 1030 then
		    plasmaShotY (i) := plasmaShotY (i) + plasmaShotYdiff (i)
		    plasmaShotX (i) := plasmaShotX (i) + plasmaShotXdiff (i)
		    if Math.Distance (plasmaShotX (i), plasmaShotY (i), xCo, yCo) <= 40  then                  % YOU DIED!
			dead := true
		    end if
		    Sprite.SetPosition (plasmaShotSprites (i), round (plasmaShotX (i)), round (plasmaShotY (i)), true)
		else
		    nextLaser (previousLaser (i)) := nextLaser (i)
		    previousLaser (nextLaser (i)) := previousLaser (i)
		    lastLaser := nextLaser (i)
		    Sprite.Hide (plasmaShotSprites (i))
		    plasmaShotActive (i) := false
		end if
		exit when i = lastLaser
	    end loop
	    % LASER FIRE FORMULA                ________   E    ________   E    ________    E     ________    E    ________     E     ________
	    %===================================================================================================================================



	    %===================================================================================================================================
	    % SHIP HITBOX                       ________   S    ________   S    ________    S     ________     S   ________     S     ________

	    %MAP BORDERS
	    if xCo <= 29 then
		xCo := 30
	    elsif xCo >= 983 then
		xCo := 982
	    end if
	    if yCo >= 664 then
		yCo := 663
	    elsif yCo <= 29 then
		yCo := 30
	    end if

	    % SHIP HITBOX                       ________   E    ________   E    ________    E     ________    E    ________     E     ________
	    %===================================================================================================================================

	    delay (delayTime)

	    %============================================YOU ARE DEAD====================================START==========================
	    if dead then
		delay (100)
		i := lastLaser
		loop
		    Sprite.Hide (plasmaShotSprites (i))
		    i := nextLaser (i)
		    exit when i = lastLaser
		end loop
		Sprite.Hide (mainShipSprite)
		for eNo : 1 .. amountOfEnemies
		    Sprite.Hide (enemyShipSprites (eNo))
		end for
		cls
		colour (white)
		Music.PlayFileStop
		Draw.Text ("Statistics", 370, 620, BiggerTfont, brightred)
		locate (16, 60)
		Draw.Text ("Time Survived:", 430, 490, MediumTfont, brightred)
		var timeSurvived : real := (End - start) / 1000
		put timeSurvived, " seconds."
		var timeSurvivedInt := timeSurvived div 1
		var countScore : real := 0
		for count : 0 .. timeSurvivedInt by 3
		    countScore := countScore + 10
		end for
		countScore := countScore - 10
		var finalscore : real := countScore
		locate (25, 61)
		Draw.Text ("Total Score:", 440, 350, MediumTfont, brightred)
		put finalscore, " points."
		drawfillbox (390, 25, 630, 110, white)
		drawfillbox (395, 30, 625, 105, black)
		Draw.Text ("Double Click (Anywhere)", 300, 190, Tfont, brightred)
		Draw.Text ("To Go back To", 430, 140, STfont, brightred)
		Draw.Text ("Main Menu", 415, 55, Tfont, brightred)
		buttonwait ("down", PositionX, PositionY, buttonNumber, buttonPressed)
		if PositionX > 395 and PositionX < 625 and PositionY > 30 and PositionY < 105 and screen = 4 then
		    screen := 0    %Back to Main Menu BUTTON
		end if
		screen := 0
		xCo := 499
		yCo := 55
	    end if
	    %--------------------------------------------------------------------------------------------------------------------------

	    View.Update
	    exit when screen = 0
	end loop
							 
	
				     %%%%%%%%%%%%%%%%%%%%%%%
				     %%%%%%%%%%%%%%%%%%%%%%%
				     %%%
				     %%%
				     %%%
				     %%%
				     %%%
				     %%%%%%%%%%%%%%%%%%%%%%%
				     %%%%%%%%%%%%%%%%%%%%%%%
							 %%%
							 %%%
							 %%%
							 %%%
							 %%%
				     %%%%%%%%%%%%%%%%%%%%%%% 
				     %%%%%%%%%%%%%%%%%%%%%%%  

				     

	%==================================================PLAY====================================START==========================
    elsif (screen = 5) then
	cls
	setscreen ("Graphics:1010;695,offscreenonly")
	%LEVEL #3

	var delayTime : int := 5

	%MainShip.
	var mainShip : int := Pic.FileNew ("MainShipFinal.bmp")    %
	var mainShipSprite : int
	var dead : boolean := false
	mainShip := Pic.Scale (mainShip, 60, 60)
	mainShipSprite := Sprite.New (mainShip)
	Sprite.SetHeight (mainShipSprite, 1)

	Pic.Draw (BackgroundPic, 0, 0, picMerge)
	var chars : array char of boolean

	%EnemyShip.
	var enemyShip : int := Pic.FileNew ("EnemyShip.bmp")    %
	enemyShip := Pic.Scale (enemyShip, 90, 90)
	var amountOfEnemies : int := 5 %The amount of enemies
	var rechargeTime : array 1 .. amountOfEnemies of int % how long it takes before the next shot is shot.
	var rechargeTimer : array 1 .. amountOfEnemies of int % how long left until it can shoot again.
	var enemyShipX : array 1 .. amountOfEnemies of int
	var enemyShipY : array 1 .. amountOfEnemies of int
	var enemyShipSprites : array 1 .. amountOfEnemies of int %Sprites representing the enemy ships.
	enemyShipX (1) := 500
	enemyShipY (1) := 660
	enemyShipX (2) := 40
	enemyShipY (2) := 660
	enemyShipX (3) := 975
	enemyShipY (3) := 660
	enemyShipX (4) := 270
	enemyShipY (4) := 660
	enemyShipX (5) := 730
	enemyShipY (5) := 660

	for i : 1 .. amountOfEnemies   %Initialization for the enemy ships.
	    enemyShipSprites (i) := Sprite.New (enemyShip)
	    rechargeTimer (i) := 200 %Initialized value before it can shoot again.
	    rechargeTime (i) := 300
	    Sprite.Show (enemyShipSprites (i)) %Shows enemy ships.
	    Sprite.SetPosition (enemyShipSprites (i), enemyShipX (i), enemyShipY (i), true)
	end for

	var plasmaShotPic : int := Pic.FileNew ("laserblob.bmp")
	var amountOfLasers : int := 100 %How many plasmaShots can be on the screen at once.
	var lastLaser : int := 1 %index of the last plasmaShot fired.
	var newIndex : int := 0
	var plasmaShotX : array 1 .. amountOfLasers of real
	var plasmaShotY : array 1 .. amountOfLasers of real
	var plasmaShotXdiff : array 1 .. amountOfLasers of real
	var plasmaShotYdiff : array 1 .. amountOfLasers of real
	var plasmaShotSpeed : int := 8 %speed of the plasmaShot.
	var plasmaShotSprites : array 1 .. amountOfLasers of int
	var nextLaser : array 1 .. amountOfLasers of int
	var previousLaser : array 1 .. amountOfLasers of int
	var plasmaShotActive : array 1 .. amountOfLasers of boolean
	plasmaShotPic := Pic.Scale (plasmaShotPic, 30, 30)
	for i : 1 .. amountOfLasers
	    plasmaShotY (i) := -200
	    plasmaShotX (i) := -1000
	    plasmaShotSprites (i) := Sprite.New (plasmaShotPic)
	    plasmaShotActive (i) := false
	    Sprite.Hide (plasmaShotSprites (i))
	end for

	nextLaser (1) := 1
	previousLaser (1) := 2
	nextLaser (2) := 1
	previousLaser (2) := 1
	plasmaShotActive (1) := true
	plasmaShotActive (2) := true
	View.Update
	
	%3 2 1 Start!
	var Num3pic, Num3Sprite : int
	Num3pic := Pic.FileNew ("#3.bmp")
	Num3pic := Pic.Scale (Num3pic, 90, 90)
	Num3Sprite := Sprite.New (Num3pic)
	Sprite.Show (Num3Sprite)
	Sprite.SetPosition (Num3Sprite, 495, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (Num3Sprite)
	var Num2pic, Num2Sprite : int
	Num2pic := Pic.FileNew ("#2.bmp")
	Num2pic := Pic.Scale (Num2pic, 90, 90)
	Num2Sprite := Sprite.New (Num2pic)
	Sprite.Show (Num2Sprite)
	Sprite.SetPosition (Num2Sprite, 495, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (Num2Sprite)
	var Num1pic, Num1Sprite : int
	Num1pic := Pic.FileNew ("#1.bmp")
	Num1pic := Pic.Scale (Num1pic, 90, 90)
	Num1Sprite := Sprite.New (Num1pic)
	Sprite.Show (Num1Sprite)
	Sprite.SetPosition (Num1Sprite, 495, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (Num1Sprite)
	var Startpic, StartSprite : int
	Startpic := Pic.FileNew ("Start!.bmp")
	Startpic := Pic.Scale (Startpic, 180, 90)
	StartSprite := Sprite.New (Startpic)
	Sprite.Show (StartSprite)
	Sprite.SetPosition (StartSprite, 490, 400, true)
	delay (500)
	View.Update
	Sprite.Hide (StartSprite)

	var start : int        %Time counter starts.
	start := Time.Elapsed
	loop

	    Sprite.Show (mainShipSprite)
	    Sprite.SetPosition (mainShipSprite, xCo, yCo, true)
	    var End : int
	    End := Time.Elapsed


	    %===================================================================================================================================
	    % SHIP MOVEMENT                      ________   S    ________   S    ________    S     ________     S   ________     S     ________
	    Input.KeyDown (chars)
	    if chars (KEY_UP_ARROW) then
		yCo := yCo + 6
	    end if
	    if chars (KEY_RIGHT_ARROW) then
		xCo := xCo + 6
	    end if
	    if chars (KEY_LEFT_ARROW) then
		xCo := xCo - 6
	    end if
	    if chars (KEY_DOWN_ARROW) then
		yCo := yCo - 6
	    end if
	    % SHIP MOVEMENT                      ________   E    ________   E    ________    E     ________    E    ________     E     ________
	    %===================================================================================================================================



	    %===================================================================================================================================
	    %LASER FIRE FORMULA                  ________   S    ________   S    ________    S     ________     S   ________     S     ________
	    %xCo > 495 and xCo < 505 and
	    for eNo : 1 .. amountOfEnemies % for the number of enemies
		if rechargeTimer (eNo) = 0 then % if the recharge time for a ship to fire is 0 then.
		    rechargeTimer (eNo) := rechargeTime (eNo)
		    loop
			newIndex := newIndex mod amountOfLasers + 1
			exit when plasmaShotActive (newIndex) = false or newIndex = lastLaser
		    end loop
		    nextLaser (newIndex) := nextLaser (lastLaser)
		    previousLaser (nextLaser (newIndex)) := newIndex
		    nextLaser (lastLaser) := newIndex
		    previousLaser (newIndex) := lastLaser
		    lastLaser := newIndex
		    var xDiff : int := xCo - enemyShipX (eNo)
		    var yDiff : int := yCo - enemyShipY (eNo) + 20
		    plasmaShotXdiff (newIndex) := plasmaShotSpeed * xDiff / sqrt (xDiff * xDiff + yDiff * yDiff) %fire value same speed in any direction.
		    plasmaShotYdiff (newIndex) := plasmaShotSpeed * yDiff / sqrt (xDiff * xDiff + yDiff * yDiff) %fire value same speed in any direction.
		    plasmaShotY (newIndex) := enemyShipY (eNo) - 20
		    plasmaShotX (newIndex) := enemyShipX (eNo)
		    plasmaShotActive (newIndex) := true
		    Sprite.Show (plasmaShotSprites (newIndex))
		end if
		if rechargeTimer (eNo) > 0 then
		    rechargeTimer (eNo) := max (rechargeTimer (eNo) - delayTime, 0)
		end if
	    end for
	    var i := lastLaser
	    loop
		i := nextLaser (i)
		if plasmaShotY (i) > -20 and plasmaShotY (i) < 715 and plasmaShotX (i) > -20 and plasmaShotX (i) < 1030 then
		    plasmaShotY (i) := plasmaShotY (i) + plasmaShotYdiff (i)
		    plasmaShotX (i) := plasmaShotX (i) + plasmaShotXdiff (i)
		    if Math.Distance (plasmaShotX (i), plasmaShotY (i), xCo, yCo) <= 40  then                  % YOU DIED!
			dead := true
		    end if
		    Sprite.SetPosition (plasmaShotSprites (i), round (plasmaShotX (i)), round (plasmaShotY (i)), true)
		else
		    nextLaser (previousLaser (i)) := nextLaser (i)
		    previousLaser (nextLaser (i)) := previousLaser (i)
		    lastLaser := nextLaser (i)
		    Sprite.Hide (plasmaShotSprites (i))
		    plasmaShotActive (i) := false
		end if
		exit when i = lastLaser
	    end loop
	    % LASER FIRE FORMULA                ________   E    ________   E    ________    E     ________    E    ________     E     ________
	    %===================================================================================================================================



	    %===================================================================================================================================
	    % SHIP HITBOX                       ________   S    ________   S    ________    S     ________     S   ________     S     ________

	    %MAP BORDERS
	    if xCo <= 29 then
		xCo := 30
	    elsif xCo >= 983 then
		xCo := 982
	    end if
	    if yCo >= 664 then
		yCo := 663
	    elsif yCo <= 29 then
		yCo := 30
	    end if

	    % SHIP HITBOX                       ________   E    ________   E    ________    E     ________    E    ________     E     ________
	    %===================================================================================================================================

	    delay (delayTime)

	    %============================================YOU ARE DEAD====================================START==========================
	    if dead then
		delay (100)
		i := lastLaser
		loop
		    Sprite.Hide (plasmaShotSprites (i))
		    i := nextLaser (i)
		    exit when i = lastLaser
		end loop
		Sprite.Hide (mainShipSprite)
		for eNo : 1 .. amountOfEnemies
		    Sprite.Hide (enemyShipSprites (eNo))
		end for
		cls
		colour (white)
		Music.PlayFileStop
		Draw.Text ("Statistics", 370, 620, BiggerTfont, brightred)
		locate (16, 60)
		Draw.Text ("Time Survived:", 430, 490, MediumTfont, brightred)
		var timeSurvived : real := (End - start) / 1000
		put timeSurvived, " seconds."
		var timeSurvivedInt := timeSurvived div 1
		var countScore : real := 0
		for count : 0 .. timeSurvivedInt by 1
		    countScore := countScore + 7.5
		end for
		countScore := countScore - 7.5
		var finalscore : real := countScore
		locate (25, 61)
		Draw.Text ("Total Score:", 440, 350, MediumTfont, brightred)
		put finalscore, " points."
		drawfillbox (390, 25, 630, 110, white)
		drawfillbox (395, 30, 625, 105, black)
		Draw.Text ("Double Click (Anywhere)", 300, 190, Tfont, brightred)
		Draw.Text ("To Go back To", 430, 140, STfont, brightred)
		Draw.Text ("Main Menu", 415, 55, Tfont, brightred)
		buttonwait ("down", PositionX, PositionY, buttonNumber, buttonPressed)
		if PositionX > 395 and PositionX < 625 and PositionY > 30 and PositionY < 105 and screen = 4 then
		    screen := 0    %Back to Main Menu BUTTON
		end if
		screen := 0
		xCo := 499
		yCo := 55
	    end if
	    %--------------------------------------------------------------------------------------------------------------------------

	    View.Update
	    exit when screen = 0
	end loop
    end if
    %--------------------------------------------------------------------------------------------------------------------------







    %==================================================BUTTONS==================================START==========================
    buttonwait ("down", PositionX, PositionY, buttonNumber, buttonPressed)
    if PositionX > 725 and PositionX < 885 and PositionY > 80 and PositionY < 135 and screen = 0 then
	delay (200)
	screen := 1     %Controls BUTTON
    elsif PositionX > 415 and PositionX < 585 and PositionY > 80 and PositionY < 135 and screen = 0 then
	delay (200)
	screen := 2     %Level Selection BUTTON
    elsif PositionX < 275 and PositionY > 80 and PositionY < 135 and screen = 0 then
    cls
    setscreen ("Graphics:1010;695")
    Draw.Text ("Made By Philip Radojcic", 90, 500, BiggerTfont, brightred)
    Draw.Text ("Greatly Assisted by Nikita Kapustin", 280, 300, MediumTfont, brightred)
    delay (5000)
	quit     %Quit BUTTON
    else
	%Nothing happens if you don't click a button.
    end if
    if PositionX > 425 and PositionX < 580 and PositionY > 30 and PositionY < 95 and screen = 1 then
	screen := 0     %Back to Main Menu BUTTON
    end if
end loop
%--------------------------------------------------------------------------------------------------------------------------


%BIBILIOGRAPHY!

%Background made up of 3 images, then photoshopped by Philip Radojcic
%Space Station = http://www.google.ca/imgres?num=10&hl=en&tbo=d&biw=1920&bih=936&tbm=isch&tbnid=vkuE_WvdfiYuTM:&imgrefurl=http://www.swagonline.net/taxonomy/term/36%3Fpage%3D4&docid=SH6tVPux9tPpSM&imgurl=http://www.swagonline.net/files/images/space%252520station%252520icon.preview.jpg&w=800&h=400&ei=MWP3UO61C6aI2gXvmYGADg&zoom=1&iact=rc&dur=342&sig=108913309538085314747&page=1&tbnh=135&tbnw=245&start=0&ndsp=53&ved=1t:429,r:1,s:0,i:85&tx=102&ty=70
%Metal Planet = http://www.google.ca/imgres?hl=en&tbo=d&biw=1920&bih=936&tbm=isch&tbnid=UsJ9BSOZw0POHM:&imgrefurl=http://www.kickstarter.com/projects/659943965/planetary-annihilation-a-next-generation-rts/posts/299852&docid=uwE1LvDzSP03IM&imgurl=http://planetaryannihilation.com/assets/metal_planet.png&w=1280&h=720&ei=-2P3UKy7BKXo2QXsnYDoBg&zoom=1&iact=hc&vpx=145&vpy=140&dur=763&hovh=168&hovw=300&tx=89&ty=70&sig=108913309538085314747&page=1&tbnh=140&tbnw=253&start=0&ndsp=49&ved=1t:429,r:1,s:0,i:82
%Space Background = http://www.google.ca/imgres?hl=en&tbo=d&biw=1920&bih=936&tbm=isch&tbnid=lvGN75FmYLTrzM:&imgrefurl=http://wallpaperswa.com/Space/Outer_space/outer_space_eclipse_asteroids_meteorite_space_art_1920x1200_wallpaper_30247&docid=5kbXIeQdJWLxGM&imgurl=http://wallpaperswa.com/thumbnails/detail/20120805/outer%252520space%252520eclipse%252520asteroids%252520meteorite%252520space%252520art%2525201920x1200%252520wallpaper_wallpaperswa.com_8.jpg&w=600&h=375&ei=mmX3UKLPKeSi2wXLl4GIDw&zoom=1&iact=hc&vpx=4&vpy=137&dur=139&hovh=177&hovw=284&tx=164&ty=60&sig=108913309538085314747&page=1&tbnh=142&tbnw=224&start=0&ndsp=53&ved=1t:429,r:0,s:0,i:79

%Enemy Ships by Philip Radojcic
%Main Ship by Philip Radojcic
%PlasmaShot by Philip Radojcic

%Music from Metroid.
%Song #1 (original) Metroid Theme Song
%Song #2 Metroid- Zero Mission Music - Brinstar Theme
%Song #3 Metroid- Other M Music - Final Mission Resolve

%ERROR: Cannot allocate item. Out of id numbers (max 1000).
%This error is being created after 1000 PlasmaShots have been made.
