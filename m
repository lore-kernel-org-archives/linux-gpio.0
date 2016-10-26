From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: [PATCH] pinctrl: zynq: Add a 8 bit wide nand option
Date: Wed, 26 Oct 2016 12:04:54 -0600
Message-ID: <20161026180454.GC24717@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from quartz.orcorp.ca ([184.70.90.242]:49371 "EHLO quartz.orcorp.ca"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932993AbcJZSE7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Oct 2016 14:04:59 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michal Simek <michal.simek@xilinx.com>, =?unknown-8bit?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org

The hardware supports a 16 and 8 bit wide NAND bus, let users pick
either.

Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
---
 drivers/pinctrl/pinctrl-zynq.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index 7afdbede6823..798bcf875052 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -247,6 +247,8 @@ static const unsigned int smc0_nor_addr25_pins[] = {1};
 static const unsigned int smc0_nand_pins[] = {0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
 					      12, 13, 14, 16, 17, 18, 19, 20,
 					      21, 22, 23};
+static const unsigned int smc0_nand8_pins[] = {0, 2, 3,  4,  5,  6,  7,
+					       8, 9, 10, 11, 12, 13, 14};
 /* Note: CAN MIO clock inputs are modeled in the clock framework */
 static const unsigned int can0_0_pins[] = {10, 11};
 static const unsigned int can0_1_pins[] = {14, 15};
@@ -445,6 +447,7 @@ static const struct zynq_pctrl_group zynq_pctrl_groups[] = {
 	DEFINE_ZYNQ_PINCTRL_GRP(smc0_nor_cs1),
 	DEFINE_ZYNQ_PINCTRL_GRP(smc0_nor_addr25),
 	DEFINE_ZYNQ_PINCTRL_GRP(smc0_nand),
+	DEFINE_ZYNQ_PINCTRL_GRP(smc0_nand8),
 	DEFINE_ZYNQ_PINCTRL_GRP(can0_0),
 	DEFINE_ZYNQ_PINCTRL_GRP(can0_1),
 	DEFINE_ZYNQ_PINCTRL_GRP(can0_2),
@@ -709,7 +712,8 @@ static const char * const sdio1_wp_groups[] = {"gpio0_0_grp",
 static const char * const smc0_nor_groups[] = {"smc0_nor_grp"};
 static const char * const smc0_nor_cs1_groups[] = {"smc0_nor_cs1_grp"};
 static const char * const smc0_nor_addr25_groups[] = {"smc0_nor_addr25_grp"};
-static const char * const smc0_nand_groups[] = {"smc0_nand_grp"};
+static const char * const smc0_nand_groups[] = {"smc0_nand_grp",
+		"smc0_nand8_grp"};
 static const char * const can0_groups[] = {"can0_0_grp", "can0_1_grp",
 		"can0_2_grp", "can0_3_grp", "can0_4_grp", "can0_5_grp",
 		"can0_6_grp", "can0_7_grp", "can0_8_grp", "can0_9_grp",
-- 
2.1.4

