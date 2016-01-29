package AbstractFactoryWithSingleton;

public class UrduEdit implements EditMode {
	private UrduEdit(){}
	public static EditMode mode;
	public static EditMode getUrduEdit()
	{
		if(mode == null){
			mode = new UrduEdit();
		System.out.println("Singleton Urdu Edit mode has been initialized.");
			return mode;
		}
		else
		{
			System.out.println("Already created Singleton Urdu Edit mode has been returned.");
			
			return mode;
		}
	}
}
