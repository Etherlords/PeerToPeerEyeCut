package core.pingPong
{
	import com.greensock.TweenLite;
	import core.Box2D.utils.Box2DWorldController;
	import core.ui.KeyBoardController;
	import core.view.gameobject.GameObject;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class PlayerPlatformController
	{
		protected var viewInstance:DisplayObjectContainer;
		protected var worldController:Box2DWorldController;
		protected var platform:GameObject;
		
		private var _basex:Number = 0;
		private var impulsePhase:Boolean = false;
		private var impulseTimer:Timer;
		
		public function PlayerPlatformController(viewInstance:DisplayObjectContainer, worldController:Box2DWorldController, platform:GameObject)
		{
			this.platform = platform;
			this.worldController = worldController;
			this.viewInstance = viewInstance;
			
			basex = platform.body.x;
			initilize();
		}
		
		protected function initilize():void
		{
			
			viewInstance.addEventListener(Event.ENTER_FRAME, onFrameUpdate);
			Starling.current.nativeStage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			setPlatformPosition(Starling.current.nativeStage.mouseY) //viewInstance.stage.mouseY);
			
			impulseTimer = new Timer(50, 1);
			impulseTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onImpulseEnd)
			
			var keyController:KeyBoardController = new KeyBoardController(Starling.current.nativeStage);
			
			keyController.registerKeyDownReaction(Keyboard.A, turnPlatformLeft);
			keyController.registerKeyDownReaction(Keyboard.LEFT, turnPlatformLeft);
			
			keyController.registerKeyDownReaction(Keyboard.RIGHT, turnPlatformRight);
			keyController.registerKeyDownReaction(Keyboard.D, turnPlatformRight);
			
			keyController.registerKeyUpReaction(Keyboard.A, turnToNormal);
			keyController.registerKeyUpReaction(Keyboard.D, turnToNormal);
			keyController.registerKeyUpReaction(Keyboard.LEFT, turnToNormal);
			keyController.registerKeyUpReaction(Keyboard.RIGHT, turnToNormal);
		}
		
		
		private function turnToNormal():void
		{
		
			TweenLite.killTweensOf(platform.body);
			//TweenLite.to(platform.body, 1, { rotation:-180 } );
			platform.body.rotation = -180;
		}
		
		private function turnPlatformLeft():void
		{
			trace(platform.body.rotation);
			//TweenLite.to(platform.body, 0.1, { rotation: 145 } );
			
			platform.body.rotation = 145;
		}
		
		private function turnPlatformRight():void
		{
			//TweenLite.to(platform.body,  0.1, { rotation:-145 } );
			
			platform.body.rotation = -145;
		}
		
		private function onImpulseEnd(e:TimerEvent):void
		{
			
			impulsePhase = false;
			
			platform.applyActionView(5, basex);
			platform.physicalProperties.stopXVelocity();
			platform.body.x = basex;
		}
		
		protected function onFrameUpdate(e:Event = null):void
		{
			if (!impulsePhase)
				platform.physicalProperties.stopXVelocity();
			
			platform.physicalProperties.stopYVelocity();
		}
		
		private function onMouseMove(e:MouseEvent):void
		{
			
			setPlatformPosition(e.stageY);
		}
		
		public function impulse():void
		{
			impulsePhase = true;
			platform.applyActionView(4);
			platform.physicalProperties.applyImpulse(50);
			impulseTimer.start();
		
		}
		
		protected function setPlatformPosition(position:Number):void
		{
			var __y:Number = position - platform.body.height;
			
			if (__y < 0 + platform.skin.phsyHeight)
				__y = 0 + platform.skin.phsyHeight;
			
			if (__y > 400 + platform.skin.phsyHeight)
				__y = 400 + platform.skin.phsyHeight;
			
			if (!impulsePhase)
				platform.body.x = basex;
			
			platform.body.y = __y;
		}
		
		public function get basex():Number
		{
			return _basex;
		}
		
		public function set basex(value:Number):void
		{
			_basex = value;
			platform.body.x = basex;
		}
	
	}

}