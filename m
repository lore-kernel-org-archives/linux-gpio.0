From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: pinmux: Use seq_putc() in pinmux_pins_show()
Date: Sat, 13 Jan 2018 11:49:02 +0100
Message-ID: <bb070097-4d6a-3986-398d-7276cb18bb37@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:64776 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933432AbeAMKtF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Jan 2018 05:49:05 -0500
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 11:33:47 +0100

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 55502fc4479c..139a004a5e71 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -619,7 +619,7 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 				   pctlops->get_group_name(pctldev,
 					desc->mux_setting->group));
 		else
-			seq_printf(s, "\n");
+			seq_putc(s, '\n');
 	}
 
 	mutex_unlock(&pctldev->mutex);
-- 
2.15.1

