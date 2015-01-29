From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] sh-pfc: emev2 - Fix mangled author name
Date: Thu, 29 Jan 2015 11:12:56 +0100
Message-ID: <1422526376-12146-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niso@kth.se>, linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
=46ixes: 1e7d5d849cf4f0c5 ("sh-pfc: Add emev2 pinmux support")
---
Looks like the original UTF-8 was interpreted as ISO-8859-1, and the
resulting characters being converted to UTF-8 again.

BTW, the same issue is present in the SoB-lines of both
1e7d5d849cf4f0c5 ("sh-pfc: Add emev2 pinmux support") and
4c9e473541c52453 ("sh-pfc: add macro to define pinmux without function"=
)
Perhaps they can still be fixed while squashing this in?
---
 drivers/pinctrl/sh-pfc/pfc-emev2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-emev2.c b/drivers/pinctrl/sh-pf=
c/pfc-emev2.c
index 9b3ce5d1265b391f..849c6943ed308ee0 100644
--- a/drivers/pinctrl/sh-pfc/pfc-emev2.c
+++ b/drivers/pinctrl/sh-pfc/pfc-emev2.c
@@ -1,7 +1,7 @@
 /*
  * Pin Function Controller Support
  *
- * Copyright (C) 2015 Niklas S=C3=83=C2=B6derlund
+ * Copyright (C) 2015 Niklas S=C3=B6derlund
  *
  * This file is subject to the terms and conditions of the GNU General=
 Public
  * License.  See the file "COPYING" in the main directory of this arch=
ive
--=20
1.9.1

