From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Mon,  9 Jan 2017 20:31:55 +0100
Message-ID: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
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

Thanks
   j


Magnus Damm (3):
  pinctrl: sh-pfc: Add r7s72100 PFC driver
  gpio: gpio-rz: GPIO driver for Renesas RZ series
  arm: dts: r7s72100: Add peripherals nodes

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   1 +
 arch/arm/boot/dts/r7s72100-genmai.dts              |  51 ++
 arch/arm/boot/dts/r7s72100.dtsi                    | 151 ++++++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-rz.c                             | 212 +++++++++
 drivers/pinctrl/sh-pfc/Kconfig                     |   5 +
 drivers/pinctrl/sh-pfc/Makefile                    |   1 +
 drivers/pinctrl/sh-pfc/core.c                      |   9 +
 drivers/pinctrl/sh-pfc/pfc-r7s72100.c              | 529 +++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   9 +-
 11 files changed, 972 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpio/gpio-rz.c
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r7s72100.c

-- 
2.7.4
