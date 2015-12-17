package AbstractFactoryWithSingleton;

public class JapaneseLanguage extends EditorLanguages{
	Language editingEnvironment(String feature) {
		Language language = null;
		EditConfigurations ingredientFactory = new JapaneseEditConfigurations();
		System.out.println("Fonts, thesaurus, spellcheck utility, edit mode are all reset.");
		if (feature.equals("font")) {
			language = LanguageFont.getLanguageFont(ingredientFactory);
			language.setConfiguration("Japanese Font.");
		} else if (feature.equals("thesaurus")) {
			language = LanguageThesaurus.getLanguageThesaurus(ingredientFactory);
			language.setConfiguration("Japanese Thesaurus.");
		} else if (feature.equals("spellchecker")) {
			language = LanguageSpellchecker.getLanguageSpellchecker(ingredientFactory);
			language.setConfiguration("Japanese SpellChecker Utility.");
		} else if (feature.equals("edit")) {
			language = LanguageEdit.getLanguageEdit(ingredientFactory);
			language.setConfiguration("Japanese Edit mode.");
		}
		return language;
	}
}
