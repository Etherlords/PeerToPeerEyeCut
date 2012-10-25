package core.net.commands 
{
	import com.reyco1.multiuser.events.UserStatusEvent;
	import core.net.model.UserStatusCommandModel;
	import patterns.strategy.StrategyController;
	/**
	 * ...
	 * @author Nikro
	 */
	public class UserStatusCommand extends AbstractNetCommand 
	{
		private var statusCommandsController:StrategyController;
		
		public function UserStatusCommand() 
		{
			initilize();
		}
		
		private function initilize():void 
		{
			statusCommandsController = new StrategyController();
			statusCommandsController.crateNewStrategy(UserStatusEvent.CONNECTED, new ConnectionCommand())
			statusCommandsController.crateNewStrategy(UserStatusEvent.USER_ADDED, new UserAddCommand())
			statusCommandsController.crateNewStrategy(UserStatusEvent.USER_REMOVED, new UserRemoveCommand())
		}
		
		public function execute(data:UserStatusCommandModel):void
		{
			statusCommandsController.execute(data.status, data);
		}
	}

}