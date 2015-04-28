From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] pinctrl: sh-pfc: Remove r8a73a4 platform_device_id entry
Date: Tue, 28 Apr 2015 12:15:07 +0200
Message-ID: <1430216107-31501-2-git-send-email-geert+renesas@glider.be>
References: <1430216107-31501-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1430216107-31501-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

As of commit 9d07d414d4c33d86 ("ARM: shmobile: r8a73a4: ape6evm: Remove
legacy platform"), r8a73a4 is only supported in generic DT-only ARM
multi-platform builds.  The driver doesn't need to match platform
devices by name anymore, hence remove the corresponding
platform_device_id entry.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 7b2c9495c3832410..287a3d048a5e1cf9 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -579,9 +579,6 @@ static int sh_pfc_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id sh_pfc_id_table[] = {
-#ifdef CONFIG_PINCTRL_PFC_R8A73A4
-	{ "pfc-r8a73a4", (kernel_ulong_t)&r8a73a4_pinmux_info },
-#endif
 #ifdef CONFIG_PINCTRL_PFC_R8A7740
 	{ "pfc-r8a7740", (kernel_ulong_t)&r8a7740_pinmux_info },
 #endif
-- 
1.9.1

