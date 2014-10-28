From: Doug Anderson <dianders@chromium.org>
Subject: [RFC PATCH 2/2] pinctrl: rockchip: Implement PIN_CONFIG_OUTPUT_DISABLE
Date: Tue, 28 Oct 2014 13:57:15 -0700
Message-ID: <1414529835-16207-2-git-send-email-dianders@chromium.org>
References: <1414529835-16207-1-git-send-email-dianders@chromium.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:57619 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753305AbaJ1U5g (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Oct 2014 16:57:36 -0400
Received: by mail-pd0-f175.google.com with SMTP id y13so1498908pdi.34
        for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2014 13:57:36 -0700 (PDT)
In-Reply-To: <1414529835-16207-1-git-send-email-dianders@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sonny Rao <sonnyrao@chromium.org>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Doug Anderson <dianders@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

If someone requests us to disable output for a pin, we'll configure it
as an input.

Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 40970c3..c1ac14c 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -971,6 +971,12 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			if (rc)
 				return rc;
 			break;
+		case PIN_CONFIG_OUTPUT_DISABLE:
+			rc = _rockchip_pmx_gpio_set_direction(&bank->gpio_chip,
+					  pin - bank->pin_base, true);
+			if (rc)
+				return rc;
+			break;
 		case PIN_CONFIG_OUTPUT:
 			rockchip_gpio_set(&bank->gpio_chip,
 					  pin - bank->pin_base, arg);
-- 
2.1.0.rc2.206.gedb03e5

