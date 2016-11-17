From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC] pinctrl: sh-pfc: r8a7790: initialize TDSEL register
Date: Thu, 17 Nov 2016 14:30:43 +0100
Message-ID: <20161117133043.20771-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms@verge.net.au>, linux-gpio@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: linux-gpio@vger.kernel.org

Documentation says that some bits in TDSEL must be set (ch 5.3.39 in R-Car H2
v0.91). However, the reset value of the register is 0, so software has to do
it. Add this to the kernel driver to ensure this is really done independent of
firmware versions.

This is needed for some SD cards supporting SDR104 transfer mode. For
me, TDSEL was not initialized by the firmware and I had problems with
the card when re-inserting it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

* something like this is needed for all other Gen2 SoCs probably, but I can't
  test it
* I can also only verify the positive result for 'sd0tdsel'. For all other bits,
  I follow the documentation. Dunno if we better only modify bits we really need?
  Because of this, patch is still RFC. And values are hardcoded, but seems to be OK
  with PFC at places, too?
* Gen2 has no drive-strength capabilities to play around with, so it must be TDSEL
  here
* Simon: maybe a similar fix helps with the SDR issues you saw on Gose occasionally?

 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index b769c05480da68..f01ff6d7052fed 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -24,6 +24,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 
+#include "core.h"
 #include "sh_pfc.h"
 
 /*
@@ -5704,7 +5705,16 @@ static int r8a7790_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
 	return 31 - (pin & 0x1f);
 }
 
+static int r8a7790_pinmux_soc_init(struct sh_pfc *pfc)
+{
+	/* Initialize TDSEL */
+	sh_pfc_write_reg(pfc, 0xe6060088, 32, 0x00155554);
+
+	return 0;
+}
+
 static const struct sh_pfc_soc_operations r8a7790_pinmux_ops = {
+	.init = r8a7790_pinmux_soc_init,
 	.pin_to_pocctrl = r8a7790_pin_to_pocctrl,
 };
 
-- 
2.10.2
