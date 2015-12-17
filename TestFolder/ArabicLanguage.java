package AbstractFactoryWithSingleton;

public class ArabicLanguage extends EditorLanguages{
	Language editingEnvironment(String feature) {
		Language language = null;
		EditConfigurations ingredientFactory = new ArabicEditConfigurations();
		System.out.println("Fonts, thesaurus, spellcheck utility, edit mode are all reset.");
		if (feature.equals("font")) {
			language = LanguageFont.getLanguageFont(ingredientFactory);
			language.setConfiguration("Arabic Font.");
		} else if (feature.equals("thesaurus")) {
			language = LanguageThesaurus.getLanguageThesaurus(ingredientFactory);
			language.setConfiguration("Arabic Thesaurus.");
		} else if (feature.equals("spellchecker")) {
			language = LanguageSpellchecker.getLanguageSpellchecker(ingredientFactory);
			language.setConfiguration("Arabic SpellChecker Utility.");
		} else if (feature.equals("edit")) {
			language = LanguageEdit.getLanguageEdit(ingredientFactory);
			language.setConfiguration("Arabic Edit mode.");
		}
		return language;
	}
}
