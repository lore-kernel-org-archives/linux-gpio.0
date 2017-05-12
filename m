From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 0/6] pintrl: meson: add support for GPIO IRQs
Date: Fri, 12 May 2017 21:01:09 +0200
Message-ID: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33979 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758513AbdELTBY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2017 15:01:24 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>

This patch series is partially based on a series Jerome Brunet
submitted about half a year ago. Due to open questions this series never
made it to mainline, see https://patchwork.kernel.org/patch/9384431/

This new attempt uses GPIOLIB_IRQCHIP resulting in less needed code.
Included is also support for using two parent IRQs in case
of IRQ_TYPE_EDGE_BOTH, like in the vendor driver.

Worth to be mentioned is also that I had to work around a strange
issue with spurious interrupts resulting in a deadlock.
The affected critical section in __setup_irq is executed with interrupts
disabled, nevertheless spurious GPIO IRQs result in a deadlock what
seems to indicate that they are handled on the same CPU.
I didn't find a better explanation than a possible HW flaw so far.

The series was successfully tested on a Odroid-C2, e.g. with removing
polling for SD card insertion/removal from the mmc driver.

Changes in v2:
- separate the GPIO IRQ controller from the pinctrl driver
- minor improvements to the GPIO IRQ controller

Heiner Kallweit (5):
  pinctrl: meson: add interrupts to pinctrl data
  pinctrl: meson: document GPIO IRQ DT binding
  pinctrl: meson: add DT node for GPIO IRQ on Meson GX
  pinctrl: meson: add DT node for GPIO IRQ on Meson 8 / 8b
  pinctrl: meson: improve meson_get_bank and export it
  pinctrl: meson: add support for GPIO interrupts

 .../bindings/gpio/amlogic,meson-gpio-interrupt.txt |  30 ++
 arch/arm/boot/dts/meson8.dtsi                      |  13 +
 arch/arm/boot/dts/meson8b.dtsi                     |  13 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  13 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/meson/Makefile                     |   2 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |  22 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |  20 +-
 drivers/pinctrl/meson/pinctrl-meson-irq.c          | 367 +++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |  67 ++--
 drivers/pinctrl/meson/pinctrl-meson.h              |  19 +-
 drivers/pinctrl/meson/pinctrl-meson8.c             |  20 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c            |  32 +-
 13 files changed, 538 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-irq.c

-- 
2.12.2

