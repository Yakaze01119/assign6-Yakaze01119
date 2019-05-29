class Dinosaur extends Enemy {
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float speed = 1f;
  float currentSpeed = speed;
    
  void update(){
    x += currentSpeed;
    
    if(x > width-w || x < 0){
      currentSpeed *= -1;
    }
    
    if(player.y == y){
      if(player.x < x && currentSpeed < 0){
        x += currentSpeed * TRIGGERED_SPEED_MULTIPLIER;
      }
      if(player.x > x && currentSpeed > 0){
        x += currentSpeed * TRIGGERED_SPEED_MULTIPLIER;
      }
    }
    
  }
  
  void display() {
    int direction = (currentSpeed > 0) ? RIGHT : LEFT;
    
    pushMatrix();
    translate(x, y);
    if (direction == RIGHT) {
      scale(1, 1);
      image(dinosaur,0,0);
    } else {
      scale(-1, 1);
      image(dinosaur,-w,0);
    }
    popMatrix();
  }
  
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/

  Dinosaur(float x, float y){
    super(x,y);
  }
  
}
