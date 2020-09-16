Return-Path: <SRS0=j2kj=CZ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD86C43461
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Sep 2020 18:17:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49861221E5
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Sep 2020 18:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600280246;
	bh=pbNqN55u1tHeehZkWrTDpltfJRJ8+e4PE2IzZeekHpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=H2pi5z7r5R0bWC0JoBv5hZ7twBBfPp7x2h/jDH7ypbCvrz5zxudAixS13UTcRhDrL
	 tVibN90KRlYepGtD/qfMRr3MSONWvzvphVFzJgLe7cDAiJ3A5bnrZq0mTuE56MxAKR
	 S3eYUCm+RPKoJMVDvbooFZw/sZywbpfmlIAwDTDg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbgIPSQl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Sep 2020 14:16:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:53920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727819AbgIPSPr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 14:15:47 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B1E8229C6;
        Wed, 16 Sep 2020 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600273404;
        bh=pbNqN55u1tHeehZkWrTDpltfJRJ8+e4PE2IzZeekHpA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kYSf1vBqT453bvKPNNX0mhEyKbeXeUBCLEDSDWiVcZ4LgTK08f/u+/9PmWPZs33OI
         wzOO2cjqATnDvdqS7QH5aVONUyL4s3lUQEsP88PogmW/EgFDwIv38zdzauT4asZZjP
         3OVvhk/RM/fsDVg6Ne4MBV7ANGcwokDOtDm2DDGM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-unisoc@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/8] dt-bindings: gpio: include common schema in GPIO controllers
Date:   Wed, 16 Sep 2020 18:22:44 +0200
Message-Id: <20200916162250.16098-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916162250.16098-1-krzk@kernel.org>
References: <20200916162250.16098-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Include the common GPIO schema in GPIO controllers to be sure all common
properties are properly validated.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml          | 3 +++
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml       | 3 +++
 Documentation/devicetree/bindings/gpio/gpio-mxs.yaml           | 3 +++
 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml       | 3 +++
 Documentation/devicetree/bindings/gpio/gpio-rda.yaml           | 3 +++
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml         | 3 +++
 Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml          | 1 +
 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml  | 3 +++
 Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml     | 3 +++
 Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml  | 3 +++
 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml        | 3 +++
 .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 3 +++
 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml | 3 +++
 13 files changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
index c213cb9ddb9f..1ac69b9c03f9 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
@@ -13,6 +13,9 @@ description: |
   This controller is the Chip Common A GPIO present on a number of Broadcom
   switch ASICs with integrated SoCs.
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     const: brcm,iproc-gpio-cca
diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index de0b9b5f6a70..737756e081fb 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -9,6 +9,9 @@ title: Freescale i.MX/MXC GPIO controller
 maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
index dfa1133f8c5e..7fc04ab35044 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
@@ -17,6 +17,9 @@ description: |
   GPIO ports share the same IO space with PIN controller, the GPIO node
   will be represented as sub-nodes of MXS pinctrl node.
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
index 338c5312a106..69b12041c893 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
@@ -9,6 +9,9 @@ title: PCA9570 I2C GPO expander
 maintainers:
   - Sungbo Eo <mans0n@gorani.run>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
index 6ece555f074f..d70c99f463c2 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
@@ -9,6 +9,9 @@ title: RDA Micro GPIO controller
 maintainers:
   - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     const: rda,8810pl-gpio
diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index 6ac5a78ad3da..82f3e4b407d1 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -17,6 +17,9 @@ description: |
   Note: Each GPIO port should have an alias correctly numbered in "aliases"
   node.
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
index 4db3b8a3332c..e2b7d2d133a8 100644
--- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
@@ -12,6 +12,7 @@ maintainers:
   - Rob Herring <robh+dt@kernel.org>
 
 allOf:
+  - $ref: gpio-common.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
index 32a566ec3558..2eee374e8396 100644
--- a/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
@@ -13,6 +13,9 @@ description: |
   Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
   gpio controller to control 5 gpios on the chip.
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
index 8bdef812c87c..845689807678 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
@@ -9,6 +9,9 @@ title: Renesas EMMA Mobile General Purpose I/O Interface
 maintainers:
   - Magnus Damm <magnus.damm@gmail.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     const: renesas,em-gio
diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index 5026662e4508..c116000d579f 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -9,6 +9,9 @@ title: Renesas R-Car General-Purpose Input/Output Ports (GPIO)
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index a0efd8dc2538..f2d93b40fc7e 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Yash Shah <yash.shah@sifive.com>
   - Paul Walmsley <paul.walmsley@sifive.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     items:
diff --git a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
index c58ff9a94f45..94a911e9c313 100644
--- a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
@@ -9,6 +9,9 @@ title: UniPhier GPIO controller
 maintainers:
   - Masahiro Yamada <yamada.masahiro@socionext.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   $nodename:
     pattern: "^gpio@[0-9a-f]+$"
diff --git a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
index a36aec27069c..0e4581241b3f 100644
--- a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
@@ -23,6 +23,9 @@ description: |
   - EN_VEE (power control) mapped to index 7
   - V_EN (power control) mapped to index 8
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   $nodename:
     pattern: "^gpio@[0-9a-f]+$"
-- 
2.17.1

