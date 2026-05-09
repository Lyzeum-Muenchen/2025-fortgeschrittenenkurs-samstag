package de.lyzeum.web;

import com.vaadin.flow.component.Key;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.html.H1;
import com.vaadin.flow.component.html.Paragraph;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.data.value.ValueChangeMode;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;

@Route(value = "")
@PageTitle("My First View")
public class MyFirstView extends VerticalLayout {

	final TextField txtInput;
	final Paragraph outputParagraph;

	public MyFirstView() {
		H1 firstTitle = new H1("Palindrome Checker");

		txtInput = new TextField();
		txtInput.setPlaceholder("Please enter a Palindrome");
		txtInput.setMinWidth("20em");
		txtInput.setValueChangeMode(ValueChangeMode.EAGER);
		txtInput.addKeyPressListener(event -> {
			if (event.getKey().equals(Key.ENTER)) {
				checkPalindrome();
			}
		});

		Button button = new Button("Check Input");
		button.addClickListener(
			event -> checkPalindrome()
		);

		outputParagraph = new Paragraph();

		add(
			firstTitle,
			new HorizontalLayout(txtInput, button),
			outputParagraph
		);
	}

	private void checkPalindrome() {
		if (isPalindrome(txtInput.getValue())) {
			outputParagraph.setText(
					txtInput.getValue() + " is a Palindrome!"
			);
			outputParagraph.removeClassName("error-text");
			outputParagraph.addClassName("success-text");
		} else {
			outputParagraph.setText(
					txtInput.getValue() + " is not a Palindrome!"
			);
			outputParagraph.removeClassName("success-text");
			outputParagraph.addClassName("error-text");
		}
	}


	public boolean isPalindrome(String input) {
		if (input.isBlank()) {
			return false;
		}
		String lowercaseInput = input.toLowerCase();
		for (int i = 0; i <= input.length() / 2; i++) {
			if(lowercaseInput.charAt(i) != lowercaseInput.charAt(input.length() - 1 - i)) {
				return false;
			}
		}
		return true;
	}
}
