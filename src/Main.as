package 
{
	import com.reyco1.multiuser.debug.Logger;
	import com.reyco1.multiuser.events.UserStatusEvent;
	import core.net.connectionhandle.AbstractConnectionHandler;
	import core.net.connectionhandle.commands.UserAddCommand;
	import core.net.ConnectionManager;
	import core.net.PeerConnection;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Security;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class Main extends Sprite 
	{

		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			//Logger.LEVEL = 1;
			Security.allowDomain('*');
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var connectionHandler:AbstractConnectionHandler = new AbstractConnectionHandler();
			connectionHandler.addHandlStrategy(UserStatusEvent.USER_ADDED, new UserAddCommand());
			var connection:PeerConnection = new PeerConnection('multiuser/test12345');
			var connectionManager:ConnectionManager = new ConnectionManager(connection, connectionHandler);
			
			addChild(new Status());
		}
		
		private function onFrameEnter(e:Event):void 
		{
			
		}
		

		
	}
	
}