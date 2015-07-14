From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/4] pinctrl: sh-pfc: Remove obsolete sh73a0 platform_device_id entry
Date: Tue, 14 Jul 2015 13:56:53 +0200
Message-ID: <1436875015-13706-3-git-send-email-geert+renesas@glider.be>
References: <1436875015-13706-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:36488 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752181AbbGNL47 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 07:56:59 -0400
In-Reply-To: <1436875015-13706-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Since the removal of the sh73a0 legacy SoC code in commit
9a9863987bf7307f ("ARM: shmobile: Remove legacy SoC code for SH-Mobile
AG5"), sh73a0 is only supported in generic DT-only ARM multi-platform
builds.  The driver doesn't need to match platform devices by name
anymore, hence remove the corresponding platform_device_id entry.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
The commit mentioned above is in -next, destined for v4.3.

v2:
  - Add Acked-by.
---
 drivers/pinctrl/sh-pfc/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 865d235612c5200a..ceb7dbc1995c7c7f 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -609,9 +609,6 @@ static const struct platform_device_id sh_pfc_id_table[] = {
 #ifdef CONFIG_PINCTRL_PFC_SH7269
 	{ "pfc-sh7269", (kernel_ulong_t)&sh7269_pinmux_info },
 #endif
-#ifdef CONFIG_PINCTRL_PFC_SH73A0
-	{ "pfc-sh73a0", (kernel_ulong_t)&sh73a0_pinmux_info },
-#endif
 #ifdef CONFIG_PINCTRL_PFC_SH7720
 	{ "pfc-sh7720", (kernel_ulong_t)&sh7720_pinmux_info },
 #endif
-- 
1.9.1

