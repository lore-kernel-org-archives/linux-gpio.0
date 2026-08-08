Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F98137BE93
	for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2026 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786161535; cv=none; b=it+gX2uc2yZv1ORUTJHHumcKomuvk14Dky9k/4cqU4qVYMD0ihxWrR6AEsHtoAWqe21Kuwu9CEO4v1i51Sje/Dy8mHwglastsMB4wAjPtEosYKntfUeW4by6s4EAbcZ5BKcYHJrkTVitOUyoy8N49cqefv/q892RvkZXD5fftbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786161535; c=relaxed/simple;
	bh=xOuI2uvaogVpXoU3ek4Ue/485BwfxthxD11w9S8ZIsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQ84Rgpfj0WWaH7mEV5dyKsbMZn0ZufWa830xuXWQUidNqwzdDwGGrqs6sqTUatt7KCciRxkU+nAU6hJi5ajTypO1+/ZZkdMSZY6HAYIdhgD++LpHMtowuJeFBnJwRkjqw/Rh1gxF0uGqBSSYsn+DX11HHdxEELPjCffatxO92Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgRhVm6j; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgRhVm6j"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so149625e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 20:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786161532; x=1786766332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbxFbepJjdL7JygBXwv8r/FSSSnS2NcO8+/iu/4Xj90=;
        b=SgRhVm6jb8ScDakuSv+Aa68F8lSiNdAOi3BBAN9pVm+kz+WPT/5A+wyah8HinoPsHo
         /aYT7094Be84BgkUQ1H/sdi44ZRaEmt3ZtCpOQ0HE2P67Z/QQTpCbasbGe7QJwZJMbtY
         eyZlA9Q1VkO9QU7Ha+0oXrLbDTsQ/ubAYno39z+bCokptIilqJ2A9TxXU9YSXEMnGHDJ
         OLGyMaXMpybt81CEqJl/NSy/FWI9vYXQQUIHqVSrLbsx14YPNK7Obublic2L60GPC8e1
         UiiYDf0djZ08kilOxWfiz0MipI1mI5wklZ5wzklkXac2lBKPI9XMLdjRc6h1Q/VRGL9J
         JERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786161532; x=1786766332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbxFbepJjdL7JygBXwv8r/FSSSnS2NcO8+/iu/4Xj90=;
        b=TlWJcbhXWvickjQxbQ8/GfqV1Jk6KNOQD8uD5St+fRCQlzjTxfw/Fx4QUHuVAnb3vj
         yIKzGUiLPtitsCe5fwM9SddUUUiXR+jbSon9+FJPFhF3P7PcURximoOBcNUgV5P8rVxy
         S5wbZVIaNYCZhmUtP9FitsrwOO77qi3qiv4yrbT16dhwVdyTySImtu8lfvThezuCdK39
         lAPUk3J/FItbutw7xTu94Wa7c174tE0QVfbATwjtLExfXi5xPfja/3xNdF33Z/mLBAcK
         BiA6ZJAzTw3BcO7KPlXVknl4fxO1J8NXgUxtDOwlWRRormsU1BHBBeOmKni5w/ceVipi
         k6xg==
X-Forwarded-Encrypted: i=1; AHgh+RqB/rIuiVB/+0j3xbv0ahdHa/ha9oLRe5oqCOp8xx8TcTo10tCZ4Xd27589Pd3myeIYE3cb9H1881az@vger.kernel.org
X-Gm-Message-State: AOJu0YzxMeRvBPGZOFN6pKQ3fTwSn9T/TpUvjihC5TZpisNH/JAG5jMJ
	YzuE7/HafQNJd4oVWi1gla8ZgkBUO+FD0v/5aOImz2pBKOOiAycAzePU
X-Gm-Gg: AR+sD13VLBV//uQx3WPa1O9w+/zJmHfN6bPoXvV3wkCB0yFBpl89YFQUwBtwL7NykAJ
	OGd5szar//RbSWaD6u7+5x6O2PTVUPLGoGdmZPl+0y986GYMIdAetfU/ZDMbu/EO7m+WIYssznn
	N+NAJvPcYqOE4ghRoYGDKUqlKpjs/2j2EOC20D33zGxWQIL0DE6hlWFoomn8Hx7o8Wrr8uuIGG5
	21mVatvBGmuL3Vio4BTJgpRSer5iovYFN9P+iJE3sy397WD9nMCKvRu0CNHd7ccPMmHa0OhnoWG
	QlVpkvMG0XzpmstIO70EGddZ2f+0GQ1bBPoGkULsJMP5wkKd7k2ENDXzI42PUylWGrAO8Ir+lc/
	TB1bX1GFiArBg24Xa+Vxx/rCOEmYPzRcooQFvS17t0D4gsHVvs6pYBVwgSvbhtCpqmH9pc8SN90
	KLFdzOOs7n28+Wj+0FUIdpg/bDu0EWG1AHKPEzxxx+H4aXsEDuDYLnSO8dvB4=
X-Received: by 2002:a05:6122:d0b:b0:5bf:bc5e:e24 with SMTP id 71dfb90a1353d-5c3fa02925amr2239835e0c.12.1786161532522;
        Fri, 07 Aug 2026 20:58:52 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b212fa6sm1432936e0c.16.2026.08.07.20.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 20:58:52 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 07 Aug 2026 22:58:23 -0500
Subject: [PATCH v3 1/9] dt-bindings: iio: adc: support the TI ADS126x ADC
 family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260807-ads126x-v3-1-f89925d72792@gmail.com>
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
In-Reply-To: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12839; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=xOuI2uvaogVpXoU3ek4Ue/485BwfxthxD11w9S8ZIsw=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFllK8tLFmz/F7nor96HitZfJzldXhc+VX0tKlr7J+KJr
 ooxD+uxjlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZjIgjCG/+4Sj7WLt/UUBb4K
 F0xZHyJvvVzvfte91b9W3DzBcUU0poXhD9/uExuFjn9mCpt74Iv0qy69xqevba2DDsx5FOiS1KC
 dyw0A
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
integrated PGA, internal reference, excitation and burn-out current
sources for sensor biasing and diagnostics. The ADS1263 adds a second,
24-bit delta-sigma ADC (ADC2) for background measurements.

Each can configure its own voltage reference source, the two excitation
current sources (IDAC), plus input and excitation channels rotation for
offset and IDAC mismatch cancellation. This lets the device drive and
ratiometrically measure RTDs and other resistive sensors.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../devicetree/bindings/iio/adc/ti,ads1262.yaml    | 379 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 385 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
new file mode 100644
index 000000000000..c43ba7abb391
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
@@ -0,0 +1,379 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ti,ads1262.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI ADS1262/ADS1263 analog to digital converter
+
+maintainers:
+  - Kurt Borja <kuurtb@gmail.com>
+
+description: |
+  The ADS1262 and ADS1263 are 38.4-kSPS, delta-sigma (ΔΣ) ADCs with an
+  integrated PGA, reference, and internal fault monitors. The ADS1263 integrates
+  an auxiliary, 24-bit, ΔΣ ADC intended for background measurements.
+
+  Datasheets:
+    - ADS126x: https://www.ti.com/lit/ds/symlink/ads1262.pdf
+
+properties:
+  compatible:
+    oneOf:
+      - const: ti,ads1262
+      - items:
+          - const: ti,ads1263
+          - const: ti,ads1262
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  spi-max-frequency:
+    maximum: 8000000
+
+  spi-cpha: true
+
+  interrupts:
+    description: Data Ready (DRDY) interrupt line.
+    maxItems: 1
+
+  interrupt-names:
+    description:
+      Specify which pin should be configured as Data Ready interrupt.
+    enum: [drdy, dout-drdy]
+
+  start-gpios:
+    description: Start conversion control.
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  dvdd-supply:
+    description: Digital power supply.
+
+  avdd-supply:
+    description:
+      Analog power supply. In bipolar supply configurations, the reported
+      voltage should be in reference to DGND.
+
+  avss-supply:
+    description:
+      Negative analog power supply for bipolar configurations. AVSS can only be
+      at or below the ground reference (DGND). If not described, AVSS is assumed
+      to be connected to ground (0V).
+
+  clocks:
+    maxItems: 1
+
+  '#io-channel-cells':
+    minimum: 1
+    maximum: 2
+    description:
+      The first cell selects the channel by it's reg. The second cell selects
+      between ADC1 (0) and ADC2 (1).
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+  regulators:
+    type: object
+    description:
+      List of regulators provided by this chip.
+
+    properties:
+      vbias:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        description:
+          Level-shift voltage output on the AINCOM pin. Its output is the
+          mid-voltage of the analog supply, (AVDD + AVSS) / 2, and is used to
+          shift floating sensors to within the ADC input range.
+        unevaluatedProperties: false
+
+      refout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        description:
+          Buffered internal voltage reference output on the REFOUT pin.
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+patternProperties:
+  "^ain([0-9]|com)-supply$":
+    description:
+      Common-mode voltage supply connected to AIN<N> or AINCOM.
+
+  "^refp[1-3]-supply$":
+    description:
+      Positive voltage reference connected to REFP1 (AIN0), REFP2 (AIN2) or
+      REFP3 (AIN4). If not described, its assumed to be connected to ground
+      (0V).
+
+  "^refn[1-3]-supply$":
+    description:
+      Negative voltage reference connected to REFN1 (AIN1), REFN2 (AIN3) or
+      REFN3 (AIN5). If not described, its assumed to be connected to ground
+      (0V).
+
+  "^ti,refp[1-3]-refn[1-3]-resistor-ohms$":
+    description:
+      Magnitude of the external reference resistor connected between REFP<N>
+      and REFN<M>. In ratiometric configurations, such as RTD measurements, the
+      IDAC excitation current returns through this resistor, generating the
+      reference voltage for the conversion.
+
+  "^channel@[0-9]+$":
+    $ref: /schemas/iio/adc/adc.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      single-channel:
+        minimum: 0
+        maximum: 10
+
+      common-mode-channel:
+        minimum: 0
+        maximum: 10
+        default: 10
+
+      diff-channels:
+        description: |
+          In addition to the analog input pins 0 (AIN0) - 10 (AINCOM), there are
+          special inputs that can be selected from the following values:
+          11: Temperature sensor monitor
+          12: Analog power supply monitor
+          13: Digital power supply monitor
+          14: TDAC test signal
+        items:
+          minimum: 0
+          maximum: 14
+
+      reference-sources:
+        minItems: 2
+        description:
+          Indicates the reference sources for this channel. The first and second
+          items are the positive (REFP) and negative (REFN) sources of the main
+          ADC (ADC1). The third item is the reference source of the secondary
+          ADC (ADC2) and must always have a positive differential voltage.
+        items:
+          - enum: [internal, refp1, refp2, refp3, avdd]
+          - enum: [internal, refn1, refn2, refn3, avss]
+          - enum: [internal, refp1-refn1, refp2-refn2, refp3-refn3, avdd-avss]
+
+      ti,reference-reversal:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Indicates that the ADC1 (this has no effect on ADC2) reference voltage
+          for this channel has negative polarity and thus should be internally
+          reversed.
+
+      excitation-channels:
+        minItems: 1
+        maxItems: 2
+        description:
+          Selects the pins for the IDAC sources from 0 (AIN0) to 10 (AINCOM).
+          The first value corresponds to IDAC1 and the second to IDAC2.
+        items:
+          minimum: 0
+          maximum: 10
+
+      excitation-current-nanoamp:
+        minItems: 1
+        maxItems: 2
+        description:
+          The first value corresponds to IDAC1 and the second to IDAC2.
+        items:
+          enum: [50000, 100000, 250000, 500000, 750000, 1000000, 1500000,
+                 2000000, 2500000, 3000000]
+
+      burn-out-current-nanoamp:
+        description:
+          Selects current magnitude for the sensor bias current source.
+        enum: [500, 2000, 10000, 50000, 200000]
+
+      ti,burn-out-resistor:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Instead of a fixed current, the sensor bias (burn-out) current source
+          can be pulled using an internal 10 MΩ resistor.
+
+      ti,burn-out-polarity:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          The sensor bias can be configured to either pull-up or pull-down mode.
+          In pull-up mode, the current flows into the positive input and flows
+          out of the negative input. In pull-down mode, the polarities are
+          reversed.
+        enum: [pull-up, pull-down]
+        default: pull-up
+
+      input-chopping: true
+
+      ti,idac-rotation:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Automatically swap the IDAC1 and IDAC2 connections of alternate
+          conversions. The ADC averages the alternate conversions to eliminate
+          IDAC mismatch.
+
+    dependencies:
+      excitation-channels: [excitation-current-nanoamp]
+      excitation-current-nanoamp: [excitation-channels]
+      burn-out-current-nanoamp:
+        not:
+          required:
+            - ti,burn-out-resistor
+
+    required:
+      - reg
+
+    allOf:
+      - if:
+          properties:
+            excitation-channels:
+              maxItems: 1
+          required:
+            - excitation-channels
+        then:
+          properties:
+            excitation-current-nanoamp:
+              maxItems: 1
+        else:
+          properties:
+            excitation-current-nanoamp:
+              minItems: 2
+
+    oneOf:
+      - required: [single-channel]
+      - required: [diff-channels]
+
+dependencies:
+  interrupts: [interrupt-names]
+  interrupts-extended: [interrupt-names]
+
+required:
+  - compatible
+  - reg
+  - spi-cpha
+  - avdd-supply
+  - dvdd-supply
+  - '#address-cells'
+  - '#size-cells'
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,ads1263
+    then:
+      properties:
+        '#io-channel-cells':
+          const: 2
+      patternProperties:
+        "^channel@[0-9]+$":
+          properties:
+            reference-sources:
+              minItems: 3
+              maxItems: 3
+              default: [internal, internal, internal]
+    else:
+      properties:
+        '#io-channel-cells':
+          const: 1
+      patternProperties:
+        "^channel@[0-9]+$":
+          properties:
+            reference-sources:
+              minItems: 2
+              maxItems: 2
+              default: [internal, internal]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@0 {
+            compatible = "ti,ads1262";
+            reg = <0>;
+            spi-max-frequency = <8000000>;
+            spi-cpha;
+            avdd-supply = <&avdd>;
+            dvdd-supply = <&dvdd>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            interrupts-extended = <&gpio 0 IRQ_TYPE_EDGE_FALLING>;
+            interrupt-names = "drdy";
+
+            /* Typical common mode voltage configuration */
+            aincom-supply = <&ads1262_vbias>;
+
+            regulators {
+                ads1262_vbias: vbias {
+                    regulator-name = "vbias";
+                };
+            };
+
+            channel@0 {
+                reg = <0>;
+                single-channel = <0>;
+                /* The VBIAS is enabled on pin 10 (AINCOM) */
+                common-mode-channel = <10>;
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@0 {
+            compatible = "ti,ads1263", "ti,ads1262";
+            reg = <0>;
+            spi-max-frequency = <8000000>;
+            spi-cpha;
+            avdd-supply = <&avdd>;
+            dvdd-supply = <&dvdd>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            interrupts-extended = <&gpio 0 IRQ_TYPE_EDGE_FALLING>;
+            interrupt-names = "drdy";
+
+            ti,refp2-refn2-resistor-ohms = <3520>;
+
+            channel@0 {
+                reg = <0>;
+                diff-channels = <4 5>;
+                reference-sources = "refp2", "refn2", "refp2-refn2";
+                excitation-channels = <1 6>;
+                excitation-current-nanoamp = <500000 500000>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 04fa5322d9f7..e9248979b801 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27001,6 +27001,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/ti,ads1018.yaml
 F:	drivers/iio/adc/ti-ads1018.c
 
+TI ADS1262 ADC DRIVER
+M:	Kurt Borja <kuurtb@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
+
 TI ADS7924 ADC DRIVER
 M:	Hugo Villeneuve <hvilleneuve@dimonoff.com>
 L:	linux-iio@vger.kernel.org

-- 
2.55.0

