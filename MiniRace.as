package  {
	import mitella.templates.LandscapeGame;
	import mitella.interactions.UpDownController;
	import mitella.interactions.LeftRightController;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	public class MiniRace extends LandscapeGame {
		
		public var updownMC:MovieClip;
		public var leftrightMC:MovieClip;
		public var racecarMC:MovieClip;
		
		public var UDcontrol:UpDownController;
		public var LRcontrol:LeftRightController;
		
		public var speedX:Number = 0;
		public var speedY:Number = 0;
		public var maxSpeed:Number = 10;
		public var rotHome:Number = 0;
		
		public function MiniRace() {
			// constructor code
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event):void
		{
			UDcontrol = new UpDownController(updownMC);
			LRcontrol = new LeftRightController(leftrightMC);
			this.addEventListener(Event.ENTER_FRAME, onF);			
		}
		
		private function onF(e:Event):void
		{
			if(UDcontrol.DOWN){
				speedY += (maxSpeed - speedY)*.5;
			}
			if(UDcontrol.UP){
				speedY += (-maxSpeed - speedY)*.5;
			}
			if(!UDcontrol.DOWN && !UDcontrol.UP){
				speedY += (0 - speedY)*.5;
			}
			if(LRcontrol.RIGHT){
				speedX += (maxSpeed - speedX)*.5;
			}
			if(LRcontrol.LEFT){
				speedX += (-maxSpeed - speedX)*.5;
			}
			if(!LRcontrol.RIGHT && !LRcontrol.LEFT){
				speedX += (0 - speedX)*.5;
			}
			//racecarMC.rotation = Vector3D.angleBetween(new Vector3D(0, -maxSpeed), new Vector3D(speedX, -speedY)) * 180 / Math.PI;
			racecarMC.rotation = Math.atan2(speedY, speedX) * 180 / Math.PI;
			racecarMC.y += speedY;
			racecarMC.x += speedX;
			if(racecarMC.y < -100){
				racecarMC.y = 580;
			}
			if(racecarMC.y > 580){
				racecarMC.y = -100;
			}
			if(racecarMC.x < -100){
				racecarMC.x = 900;
			}
			if(racecarMC.x > 900){
				racecarMC.x = -100;
			}			
			
			
		}

	}
	
}
