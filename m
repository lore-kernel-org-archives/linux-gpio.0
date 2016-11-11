From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCHv2 1/6] pinctrl: sh-pfc: Do not unconditionally support PIN_CONFIG_BIAS_DISABLE
Date: Fri, 11 Nov 2016 21:30:16 +0100
Message-ID: <20161111203021.3384-2-niklas.soderlund@ragnatech.se>
References: <20161111203021.3384-1-niklas.soderlund@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:58525 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933880AbcKKUb0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2016 15:31:26 -0500
In-Reply-To: <20161111203021.3384-1-niklas.soderlund@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Always stating PIN_CONFIG_BIAS_DISABLE is supported gives untrue output
when examining /sys/kernel/debug/pinctrl/e6060000.pfc/pinconf-pins if
the operation get_bias() is implemented but the pin is not handled by
the get_bias() implementation. In that case the output will state that
"input bias disabled" indicating that this pin has bias control
support.

Make support for PIN_CONFIG_BIAS_DISABLE depend on that the pin either
supports SH_PFC_PIN_CFG_PULL_UP or SH_PFC_PIN_CFG_PULL_DOWN. This also
solves the issue where SoC specific implementations print error messages
if their particular implementation of {set,get}_bias() is called with a
pin it dose not know about.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index c577258..fcacfa7 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -570,7 +570,8 @@ static bool sh_pfc_pinconf_validate(struct sh_pfc *pfc, unsigned int _pin,
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-		return true;
+		return pin->configs &
+			(SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN);
 
 	case PIN_CONFIG_BIAS_PULL_UP:
 		return pin->configs & SH_PFC_PIN_CFG_PULL_UP;
-- 
2.10.2

