package core.net.commands 
{
	import core.net.model.UserStatusCommandModel;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class ConnectionCommand extends AbstractNetCommand 
	{
		
		public function ConnectionCommand() 
		{
			super();
			
		}
		
		public function execute(data:UserStatusCommandModel):void
		{
			Status.instance.addMessage('---Вход выполнен---');
		}
		
	}

}