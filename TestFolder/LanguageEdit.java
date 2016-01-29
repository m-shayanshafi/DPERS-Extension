package AbstractFactoryWithSingleton;

//This class is implementing the Arabic editor and is using singlteton pattern
public class LanguageEdit extends Language {
	EditConfigurations factory;
	public static LanguageEdit languageEdit;
	private LanguageEdit(EditConfigurations factory) {
		this.factory = factory;
		method();
		
	}
	
	public static LanguageEdit getLanguageEdit(EditConfigurations factory){
		if(languageEdit == null){
			languageEdit= new LanguageEdit(factory);
			System.out.println("Instantiated Singleton Language Edit.");
			return languageEdit;
		}
		else{
			System.out.println("Already created Singleton Language Edit.");
		return languageEdit;
		}
		
	}
	
	void method()
	{
		factory.edit();
	}
}
