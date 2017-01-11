From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 1/7] pinctrl: sh-pfc: Add r7s72100 PFC driver
Date: Wed, 11 Jan 2017 10:57:07 +0100
Message-ID: <1484128633-22683-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Magnus Damm <damm@opensource.se>

Squash commits in Geert's renesas-driver/genmai-gpio-and-pfc branch that
add support for r7s72100 PFC.
This squash combines commits for Magnus' original driver and minor fixes
to forward-port it to a more recent kernel (v4.10)

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

-----------------------------------------------------------------------

pinctrl: sh-pfc: Rework _GP_GPIO, introduce _GP_GPIO32

Rework _GP_GPIO to take banksize as argument, introduce
_GP_GPIO32 for SoCs with 32-bit GPIO banks.

Signed-off-by: Magnus Damm <damm@opensource.se>

pinctrl: sh-pfc: r7s72100 base support

Add r7s72100 PINCTRL support via sh-pfc V2. At this point the code
provides enough support to allow use together with the gpio-rz
driver. Incremental per-device patches will in the future be
submitted on top of this base patch to allow PINCTRL enablement
for each individual device.

Signed-off-by: Magnus Damm <damm@opensource.se>

pinctrl: sh-pfc: r7s72100 single pin macros

Introduce macros that allow description of one pin per line.
Compared to the other ways of doing this, using this style
we can compresses the description of each pin from 9 to 1 line.

Signed-off-by: Magnus Damm <damm@opensource.se>

pinctrl: sh-pfc: r7s72100 SCIF support

Add support for SCIF functions SCK, TXD, RXD, CTS and RTS to the
r7s72100 PINCTRL code. There are two possible pins that can be used
for TXD (Port 3 Pin 0 Function 6 and Port 3 Pin 1 Function 4) and
because of that are pins broken out into separate functions.

Signed-off-by: Magnus Damm <damm@opensource.se>

[REBASED] pinctrl: sh-pfc: r7s72100 binding docs

Add compatible string for r7s72100.

Signed-off-by: Magnus Damm <damm@opensource.se>

pinctrl: r7s72100: add riic groups

Tested RIIC2 on a genmai board. Other riic groups are untested but seem
trivial enough to be added.

Signed-off-by: Wolfram Sang <wsa@sang-engineering.com>
Acked-by: Magnus Damm <damm@opensource.se>

[PATCH] HACK: make magnus new driver work

On Wed, Dec 18, 2013 at 10:31:57PM +0100, Wolfram Sang wrote:
> From: Wolfram Sang <wsa@sang-engineering.com>
>
> Tested RIIC2 on a genmai board. Other riic groups are untested but seem
> trivial enough to be added.
>
> Signed-off-by: Wolfram Sang <wsa@sang-engineering.com>
> Acked-by: Magnus Damm <damm@opensource.se>
> ---
>
> V2: keep sorting alphabetical
>
> Note: With the current PFC driver as posted by Magnus, it needs another patch
> to work. Yet, I think this is a seperate PFC issue which needs to be sorted out
> seperately and shouldn't affect these declarations. I'll add the needed patch
> as a response to this mail.

From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] HACK: make magnus new driver work

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

pinctl: sh-pfc: r7s72100: Ethernet support

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

[WIP] eth pfc comments from Laurent

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

pinctrl: sh-pfc: r7s72100: Add RSPI support

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

pinctrl: sh-pfc: Port to v4.10-rc1

Port of Magnus' driver from v3.18 to v4.10-rc1

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |   5 +
 drivers/pinctrl/sh-pfc/Makefile                    |   1 +
 drivers/pinctrl/sh-pfc/core.c                      |   6 +
 drivers/pinctrl/sh-pfc/pfc-r7s72100.c              | 529 +++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   9 +-
 6 files changed, 548 insertions(+), 3 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r7s72100.c

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
index 13df949..bd6629b 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
@@ -11,6 +11,7 @@ Required Properties:
 
   - compatible: should be one of the following.
     - "renesas,pfc-emev2": for EMEV2 (EMMA Mobile EV2) compatible pin-controller.
+    - "renesas,pfc-r7s72100": for R7S72100 (RZ/A1H) compatible pin-controller.
     - "renesas,pfc-r8a73a4": for R8A73A4 (R-Mobile APE6) compatible pin-controller.
     - "renesas,pfc-r8a7740": for R8A7740 (R-Mobile A1) compatible pin-controller.
     - "renesas,pfc-r8a7778": for R8A7778 (R-Mobile M1) compatible pin-controller.
diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index 07eca54..e4ccae2 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -24,6 +24,11 @@ config PINCTRL_PFC_EMEV2
 	depends on ARCH_EMEV2
 	select PINCTRL_SH_PFC
 
+config PINCTRL_PFC_R7S72100
+	def_bool y
+	depends on ARCH_R7S72100
+	select PINCTRL_SH_PFC
+
 config PINCTRL_PFC_R8A73A4
 	def_bool y
 	depends on ARCH_R8A73A4
diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
index 2dda8c6..b953392 100644
--- a/drivers/pinctrl/sh-pfc/Makefile
+++ b/drivers/pinctrl/sh-pfc/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_PINCTRL_SH_PFC)	+= core.o pinctrl.o
 obj-$(CONFIG_PINCTRL_SH_PFC_GPIO)	+= gpio.o
 obj-$(CONFIG_PINCTRL_PFC_EMEV2)	+= pfc-emev2.o
+obj-$(CONFIG_PINCTRL_PFC_R7S72100)	+= pfc-r7s72100.o
 obj-$(CONFIG_PINCTRL_PFC_R8A73A4)	+= pfc-r8a73a4.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7740)	+= pfc-r8a7740.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7778)	+= pfc-r8a7778.o
diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index cf80ce1..c0d74e1 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -473,6 +473,12 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.data = &emev2_pinmux_info,
 	},
 #endif
+#ifdef CONFIG_PINCTRL_PFC_R7S72100
+	{
+		.compatible = "renesas,pfc-r7s72100",
+		.data = &r7s72100_pinmux_info,
+	},
+#endif
 #ifdef CONFIG_PINCTRL_PFC_R8A73A4
 	{
 		.compatible = "renesas,pfc-r8a73a4",
diff --git a/drivers/pinctrl/sh-pfc/pfc-r7s72100.c b/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
new file mode 100644
index 0000000..72e1dff
--- /dev/null
+++ b/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
@@ -0,0 +1,529 @@
+/*
+ * R7S72100 processor support
+ *
+ * Copyright (C) 2013  Renesas Electronics Corporation
+ * Copyright (C) 2013  Magnus Damm
+ * Copyright (C) 2012  Renesas Solutions Corp.
+ * Copyright (C) 2012  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; version 2 of the
+ * License.
+ */
+
+#include <linux/kernel.h>
+
+#include "core.h"
+#include "sh_pfc.h"
+
+#define CPU_ALL_PORT(fn, sfx)						\
+	PORT_GP_16(0, fn, sfx), PORT_GP_16(1, fn, sfx),			\
+	PORT_GP_16(2, fn, sfx), PORT_GP_16(3, fn, sfx),			\
+	PORT_GP_16(4, fn, sfx), PORT_GP_16(5, fn, sfx),			\
+	PORT_GP_16(6, fn, sfx), PORT_GP_16(7, fn, sfx),			\
+	PORT_GP_16(8, fn, sfx), PORT_GP_16(9, fn, sfx),			\
+	PORT_GP_16(10, fn, sfx), PORT_GP_16(11, fn, sfx),			\
+	PORT_GP_16(12, fn, sfx)
+
+enum {
+	PINMUX_RESERVED = 0,
+
+	PINMUX_DATA_BEGIN,
+	GP_ALL(DATA),
+	PINMUX_DATA_END,
+
+	PINMUX_FUNCTION_BEGIN,
+	GP_ALL(PMC_0), GP_ALL(PMC_1),
+	GP_ALL(PFC_0), GP_ALL(PFC_1),
+	GP_ALL(PFCE_0), GP_ALL(PFCE_1),
+	GP_ALL(PFCAE_0), GP_ALL(PFCAE_1),
+	GP_ALL(PIBC_0), GP_ALL(PIBC_1),
+	GP_ALL(PBDC_0), GP_ALL(PBDC_1),
+	GP_ALL(PIPC_0), GP_ALL(PIPC_1),
+	PINMUX_FUNCTION_END,
+
+	PINMUX_MARK_BEGIN,
+	GP_ALL(MARK_FN1), GP_ALL(MARK_FN2), GP_ALL(MARK_FN3), GP_ALL(MARK_FN4),
+	GP_ALL(MARK_FN5), GP_ALL(MARK_FN6), GP_ALL(MARK_FN7), GP_ALL(MARK_FN8),
+	PINMUX_MARK_END,
+};
+
+#define _P_ALL(n) CPU_ALL_PORT(n, unused)
+
+#define _P_GPIO(bank, _pin, _name, sfx, cfg) \
+	_GP_GPIO(16, bank, _pin, _name, sfx, cfg)
+
+#define _P_DATA(bank, pin, name, sfx, cfg)					\
+	PINMUX_DATA(name##_DATA, name##_PMC_0,		\
+		    name##_PIBC_1, name##_PBDC_1)
+
+#define _P_FN(n, fn, pfcae, pfce, pfc)					\
+	PINMUX_DATA(n##_MARK_FN##fn, n##_PMC_1,		\
+		    n##_PFCAE_##pfcae, n##_PFCE_##pfce, n##_PFC_##pfc)
+
+#define _P_MARK_FN1(bank, pin, name, sfx, cfg) _P_FN(name, 1, 0, 0, 0)
+#define _P_MARK_FN2(bank, pin, name, sfx, cfg) _P_FN(name, 2, 0, 0, 1)
+#define _P_MARK_FN3(bank, pin, name, sfx, cfg) _P_FN(name, 3, 0, 1, 0)
+#define _P_MARK_FN4(bank, pin, name, sfx, cfg) _P_FN(name, 4, 0, 1, 1)
+#define _P_MARK_FN5(bank, pin, name, sfx, cfg) _P_FN(name, 5, 1, 0, 0)
+#define _P_MARK_FN6(bank, pin, name, sfx, cfg) _P_FN(name, 6, 1, 0, 1)
+#define _P_MARK_FN7(bank, pin, name, sfx, cfg) _P_FN(name, 7, 1, 1, 0)
+#define _P_MARK_FN8(bank, pin, name, sfx, cfg) _P_FN(name, 8, 1, 1, 1)
+
+static const u16 pinmux_data[] = {
+	_P_ALL(_P_DATA), /* PINMUX_DATA(P_M_N_DATA, P_M_N_PMC_0)... */
+	_P_ALL(_P_MARK_FN1), _P_ALL(_P_MARK_FN2),
+	_P_ALL(_P_MARK_FN3), _P_ALL(_P_MARK_FN4),
+	_P_ALL(_P_MARK_FN5), _P_ALL(_P_MARK_FN6),
+	_P_ALL(_P_MARK_FN7), _P_ALL(_P_MARK_FN8),
+};
+
+static struct sh_pfc_pin pinmux_pins[] = {
+	_P_ALL(_P_GPIO),
+};
+
+#define RZ_PORT_PIN(bank, pin) (((bank) * 16) + (pin))
+
+#define __RZ_STR(pfx, hw, bank, pin, sfx)		\
+	pfx##_##hw##_p##bank##_##pin####sfx
+
+#define RZ_PIN_AND_MUX(pfx, hw, bank, pin, fn)				\
+static const unsigned int __RZ_STR(pfx, hw, bank, pin, _pins)[] = {	\
+	RZ_PORT_PIN(bank, pin),						\
+};									\
+static const unsigned int __RZ_STR(pfx, hw, bank, pin, _mux)[] = {	\
+	GP_##bank##_##pin##_MARK_FN##fn,					\
+};
+
+#define RZ_PMX_GROUP(pfx, hw, bank, pin, fn) \
+	SH_PFC_PIN_GROUP(pfx##_##hw##_p##bank##_##pin),
+
+#define __RZ_GROUPS(x) #x
+
+#define RZ_GROUPS(pfx, hw, bank, pin, fn) \
+	__RZ_GROUPS(pfx##_##hw##_p##bank##_##pin),
+
+#define RIIC0(fn)			\
+	fn(riic0, scl, 1, 0, 1)		\
+	fn(riic0, sda, 1, 1, 1)
+
+#define RIIC1(fn)			\
+	fn(riic1, scl, 1, 2, 1)		\
+	fn(riic1, sda, 1, 3, 1)
+
+#define RIIC2(fn)			\
+	fn(riic2, scl, 1, 4, 1)		\
+	fn(riic2, sda, 1, 5, 1)
+
+#define RIIC3(fn)			\
+	fn(riic3, scl, 1, 6, 1)		\
+	fn(riic3, sda, 1, 7, 1)
+
+RIIC0(RZ_PIN_AND_MUX)
+RIIC1(RZ_PIN_AND_MUX)
+RIIC2(RZ_PIN_AND_MUX)
+RIIC3(RZ_PIN_AND_MUX)
+
+#define RSPI0(fn)			\
+	fn(rspi0, rspck,  2, 12, 2)	\
+	fn(rspi0, ssl0,   2, 13, 2)	\
+	fn(rspi0, mosi,   2, 14, 2)	\
+	fn(rspi0, miso,   2, 15, 2)	\
+	fn(rspi0, rspck,  7, 15, 2)	\
+	fn(rspi0, ssl0,   8,  0, 2)	\
+	fn(rspi0, mosi,   8,  1, 2)	\
+	fn(rspi0, miso,   8,  2, 2)	\
+	fn(rspi0, rspck, 10, 12, 4)	\
+	fn(rspi0, ssl0,  10, 13, 4)	\
+	fn(rspi0, mosi,  10, 14, 4)	\
+	fn(rspi0, miso,  10, 15, 4)	\
+
+#define RSPI1(fn)			\
+	fn(rspi1, rspck,  4,  4, 2)	\
+	fn(rspi1, ssl0,   4,  5, 2)	\
+	fn(rspi1, mosi,   4,  6, 2)	\
+	fn(rspi1, miso,   4,  7, 2)	\
+	fn(rspi1, rspck,  6,  4, 7)	\
+	fn(rspi1, ssl0,   6,  5, 7)	\
+	fn(rspi1, mosi,   6,  6, 7)	\
+	fn(rspi1, miso,   6,  7, 7)	\
+	fn(rspi1, rspck, 11, 12, 2)	\
+	fn(rspi1, ssl0,  11, 13, 2)	\
+	fn(rspi1, mosi,  11, 14, 2)	\
+	fn(rspi1, miso,  11, 15, 2)	\
+
+#define RSPI2(fn)			\
+	fn(rspi2, rspck,  8,  3, 3)	\
+	fn(rspi2, ssl0,   8,  4, 3)	\
+	fn(rspi2, mosi,   8,  5, 3)	\
+	fn(rspi2, miso,   8,  6, 3)	\
+	fn(rspi2, rspck,  8, 14, 5)	\
+	fn(rspi2, ssl0,   8, 15, 5)	\
+	fn(rspi2, mosi,   9,  0, 5)	\
+	fn(rspi2, miso,   9,  1, 5)	\
+
+#define RSPI3(fn)			\
+	fn(rspi3, rspck,  3,  0, 8)	\
+	fn(rspi3, ssl0,   3,  1, 8)	\
+	fn(rspi3, mosi,   3,  2, 8)	\
+	fn(rspi3, miso,   3,  3, 8)	\
+	fn(rspi3, rspck,  5,  0, 8)	\
+	fn(rspi3, ssl0,   5,  1, 8)	\
+	fn(rspi3, mosi,   5,  2, 8)	\
+	fn(rspi3, miso,   5,  3, 8)	\
+
+#define RSPI4(fn)			\
+	fn(rspi4, rspck,  2,  8, 8)	\
+	fn(rspi4, ssl0,   2,  9, 8)	\
+	fn(rspi4, mosi,   2, 10, 8)	\
+	fn(rspi4, miso,   2, 11, 8)	\
+	fn(rspi4, rspck,  4,  0, 7)	\
+	fn(rspi4, ssl0,   4,  1, 7)	\
+	fn(rspi4, mosi,   4,  2, 7)	\
+	fn(rspi4, miso,   4,  3, 7)	\
+
+RSPI0(RZ_PIN_AND_MUX)
+RSPI1(RZ_PIN_AND_MUX)
+RSPI2(RZ_PIN_AND_MUX)
+RSPI3(RZ_PIN_AND_MUX)
+RSPI4(RZ_PIN_AND_MUX)
+
+#define SCIF0(fn)			\
+	fn(scif0, clk, 2, 13, 6)	\
+	fn(scif0, txd, 2, 14, 6)	\
+	fn(scif0, rxd, 2, 15, 6)	\
+	fn(scif0, clk, 4, 8, 7)		\
+	fn(scif0, txd, 4, 9, 7)		\
+	fn(scif0, rxd, 4, 10, 7)	\
+	fn(scif0, clk, 6, 8, 5)		\
+	fn(scif0, txd, 6, 9, 5)		\
+	fn(scif0, rxd, 6, 10, 5)
+
+#define SCIF1(fn)			\
+	fn(scif1, cts, 2, 3, 6)		\
+	fn(scif1, clk, 2, 4, 6)		\
+	fn(scif1, txd, 2, 5, 6)		\
+	fn(scif1, rxd, 2, 6, 6)		\
+	fn(scif1, rts, 2, 7, 6)		\
+	fn(scif1, clk, 4, 11, 7)	\
+	fn(scif1, txd, 4, 12, 7)	\
+	fn(scif1, rxd, 4, 13, 7)	\
+	fn(scif1, clk, 6, 11, 5)	\
+	fn(scif1, txd, 6, 12, 5)	\
+	fn(scif1, rxd, 6, 13, 5)	\
+	fn(scif1, clk, 9, 2, 4)		\
+	fn(scif1, txd, 9, 3, 4)		\
+	fn(scif1, rxd, 9, 4, 4)		\
+	fn(scif1, cts, 9, 5, 4)		\
+	fn(scif1, rts, 9, 6, 4)
+
+#define SCIF2(fn)			\
+	fn(scif2, clk, 3, 0, 4)		\
+	fn(scif2, txd, 3, 1, 4)		\
+	fn(scif2, rxd, 3, 2, 4)		\
+	fn(scif2, txd, 3, 0, 6)		\
+	fn(scif2, clk, 4, 1, 5)		\
+	fn(scif2, txd, 4, 2, 5)		\
+	fn(scif2, rxd, 4, 3, 5)		\
+	fn(scif2, txd, 4, 14, 7)	\
+	fn(scif2, rxd, 4, 15, 7)	\
+	fn(scif2, txd, 6, 2, 7)		\
+	fn(scif2, rxd, 6, 3, 7)		\
+	fn(scif2, clk, 8, 3, 7)		\
+	fn(scif2, rxd, 8, 4, 7)		\
+	fn(scif2, txd, 8, 6, 7)
+
+#define SCIF3(fn)			\
+	fn(scif3, clk, 3, 4, 7)		\
+	fn(scif3, txd, 3, 5, 7)		\
+	fn(scif3, rxd, 3, 6, 7)		\
+	fn(scif3, clk, 5, 2, 5)		\
+	fn(scif3, txd, 5, 3, 5)		\
+	fn(scif3, rxd, 5, 4, 5)		\
+	fn(scif3, rxd, 6, 0, 7)		\
+	fn(scif3, txd, 6, 1, 7)		\
+	fn(scif3, txd, 8, 8, 7)		\
+	fn(scif3, rxd, 8, 9, 7)
+
+#define SCIF4(fn)			\
+	fn(scif4, txd, 5, 0, 5)		\
+	fn(scif4, rxd, 5, 1, 5)		\
+	fn(scif4, clk, 7, 0, 4)		\
+	fn(scif4, txd, 7, 1, 4)		\
+	fn(scif4, rxd, 7, 2, 4)		\
+	fn(scif4, txd, 8, 14, 7)	\
+	fn(scif4, rxd, 8, 15, 7)
+
+#define SCIF5(fn)			\
+	fn(scif5, cts, 6, 3, 5)		\
+	fn(scif5, rts, 6, 4, 5)		\
+	fn(scif5, clk, 6, 5, 5)		\
+	fn(scif5, txd, 6, 6, 5)		\
+	fn(scif5, rxd, 6, 7, 5)		\
+	fn(scif5, cts, 7, 15, 4)	\
+	fn(scif5, clk, 8, 0, 4)		\
+	fn(scif5, txd, 8, 1, 4)		\
+	fn(scif5, rxd, 8, 2, 4)		\
+	fn(scif5, rts, 8, 3, 4)		\
+	fn(scif5, rxd, 8, 11, 5)	\
+	fn(scif5, clk, 8, 12, 5)	\
+	fn(scif5, txd, 8, 13, 5)	\
+	fn(scif5, cts, 11, 7, 3)	\
+	fn(scif5, rts, 11, 8, 3)	\
+	fn(scif5, clk, 11, 9, 3)	\
+	fn(scif5, txd, 11, 10, 3)	\
+	fn(scif5, rxd, 11, 11, 3)
+
+#define SCIF6(fn)			\
+	fn(scif6, txd, 5, 6, 5)		\
+	fn(scif6, rxd, 5, 7, 5)		\
+	fn(scif6, clk, 6, 13, 4)	\
+	fn(scif6, txd, 6, 14, 4)	\
+	fn(scif6, rxd, 6, 15, 4)	\
+	fn(scif6, clk, 11, 0, 4)	\
+	fn(scif6, txd, 11, 1, 4)	\
+	fn(scif6, rxd, 11, 2, 4)
+
+#define SCIF7(fn)			\
+	fn(scif7, clk, 7, 3, 4)		\
+	fn(scif7, txd, 7, 4, 4)		\
+	fn(scif7, rxd, 7, 5, 4)		\
+	fn(scif7, cts, 7, 6, 4)		\
+	fn(scif7, rts, 7, 7, 4)
+
+SCIF0(RZ_PIN_AND_MUX)
+SCIF1(RZ_PIN_AND_MUX)
+SCIF2(RZ_PIN_AND_MUX)
+SCIF3(RZ_PIN_AND_MUX)
+SCIF4(RZ_PIN_AND_MUX)
+SCIF5(RZ_PIN_AND_MUX)
+SCIF6(RZ_PIN_AND_MUX)
+SCIF7(RZ_PIN_AND_MUX)
+
+#define ETHERNET(fn)			\
+	fn(ethernet, col,    1,  3, 3)		\
+	fn(ethernet, col,    1, 14, 4)		\
+	fn(ethernet, int,    1, 15, 1)		\
+	fn(ethernet, txclk,  2,  0, 2)		\
+	fn(ethernet, txer,   2,  1, 2)		\
+	fn(ethernet, txen,   2,  2, 2)		\
+	fn(ethernet, txcrs,  2,  3, 2)		\
+	fn(ethernet, txd0,   2,  4, 2)		\
+	fn(ethernet, txd1,   2,  5, 2)		\
+	fn(ethernet, txd2,   2,  6, 2)		\
+	fn(ethernet, txd3,   2,  7, 2)		\
+	fn(ethernet, rxd0,   2,  8, 2)		\
+	fn(ethernet, rxd1,   2,  9, 2)		\
+	fn(ethernet, rxd2,   2, 10, 2)		\
+	fn(ethernet, rxd3,   2, 11, 2)		\
+	fn(ethernet, txclk,  3,  0, 2)		\
+	fn(ethernet, txer,   3,  1, 2)		\
+	fn(ethernet, txen,   3,  2, 2)		\
+	fn(ethernet, mdio,   3,  3, 2)		\
+	fn(ethernet, rxclk,  3,  4, 2)		\
+	fn(ethernet, rxer,   3,  5, 2)		\
+	fn(ethernet, rxdv,   3,  6, 2)		\
+	fn(ethernet, mdc,    5,  9, 2)		\
+	fn(ethernet, mdc,    7,  0, 3)		\
+	fn(ethernet, txclk,  7,  1, 3)		\
+	fn(ethernet, txer,   7,  2, 3)		\
+	fn(ethernet, txen,   7,  3, 3)		\
+	fn(ethernet, txd0,   7,  4, 3)		\
+	fn(ethernet, txd1,   7,  5, 3)		\
+	fn(ethernet, txd2,   7,  6, 3)		\
+	fn(ethernet, txd3,   7,  7, 3)		\
+	fn(ethernet, rxd0,   7,  9, 3)		\
+	fn(ethernet, rxd1,   7, 10, 3)		\
+	fn(ethernet, rxd2,   7, 11, 2)		\
+	fn(ethernet, rxd3,   7, 12, 3)		\
+	fn(ethernet, mdio,   7, 13, 3)		\
+	fn(ethernet, crs,    7, 14, 3)		\
+	fn(ethernet, rxclk,  7, 15, 3)		\
+	fn(ethernet, rxer,   8,  0, 3)		\
+	fn(ethernet, rxd,    8,  1, 3)		\
+	fn(ethernet, col,    8,  7, 5)		\
+	fn(ethernet, txclk, 10,  0, 4)		\
+	fn(ethernet, txer,  10,  1, 4)		\
+	fn(ethernet, txen,  10,  2, 4)		\
+	fn(ethernet, crs,   10,  3, 4)		\
+	fn(ethernet, txd0,  10,  4, 4)		\
+	fn(ethernet, txd1,  10,  5, 4)		\
+	fn(ethernet, txd2,  10,  6, 4)		\
+	fn(ethernet, txd3,  10,  7, 4)		\
+	fn(ethernet, txd0,  10,  8, 4)		\
+	fn(ethernet, txd1,  10,  9, 4)		\
+	fn(ethernet, txd2,  10, 10, 4)		\
+	fn(ethernet, txd3,  10, 11, 4)		\
+
+ETHERNET(RZ_PIN_AND_MUX)
+
+static const struct sh_pfc_pin_group pinmux_groups[] = {
+	RIIC0(RZ_PMX_GROUP)
+	RIIC1(RZ_PMX_GROUP)
+	RIIC2(RZ_PMX_GROUP)
+	RIIC3(RZ_PMX_GROUP)
+	RSPI0(RZ_PMX_GROUP)
+	RSPI1(RZ_PMX_GROUP)
+	RSPI2(RZ_PMX_GROUP)
+	RSPI3(RZ_PMX_GROUP)
+	RSPI4(RZ_PMX_GROUP)
+	SCIF0(RZ_PMX_GROUP)
+	SCIF1(RZ_PMX_GROUP)
+	SCIF2(RZ_PMX_GROUP)
+	SCIF3(RZ_PMX_GROUP)
+	SCIF4(RZ_PMX_GROUP)
+	SCIF5(RZ_PMX_GROUP)
+	SCIF6(RZ_PMX_GROUP)
+	SCIF7(RZ_PMX_GROUP)
+	ETHERNET(RZ_PMX_GROUP)
+};
+
+static const char * const riic0_groups[] = {
+	RIIC0(RZ_GROUPS)
+};
+
+static const char * const riic1_groups[] = {
+	RIIC1(RZ_GROUPS)
+};
+
+static const char * const riic2_groups[] = {
+	RIIC2(RZ_GROUPS)
+};
+
+static const char * const riic3_groups[] = {
+	RIIC3(RZ_GROUPS)
+};
+
+static const char * const rspi0_groups[] = {
+	RSPI0(RZ_GROUPS)
+};
+
+static const char * const rspi1_groups[] = {
+	RSPI1(RZ_GROUPS)
+};
+
+static const char * const rspi2_groups[] = {
+	RSPI2(RZ_GROUPS)
+};
+
+static const char * const rspi3_groups[] = {
+	RSPI3(RZ_GROUPS)
+};
+
+static const char * const rspi4_groups[] = {
+	RSPI4(RZ_GROUPS)
+};
+
+static const char * const scif0_groups[] = {
+	SCIF0(RZ_GROUPS)
+};
+
+static const char * const scif1_groups[] = {
+	SCIF1(RZ_GROUPS)
+};
+
+static const char * const scif2_groups[] = {
+	SCIF2(RZ_GROUPS)
+};
+
+static const char * const scif3_groups[] = {
+	SCIF3(RZ_GROUPS)
+};
+
+static const char * const scif4_groups[] = {
+	SCIF4(RZ_GROUPS)
+};
+
+static const char * const scif5_groups[] = {
+	SCIF5(RZ_GROUPS)
+};
+
+static const char * const scif6_groups[] = {
+	SCIF6(RZ_GROUPS)
+};
+
+static const char * const scif7_groups[] = {
+	SCIF7(RZ_GROUPS)
+};
+
+static const char * const ethernet_groups[] = {
+	ETHERNET(RZ_GROUPS)
+};
+
+static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(riic0),
+	SH_PFC_FUNCTION(riic1),
+	SH_PFC_FUNCTION(riic2),
+	SH_PFC_FUNCTION(riic3),
+	SH_PFC_FUNCTION(rspi0),
+	SH_PFC_FUNCTION(rspi1),
+	SH_PFC_FUNCTION(rspi2),
+	SH_PFC_FUNCTION(rspi3),
+	SH_PFC_FUNCTION(rspi4),
+	SH_PFC_FUNCTION(scif0),
+	SH_PFC_FUNCTION(scif1),
+	SH_PFC_FUNCTION(scif2),
+	SH_PFC_FUNCTION(scif3),
+	SH_PFC_FUNCTION(scif4),
+	SH_PFC_FUNCTION(scif5),
+	SH_PFC_FUNCTION(scif6),
+	SH_PFC_FUNCTION(scif7),
+	SH_PFC_FUNCTION(ethernet),
+};
+
+#define PFC_REG(idx, name, reg)						\
+	{ PINMUX_CFG_REG(__stringify(name), reg, 16, 1) {		\
+		GP_##idx##_15_##name##_0, GP_##idx##_15_##name##_1,	\
+		GP_##idx##_14_##name##_0, GP_##idx##_14_##name##_1,	\
+		GP_##idx##_13_##name##_0, GP_##idx##_13_##name##_1,	\
+		GP_##idx##_12_##name##_0, GP_##idx##_12_##name##_1,	\
+		GP_##idx##_11_##name##_0, GP_##idx##_11_##name##_1,	\
+		GP_##idx##_10_##name##_0, GP_##idx##_10_##name##_1,	\
+		GP_##idx##_9_##name##_0, GP_##idx##_9_##name##_1,		\
+		GP_##idx##_8_##name##_0, GP_##idx##_8_##name##_1,		\
+		GP_##idx##_7_##name##_0, GP_##idx##_7_##name##_1,		\
+		GP_##idx##_6_##name##_0, GP_##idx##_6_##name##_1,		\
+		GP_##idx##_5_##name##_0, GP_##idx##_5_##name##_1,		\
+		GP_##idx##_4_##name##_0, GP_##idx##_4_##name##_1,		\
+		GP_##idx##_3_##name##_0, GP_##idx##_3_##name##_1,		\
+		GP_##idx##_2_##name##_0, GP_##idx##_2_##name##_1,		\
+		GP_##idx##_1_##name##_0, GP_##idx##_1_##name##_1,		\
+		GP_##idx##_0_##name##_0, GP_##idx##_0_##name##_1 }	\
+	}
+
+#define PFC_REGS(idx)						\
+	PFC_REG(idx, PMC, (0xfcfe3400 + (idx * 4))),		\
+	PFC_REG(idx, PFC, (0xfcfe3500 + (idx * 4))),		\
+	PFC_REG(idx, PFCE, (0xfcfe3600 + (idx * 4))),		\
+	PFC_REG(idx, PFCAE, (0xfcfe3a00 + (idx * 4))),		\
+	PFC_REG(idx, PIBC, (0xfcfe7000 + (idx * 4))),		\
+	PFC_REG(idx, PBDC, (0xfcfe7100 + (idx * 4))),		\
+	PFC_REG(idx, PIPC, (0xfcfe7200 + (idx * 4)))
+
+static struct pinmux_cfg_reg pinmux_config_regs[] = {
+	PFC_REGS(0), PFC_REGS(1), PFC_REGS(2), PFC_REGS(3),
+	PFC_REGS(4), PFC_REGS(5), PFC_REGS(6), PFC_REGS(7),
+	PFC_REGS(8), PFC_REGS(9), PFC_REGS(10), PFC_REGS(11),
+	PFC_REG(12, PMC, 0xfcfe7b40),
+	PFC_REG(12, PIBC, 0xfcfe7f00),
+	{ },
+};
+
+const struct sh_pfc_soc_info r7s72100_pinmux_info = {
+	.name = "r7s72100_pfc",
+
+	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
+
+	.pins = pinmux_pins,
+	.nr_pins = ARRAY_SIZE(pinmux_pins),
+	.groups = pinmux_groups,
+	.nr_groups = ARRAY_SIZE(pinmux_groups),
+	.functions = pinmux_functions,
+	.nr_functions = ARRAY_SIZE(pinmux_functions),
+
+	.cfg_regs = pinmux_config_regs,
+
+	.pinmux_data = pinmux_data,
+	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+};
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index e42cc7a..95a07c9 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -257,6 +257,7 @@ struct sh_pfc_soc_info {
 };
 
 extern const struct sh_pfc_soc_info emev2_pinmux_info;
+extern const struct sh_pfc_soc_info r7s72100_pinmux_info;
 extern const struct sh_pfc_soc_info r8a73a4_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7740_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7778_pinmux_info;
@@ -484,14 +485,16 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 #define GP_ALL(str)			CPU_ALL_PORT(_GP_ALL, str)
 
 /* PINMUX_GPIO_GP_ALL - Expand to a list of sh_pfc_pin entries */
-#define _GP_GPIO(bank, _pin, _name, sfx, cfg)				\
+#define _GP_GPIO(banksize, bank, _pin, _name, sfx, cfg)				\
 	{								\
-		.pin = (bank * 32) + _pin,				\
+		.pin = (bank * banksize) + _pin,			\
 		.name = __stringify(_name),				\
 		.enum_id = _name##_DATA,				\
 		.configs = cfg,						\
 	}
-#define PINMUX_GPIO_GP_ALL()		CPU_ALL_PORT(_GP_GPIO, unused)
+#define _GP_GPIO32(bank, _pin, _name, sfx, cfg)\
+  _GP_GPIO(32, bank, _pin, _name, sfx, cfg)
+#define PINMUX_GPIO_GP_ALL()		CPU_ALL_PORT(_GP_GPIO32, unused)
 
 /* PINMUX_DATA_GP_ALL -  Expand to a list of name_DATA, name_FN marks */
 #define _GP_DATA(bank, pin, name, sfx, cfg)	PINMUX_DATA(name##_DATA, name##_FN)
-- 
2.7.4
