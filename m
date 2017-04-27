From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv2 4/6] arm: lpc32xx: defconfig: MCP23S08 config has been renamed
Date: Thu, 27 Apr 2017 16:19:35 +0200
Message-ID: <20170427141937.762-5-sebastian.reichel@collabora.co.uk>
References: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49988 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938355AbdD0OUB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Apr 2017 10:20:01 -0400
In-Reply-To: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Steven Miao <realmz6@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

The mcp23s08 driver now supports pinconf, so the config
option has been renamed from CONFIG_GPIO_MCP23S08 to
CONFIG_PINCTRL_MCP23S08.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 arch/arm/configs/lpc32xx_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index 6ba430d2b5b2..e15fa5f168bb 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -112,7 +112,7 @@ CONFIG_GPIO_SX150X=y
 CONFIG_GPIO_74X164=y
 CONFIG_GPIO_MAX7301=y
 CONFIG_GPIO_MC33880=y
-CONFIG_GPIO_MCP23S08=y
+CONFIG_PINCTRL_MCP23S08=y
 CONFIG_SENSORS_DS620=y
 CONFIG_SENSORS_MAX6639=y
 CONFIG_WATCHDOG=y
-- 
2.11.0

