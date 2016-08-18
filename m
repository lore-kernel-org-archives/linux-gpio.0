From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] MIPS: TXx9: tx49xx: Move GPIO setup from .mem_setup() to .arch_init()
Date: Thu, 18 Aug 2016 14:57:48 +0200
Message-ID: <1471525068-1525-3-git-send-email-geert@linux-m68k.org>
References: <1471525068-1525-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:46464 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753729AbcHRM5z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2016 08:57:55 -0400
In-Reply-To: <1471525068-1525-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

txx9_gpio_init() calls gpiochip_add_data(), which fails with -ENOMEM as
it is called too early in the boot process. This causes all subsequent
GPIO operations to fail silently (before commit 54d77198fdfbc4f0 ("gpio:
bail out silently on NULL descriptors") it printed the error message
"gpiod_direction_output_raw: invalid GPIO" on RBTX49[23]7).

Postpone all GPIO setup to .arch_init() time to fix this.

Suggested-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Tested on RBTX4927 only. The gpiochip appears under /sys/class/gpio/.

Sent as a single patch, as RBTX4937 is handled by rbtx4927/setup.c, but
uses tx4938_setup().
---
 arch/mips/txx9/generic/setup_tx4927.c |  1 -
 arch/mips/txx9/generic/setup_tx4938.c |  1 -
 arch/mips/txx9/rbtx4927/setup.c       | 32 ++++++++++++++++++++++----------
 arch/mips/txx9/rbtx4938/setup.c       |  1 +
 4 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/arch/mips/txx9/generic/setup_tx4927.c b/arch/mips/txx9/generic/setup_tx4927.c
index a4664cb6c1e18371..8d8011570b1dbe99 100644
--- a/arch/mips/txx9/generic/setup_tx4927.c
+++ b/arch/mips/txx9/generic/setup_tx4927.c
@@ -215,7 +215,6 @@ void __init tx4927_setup(void)
 		txx9_tmr_init(TX4927_TMR_REG(i) & 0xfffffffffULL);
 
 	/* PIO */
-	txx9_gpio_init(TX4927_PIO_REG & 0xfffffffffULL, 0, TX4927_NUM_PIO);
 	__raw_writel(0, &tx4927_pioptr->maskcpu);
 	__raw_writel(0, &tx4927_pioptr->maskext);
 
diff --git a/arch/mips/txx9/generic/setup_tx4938.c b/arch/mips/txx9/generic/setup_tx4938.c
index 58cdb2aba5e1ba72..ba265bf1fd067036 100644
--- a/arch/mips/txx9/generic/setup_tx4938.c
+++ b/arch/mips/txx9/generic/setup_tx4938.c
@@ -241,7 +241,6 @@ void __init tx4938_setup(void)
 		txx9_tmr_init(TX4938_TMR_REG(i) & 0xfffffffffULL);
 
 	/* PIO */
-	txx9_gpio_init(TX4938_PIO_REG & 0xfffffffffULL, 0, TX4938_NUM_PIO);
 	__raw_writel(0, &tx4938_pioptr->maskcpu);
 	__raw_writel(0, &tx4938_pioptr->maskext);
 
diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index 3c516ef625e57d2d..f5b367e20dff1cfa 100644
--- a/arch/mips/txx9/rbtx4927/setup.c
+++ b/arch/mips/txx9/rbtx4927/setup.c
@@ -52,6 +52,7 @@
 #include <linux/leds.h>
 #include <asm/io.h>
 #include <asm/reboot.h>
+#include <asm/txx9pio.h>
 #include <asm/txx9/generic.h>
 #include <asm/txx9/pci.h>
 #include <asm/txx9/rbtx4927.h>
@@ -151,20 +152,37 @@ static void __init tx4937_pci_setup(void)
 	}
 	tx4938_setup_pcierr_irq();
 }
+#else
+static inline void tx4927_pci_setup(void) {}
+static inline void tx4937_pci_setup(void) {}
+#endif /* CONFIG_PCI */
+
+static void __init rbtx4927_gpio_init(void)
+{
+	/* TX4927-SIO DTR on (PIO[15]) */
+	gpio_request(15, "sio-dtr");
+	gpio_direction_output(15, 1);
+
+	tx4927_sio_init(0, 0);
+}
 
 static void __init rbtx4927_arch_init(void)
 {
+	txx9_gpio_init(TX4927_PIO_REG & 0xfffffffffULL, 0, TX4927_NUM_PIO);
+
+	rbtx4927_gpio_init();
+
 	tx4927_pci_setup();
 }
 
 static void __init rbtx4937_arch_init(void)
 {
+	txx9_gpio_init(TX4938_PIO_REG & 0xfffffffffULL, 0, TX4938_NUM_PIO);
+
+	rbtx4927_gpio_init();
+
 	tx4937_pci_setup();
 }
-#else
-#define rbtx4927_arch_init NULL
-#define rbtx4937_arch_init NULL
-#endif /* CONFIG_PCI */
 
 static void toshiba_rbtx4927_restart(char *command)
 {
@@ -205,12 +223,6 @@ static void __init rbtx4927_mem_setup(void)
 #else
 	set_io_port_base(KSEG1 + RBTX4927_ISA_IO_OFFSET);
 #endif
-
-	/* TX4927-SIO DTR on (PIO[15]) */
-	gpio_request(15, "sio-dtr");
-	gpio_direction_output(15, 1);
-
-	tx4927_sio_init(0, 0);
 }
 
 static void __init rbtx4927_clock_init(void)
diff --git a/arch/mips/txx9/rbtx4938/setup.c b/arch/mips/txx9/rbtx4938/setup.c
index 54de66837103c702..07939ed6b22fdac5 100644
--- a/arch/mips/txx9/rbtx4938/setup.c
+++ b/arch/mips/txx9/rbtx4938/setup.c
@@ -336,6 +336,7 @@ static void __init rbtx4938_mtd_init(void)
 
 static void __init rbtx4938_arch_init(void)
 {
+	txx9_gpio_init(TX4938_PIO_REG & 0xfffffffffULL, 0, TX4938_NUM_PIO);
 	gpiochip_add_data(&rbtx4938_spi_gpio_chip, NULL);
 	rbtx4938_pci_setup();
 	rbtx4938_spi_init();
-- 
1.9.1

