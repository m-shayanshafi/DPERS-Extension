package AbstractFactoryWithSingleton;

public class EnglishSpellChecker implements SpellCheckerUtility {
	private EnglishSpellChecker(){}
	public static SpellCheckerUtility spellCheck;
	public static SpellCheckerUtility getEnglishSpellChecker()
	{
		if(spellCheck == null){
			spellCheck = new EnglishSpellChecker();
		System.out.println("Singleton English SpellChecker mode has been initialized.");
			return spellCheck;
		}
		else
		{
			System.out.println("Already created Singleton English Spell checker mode has been returned.");
			return spellCheck;
		}
	}
}
