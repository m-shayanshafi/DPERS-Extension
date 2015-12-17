package AbstractFactoryWithSingleton;

public class ArabicSpellChecker implements SpellCheckerUtility {
	private ArabicSpellChecker(){}
	public static SpellCheckerUtility spellCheck;
	public static SpellCheckerUtility getArabicSpellChecker()
	{
		if(spellCheck == null){
			spellCheck = new ArabicSpellChecker();
		System.out.println("Singleton Arabic SpellChecker mode has been initialized.");
			return spellCheck;
		}
		else
		{
			System.out.println("Already created Singleton Arabic Spell checker mode has been returned.");
			
			return spellCheck;
		}
	}
}
