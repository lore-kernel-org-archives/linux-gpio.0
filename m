From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: nomadik: hide unused functions
Date: Mon, 25 Jan 2016 16:59:09 +0100
Message-ID: <1453737557-1960171-1-git-send-email-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:57793 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932879AbcAYP7x (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2016 10:59:53 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Alessandro Rubini <rubini@unipv.it>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The nomadik pinctrl driver has two functions that are only used
for debugfs output and are otherwise unused:

drivers/pinctrl/nomadik/pinctrl-abx500.c:194:12: error: 'abx500_get_pull_updown' defined but not used
drivers/pinctrl/nomadik/pinctrl-abx500.c:471:12: error: 'abx500_get_mode' defined but not used

This makes the function definitions conditional to avoid the
harmless warnings.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 085e60106ec2..1f7469c9857d 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -191,6 +191,7 @@ static void abx500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 		dev_err(pct->dev, "%s write failed (%d)\n", __func__, ret);
 }
 
+#ifdef CONFIG_DEBUG_FS
 static int abx500_get_pull_updown(struct abx500_pinctrl *pct, int offset,
 				  enum abx500_gpio_pull_updown *pull_updown)
 {
@@ -226,6 +227,7 @@ out:
 
 	return ret;
 }
+#endif
 
 static int abx500_set_pull_updown(struct abx500_pinctrl *pct,
 				  int offset, enum abx500_gpio_pull_updown val)
@@ -468,6 +470,7 @@ out:
 	return ret;
 }
 
+#ifdef CONFIG_DEBUG_FS
 static int abx500_get_mode(struct pinctrl_dev *pctldev, struct gpio_chip *chip,
 			  unsigned gpio)
 {
@@ -553,8 +556,6 @@ out:
 	return ret;
 }
 
-#ifdef CONFIG_DEBUG_FS
-
 #include <linux/seq_file.h>
 
 static void abx500_gpio_dbg_show_one(struct seq_file *s,
-- 
2.7.0

