package core.net.commands 
{
	import com.reyco1.multiuser.events.UserStatusEvent;
	import patterns.strategy.SimpleAlgorithm;
	
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
		
		public function execute(e:UserStatusEvent):void 
		{
			Status.instance.addMessage('---Пользователь вышел: ' + e.user.name+'---');
		}
	}

}