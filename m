From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/4] pinctrl: sh-pfc: Add PINMUX_SINGLE()
Date: Tue, 20 Oct 2015 21:26:32 +0200
Message-ID: <1445369195-25117-2-git-send-email-geert+renesas@glider.be>
References: <1445369195-25117-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1445369195-25117-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Add a macro to describe a pinmux configuration for a single-function
pin.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 63e6cd050d0fb7d2..932fbef8bad400dd 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -277,6 +277,13 @@ struct sh_pfc_soc_info {
 	PINMUX_DATA(fn##_MARK, FN_##ms, FN_##ipsr, FN_##fn)
 
 /*
+ * Describe a pinmux configuration for a single-function pin.
+ *   - fn: Function name
+ */
+#define PINMUX_SINGLE(fn)						\
+	PINMUX_DATA(fn##_MARK, FN_##fn)
+
+/*
  * GP port style (32 ports banks)
  */
 
-- 
1.9.1

