From: <Frank.Li@freescale.com>
Subject: [PATCH v3 07/10] ARM: imx: add gpt system timer support for imx7d
Date: Sat, 18 Apr 2015 05:28:52 +0800
Message-ID: <1429306135-24695-8-git-send-email-Frank.Li@freescale.com>
References: <1429306135-24695-1-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2on0123.outbound.protection.outlook.com ([65.55.169.123]:24928
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932389AbbDQVbx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 17 Apr 2015 17:31:53 -0400
In-Reply-To: <1429306135-24695-1-git-send-email-Frank.Li@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: lznuaa@gmail.com, shawn.guo@linaro.org, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Frank Li <Frank.Li@freescale.com>, Anson Huang <b20788@freescale.com>

From: Frank Li <Frank.Li@freescale.com>

Add GPT system timer support for i.MX7D, it has same hardware
as i.MX6DL.

Signed-off-by: Frank Li <Frank.Li@freescale.com>
Signed-off-by: Anson Huang <b20788@freescale.com>
---
 arch/arm/mach-imx/time.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/time.c b/arch/arm/mach-imx/time.c
index 15d18e1..7c1d8a3 100644
--- a/arch/arm/mach-imx/time.c
+++ b/arch/arm/mach-imx/time.c
@@ -321,7 +321,7 @@ static void __init _mxc_timer_init(int irq,
 		tctl_val = V2_TCTL_FRR | V2_TCTL_WAITEN | MXC_TCTL_TEN;
 		if (clk_get_rate(clk_per) == V2_TIMER_RATE_OSC_DIV8) {
 			tctl_val |= V2_TCTL_CLK_OSC_DIV8;
-			if (cpu_is_imx6dl() || cpu_is_imx6sx()) {
+			if (cpu_is_imx6dl() || cpu_is_imx6sx() || cpu_is_imx7d()) {
 				/* 24 / 8 = 3 MHz */
 				__raw_writel(7 << V2_TPRER_PRE24M,
 					timer_base + MXC_TPRER);
@@ -383,3 +383,4 @@ CLOCKSOURCE_OF_DECLARE(mx53_timer, "fsl,imx53-gpt", mxc_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(mx6q_timer, "fsl,imx6q-gpt", mxc_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(mx6sl_timer, "fsl,imx6sl-gpt", mxc_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(mx6sx_timer, "fsl,imx6sx-gpt", mxc_timer_init_dt);
+CLOCKSOURCE_OF_DECLARE(mx7d_timer, "fsl,imx7d-gpt", mxc_timer_init_dt);
-- 
1.9.1

