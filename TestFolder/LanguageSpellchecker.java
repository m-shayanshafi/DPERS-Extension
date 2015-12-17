package AbstractFactoryWithSingleton;

public class LanguageSpellchecker extends Language {
	EditConfigurations factory;
	public static LanguageSpellchecker languageSpellchecker;
	private LanguageSpellchecker(EditConfigurations factory) {
		this.factory = factory;
		method();
		
	}
	
	public static LanguageSpellchecker getLanguageSpellchecker(EditConfigurations factory){
		if(languageSpellchecker == null){
			languageSpellchecker= new LanguageSpellchecker(factory);
			System.out.println("Instantiated Singleton Language SpellChecker.");
			return languageSpellchecker;
		}
		else{
			System.out.println("Already created Singleton Language SpellChecker.");
		return languageSpellchecker;
		}
		
	}
	
	void method()
	{
		factory.spellChecker();
	}
}
