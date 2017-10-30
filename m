From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 3/3] pinctrl: mcp23s08: Combine two function calls in
 mcp23s08_dbg_show()
Date: Mon, 30 Oct 2017 16:49:21 +0100
Message-ID: <0510a811-e653-6310-5c7f-8d6434efca2a@users.sourceforge.net>
References: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 16:34:44 +0100

* Print a line break together with other data in a single function call.

* Adjust indentation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index d1a7c627dbb9..79b585d46289 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -745,13 +745,12 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		if (!label)
 			continue;
 
-		seq_printf(s, " gpio-%-3d P%c.%d (%-12s) %s %s %s",
-			chip->base + t, bank, t, label,
-			(iodir & mask) ? "in " : "out",
-			(gpio & mask) ? "hi" : "lo",
-			(gppu & mask) ? "up" : "  ");
+		seq_printf(s, " gpio-%-3d P%c.%d (%-12s) %s %s %s\n",
+			   chip->base + t, bank, t, label,
+			   (iodir & mask) ? "in " : "out",
+			   (gpio & mask) ? "hi" : "lo",
+			   (gppu & mask) ? "up" : "  ");
 		/* NOTE:  ignoring the irq-related registers */
-		seq_puts(s, "\n");
 	}
 unlock:
 	mutex_unlock(&mcp->lock);
-- 
2.14.3
