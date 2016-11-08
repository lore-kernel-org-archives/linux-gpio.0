From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: sx150x: fix up headers
Date: Tue,  8 Nov 2016 10:27:17 +0100
Message-ID: <1478597237-4441-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34803 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932256AbcKHJ1X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 04:27:23 -0500
Received: by mail-lf0-f50.google.com with SMTP id o141so62315760lff.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 01:27:23 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>

Include <linux/gpio/driver.h> rather than <linux/gpio.h>
Drop <linux/pinctrl/machine.h>.

Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-sx150x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index dc1341fdc73d..63778058eec7 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -27,8 +27,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/gpio.h>
-#include <linux/pinctrl/machine.h>
+#include <linux/gpio/driver.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
-- 
2.7.4

