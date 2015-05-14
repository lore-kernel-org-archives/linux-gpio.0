From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH 2/2] pinctrl: cygnus: fixed incorrect GPIO-pin mapping
Date: Wed, 13 May 2015 17:06:23 -0700
Message-ID: <1431561983-8543-3-git-send-email-rjui@broadcom.com>
References: <1431561983-8543-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:26105 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934123AbbENAGb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 20:06:31 -0400
In-Reply-To: <1431561983-8543-1-git-send-email-rjui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Jason Uy <jasonuy@broadcom.com>, Ray Jui <rjui@broadcom.com>

This patch fixes an incorrect GPIO-to-pin mapping in the Cygnus GPIO
driver

Signed-off-by: Ray Jui <rjui@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
index bde45ba..e8c50f0 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
@@ -643,7 +643,9 @@ static const struct cygnus_gpio_pin_range cygnus_gpio_pintable[] = {
 	CYGNUS_PINRANGE(87, 104, 12),
 	CYGNUS_PINRANGE(99, 102, 2),
 	CYGNUS_PINRANGE(101, 90, 4),
-	CYGNUS_PINRANGE(105, 116, 10),
+	CYGNUS_PINRANGE(105, 116, 6),
+	CYGNUS_PINRANGE(111, 100, 2),
+	CYGNUS_PINRANGE(113, 122, 4),
 	CYGNUS_PINRANGE(123, 11, 1),
 	CYGNUS_PINRANGE(124, 38, 4),
 	CYGNUS_PINRANGE(128, 43, 1),
-- 
1.7.9.5

