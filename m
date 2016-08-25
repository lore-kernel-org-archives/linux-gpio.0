From: =?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>
Subject: [PATCH] pinctrl: zynq: fix typo in sdio1_3_grp pin list
Date: Thu, 25 Aug 2016 15:48:31 +0200
Message-ID: <1472132911-28380-1-git-send-email-dg@emlix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.emlix.com ([88.198.252.230]:40322 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934212AbcHYN6L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Aug 2016 09:58:11 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org, =?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>

It contains pin 50 instead of pin 40.

Signed-off-by: Daniel Glöckner <dg@emlix.com>
---
 drivers/pinctrl/pinctrl-zynq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index 7afdbed..e0ecffc 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -233,7 +233,7 @@ static const unsigned int sdio0_2_pins[] = {40, 41, 42, 43, 44, 45};
 static const unsigned int sdio1_0_pins[] = {10, 11, 12, 13, 14, 15};
 static const unsigned int sdio1_1_pins[] = {22, 23, 24, 25, 26, 27};
 static const unsigned int sdio1_2_pins[] = {34, 35, 36, 37, 38, 39};
-static const unsigned int sdio1_3_pins[] = {46, 47, 48, 49, 40, 51};
+static const unsigned int sdio1_3_pins[] = {46, 47, 48, 49, 50, 51};
 static const unsigned int sdio0_emio_wp_pins[] = {54};
 static const unsigned int sdio0_emio_cd_pins[] = {55};
 static const unsigned int sdio1_emio_wp_pins[] = {56};
-- 
2.1.2

