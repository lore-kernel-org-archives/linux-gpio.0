From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: sort dt_params array in the same order as pin_config_param
Date: Mon, 21 Sep 2015 01:26:59 +0900
Message-ID: <1442766419-3983-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg011.nifty.com ([202.248.44.37]:30317 "EHLO
	conuserg011-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753198AbbITQ1N (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Sep 2015 12:27:13 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

Sort this array in the same order as enum pin_config_param and
conf_items array for consistency.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinconf-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index e63ad9f..f0bc8bb 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -166,11 +166,11 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "input-schmitt-disable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 0 },
 	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
 	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
+	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
 	{ "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
 	{ "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
 	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
 	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
-	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0},
 };
 
 /**
-- 
1.9.1

