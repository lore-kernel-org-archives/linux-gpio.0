From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: zynq: add static const to zynq_pctrl_groups
Date: Thu, 28 May 2015 21:57:53 +0900
Message-ID: <1432817873-6106-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:29005 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753807AbbE1M7L (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2015 08:59:11 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This array is only referenced in this file and never updated.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinctrl-zynq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index a687f24..93d3774 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -369,7 +369,7 @@ static const unsigned int usb1_0_pins[] = {40, 41, 42, 43, 44, 45, 46, 47, 48,
 		.npins = ARRAY_SIZE(nm ## _pins), \
 	}
 
-struct zynq_pctrl_group zynq_pctrl_groups[] = {
+static const struct zynq_pctrl_group zynq_pctrl_groups[] = {
 	DEFINE_ZYNQ_PINCTRL_GRP(ethernet0_0),
 	DEFINE_ZYNQ_PINCTRL_GRP(ethernet1_0),
 	DEFINE_ZYNQ_PINCTRL_GRP(mdio0_0),
-- 
1.9.1

