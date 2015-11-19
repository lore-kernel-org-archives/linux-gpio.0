From: Pramod Kumar <pramodku@broadcom.com>
Subject: [PATCH v2 4/7] pinctrl: Add new compatible string to GPIO controller driver
Date: Thu, 19 Nov 2015 09:22:16 +0530
Message-ID: <1447905139-16002-5-git-send-email-pramodku@broadcom.com>
References: <1447905139-16002-1-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:57213 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933721AbbKSDwr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2015 22:52:47 -0500
In-Reply-To: <1447905139-16002-1-git-send-email-pramodku@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas Gorski <jogo@openwrt.org>, Pramod Kumar <pramodku@broadcom.com>

This compatible string should be used for all new iproc based future
SoCs having the same GPIO controller hardware.

Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
index 498a58a..d0d788f 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
@@ -646,6 +646,7 @@ static const struct of_device_id cygnus_gpio_of_match[] = {
 	{ .compatible = "brcm,cygnus-ccm-gpio" },
 	{ .compatible = "brcm,cygnus-asiu-gpio" },
 	{ .compatible = "brcm,cygnus-crmu-gpio" },
+	{ .compatible = "brcm,iproc-gpio" },
 	{ }
 };
 
-- 
1.9.1

