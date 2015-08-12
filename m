From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] pinctrl-zynq.c: Fix typos in smc0_nand_grp and smc0_nor_grp
Date: Wed, 12 Aug 2015 16:22:12 +0200
Message-ID: <1439389332-9373-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from atl4mhfb02.myregisteredsite.com ([209.17.115.56]:57942 "EHLO
	atl4mhfb02.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752979AbbHLOWe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 12 Aug 2015 10:22:34 -0400
Received: from atl4mhob02.myregisteredsite.com (atl4mhob02.myregisteredsite.com [209.17.115.40])
	by atl4mhfb02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id t7CEMSeT012319
	for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2015 10:22:28 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.208])
	by atl4mhob02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id t7CEMOXA006068
	for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2015 10:22:24 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, Mike Looijmans <mike.looijmans@topic.nl>

Group names should be smc0_nand_grp and smc0_nor_grp, otherwise you'll
get errors like this if you try to pinmux them via the devicetree:
zynq-pinctrl 700.pinctrl: invalid group "smc0_nand_grp" for function "s=
mc0_nand"

Probably a typo while creating these tables.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
---
 drivers/pinctrl/pinctrl-zynq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-z=
ynq.c
index 7ce23b6..5aafea8 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -706,10 +706,10 @@ static const char * const sdio1_wp_groups[] =3D {=
"gpio0_0_grp",
 		"gpio0_39_grp", "gpio0_41_grp", "gpio0_43_grp",
 		"gpio0_45_grp", "gpio0_47_grp", "gpio0_49_grp",
 		"gpio0_51_grp", "gpio0_53_grp", "sdio1_emio_wp_grp"};
-static const char * const smc0_nor_groups[] =3D {"smc0_nor"};
+static const char * const smc0_nor_groups[] =3D {"smc0_nor_grp"};
 static const char * const smc0_nor_cs1_groups[] =3D {"smc0_nor_cs1_grp=
"};
 static const char * const smc0_nor_addr25_groups[] =3D {"smc0_nor_addr=
25_grp"};
-static const char * const smc0_nand_groups[] =3D {"smc0_nand"};
+static const char * const smc0_nand_groups[] =3D {"smc0_nand_grp"};
 static const char * const can0_groups[] =3D {"can0_0_grp", "can0_1_grp=
",
 		"can0_2_grp", "can0_3_grp", "can0_4_grp", "can0_5_grp",
 		"can0_6_grp", "can0_7_grp", "can0_8_grp", "can0_9_grp",
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
