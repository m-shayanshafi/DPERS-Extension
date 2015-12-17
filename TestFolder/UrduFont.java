package AbstractFactoryWithSingleton;

public class UrduFont implements FontSelect {
	private UrduFont(){}
	public static FontSelect font;
	public static FontSelect getUrduFont()
	{
		if(font == null){
			font = new UrduFont();
		System.out.println("Singleton Urdu Font mode has been initialized.");
			return font;
		}
		else
		{
			System.out.println("Already created Singleton Urdu font mode has been returned.");
			
			return font;
		}
	}
}
