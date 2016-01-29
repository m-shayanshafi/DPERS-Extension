package AbstractFactoryWithSingleton;

public class EnglishEditConfigurations implements EditConfigurations{

	public EditMode edit() {
		return EnglishEdit.getEnglishEdit();
	}

	public FontSelect font() {
		return EnglishFont.getEnglishFont();
	}

	public SpellCheckerUtility spellChecker() {
		return EnglishSpellChecker.getEnglishSpellChecker();
	}

	public ThesaurusActivate thesaurus() {
		return EnglishThesaurus.getEnglishThesaurus();
	}
}