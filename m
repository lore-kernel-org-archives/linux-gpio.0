From: =?ISO-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>
Subject: [PATCH v2] gpio/xilinx: Use correct address when setting initial
 values.
Date: Wed, 24 Jun 2015 09:19:45 +0200
Message-ID: <1435130385.30543.3.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:36004 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbbFXHXw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2015 03:23:52 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

xgpio_save_regs() is used in this driver to setup the initial
values of the registers in the hardware.

The relevant registers at that time are:
0x0 -> channel 0 data (32 bits, one for each GPIO on this channel).
0x4 -> channel 0 tri, controls in/out status for each GPIO of this chan=
nel.
0x8 -> channel 1 data
0xC -> channel 1 tri

gpio-xilinx.c defines these:
XGPIO_DATA_OFFSET   (0x0)
XGPIO_TRI_OFFSET    (0x4)
XGPIO_CHANNEL_OFFSET	0x8

Before this patch, the "data" register value of channel 1 was written
at 0x4 intead of 0x8 (overwriting the channel 0 "tri" register),
and the "tri" register value for channel 1 was written at 0x8 instead o=
f 0xC.

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
