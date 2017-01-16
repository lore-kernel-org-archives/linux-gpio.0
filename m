From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 0/8] Renesas RZ PFC and GPIO driver
Date: Mon, 16 Jan 2017 13:12:44 +0100
Message-ID: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello
   here it is v3 of PFC and GPIO driver for Renesas RZ SoC Series.

I'll premit that this series goes in the "pin-based PFC HW in group-based PFC
software" direction, and that, after some discussions on v1, it is
not clear yet if this is desirable for RZ series or we may want to explore
other solutions.

Compared to v2 I have fixed Linus' remarks on GPIO driver, and made it to use
a "more standard" set of registers among other RZ SoC to drive gpio pins
(thanks Chris for pointing this out).
Other bits in the driver changed, but that's mostly cosmetic stuff.

I have applied on top of PFC patch one of the patches I sent as RFC
(pinctrl: sh-pfc: r7s72100: Add IO mode selection) to set previously ignored
PIPC, PIBC and PBDC register to let the alternate function decide the pin's
I/O mode.

Other minor fixes applied to dts and dtsi.
Changes to the GPIO driver have required dtsi to change accordingly, in order
to provide memory regions for the newly used registers.

As per the previous submission, I can only test accessing an i2c-gpio eeprom,
so everyone interested (and with an actual test board on the desk) may want to
test and possibly provide feedbacks.

Thanks
   j

---

v1 -> v2:
    - split node addition in r7s72100.dtsi and r7s72100-genami.dts in 2 patches
    - break down addition of peripheral nodes in  r7s72100-genami.dts in 4
      patches
    - drop GPIO aliases in .dtsi file

v2 -> v3:
    - Add IO mode selection patch on top of PFC driver
    - Reworked commit messages that looked ugly in PFC and GPIO driver
    - Reworked GPIO driver to include Linus review comments and change the
      set of registers used to set pin's direction/value
    - Changed dtsi to make PFC and GPIO iomem regions not overlap
    - Drop "renesas" prefix from "groups" and "function" attributes as
      suggested by Geert.
---

Geert Uytterhoeven (1):
  arm: dts: r7s72100-genmai: Add pinctrl for RSPI

Jacopo Mondi (1):
  pinctrl: sh-pfc: r7s72100: Configure I/O mode

Magnus Damm (5):
  pinctrl: sh-pfc: Add r7s72100 PFC driver
  gpio: gpio-rz: GPIO driver for Renesas RZ series
  arm: dts: r7s72100: GPIO and PFC device nodes
  arm: dts: r7s72100-genmai: SCIF2 PINCTRL configuration
  arm: dts: r7s72100-genmai: LED1 and LED2 support

Simon Horman (1):
  arm: dts: r7s72100-genmai:Add ethernet PFC node

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   1 +
 arch/arm/boot/dts/r7s72100-genmai.dts              |  50 ++
 arch/arm/boot/dts/r7s72100.dtsi                    | 136 ++++++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-rz.c                             | 211 ++++++++
 drivers/pinctrl/sh-pfc/Kconfig                     |   5 +
 drivers/pinctrl/sh-pfc/Makefile                    |   1 +
 drivers/pinctrl/sh-pfc/core.c                      |   6 +
 drivers/pinctrl/sh-pfc/pfc-r7s72100.c              | 532 +++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   9 +-
 11 files changed, 955 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpio/gpio-rz.c
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r7s72100.c

-- 
2.7.4
