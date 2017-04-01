From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/2] pinctrl: meson: meson8b: fix the NAND DQS pins
Date: Sat,  1 Apr 2017 15:59:21 +0200
Message-ID: <20170401135922.1288-2-martin.blumenstingl@googlemail.com>
References: <20170325184350.7677-1-martin.blumenstingl@googlemail.com>
 <20170401135922.1288-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33178 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751413AbdDAN7h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Apr 2017 09:59:37 -0400
Received: by mail-wm0-f68.google.com with SMTP id o81so3737507wmb.0
        for <linux-gpio@vger.kernel.org>; Sat, 01 Apr 2017 06:59:36 -0700 (PDT)
In-Reply-To: <20170401135922.1288-1-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, khilman@baylibre.com, carlo@caione.org, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

The nand_groups table uses different names for the NAND DQS pins than
the GROUP() definition in meson8b_cbus_groups (nand_dqs_0 vs nand_dqs0).
This prevents using the NAND DQS pins in the devicetree.

Fix this by ensuring that the GROUP() definition and the
meson8b_cbus_groups use the same name for these pins.

Fixes: 0fefcb6876d0 ("pinctrl: Add support for Meson8b")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 76f077f18193..f87ef5a0ee6c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -739,8 +739,8 @@ static const char * const sdxc_c_groups[] = {
 static const char * const nand_groups[] = {
 	"nand_io", "nand_io_ce0", "nand_io_ce1",
 	"nand_io_rb0", "nand_ale", "nand_cle",
-	"nand_wen_clk", "nand_ren_clk", "nand_dqs0",
-	"nand_dqs1"
+	"nand_wen_clk", "nand_ren_clk", "nand_dqs_0",
+	"nand_dqs_1"
 };
 
 static const char * const nor_groups[] = {
-- 
2.12.1

