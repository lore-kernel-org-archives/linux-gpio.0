From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl-st: fix of_irq_to_resource() result check
Date: Sat, 29 Jul 2017 21:07:07 +0300
Message-ID: <20170729180744.873303067@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:37277 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752755AbdG2SHu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jul 2017 14:07:50 -0400
Received: by mail-lf0-f45.google.com with SMTP id m86so94115261lfi.4
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2017 11:07:49 -0700 (PDT)
Content-Disposition: inline; filename=pinctrl-st-fix-of_irq_to_resource-result-check.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Patrice Chotard <patrice.chotard@st.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

of_irq_to_resource() has recently been fixed to return negative error #'s
along with 0 in case of failure, however the ST driver still only regards
0 as failure indication -- fix it up.

Fixes: 7a4228bbff76 ("of: irq: use of_irq_get() in of_irq_to_resource()")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/pinctrl/pinctrl-st.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-pinctrl/drivers/pinctrl/pinctrl-st.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/pinctrl-st.c
+++ linux-pinctrl/drivers/pinctrl/pinctrl-st.c
@@ -1521,7 +1521,7 @@ static int st_gpiolib_register_bank(stru
 	 *	[irqN]----> [gpio-bank (n)]
 	 */
 
-	if (of_irq_to_resource(np, 0, &irq_res)) {
+	if (of_irq_to_resource(np, 0, &irq_res) > 0) {
 		gpio_irq = irq_res.start;
 		gpiochip_set_chained_irqchip(&bank->gpio_chip, &st_gpio_irqchip,
 					     gpio_irq, st_gpio_irq_handler);

