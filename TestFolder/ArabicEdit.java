package AbstractFactoryWithSingleton;

//This class is implementing the Arabic editor and is using singlteton pattern
public class ArabicEdit implements EditMode {
	private ArabicEdit(){}
	public static EditMode mode;
	public static EditMode getArabicEdit()
	{
		if(mode == null){
			mode = new ArabicEdit();
		System.out.println("Singleton Arabic Edit mode has been initialized.");
			return mode;
		}
		else
		{
			System.out.println("Already created Singleton Arabic Edit mode has been returned.");
			
			return mode;
		}
	}
}
