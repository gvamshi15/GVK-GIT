package com.tutorialspoint;


public class TextEditor {

	private SpellChecker spellChecker;

	
	   public TextEditor(SpellChecker spellChecker){
	      System.out.println("Inside TextEditor constructor." );
	      this.spellChecker = spellChecker;
	   }
	
	/*public SpellChecker getSpellChecker() {
		return spellChecker;
	}*/

	public void spellCheck() {
		spellChecker.checkSpelling();
	}
}