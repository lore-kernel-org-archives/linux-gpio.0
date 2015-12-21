From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] pinctrl: bcm2835: Fix memory leak in error path
Date: Mon, 21 Dec 2015 00:44:04 +0000
Message-ID: <1450658644-20858-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:60502 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751081AbbLUAo4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Dec 2015 19:44:56 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stefan Wahren <stefan.wahren@i2se.com>

In case of an invalid pin value bcm2835_pctl_dt_node_to_map()
would leak the pull configs of already assigned pins.
So avoid this by calling the free map function in error case.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Fixes: e1b2dc70cd5b ("pinctrl: add bcm2835 driver")
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 2e6ca69..75b0d8c 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -795,7 +795,7 @@ static int bcm2835_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 
 out:
-	kfree(maps);
+	bcm2835_pctl_dt_free_map(pctldev, maps, num_pins * maps_per_pin);
 	return err;
 }
 
-- 
1.7.9.5

