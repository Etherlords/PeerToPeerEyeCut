package core.net.commands 
{
	import core.net.model.UserStatusCommandModel;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class UserAddCommand extends AbstractNetCommand 
	{
		
		public function UserAddCommand() 
		{
			super();
			
		}
		
		public function execute(data:UserStatusCommandModel):void
		{
			Status.instance.addMessage('---Пользователь вошел: ' + data.sender.name+'---');
		}
		
	}

}