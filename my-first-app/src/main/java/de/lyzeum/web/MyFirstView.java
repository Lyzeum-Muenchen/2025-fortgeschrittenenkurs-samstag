package de.lyzeum.web;

import com.vaadin.flow.component.html.H1;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;

@Route(value = "")
@PageTitle("My First View")
public class MyFirstView extends VerticalLayout {

	public MyFirstView() {
		H1 firstTitle = new H1("Palindrome Checker");
		add(firstTitle);
	}
}
