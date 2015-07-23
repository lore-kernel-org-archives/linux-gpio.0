From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/5] pinctrl: nomadik: assure GPIO chips are populated
Date: Thu, 23 Jul 2015 09:09:38 +0200
Message-ID: <1437635378-23415-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:35716 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbbGWHJq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2015 03:09:46 -0400
Received: by lblf12 with SMTP id f12so151304520lbl.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2015 00:09:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

If the pin controller probes before the GPIO driver it needs to
populate the GPIO driver state containers ahead of the actual
driver probe as the addresses are used by both halves of the
driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/pinctrl/ste,nomadik.txt    |  7 ++++--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          | 25 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ste,nomadik.txt b/Documentation/devicetree/bindings/pinctrl/ste,nomadik.txt
index f63fcb3ed352..2213802435e0 100644
--- a/Documentation/devicetree/bindings/pinctrl/ste,nomadik.txt
+++ b/Documentation/devicetree/bindings/pinctrl/ste,nomadik.txt
@@ -3,7 +3,9 @@ ST Ericsson Nomadik pinmux controller
 Required properties:
 - compatible: "stericsson,db8500-pinctrl", "stericsson,db8540-pinctrl",
               "stericsson,stn8815-pinctrl"
-- reg: Should contain the register physical address and length of the PRCMU.
+- nomadik-gpio-chips: array of phandles to the corresponding GPIO chips
+              (these have the register ranges used by the pin controller).
+- prcm: phandle to the PRCMU managing the back end of this pin controller
 
 Please refer to pinctrl-bindings.txt in this directory for details of the
 common pinctrl bindings used by client devices, including the meaning of the
@@ -74,7 +76,8 @@ Example board file extract:
 
 	pinctrl@80157000 {
 		compatible = "stericsson,db8500-pinctrl";
-		reg = <0x80157000 0x2000>;
+		nomadik-gpio-chips = <&gpio0>, <&gpio1>, <&gpio2>, <&gpio3>;
+		prcm = <&prcmu>;
 
 		pinctrl-names = "default";
 
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index f068583fdc9b..d1020256c999 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -2021,6 +2021,31 @@ static int nmk_pinctrl_probe(struct platform_device *pdev)
 	if (version == PINCTRL_NMK_DB8540)
 		nmk_pinctrl_db8540_init(&npct->soc);
 
+	/*
+	 * Since we depend on the GPIO chips to provide clock and register base
+	 * for the pin control operations, make sure that we have these
+	 * populated before we continue. Follow the phandles to instantiate
+	 * them. The GPIO portion of the actual hardware may be probed before
+	 * or after this point: it shouldn't matter as the APIs are orthogonal.
+	 */
+	for (i = 0; i < NMK_MAX_BANKS; i++) {
+		struct device_node *gpio_np;
+		struct nmk_gpio_chip *nmk_chip;
+
+		gpio_np = of_parse_phandle(np, "nomadik-gpio-chips", i);
+		if (gpio_np) {
+			dev_info(&pdev->dev,
+				 "populate NMK GPIO %d \"%s\"\n",
+				 i, gpio_np->name);
+			nmk_chip = nmk_gpio_populate_chip(gpio_np, pdev);
+			if (IS_ERR(nmk_chip))
+				dev_err(&pdev->dev,
+					"could not populate nmk chip struct "
+					"- continue anyway\n");
+			of_node_put(gpio_np);
+		}
+	}
+
 	prcm_np = of_parse_phandle(np, "prcm", 0);
 	if (prcm_np)
 		npct->prcm_base = of_iomap(prcm_np, 0);
-- 
2.4.3

