package core.net.commands 
{
	import core.game.GameProcessor;
	import core.net.model.UserModel;
	import core.net.model.UserStatusCommandModel;
	import core.services.ServicesLocator;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class UserAddCommand extends AbstractNetCommand 
	{
		private var gameProcessor:GameProcessor = ServicesLocator.instance.getService(GameProcessor) as GameProcessor;
		
		public function UserAddCommand() 
		{
			super();
		}
		
		public function execute(data:UserStatusCommandModel):void
		{
			Status.instance.addMessage('---Пользователь вошел: ' + data.sender.name + '---');
			
			var userModel:UserModel = data.sender;
			gameProcessor.spawnPlayer(userModel);
		}
		
	}

}