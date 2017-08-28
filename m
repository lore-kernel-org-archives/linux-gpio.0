From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH] pinctrl: uniphier: fix members of rmii group for Pro4
Date: Mon, 28 Aug 2017 11:21:26 +0900
Message-ID: <1503886886-30065-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx.socionext.com ([202.248.49.38]:19888 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751856AbdH1CVi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 27 Aug 2017 22:21:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: yamada.masahiro@socionext.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

The ether_rmii_groups should have "ether_rmii" and "ether_rmiib" as
members. This patch replaces to them.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
index a433a30..adc65ea 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
@@ -1462,7 +1462,7 @@ static const struct uniphier_pinctrl_group uniphier_pro4_groups[] = {
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
 static const char * const ether_mii_groups[] = {"ether_mii"};
 static const char * const ether_rgmii_groups[] = {"ether_rgmii"};
-static const char * const ether_rmii_groups[] = {"ether_rgmii", "ether_rgmiib"};
+static const char * const ether_rmii_groups[] = {"ether_rmii", "ether_rmiib"};
 static const char * const i2c0_groups[] = {"i2c0"};
 static const char * const i2c1_groups[] = {"i2c1"};
 static const char * const i2c2_groups[] = {"i2c2"};
-- 
2.7.4

