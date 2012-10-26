package core.net 
{
	import com.reyco1.multiuser.events.ChatMessageEvent;
	import com.reyco1.multiuser.events.UserStatusEvent;
	import core.net.events.ConnectionActivityEvent;
	import core.services.AbstractService;
	import patterns.events.StrategyControllerEventSolver;
	import patterns.strategy.StrategyController;
	/**
	 * ...
	 * @author Nikro
	 */
	public class ConnectionManager extends AbstractService
	{
		private var _connection:IConnection;
		private var connectionHandlStrategy:StrategyController;
		
		public function ConnectionManager(connection:IConnection, connectionHandlStrategy:StrategyController) 
		{
			this.connectionHandlStrategy = connectionHandlStrategy;
			_connection = connection;
			
			initilize();
		}
		
		public function send(data:Object):void
		{
			_connection.sendData(data);
		}
		
		private function initilize():void
		{
			listenConnection()
		}
		
		private function listenConnection():void 
		{
			var eventSolver:StrategyControllerEventSolver = new StrategyControllerEventSolver(connectionHandlStrategy);
			var solveFunction:Function = eventSolver.eventSolverFunction;
			
			connection.addEventListener(ConnectionActivityEvent.CONENCTION_ACTIVITY		, solveFunction);
		}
		
		public function get connection():IConnection 
		{
			return _connection;
		}
		
	}

}