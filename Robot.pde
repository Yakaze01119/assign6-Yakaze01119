class Robot extends Enemy {
	// Requirement #5: Complete Dinosaur Class

	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float speed = 2f;
  
  
  Robot(float x, float y){
    super(x,y);
  }
  
  void update(){
    int checkWard = (speed > 0) ? RIGHT : LEFT;
    boolean checkX = false;
    boolean checkY = (player.y > y-3*h && player.y < y+3*h) ? true : false;
    
    if(checkWard == RIGHT && player.x + player.w/2 > x+HAND_OFFSET_X_BACKWARD){
      checkX = true;
    }else if(checkWard == LEFT && player.x + player.w/2 < x-w+HAND_OFFSET_X_BACKWARD){
      checkX = true;
    }
    
    if(checkX && checkY){
      
      x +=0;
      
    }else {
      
      x += speed;
      if(x > width-w || x < 0) speed *= -1;
      
    }

  }
  
  void display() {
    int direction = (speed > 0) ? RIGHT : LEFT;
    
    pushMatrix();
    translate(x, y);
    if (direction == RIGHT) {
      scale(1, 1);
      image(robot,0,0);
    } else {
      scale(-1, 1);
      image(robot,-w,0);
    }
    popMatrix();
    
  }
  
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
