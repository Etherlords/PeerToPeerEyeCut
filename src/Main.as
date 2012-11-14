package 
{
	import com.reyco1.multiuser.events.ChatMessageEvent;
	import com.reyco1.multiuser.events.UserStatusEvent;
	import core.game.GameProcessor;
	import core.net.commands.ChatMessageCommand;
	import core.net.commands.ConnectionCommand;
	import core.net.commands.UserAddCommand;
	import core.net.commands.UserRemoveCommand;
	import core.net.commands.UserStatusCommand;
	import core.net.ConnectionManager;
	import core.net.model.ChatCommandModel;
	import core.net.model.DataModel;
	import core.net.model.UserStatusCommandModel;
	import core.net.PeerConnection;
	import core.pingPong.PingPongPlatformCommand;
	import core.pingPong.PlatformCommandModel;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.registerClassAlias;
	import flash.system.Security;
	import flash.ui.Keyboard;
	import patterns.strategy.StrategyController;
	import test.TestUIMain;
	
	
	
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
		
		public static var instance:Main;
		
		private function init(e:Event = null):void 
		{
			instance = this;
			//Logger.LEVEL = 1; s
			Security.allowDomain('*');
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			registerClassAlias('DataModel', DataModel);
			registerClassAlias('PlatformCommandModel', PlatformCommandModel);
			
			
			
			var connectionHandler:StrategyController = new StrategyController
			connectionHandler.crateNewStrategy(UserStatusCommandModel, new UserStatusCommand);
			connectionHandler.crateNewStrategy(ChatCommandModel, new ChatMessageCommand())
			connectionHandler.crateNewStrategy(PlatformCommandModel, new PingPongPlatformCommand())
			//connectionHandler.crateNewStrategy(PingPongStatusCommandModel, new PingPongPlatformCommand())
			
			connection = new PeerConnection('multiuser/test12345');
			var connectionManager:ConnectionManager = new ConnectionManager(connection, connectionHandler);
			
			
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, sendMesage);
		}
		
		
		private function sendMesage(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.ENTER)
			{
				var msg:String = Status.instance.getInput();
				var key:String = '';
				
				for (var i:int = 0; i < 10; i++)
				{
					key+=String.fromCharCode(int(Math.random() * 100))
				}
				if (msg.length > 0)
					connection.sendChatMessage(key + msg);
			}
		}
		
		private function onFrameEnter(e:Event):void 
		{
			
		}
		

		
	}
	
}