From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 1/2] MIPS: TXx9: tx39xx: Move GPIO setup from .mem_setup() to .arch_init()
Date: Sun, 11 Sep 2016 10:48:32 +0200
Message-ID: <1473583713-10275-2-git-send-email-geert@linux-m68k.org>
References: <1473583713-10275-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:41947 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751629AbcIKIsi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2016 04:48:38 -0400
In-Reply-To: <1473583713-10275-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

txx9_gpio_init() calls gpiochip_add_data(), which fails with -ENOMEM as
it is called too early in the boot process. This causes all subsequent
GPIO operations to fail silently.

Postpone all GPIO setup to .arch_init() time to fix this.

Suggested-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Untested due to lack of hardware.

v2:
  - Add Acked-by.
---
 arch/mips/txx9/generic/setup_tx3927.c |  1 -
 arch/mips/txx9/jmr3927/setup.c        | 11 +++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/mips/txx9/generic/setup_tx3927.c b/arch/mips/txx9/generic/setup_tx3927.c
index 110e05c3eb8fb638..d3b83a92cf26c707 100644
--- a/arch/mips/txx9/generic/setup_tx3927.c
+++ b/arch/mips/txx9/generic/setup_tx3927.c
@@ -92,7 +92,6 @@ void __init tx3927_setup(void)
 	/* PIO */
 	__raw_writel(0, &tx3927_pioptr->maskcpu);
 	__raw_writel(0, &tx3927_pioptr->maskext);
-	txx9_gpio_init(TX3927_PIO_REG, 0, 16);
 
 	conf = read_c0_conf();
 	if (conf & TX39_CONF_DCE) {
diff --git a/arch/mips/txx9/jmr3927/setup.c b/arch/mips/txx9/jmr3927/setup.c
index 3206f76f300b727a..a455166dc6d44fe7 100644
--- a/arch/mips/txx9/jmr3927/setup.c
+++ b/arch/mips/txx9/jmr3927/setup.c
@@ -142,8 +142,6 @@ static void __init jmr3927_board_init(void)
 
 	/* PIO[15:12] connected to LEDs */
 	__raw_writel(0x0000f000, &tx3927_pioptr->dir);
-	gpio_request(11, "dipsw1");
-	gpio_request(10, "dipsw2");
 
 	jmr3927_pci_setup();
 
@@ -204,6 +202,14 @@ static void __init jmr3927_device_init(void)
 	txx9_iocled_init(iocled_base, -1, 8, 1, "green", NULL);
 }
 
+static void __init jmr3927_arch_init(void)
+{
+	txx9_gpio_init(TX3927_PIO_REG, 0, 16);
+
+	gpio_request(11, "dipsw1");
+	gpio_request(10, "dipsw2");
+}
+
 struct txx9_board_vec jmr3927_vec __initdata = {
 	.system = "Toshiba JMR_TX3927",
 	.prom_init = jmr3927_prom_init,
@@ -211,6 +217,7 @@ struct txx9_board_vec jmr3927_vec __initdata = {
 	.irq_setup = jmr3927_irq_setup,
 	.time_init = jmr3927_time_init,
 	.device_init = jmr3927_device_init,
+	.arch_init = jmr3927_arch_init,
 #ifdef CONFIG_PCI
 	.pci_map_irq = jmr3927_pci_map_irq,
 #endif
-- 
1.9.1

