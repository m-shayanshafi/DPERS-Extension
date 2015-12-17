package AbstractFactoryWithSingleton;

public class LanguageFont extends Language {
	EditConfigurations factory;
	public static LanguageFont languagefont;
	private LanguageFont(EditConfigurations factory) {
		this.factory = factory;
		method();
		
	}
	
	public static LanguageFont getLanguageFont(EditConfigurations factory){
		if(languagefont == null){
			languagefont= new LanguageFont(factory);
			System.out.println("Instantiated Singleton Language Font.");
			return languagefont;
		}
		else{
			System.out.println("Already created Singleton Language Font");
		return languagefont;
		}
		
	}
	
	void method()
	{
		factory.font();
	}
}
