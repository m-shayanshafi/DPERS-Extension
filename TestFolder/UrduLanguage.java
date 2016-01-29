package AbstractFactoryWithSingleton;

public class UrduLanguage extends EditorLanguages{

	protected Language editingEnvironment(String feature) {
		Language language = null;
		EditConfigurations ingredientFactory = new UrduEditConfigurations();
		System.out.println("Fonts, thesaurus, spellcheck utility, edit mode are all reset.");
		if (feature.equals("font")) {
			language = LanguageFont.getLanguageFont(ingredientFactory);
			language.setConfiguration("Urdu Font.");
		} else if (feature.equals("thesaurus")) {
			language = LanguageThesaurus.getLanguageThesaurus(ingredientFactory);
			language.setConfiguration("Urdu Thesaurus.");
		} else if (feature.equals("spellchecker")) {
			language = LanguageSpellchecker.getLanguageSpellchecker(ingredientFactory);
			language.setConfiguration("Urdu SpellChecker Utility.");
		} else if (feature.equals("edit")) {
			language = LanguageEdit.getLanguageEdit(ingredientFactory);
			language.setConfiguration("Urdu Edit mode.");
		}
		return language;
	}
}
