From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v5 0/7] gpio: mockup: improve the user-space testing interface
Date: Mon, 18 Feb 2019 17:41:31 +0100
Message-ID: <20190218164138.24921-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Marc,

please take a look at another, much simpler approach. The only change
in irq_sim is calling the irqd_set_trigger_type() in irq_set_type(). We
don't care about the actual type - we simply store it and any interested
user (for example gpio-mockup in this series) can retrieve it using
irq_get_trigger_type() and interpret it on its own.

v1 -> v2:
- instead of providing the irq_sim_get_type() helper, move the irq type
  logic into the simulator and provide a helper that allows users to specify
  the type of the fired interrupt

v2 -> v3:
- switch back to having irq_sim_type() and put the line state logic into the
  GPIO testing module

v3 -> v4:
- drop irq_sim_get_type() and use a notifier chain instead so that any change
  in type configuration can be pushed out to interested users
- change the locking mechanism in gpio-mockup to a spinlock as we can't take
  a mutex when a hardirq-safe spinlock in irq_desc is being held when the
  irq_set_type() callback is called
- refuse to set any other type than falling or rising edge in irq_set_config

v4 -> v5:
- drop the notifier, use irqd_set_trigger_type() instead

Bartosz Golaszewski (7):
  irq/irq_sim: add irq_set_type() callback
  gpio: mockup: add locking
  gpio: mockup: implement get_multiple()
  gpio: mockup: don't create the debugfs link named after the label
  gpio: mockup: change the type of 'offset' to unsigned int
  gpio: mockup: change the signature of unlocked get/set helpers
  gpio: mockup: rework debugfs interface

 drivers/gpio/gpio-mockup.c | 189 +++++++++++++++++++++++++++++++------
 kernel/irq/irq_sim.c       |   8 ++
 2 files changed, 170 insertions(+), 27 deletions(-)

-- 
2.20.1
