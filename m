From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sirf: atlas7: fix of_irq_get() error check
Date: Sun, 30 Jul 2017 22:38:48 +0300
Message-ID: <20170730193855.099325987@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34391 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754228AbdG3TjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Jul 2017 15:39:01 -0400
Received: by mail-lf0-f53.google.com with SMTP id g25so102870037lfh.1
        for <linux-gpio@vger.kernel.org>; Sun, 30 Jul 2017 12:39:00 -0700 (PDT)
Content-Disposition: inline; filename=pinctrl-sirf-atlas7-fix-of_irq_get-error-check.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Barry Song <baohua@kernel.org>, linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

of_irq_get() may return  any negative error number as well as 0 on failure,
while the driver only checks for -EPROBE_DEFER, blithely continuing with
the call to gpiochip_set_chained_irqchip() -- that function expects the
parent IRQ as *unsigned int*, so would probably do nothing  when a large
IRQ number resulting from a conversion of a negative error number is passed
to it, however passing 0 would probably work but the driver won't receive
valid GPIO bank interrupts.

Check for 'ret <= 0' instead and return -ENXIO from the driver's probe iff
of_irq_get() returned 0.

Fixes: f9367793293d ("pinctrl: sirf: add sirf atlas7 pinctrl and gpio support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'fixes' branch of Linus W.'s 'linux-pinctrl.git' repo.

 drivers/pinctrl/sirf/pinctrl-atlas7.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux-pinctrl/drivers/pinctrl/sirf/pinctrl-atlas7.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ linux-pinctrl/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -6081,9 +6081,11 @@ static int atlas7_gpio_probe(struct plat
 
 		/* Get interrupt number from DTS */
 		ret = of_irq_get(np, idx);
-		if (ret == -EPROBE_DEFER) {
+		if (ret <= 0) {
 			dev_err(&pdev->dev,
 				"Unable to find IRQ number. ret=%d\n", ret);
+			if (!ret)
+				ret = -ENXIO;
 			goto failed;
 		}
 		bank->irq = ret;

