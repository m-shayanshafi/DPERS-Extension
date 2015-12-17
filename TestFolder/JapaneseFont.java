package AbstractFactoryWithSingleton;

public class JapaneseFont implements FontSelect {
	private JapaneseFont(){}
	public static FontSelect font;
	public static FontSelect getJapaneseFont()
	{
		if(font == null){
			font = new JapaneseFont();
		System.out.println("Singleton Japanese Font mode has been initialized.");
			return font;
		}
		else
		{
			System.out.println("Already created Singleton Japanese font mode has been returned.");
			return font;
		}
	}
}
