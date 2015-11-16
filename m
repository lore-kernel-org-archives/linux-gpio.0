From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: fix qcom ssbi drivers for 64-bit compilation
Date: Mon, 16 Nov 2015 17:41:18 +0100
Message-ID: <5235862.Gokjxf5QH1@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:62468 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752845AbbKPQl5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2015 11:41:57 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, linux-arm-msm@vger.kernel.org

When building pinctrl-ssbi-gpio and pinctrl-ssbi-mpp for ARM64, we get
a compile warning about invalid types:

drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c: In function 'pm8xxx_gpio_probe':
drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c: In function 'pm8xxx_mpp_probe':
drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

This changes the code so we cast the pointer to 'unsigned long', which
is the right thing to do here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index d809c9eaa323..19a3c3bc2f1f 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -672,7 +672,7 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pctrl->dev = &pdev->dev;
-	pctrl->npins = (unsigned)of_device_get_match_data(&pdev->dev);
+	pctrl->npins = (unsigned long)of_device_get_match_data(&pdev->dev);
 
 	pctrl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	if (!pctrl->regmap) {
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 8982027de8e8..b868ef1766a0 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -763,7 +763,7 @@ static int pm8xxx_mpp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pctrl->dev = &pdev->dev;
-	pctrl->npins = (unsigned)of_device_get_match_data(&pdev->dev);
+	pctrl->npins = (unsigned long)of_device_get_match_data(&pdev->dev);
 
 	pctrl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	if (!pctrl->regmap) {

