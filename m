From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 0/3] gpio / pinctrl: cherryview: Fix missing events from EC
Date: Tue, 20 Sep 2016 15:15:20 +0300
Message-ID: <20160920121523.170293-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:38686 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753243AbcITMP2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Sep 2016 08:15:28 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Up until now systems having Intel Cherryview/Braswell might lose GPEs
(General Purpose Events) from EC (Embedded Controller) because the pinctrl
driver masks all interrupt sources at probe time. I tried to fix this
already in bcb48cca23ec ("pinctrl: cherryview: Do not mask all interrupts
in probe") but it resulted that the irq core masked all the interrupts
because now we pass handle_bad_irq() as default handler for the irqchip.

After reading again the hardware spec, I think I finally understand the
problem correctly. In summary for southwest and north communities only the
first 8 (or 16) wires can be used to generate interrupts. Rest are reserved
for GPEs.

We fix this by excluding these only GPE capable wires from the IRQ domain
of the gpiochip.

This first follows what LinusW suggested and adds irq_valid_mask for each
gpiochip and then converts pinctrl-cherryview to use it.

Previous version of the patches and the discussion around this issue can be
found here:

  v2: http://www.spinics.net/lists/linux-gpio/msg16760.html
  v1: https://lkml.org/lkml/2015/5/22/111

Changes from v2:
  - Add irq_need_valid_mask flag that if set will make gpiochip_add_data()
    allocate irq_valid_mask for the chip.
  - Drop gpiochip_irqchip_exclude_irq() in favor of directly using
    set_/clear_bit() in drivers.
  - Use likely() annotation in gpiochip_irqchip_irq_valid().
  - Changed ordering of last two patches because there is no dependency
    anymore.

Changes from v1:
  - Only allocate irq_valid_mask when needed
  - Provide gpiochip_irqchip_exclude_irq() helper which allows drivers to
    select which GPIOs to exclude.
  - Use ->nrirqs in chv_gpio_irq_handler()
  - Added patch to convert the driver to use devm_gpiochip_add_data() so
    we can just return if gpiochip_irqchip_exclude_irq() fails (and also
    this simplifies the driver).

Mika Westerberg (3):
  gpiolib: Make it possible to exclude GPIOs from IRQ domain
  pinctrl: cherryview: Do not add all southwest and north GPIOs to IRQ domain
  pinctrl: cherryview: Convert to use devm_gpiochip_add_data()

 Documentation/gpio/driver.txt              |  6 +++
 drivers/gpio/gpiolib.c                     | 66 ++++++++++++++++++++++++++++--
 drivers/pinctrl/intel/pinctrl-cherryview.c | 55 ++++++++++++++++---------
 include/linux/gpio/driver.h                |  6 +++
 4 files changed, 111 insertions(+), 22 deletions(-)

-- 
2.9.3

