From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7796: fix trivial typo in comment
Date: Mon,  9 Oct 2017 10:35:16 +0200
Message-ID: <20171009083516.6220-2-wsa+renesas@sang-engineering.com>
References: <20171009083516.6220-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54235 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751598AbdJIIfZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Oct 2017 04:35:25 -0400
In-Reply-To: <20171009083516.6220-1-wsa+renesas@sang-engineering.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa@the-dreams.de>

From: Wolfram Sang <wsa@the-dreams.de>

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 200e1f4f6db92b..81d5ef3744fbdb 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -495,7 +495,7 @@ FM(IP16_31_28)	IP16_31_28	FM(IP17_31_28)	IP17_31_28
 #define MOD_SEL1_1		FM(SEL_PWM2_0)		FM(SEL_PWM2_1)
 #define MOD_SEL1_0		FM(SEL_PWM1_0)		FM(SEL_PWM1_1)
 
-/* MOD_SEL1 */			/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */			/* 5 */			/* 6 */			/* 7 */
+/* MOD_SEL2 */			/* 0 */			/* 1 */			/* 2 */			/* 3 */			/* 4 */			/* 5 */			/* 6 */			/* 7 */
 #define MOD_SEL2_31		FM(I2C_SEL_5_0)		FM(I2C_SEL_5_1)
 #define MOD_SEL2_30		FM(I2C_SEL_3_0)		FM(I2C_SEL_3_1)
 #define MOD_SEL2_29		FM(I2C_SEL_0_0)		FM(I2C_SEL_0_1)
-- 
2.11.0

