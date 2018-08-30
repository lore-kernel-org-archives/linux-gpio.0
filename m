From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v2 0/3] Renesas R9A06G032 PINCTRL Driver
Date: Thu, 30 Aug 2018 14:12:52 +0100
Message-ID: <1535634775-19365-1-git-send-email-phil.edworthy@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Phil Edworthy <phil.edworthy@renesas.com>
List-Id: linux-gpio@vger.kernel.org

This implements the pinctrl driver for the RZ/N1 family of devices, including
the R9A06G032 (RZ/N1D) device.

One area that is likely to be contentious is the use of 'virtual pins' for the 
MDIO pinmuxing. The driver uses two pins (170 and 171) that don't exist on the 
device to configure the MDIO source within the RZ/N1 devices. On these devices, 
there are two Ethernet MACs, a 5-Port Switch, numerous industrial Ethernet 
peripherals, any of which can be the MDIO source. Configuring the MDIO source 
could be done without the virtual pins, e.g. by extending the functions to 
cover all MDIO variants (a total of 32 additional functions), but this would 
allow users to misconfigure individual MDIO pins, rather than assign all MDIO 
pins to a MDIO source. The choice of how to implement this will affect the
DT bindings.

This series was originally written by Michel Pollet whilst at Renesas, and I
have taken over this work.

One point from Michel's v1 series:
"Note, I used renesas,rzn1-pinmux node to specify the pinmux constants,
and I also don't use some of the properties documented in
pinctrl-bindings.txt on purpose, as they are too limited for my use
(I need to be able to set, clear, ignore or reset level, pull up/down
and function as the pinmux might be set by another OS/core running
concurently)."

Patch 0003 should really be applied after patch:
 "ARM: dts: r9a06g032: Correct UART and add all other UARTs", see
 https://www.spinics.net/lists/arm-kernel/msg673525.html

Main changes:
v2:
 - Change to generic rzn1 family driver, instead of device specific.
 - Review comments fixed.
 - Fix error handling during probe

Phil Edworthy (3):
  dt-bindings: pinctrl: renesas,rzn1-pinctrl: documentation
  pinctrl: renesas: Renesas RZ/N1 pinctrl driver
  ARM: dts: r9a06g032: Add pinctrl node

 .../bindings/pinctrl/renesas,rzn1-pinctrl.txt      |  97 +++
 arch/arm/boot/dts/r9a06g032.dtsi                   |   8 +
 drivers/pinctrl/Kconfig                            |  10 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-rzn1.c                     | 844 +++++++++++++++++++++
 include/dt-bindings/pinctrl/rzn1-pinctrl.h         | 191 +++++
 6 files changed, 1151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rzn1.c
 create mode 100644 include/dt-bindings/pinctrl/rzn1-pinctrl.h

-- 
2.7.4
