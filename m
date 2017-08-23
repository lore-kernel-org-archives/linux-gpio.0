From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] pinctrl: freescale: make mxs_regs const
Date: Wed, 23 Aug 2017 19:19:12 +0530
Message-ID: <1503496152-4926-1-git-send-email-bhumirks@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33497 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754007AbdHWNt1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2017 09:49:27 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: julia.lawall@lip6.fr, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>

Make these const as they are only stored in the const field of a
mxs_pinctrl_soc_data structure.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx23.c | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx28.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx23.c b/drivers/pinctrl/freescale/pinctrl-imx23.c
index 89b4f16..c940568 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx23.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx23.c
@@ -257,7 +257,7 @@ enum imx23_pin_enum {
 	MXS_PINCTRL_PIN(EMI_CLKN),
 };
 
-static struct mxs_regs imx23_regs = {
+static const struct mxs_regs imx23_regs = {
 	.muxsel = 0x100,
 	.drive = 0x200,
 	.pull = 0x400,
diff --git a/drivers/pinctrl/freescale/pinctrl-imx28.c b/drivers/pinctrl/freescale/pinctrl-imx28.c
index 295236d..87deb9e 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx28.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx28.c
@@ -373,7 +373,7 @@ enum imx28_pin_enum {
 	MXS_PINCTRL_PIN(EMI_CKE),
 };
 
-static struct mxs_regs imx28_regs = {
+static const struct mxs_regs imx28_regs = {
 	.muxsel = 0x100,
 	.drive = 0x300,
 	.pull = 0x600,
-- 
1.9.1

