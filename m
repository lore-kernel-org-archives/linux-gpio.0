From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 0/3] gpio / pinctrl: cherryview: Fix missing events from EC
Date: Fri, 16 Sep 2016 13:52:40 +0300
Message-ID: <20160916105243.93933-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:22769 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752877AbcIPKws (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Sep 2016 06:52:48 -0400
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
gpiochip and then provides a function which allows manipulation from
drivers. Then we switch pinctrl-cherryview to use it.

Previous version of the patches and the discussion around this issue can be
found here:

  https://lkml.org/lkml/2015/5/22/111

Changes from v1 of the series:
  - Only allocate irq_valid_mask when needed
  - Provide gpiochip_irqchip_exclude_irq() helper which allows drivers to
    select which GPIOs to exclude.
  - Use ->nrirqs in chv_gpio_irq_handler()
  - Added patch to convert the driver to use devm_gpiochip_add_data() so
    we can just return if gpiochip_irqchip_exclude_irq() fails (and also
    this simplifies the driver).

Mika Westerberg (3):
  gpiolib: Make it possible to exclude GPIOs from IRQ domain
  pinctrl: cherryview: Convert to use devm_gpiochip_add_data()
  pinctrl: cherryview: Do not add all southwest and north GPIOs to IRQ
    domain

 Documentation/gpio/driver.txt              |  5 +++
 drivers/gpio/gpiolib.c                     | 72 ++++++++++++++++++++++++++++--
 drivers/pinctrl/intel/pinctrl-cherryview.c | 57 +++++++++++++++--------
 include/linux/gpio/driver.h                |  5 +++
 4 files changed, 117 insertions(+), 22 deletions(-)

-- 
2.9.3

