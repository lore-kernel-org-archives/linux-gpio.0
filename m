From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: zynq: add static to zynq_pins
Date: Thu, 28 May 2015 21:57:23 +0900
Message-ID: <1432817843-6038-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg011.nifty.com ([202.248.44.37]:20542 "EHLO
	conuserg011-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751284AbbE1M6U (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2015 08:58:20 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This array is only referenced in this file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinctrl-zynq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index 0ff653c..a687f24 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -123,7 +123,7 @@ enum zynq_pinmux_functions {
 	ZYNQ_PMUX_MAX_FUNC
 };
 
-const struct pinctrl_pin_desc zynq_pins[] = {
+static const struct pinctrl_pin_desc zynq_pins[] = {
 	PINCTRL_PIN(0,  "MIO0"),
 	PINCTRL_PIN(1,  "MIO1"),
 	PINCTRL_PIN(2,  "MIO2"),
-- 
1.9.1

