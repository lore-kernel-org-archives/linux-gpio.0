From: John Keeping <john@metanate.com>
Subject: [RFC PATCH 0/4] pinctrl: rockchip: PREEMPT_RT_FULL fixes
Date: Mon, 13 Mar 2017 18:38:09 +0000
Message-ID: <20170313183813.3582-1-john@metanate.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from dougal.metanate.com ([90.155.101.14]:54812 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754100AbdCMSij (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Mar 2017 14:38:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, John Keeping <john@metanate.com>

As described in Documentation/gpio/driver.txt, we should not be using
sleepable APIs in the irqchip implementation.  Since this includes the
regmap API, this patch series ends up moving the mux setup for IRQs into
an irq_bus_sync_unlock() handler which may result in the IRQ being
configured before the port has been muxed as a GPIO.

I've marked the series as RFC because I'm not sure if this is the best
way to accomplish this or if there is another approach that is cleaner.
Also, the first patch may not be correct on RK3399 because I originally
wrote the patch for RK3288 on top of v4.4 where all drive updates only
affect a single register.  We don't need locking in this case because
regmap_update_bits() takes a lock on the regmap internally, but if these
two registers need to be updated atomically then another lock will
be required here - slock cannot be used if it is converted to a raw
spinlock since with full RT preemption the regmap's spinlock may sleep.

John Keeping (4):
  pinctrl: rockchip: remove unnecessary locking
  pinctrl: rockchip: convert to raw spinlock
  pinctrl: rockchip: split out verification of mux settings
  pinctrl: rockchip: avoid hardirq-unsafe functions in irq_chip

 drivers/pinctrl/pinctrl-rockchip.c | 140 +++++++++++++++++++++++--------------
 1 file changed, 86 insertions(+), 54 deletions(-)

-- 
2.12.0.377.gf910686b23.dirty

