package de.lyzeum.web;

import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.H1;
import com.vaadin.flow.component.html.Paragraph;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.slider.Slider;
import com.vaadin.flow.data.value.ValueChangeMode;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;

@Route("/color-selector")
@PageTitle("Color Selector")
public class ColorSelectorView extends VerticalLayout {
	private final Slider redSlider;
	private final Slider greenSlider;
	private final Slider blueSlider;
	private final Div colorContainer;
	private final Paragraph rgbParagraph;

	public ColorSelectorView() {
		H1 title = new H1("Color Selector");
		redSlider = new Slider("Red", 0, 255);
		redSlider.addValueChangeListener(event -> onSliderUpdate());
		redSlider.setValueChangeMode(ValueChangeMode.EAGER);
		blueSlider = new Slider("Blue", 0, 255);
		blueSlider.addValueChangeListener(event -> onSliderUpdate());
		blueSlider.setValueChangeMode(ValueChangeMode.EAGER);
		greenSlider = new Slider("Green", 0, 255);
		greenSlider.addValueChangeListener(event -> onSliderUpdate());
		greenSlider.setValueChangeMode(ValueChangeMode.EAGER);
		colorContainer = new Div();
		colorContainer.addClassName("color-container");
		rgbParagraph = new Paragraph();
		add(title, redSlider, greenSlider, blueSlider, colorContainer, rgbParagraph);
		onSliderUpdate();
	}

	public void onSliderUpdate() {
		int red = redSlider.getValue().intValue();
		int blue = blueSlider.getValue().intValue();
		int green = greenSlider.getValue().intValue();
		String rgbColor = red +"," + green + "," + blue;
		rgbParagraph.setText(rgbColor);
		colorContainer.getStyle().setBackgroundColor("rgb(" + rgbColor + ")");
	}
}
