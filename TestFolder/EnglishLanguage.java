package AbstractFactoryWithSingleton;

public class EnglishLanguage extends EditorLanguages{
	Language editingEnvironment(String feature) {
		Language language = null;
		EditConfigurations ingredientFactory = new EnglishEditConfigurations();
		System.out.println("Fonts, thesaurus, spellcheck utility, edit mode are all reset.");
		if (feature.equals("font")) {
			language = LanguageFont.getLanguageFont(ingredientFactory);
			language.setConfiguration("English Font.");
		} else if (feature.equals("thesaurus")) {
			language = LanguageThesaurus.getLanguageThesaurus(ingredientFactory);
			language.setConfiguration("English Thesaurus.");
		} else if (feature.equals("spellchecker")) {
			language = LanguageSpellchecker.getLanguageSpellchecker(ingredientFactory);
			language.setConfiguration("English SpellChecker Utility.");
		} else if (feature.equals("edit")) {
			language = LanguageEdit.getLanguageEdit(ingredientFactory);
			language.setConfiguration("English Edit mode.");
		}
		return language;
	}
}
