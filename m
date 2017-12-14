From: Quentin Schulz <quentin.schulz@free-electrons.com>
Subject: [PATCH] pinctrl: axp209: add missing Kconfig dependencies
Date: Thu, 14 Dec 2017 10:43:35 +0100
Message-ID: <20171214094335.899-1-quentin.schulz@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:55666 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750737AbdLNJok (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Dec 2017 04:44:40 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@free-electrons.com, linux-sunxi@googlegroups.com, rdunlap@infradead.org, Quentin Schulz <quentin.schulz@free-electrons.com>

This fixes some compilation issues.

GENERIC_PINCONF and OF at least for pinconf_generic_dt_*, PINMUX at
least for pinmux_ops and GPIOLIB for at least gpio_chip.

Fixes: 23f75d7dfa92 ("pinctrl: axp209: add pinctrl features")

Reported-by: Randy Dunlab <rdunlap@infradead.org>
Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
---
 drivers/pinctrl/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index ce126955212c..1dd445116432 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -66,6 +66,10 @@ config PINCTRL_AS3722
 config PINCTRL_AXP209
 	tristate "X-Powers AXP209 PMIC pinctrl and GPIO Support"
 	depends on MFD_AXP20X
+	depends on OF
+	select PINMUX
+	select GENERIC_PINCONF
+	select GPIOLIB
 	help
 	  AXP PMICs provides multiple GPIOs that can be muxed for different
 	  functions. This driver bundles a pinctrl driver to select the function
-- 
2.14.1

