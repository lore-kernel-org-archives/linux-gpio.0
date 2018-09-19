From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v4 0/3] Renesas R9A06G032 PINCTRL Driver
Date: Wed, 19 Sep 2018 15:23:43 +0100
Message-ID: <20180919142346.25468-1-phil.edworthy@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Phil Edworthy <phil.edworthy@renesas.com>
List-Id: linux-gpio@vger.kernel.org

This implements the pinctrl driver for the RZ/N1 family of devices, including
the R9A06G032 (RZ/N1D) device.

This series was originally written by Michel Pollet whilst at Renesas, and I
have taken over this work.

Main changes:
v4:
 - Address Jacopo's comments
 - Add alternative way to use the pinmux prop.
 - Remove mention of gpios.
 - Implement pin_config_group_get()
 - Fix function to get pin configs, i.e. return -EINVAL when disabled.

v3:
 - Use standard DT props instead of proprietary ones.
 - Replace virtual pins used for MDIO muxing with extra funcs.
 - Use pinctrl_utils funcs to handle the maps.
 - Remove the dbg functions to keep things simple.
 - Change the way the functions are defined so it is easy to check
   against the hardware numbering.

v2:
 - Change to generic rzn1 family driver, instead of device specific.
 - Review comments fixed.
 - Fix error handling during probe

Phil Edworthy (3):
  dt-bindings: pinctrl: renesas,rzn1-pinctrl: documentation
  pinctrl: renesas: Renesas RZ/N1 pinctrl driver
  ARM: dts: r9a06g032: Add pinctrl node

 .../bindings/pinctrl/renesas,rzn1-pinctrl.txt | 153 +++
 arch/arm/boot/dts/r9a06g032.dtsi              |   8 +
 drivers/pinctrl/Kconfig                       |  10 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-rzn1.c                | 951 ++++++++++++++++++
 include/dt-bindings/pinctrl/rzn1-pinctrl.h    | 141 +++
 6 files changed, 1264 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rzn1.c
 create mode 100644 include/dt-bindings/pinctrl/rzn1-pinctrl.h

-- 
2.17.1
