From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 0/7] Renesas RZ PFC and GPIO driver
Date: Wed, 11 Jan 2017 10:57:06 +0100
Message-ID: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello,
   these patches are the result of a squash and forward porting of Magnus'
PFC and GPIO driver from
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tree
genmai-gpio-and-pfc branch to kernel v4.10

The PFC and GPIO driver have been forward ported to v4.10-rc1 with minor
fixes and applied on top of renesas-driver master branch.

As I cannot locally verify most of the peripherals functionalities enabled
by the creation of PFC and GPIO driver for RZ SoC series, testing performed
by patches original authors has to be trusted.

Some possible fixes and functional expansion for the PFC driver will follow in
an RFC series to be applied on top of this one.

PATCH v2:
whatever the future of this series will be, either we're going to drop it
completely in favour of a new per-pin driver for the RZ series or not, I have
closed review comments from Geert asking to break down dts and dtsi
modifications in more patches (as it originally was)

Thanks
   j

---

v1 -> v2:
    - split node addition in r7s72100.dtsi and r7s72100-genami.dts in 2 patches
    - break down addition of peripheral nodes in  r7s72100-genami.dts in 4
      patches
    - drop GPIO aliases in .dtsi file

---

Geert Uytterhoeven (1):
  arm: dts: r7s72100-genmai: Add pinctrl for RSPI

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
 arch/arm/boot/dts/r7s72100.dtsi                    | 138 ++++++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-rz.c                             | 212 +++++++++
 drivers/pinctrl/sh-pfc/Kconfig                     |   5 +
 drivers/pinctrl/sh-pfc/Makefile                    |   1 +
 drivers/pinctrl/sh-pfc/core.c                      |   6 +
 drivers/pinctrl/sh-pfc/pfc-r7s72100.c              | 529 +++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   9 +-
 11 files changed, 955 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpio/gpio-rz.c
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r7s72100.c

-- 
2.7.4
