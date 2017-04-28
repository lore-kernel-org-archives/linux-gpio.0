From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v5 0/1] Add support for pinctrl/gpio on Armada 37xx
Date: Fri, 28 Apr 2017 16:01:32 +0200
Message-ID: <cover.5e6e6649efd7d0482a5df17fb7f94fde29a54210.1493387770.git-series.gregory.clement@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:33956 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753390AbdD1OBk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 10:01:40 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>

Hi,

This fifth version contain only one patch all the other ones have been
applied on the pinctrl or the mvebu trees.

For the record, this series adds support for the pin and gpio
controllers present on the Armada 37xx SoCs.

Each Armada 37xx SoC comes with 2 pin controllers: one on the south
bridge (managing 28 pins) and one on the north bridge (managing 36 pins).

At the hardware level the controller configure the pins by group and not
pin by pin.

The gpio controller is also capable to handle interrupt from gpio.

Changelog

v4 -> v5
- Removed all the patches already applied

- Rebased on linux-next

- Applied binding changes asked by Rob by removing the -nb and -sb part

- Use d->mask directly directly when possible

- Add comment about the check  on gpio-controller child node

- Use of_property_read_bool() instead of of_find_property()

- Declared the armada_37xx_irq_*() functions as static

- check status register for each iteration inside the irq handler

v3 -> v4
- Some group are configured by several bits in the register:
  extend the armada_37xx_pin_group struct to manage it.

- Fix the uart2 and cspi2/3 configuration

- Document the armada_37xx_add_function(), armada_37xx_fill_group()
  and armada_37xx_fill_funcs().

- Use devm_gpiochip_add_data()

- Use irq_find_mapping instead of irq_linear_revmap

- Use handle_edge_irq instead of the wrong handle_level_irq

- Add comment about the fact the we have multiple parent interrupt

- Add comment about the mask usage of the irq_data struct

- Use BIT() macro when possible

- Select more CONFIG symbol needed for GPIO and interrupt support

v2 -> v3
 - use gpio-ranges (patch 4)

 - Document gpio-ranges usage (patch 1)

 - do not use anymore a global pin index (patch 3)

v1 -> v2:
- Update binding documentation making clear that mfd and syscon must
  be used (patch 1).

- Split the fist patch adding pin controller support for Armada 37xx
  in arm64 part (for kconfig) and pinctrl part (patch 2 and 3)

- Add MFD_SYSCON dependency (patch 3)

- Add kerneldoc for the armada_37xx_pin_group struct (patch 3)

- Rename _add_function() to armada_37xx_add_function() (patch 3)

- Use an inline function to update the reg offset (patch 4)

- Rename gpiolib_register to gpiochip_register (patch 4)

- Add a comment about the two registers limit (patch 4)

- Add explicit gpio node in the device tree (patch 4)

- Convert the driver to use GPIOLIB_IRQCHIP (patch 5)

- Add a critical section when accessing the hardware registers (patch 5)

- Use the gpio subnode (patch 5)

Thanks,

Gregory

Gregory CLEMENT (1):
  pinctrl: armada-37xx: Add irqchip support

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 229 +++++++++++++++++++++-
 1 file changed, 229 insertions(+)

base-commit: 5ae46f24f9b42187beeb512a5203126789cc791b
-- 
git-series 0.9.1
