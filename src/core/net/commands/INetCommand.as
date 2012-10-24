package core.net.commands 
{
	import com.reyco1.multiuser.events.UserStatusEvent;
	/**
	 * ...
	 * @author Nikro
	 */
	public interface INetCommand 
	{
		function execute(e:UserStatusEvent):void
		
	}

}