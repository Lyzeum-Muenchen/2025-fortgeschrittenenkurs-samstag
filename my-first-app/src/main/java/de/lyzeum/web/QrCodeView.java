package de.lyzeum.web;

import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.html.H1;
import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.component.icon.VaadinIcon;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.radiobutton.RadioButtonGroup;
import com.vaadin.flow.component.radiobutton.RadioGroupVariant;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.Map;


@Route("/qr-code")
@PageTitle("QR Code Generator")
public class QrCodeView extends VerticalLayout {

    private Image qrCodeImage;
    private final TextField textInput;
    private final RadioButtonGroup<String> errorCorrectionGroup;
    private final Map<String, ErrorCorrectionLevel> labelToErrorCorrectionLevelMap;

    public QrCodeView() {
        H1 title = new H1("QR Code Generator");
        errorCorrectionGroup = new RadioButtonGroup<>();
        errorCorrectionGroup.addThemeVariants(RadioGroupVariant.AURA_HORIZONTAL);
        errorCorrectionGroup.setLabel("Error Correction Level");
        errorCorrectionGroup.setItems("Low", "Medium", "Quartile", "High");
        errorCorrectionGroup.setValue("Medium");
        labelToErrorCorrectionLevelMap = Map.of(
            "Low", ErrorCorrectionLevel.L,
            "Medium", ErrorCorrectionLevel.M,
            "Quartile", ErrorCorrectionLevel.Q,
            "High", ErrorCorrectionLevel.H
        );
        textInput = new TextField();
        textInput.setPlaceholder("Please enter a text!");
        textInput.setMinWidth("20em");
        Button generateButton = new Button("Generate", (VaadinIcon.LIGHTBULB.create()));
        generateButton.addClickListener(event -> generateQrCode());
        qrCodeImage = new Image();

        add(
            title,
            errorCorrectionGroup,
            new HorizontalLayout(textInput, generateButton),
            qrCodeImage
        );
    }

    public void generateQrCode() {
        if (textInput.getValue().isBlank()) {
            return;
        }
        this.remove(qrCodeImage);
        ErrorCorrectionLevel errorCorrectionLevel = labelToErrorCorrectionLevelMap.get(errorCorrectionGroup.getValue());

        try {
            byte[] qrCodeBytes = generateQRCodeBytes(textInput.getValue(), 500, 500, errorCorrectionLevel);
            qrCodeImage = new Image(qrCodeBytes, "Generated QR Code");
            qrCodeImage.setWidth("500px");
            qrCodeImage.setHeight("500px");
            this.add(qrCodeImage);
        } catch(Exception e) {
            System.err.println("QR Code could not be created! " + e.getMessage() + ", " + e.getCause());
        }
    }


    public static byte[] generateQRCodeBytes(String text, int width, int height, final ErrorCorrectionLevel level) throws Exception {
        Map<EncodeHintType, Object> hints = new HashMap<>();
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
        hints.put(EncodeHintType.ERROR_CORRECTION, level);
        hints.put(EncodeHintType.MARGIN, 1);

        MultiFormatWriter writer = new MultiFormatWriter();
        BitMatrix bitMatrix = writer.encode(text, BarcodeFormat.QR_CODE, width, height, hints);

        ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
        MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);

        return pngOutputStream.toByteArray();
    }
}
