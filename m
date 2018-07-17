From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH -stable] pinctrl: sh-pfc: r8a77970: remove SH_PFC_PIN_CFG_DRIVE_STRENGTH flag
Date: Tue, 17 Jul 2018 17:24:17 +0200
Message-ID: <20180717152417.8535-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: stable@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: linux-gpio@vger.kernel.org

The datasheet does not document any registers to control drive strength,
and no drive strength registers are for this reason described for this
SoC. The flags indicating that drive strength can be controlled are
however set for some pins in the driver.

This leads to a NULL pointer dereference when the sh-pfc core tries to
access the struct describing the drive strength registers, for example
when reading the sysfs file pinconf-pins.

Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins

Fixes: b92ac66a1819602b ("pinctrl: sh-pfc: Add R8A77970 PFC support")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

---
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

---

Hi,

This is a backport of commit 550b6f7e8cf93fc2753aa01e655ed5471012ab5a
from Linusw linux-pinctrl.git tree. It's applicable for v4.16 and v4.17.

This is my first backport patch submission for stable, please let me
know if I can improve the format of this patch commit message or subject
in any way.

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index b1bb7263532b3bf9..049b374aa4ae4698 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -22,12 +22,12 @@
 #include "sh_pfc.h"
 
 #define CPU_ALL_PORT(fn, sfx)						\
-	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_28(1, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_6(4, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_15(5, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH)
+	PORT_GP_22(0, fn, sfx),	\
+	PORT_GP_28(1, fn, sfx),	\
+	PORT_GP_17(2, fn, sfx),	\
+	PORT_GP_17(3, fn, sfx),	\
+	PORT_GP_6(4, fn, sfx),	\
+	PORT_GP_15(5, fn, sfx)
 /*
  * F_() : just information
  * FM() : macro for FN_xxx / xxx_MARK
-- 
2.18.0
