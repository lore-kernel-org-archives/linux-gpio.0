Return-Path: <SRS0=j2kj=CZ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802C2C35257
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Sep 2020 20:35:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 382C9221EE
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Sep 2020 20:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600288522;
	bh=OZQQiNgbEb8ZHtloDc4attI+pGJEHjLlrjIjhE2p740=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Oji3cGTMFyDKa1gwXs7M2kkEVEyyxnRK8r6OjIg9rVe4d+EeLk6CotEboRm/4M3T7
	 WFHUNV2jO3ZySFJ5m1v0VB46QxAcFvtTFfRzip2fC/d9IcV8+opxXUPxEJm/iFCQqg
	 so13rqMg5r6K6Tsi8uqGSlnI4yOugJRTVzrC+QvU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgIPUfV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Sep 2020 16:35:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:60430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726843AbgIPRKb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 13:10:31 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D44922B30;
        Wed, 16 Sep 2020 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600273452;
        bh=OZQQiNgbEb8ZHtloDc4attI+pGJEHjLlrjIjhE2p740=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tfKj/be4+r8rwTNc7bmVfsswqTcOXsQiNqhKVO+RtwvaQhrdo5ToeYXNBAAl8nb0I
         gT1RG4b4JL+rLMux5Wi2aVdF6caBm7WWSoLETztCmT7+CXCFKsmzKw9GibovgMGalE
         YeauZ8qQHDDpbkR182aQ3e6mfpTRZGPF1yuc0/WA=
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
Subject: [PATCH 8/8] ARM: dts: imx: align GPIO hog names with dtschema
Date:   Wed, 16 Sep 2020 18:22:50 +0200
Message-Id: <20200916162250.16098-9-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916162250.16098-1-krzk@kernel.org>
References: <20200916162250.16098-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

dtschema for GPIO controllers expects GPIO hogs to end with 'hog'
prefix.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/imx51-zii-rdu1.dts        | 2 +-
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi     | 8 ++++----
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts b/arch/arm/boot/dts/imx51-zii-rdu1.dts
index e559ab0c3645..ec8ca3ac2c1c 100644
--- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
@@ -451,7 +451,7 @@
 			  "", "", "", "",
 			  "", "", "", "";
 
-	unused-sd3-wp-gpio {
+	unused-sd3-wp-hog {
 		/*
 		 * See pinctrl_esdhc1 below for more details on this
 		 */
diff --git a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
index 66b15748e287..c0a76202e16b 100644
--- a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
@@ -330,28 +330,28 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio3_hog>;
 
-	usb-emulation {
+	usb-emulation-hog {
 		gpio-hog;
 		gpios = <19 GPIO_ACTIVE_HIGH>;
 		output-low;
 		line-name = "usb-emulation";
 	};
 
-	usb-mode1 {
+	usb-mode1-hog {
 		gpio-hog;
 		gpios = <20 GPIO_ACTIVE_HIGH>;
 		output-high;
 		line-name = "usb-mode1";
 	};
 
-	usb-pwr {
+	usb-pwr-hog {
 		gpio-hog;
 		gpios = <22 GPIO_ACTIVE_LOW>;
 		output-high;
 		line-name = "usb-pwr-ctrl-en-n";
 	};
 
-	usb-mode2 {
+	usb-mode2-hog {
 		gpio-hog;
 		gpios = <23 GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts b/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
index a0bbec57ddc7..3ec042bfccba 100644
--- a/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
+++ b/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
@@ -110,7 +110,7 @@
 };
 
 &gpio5 {
-	emmc-usd-mux {
+	emmc-usd-mux-hog {
 		gpio-hog;
 		gpios = <1 GPIO_ACTIVE_LOW>;
 		output-high;
-- 
2.17.1

