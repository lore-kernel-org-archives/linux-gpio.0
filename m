From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: max77620: add OF dependency
Date: Fri, 28 Oct 2016 10:19:05 +0200
Message-ID: <20161028081923.3238580-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:52549 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759198AbcJ1ITm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2016 04:19:42 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Drivers using pinconf_generic_params tables cannot be built with
CONFIG_OF disabled:

drivers/pinctrl/pinctrl-max77620.c:53:44: error: array type has incomplete element type ‘struct pinconf_generic_params’
drivers/pinctrl/pinctrl-max77620.c:55:3: error: field name not in record or union initializer
drivers/pinctrl/pinctrl-max77620.c:55:3: note: (near initialization for ‘max77620_cfg_params’)
drivers/pinctrl/pinctrl-max77620.c:56:3: error: field name not in record or union initializer

This adds a dependency for max77620 to disallow that configuration.

Alternatively, we could rework the pinctrl infrastructure to make the
configuration valid for compile-testing.

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>
Fixes: 453943dc8f45 ("mfd: Enable compile testing for max77620 and max77686")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 801fa8bb05e1..3eea73937ce8 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -223,7 +223,7 @@ config PINCTRL_COH901
 
 config PINCTRL_MAX77620
 	tristate "MAX77620/MAX20024 Pincontrol support"
-	depends on MFD_MAX77620
+	depends on MFD_MAX77620 && OF
 	select PINMUX
 	select GENERIC_PINCONF
 	help
-- 
2.9.0

