package core.pingPong 
{
	import core.net.ConnectionManager;
	import core.services.ServicesLocator;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Nikro
	 */
	public class PlatformRemoteController 
	{
		private var _connectionService:ConnectionManager;
		
		private var platformData:PlatformCommandModel = new PlatformCommandModel(null, 0, 0 );
		
		public function PlatformRemoteController() 
		{
			initilize();
		}
		
		private function initilize():void 
		{
			//var sendTimer:Timer = new Timer(100, 0);
			
			//sendTimer.addEventListener(TimerEvent.TIMER, sendData);
			
			//sendTimer.start();
		}
		
		public function activate():void
		{
			
		}
		
		public function sendData():Boolean 
		{
			
			connectionService.send(platformData);
			
			return true;
		}
		
		public function onMouseMove(y:Number):void
		{
			platformData.mouseY = y;
		}
		
		public function turnToRight():void
		{
			platformData.turnState = 1
		}
		
		public function turnToLeft():void
		{
			platformData.turnState = 2;
		}
		
		public function turnToNormal():void
		{
			platformData.turnState = 0;
		}
		
		public function get connectionService():ConnectionManager 
		{
			if (!_connectionService)
				_connectionService = ServicesLocator.instance.getService(ConnectionManager) as ConnectionManager;
			
			return _connectionService;
		}
		
		
	}

}