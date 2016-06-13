From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] pinctrl: max77620: select PINMUX
Date: Mon, 13 Jun 2016 17:18:35 +0200
Message-ID: <1465831250-2689101-2-git-send-email-arnd@arndb.de>
References: <1465831250-2689101-1-git-send-email-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:64716 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423957AbcFMPUI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 11:20:08 -0400
In-Reply-To: <1465831250-2689101-1-git-send-email-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Laxman Dewangan <ldewangan@nvidia.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The recently added max77620 driver fails to build when CONFIG_PINMUX
is not set:

pinctrl/pinctrl-max77620.c:272:21: error: variable 'max77620_pinmux_ops' has initializer but incomplete type
 static const struct pinmux_ops max77620_pinmux_ops = {
                     ^~~~~~~~~~
pinctrl/pinctrl-max77620.c:273:2: error: unknown field 'get_functions_count' specified in initializer

This adds the Kconfig 'select' statement that was clearly meant
to be there and is used in all other pinmux drivers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index ea25eeeceef1..78c9ed277a77 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -210,6 +210,7 @@ config PINCTRL_COH901
 config PINCTRL_MAX77620
 	tristate "MAX77620/MAX20024 Pincontrol support"
 	depends on MFD_MAX77620
+	select PINMUX
 	select GENERIC_PINCONF
 	help
 	  Say Yes here to enable Pin control support for Maxim PMIC MAX77620.
-- 
2.7.0

