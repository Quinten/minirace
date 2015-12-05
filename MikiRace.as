package  {
	import mitella.templates.LandscapeGame;
	import mitella.interactions.UpDownController;
	import mitella.interactions.LeftRightController;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	public class MikiRace extends LandscapeGame {
		
		public var updownMC:MovieClip;
		public var leftrightMC:MovieClip;
		public var racecarMC:MovieClip;
		
		public var UDcontrol:UpDownController;
		public var LRcontrol:LeftRightController;
		
		public var speedRot:Number = 0;
		public var speedGas:Number = 0;
		public var maxSpeed:Number = 16;
		public var rotHome:Number = 0;
		
		public function MikiRace() {
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
				speedGas += (maxSpeed - speedGas)*.4;
			}
			if(UDcontrol.UP){
				speedGas += (-maxSpeed - speedGas)*.4;
			}
			if(!UDcontrol.DOWN && !UDcontrol.UP){
				speedGas += (0 - speedGas)*.5;
			}
			if(LRcontrol.RIGHT){
				speedRot = 6;
			}
			if(LRcontrol.LEFT){
				speedRot = -6;
			}
			if(!LRcontrol.RIGHT && !LRcontrol.LEFT){
				speedRot = 0;
			}
			//racecarMC.rotation = Vector3D.angleBetween(new Vector3D(0, -maxSpeed), new Vector3D(speedRot, -speedGas)) * 180 / Math.PI;
			//racecarMC.rotation = Math.atan2(speedGas, speedRot) * 180 / Math.PI;
			racecarMC.rotation += speedRot;
			racecarMC.y += Math.sin(racecarMC.rotation * Math.PI/180) * speedGas;
			racecarMC.x += Math.cos(racecarMC.rotation * Math.PI/180) * speedGas;
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
