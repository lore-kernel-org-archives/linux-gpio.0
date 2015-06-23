From: =?ISO-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>
Subject: [PATCH] gpio/xilinx: Use correct address when setting initial
 values.
Date: Tue, 23 Jun 2015 15:14:40 +0200
Message-ID: <1435065280.13545.6.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:34327 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932491AbbFWNSr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2015 09:18:47 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

=46rom 670209328307a198b80723a917957269a815fc32 Mon Sep 17 00:00:00 200=
1
=46rom: =3D?UTF-8?q?Rapha=3DC3=3DABl=3D20Teysseyre?=3D <rteysseyre@gmai=
l.com>
Date: Tue, 23 Jun 2015 14:49:31 +0200
Subject: [PATCH] gpio/xilinx: Use correct address when setting initial =
values.
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Rapha=C3=ABl Teysseyre <rteysseyre@gmail.com>
---
 drivers/gpio/gpio-xilinx.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 61243d1..e544b7a 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -220,9 +220,9 @@ static void xgpio_save_regs(struct of_mm_gpio_chip =
*mm_gc)
 	if (!chip->gpio_width[1])
 		return;
=20
-	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET + XGPIO_TRI_OFFSET,
+	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET + XGPIO_CHANNEL_OFFSET=
,
 		       chip->gpio_state[1]);
-	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET + XGPIO_TRI_OFFSET,
+	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET + XGPIO_CHANNEL_OFFSET,
 		       chip->gpio_dir[1]);
 }
=20
--=20
1.7.1



--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
