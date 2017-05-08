From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] gpio: mcp23s08: Use seq_putc() in mcp23s08_dbg_show()
Date: Mon, 8 May 2017 12:50:13 +0200
Message-ID: <78956b0e-7f06-487c-cd11-fea77a65e66a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:63577 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753052AbdEHKuX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 May 2017 06:50:23 -0400
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 12:44:36 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-mcp23s08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 2a57d024481d..51dff7e95a9e 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -519,7 +519,7 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 			(mcp->cache[MCP_GPIO] & mask) ? "hi" : "lo",
 			(mcp->cache[MCP_GPPU] & mask) ? "up" : "  ");
 		/* NOTE:  ignoring the irq-related registers */
-		seq_puts(s, "\n");
+		seq_putc(s, '\n');
 	}
 done:
 	mutex_unlock(&mcp->lock);
-- 
2.12.2

