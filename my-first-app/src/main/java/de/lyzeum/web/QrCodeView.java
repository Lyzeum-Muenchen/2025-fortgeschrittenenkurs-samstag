package de.lyzeum.web;

import java.util.HashMap;
import java.util.Map;

import javax.swing.plaf.basic.BasicBorders.RadioButtonBorder;

import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.H1;
import com.vaadin.flow.component.html.Paragraph;
import com.vaadin.flow.component.icon.VaadinIcon;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.radiobutton.RadioButtonGroup;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.component.html.Image;

@Route("/qrcode")
@PageTitle("QR Code Generator")
public class QrCodeView extends VerticalLayout{
    private Image qrCodeImage;
    private RadioButtonGroup<String> errorCorrectionSelector;
    private TextField inputField;
    private Map<String, ErrorCorrectionLevel> levelMap;

    public QrCodeView(){
        H1 title = new H1("QR Code Generator");

        inputField = new TextField();
        inputField.setPlaceholder("Please enter Text to encode");
        inputField.setMinWidth("20em");

        levelMap = Map.of(
            "Medium", ErrorCorrectionLevel.M,
            "Low", ErrorCorrectionLevel.L,
            "High", ErrorCorrectionLevel.H,
            "Quartile", ErrorCorrectionLevel.Q 
        );

        errorCorrectionSelector = new RadioButtonGroup<String>();
        errorCorrectionSelector.setLabel("Error Correction Level");
        errorCorrectionSelector.setItems("Low", "Medium", "High", "Quartile");
        errorCorrectionSelector.setValue("Medium");

        Button generateButton = new Button("Generate", VaadinIcon.LIGHTBULB.create());
        
        qrCodeImage = new Image();

        add(title, inputField, errorCorrectionSelector, generateButton, qrCodeImage);
    }
}