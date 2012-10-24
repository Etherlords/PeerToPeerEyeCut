package 
{
	import com.reyco1.multiuser.events.ChatMessageEvent;
	import com.reyco1.multiuser.events.UserStatusEvent;
	import core.net.commands.ChatMessageCommand;
	import core.net.commands.ConnectionCommand;
	import core.net.commands.UserAddCommand;
	import core.net.ConnectionManager;
	import core.net.PeerConnection;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.system.Security;
	import flash.ui.Keyboard;
	import patterns.strategy.StrategyController;
	
	
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class Main extends Sprite 
	{
		private var connection:PeerConnection;

		
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
			
			var connectionHandler:StrategyController = new StrategyController
			connectionHandler.crateNewStrategy(UserStatusEvent.CONNECTED, new ConnectionCommand())
			connectionHandler.crateNewStrategy(UserStatusEvent.USER_ADDED, new UserAddCommand())
			connectionHandler.crateNewStrategy(ChatMessageEvent.RECIEVE, new ChatMessageCommand())
			
			connection = new PeerConnection('multiuser/test12345');
			var connectionManager:ConnectionManager = new ConnectionManager(connection, connectionHandler);
			
			addChild(new Status());
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, sendMesage);
		}
		
		private function sendMesage(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.ENTER)
			{
				var msg:String = Status.instance.getInput();
				
				if (msg.length > 0)
					connection.sendChatMessage(msg);
			}
		}
		
		private function onFrameEnter(e:Event):void 
		{
			
		}
		

		
	}
	
}