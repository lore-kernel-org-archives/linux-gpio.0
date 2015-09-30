From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] pinctrl: pinconf-generic: add "input-schmitt" DT property
Date: Wed, 30 Sep 2015 21:07:18 +0900
Message-ID: <1443614838-23569-2-git-send-email-yamada.masahiro@socionext.com>
References: <1443614838-23569-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:23626 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752419AbbI3MHS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2015 08:07:18 -0400
In-Reply-To: <1443614838-23569-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

PIN_CONFIG_INPUT_SCHMITT is defined in enum_pin_config_param,
but the corresponding DT property is missing.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinconf-generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index a88a559..099a344 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -163,6 +163,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
 	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
 	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
+	{ "input-schmitt", PIN_CONFIG_INPUT_SCHMITT, 0 },
 	{ "input-schmitt-disable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 0 },
 	{ "input-schmitt-enable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 1 },
 	{ "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
-- 
1.9.1

