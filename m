From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 0/6] Add support for pinctrl/gpio on Armada 37xx
Date: Thu, 22 Dec 2016 18:24:55 +0100
Message-ID: <20161222172501.16121-1-gregory.clement@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:52136 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753436AbcLVRZR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Dec 2016 12:25:17 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>

Hi,

this series add support for the pin and gpio controllers present on
the Armada 37xx SoCs.

Each Armada 37xx SoC comes with 2 pin controllers: one on the south
bridge (managing 28 pins) and one on the north bridge (managing 36 pins).

At the hardware level the controller configure the pins by group and not
pin by pin.

The gpio controller is also capable to handle interrupt from gpio.

Gregory

Gregory CLEMENT (6):
  pinctrl: dt-bindings: Add documentation for Armada 37xx pin
    controllers
  pinctrl: armada-37xx: Add pin controller support for Armada 37xx
  pinctrl: armada-37xx: Add gpio support
  pinctrl: aramda-37xx: Add irqchip support
  ARM64: dts: marvell: Add pinctrl nodes for Armada 3700
  ARM64: dts: marvell: armada37xx: add pinctrl definition

 .../pinctrl/marvell,armada-37xx-pinctrl.txt        | 127 +++
 arch/arm64/Kconfig.platforms                       |   2 +
 arch/arm64/boot/dts/marvell/armada-3720-db.dts     |   8 +
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |  60 +-
 drivers/pinctrl/Makefile                           |   2 +-
 drivers/pinctrl/mvebu/Kconfig                      |   7 +
 drivers/pinctrl/mvebu/Makefile                     |   3 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        | 848 +++++++++++++++++++++
 8 files changed, 1052 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
 create mode 100644 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c

-- 
2.11.0

