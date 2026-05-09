package de.lyzeum.web;

import com.vaadin.flow.component.html.H1;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.slider.Slider;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;

@Route("/color-selector")
@PageTitle("Color Selector")
public class ColorSelectorView extends VerticalLayout {
	private final Slider redSlider;

	public ColorSelectorView() {
		H1 title = new H1("Color Selector");
		redSlider = new Slider("Red", 0, 255);
		add(title, redSlider);
	}
}
