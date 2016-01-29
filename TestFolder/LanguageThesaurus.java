package AbstractFactoryWithSingleton;

public class LanguageThesaurus extends Language {
	EditConfigurations factory;
	public static LanguageThesaurus languageThesaurus;
	private LanguageThesaurus(EditConfigurations factory) {
		this.factory = factory;
		method();
		
	}
	
	public static LanguageThesaurus getLanguageThesaurus(EditConfigurations factory){
		if(languageThesaurus == null){
			languageThesaurus= new LanguageThesaurus(factory);
			System.out.println("Instantiated Singleton Language Thesaurus.");
			return languageThesaurus;
		}
		else{
			System.out.println("Already created Singleton Language Thesaurus.");
		return languageThesaurus;
		}
		
	}
	
	void method()
	{
		factory.thesaurus();
	}
}
