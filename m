From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/9] pinctrl: Use seq_putc() in three functions
Date: Tue, 2 May 2017 11:21:55 +0200
Message-ID: <6b51c0df-b48e-c49c-b7ae-ee0c8edfb581@users.sourceforge.net>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:62498 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751099AbdEBJV7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 May 2017 05:21:59 -0400
In-Reply-To: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 May 2017 22:24:29 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinconf.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index a02dba35fcf3..1a3fbdf81ecb 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -232,7 +232,7 @@ static void pinconf_show_config(struct seq_file *s, struct pinctrl_dev *pctldev,
 							    configs[i]);
 		else
 			seq_printf(s, "%08lx", configs[i]);
-		seq_puts(s, "\n");
+		seq_putc(s, '\n');
 	}
 }
 
@@ -325,8 +325,7 @@ static int pinconf_pins_show(struct seq_file *s, void *what)
 		seq_printf(s, "pin %d (%s): ", pin, desc->name);
 
 		pinconf_dump_pin(pctldev, s, pin);
-
-		seq_printf(s, "\n");
+		seq_putc(s, '\n');
 	}
 
 	mutex_unlock(&pctldev->mutex);
@@ -361,8 +360,7 @@ static int pinconf_groups_show(struct seq_file *s, void *what)
 
 		seq_printf(s, "%u (%s): ", selector, gname);
 		pinconf_dump_group(pctldev, s, selector, gname);
-		seq_printf(s, "\n");
-
+		seq_putc(s, '\n');
 		selector++;
 	}
 
-- 
2.12.2

