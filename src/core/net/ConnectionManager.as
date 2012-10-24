package core.net 
{
	import com.reyco1.multiuser.events.ChatMessageEvent;
	import com.reyco1.multiuser.events.UserStatusEvent;
	/**
	 * ...
	 * @author Nikro
	 */
	public class ConnectionManager 
	{
		private var connection:IConnection;
		private var connectionHandlStrategy:IConnectionHandlStrategy;
		
		public function ConnectionManager(connection:IConnection, connectionHandlStrategy:IConnectionHandlStrategy) 
		{
			this.connectionHandlStrategy = connectionHandlStrategy;
			this.connection = connection;
			
			initilize();
		}
		
		public function send(data:Object):void
		{
			
		}
		
		private function initilize():void
		{
			listenConnection()
		}
		
		private function listenConnection():void 
		{
			connection.addEventListener(ChatMessageEvent.RECIEVE		, connectionHandlStrategy.handleConnectionEvent);
			connection.addEventListener(UserStatusEvent.CONNECTED		, connectionHandlStrategy.handleConnectionEvent);
			connection.addEventListener(UserStatusEvent.DISCONNECTED	, connectionHandlStrategy.handleConnectionEvent);
			connection.addEventListener(UserStatusEvent.USER_ADDED		, connectionHandlStrategy.handleConnectionEvent);
			connection.addEventListener(UserStatusEvent.USER_REMOVED	, connectionHandlStrategy.handleConnectionEvent);
			connection.addEventListener(UserStatusEvent.USER_EXPIRED	, connectionHandlStrategy.handleConnectionEvent);
			connection.addEventListener(UserStatusEvent.USER_IDLE		, connectionHandlStrategy.handleConnectionEvent);
		}
		
	}

}