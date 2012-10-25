package core.net.commands 
{
	import core.net.model.UserStatusCommandModel;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class UserRemoveCommand extends AbstractNetCommand 
	{
		
		public function UserRemoveCommand() 
		{
			super();
			
		}
		
		public function execute(data:UserStatusCommandModel):void
		{
			Status.instance.addMessage('---Пользователь вышел: ' + data.sender.name+'---');
		}
	}

}