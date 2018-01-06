From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH v2] pinctrl: mcp23s08: Combine two function calls into one in
 mcp23s08_dbg_show()
Date: Sat, 6 Jan 2018 20:52:26 +0100
Message-ID: <3f5bd410-e685-d067-14e3-b8e77552a121@users.sourceforge.net>
References: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net>
 <0510a811-e653-6310-5c7f-8d6434efca2a@users.sourceforge.net>
 <CACRpkdaoUad0i3Kddyp0aJRJ46frHMY9_57mwM3iXAhqL5V3aA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:58657 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751718AbeAFTwa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 6 Jan 2018 14:52:30 -0500
In-Reply-To: <CACRpkdaoUad0i3Kddyp0aJRJ46frHMY9_57mwM3iXAhqL5V3aA@mail.gmail.com>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 20:40:04 +0100

* Print a line break together with other data in a single function call.

* Adjust indentation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
This update suggestion was rebased on source files from the software
"Linux next-20180105".

 drivers/pinctrl/pinctrl-mcp23s08.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index e6ad36dea3e5..95d548f3ba53 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -748,13 +748,12 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
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
 done:
 	mutex_unlock(&mcp->lock);
-- 
2.15.1

