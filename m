From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH trivial] pinctrl: Grammar s/used in as/used as/
Date: Mon,  4 May 2015 19:46:57 +0200
Message-ID: <1430761617-24250-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:57789 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751065AbbEDRrC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 13:47:02 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jiri Kosina <trivial@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 89dca77ca0382e93..291099d5cf51b4d3 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -558,7 +558,7 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
 }
 
 /**
- * pinctrl_request_gpio() - request a single pin to be used in as GPIO
+ * pinctrl_request_gpio() - request a single pin to be used as GPIO
  * @gpio: the GPIO pin number from the GPIO subsystem number space
  *
  * This function should *ONLY* be used from gpiolib-based GPIO drivers,
-- 
1.9.1

