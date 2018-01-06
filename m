From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: sh-pfc: Use seq_puts() in sh_pfc_pin_dbg_show()
Date: Sat, 6 Jan 2018 21:56:14 +0100
Message-ID: <7e3a88a6-2ea8-1704-b7a0-67f1f4b4f3f6@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 21:50:20 +0100

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 736634aee500..70db21638901 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -75,7 +75,7 @@ static int sh_pfc_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
 static void sh_pfc_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 				unsigned offset)
 {
-	seq_printf(s, "%s", DRV_NAME);
+	seq_puts(s, DRV_NAME);
 }
 
 #ifdef CONFIG_OF
-- 
2.15.1
