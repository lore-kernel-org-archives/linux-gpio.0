From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] irq/irq_sim: provide a specialized variant of irq_sim_fire()
Date: Tue, 20 Nov 2018 14:40:30 +0100
Message-ID: <20181120134032.31645-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

The interrupts simulator has a limitation in that a call to irq_sim_fire()
always fires the dummy interrupt - irrespective of the flags passed to the
irq request function.

This series addresses a problem with certain libgpiod tests failing when
using gpio-mockup with simulated interrupts since commit fa38869b0161
("gpiolib: Don't support irq sharing for userspace"). The tests are
failing because irq_sim fires interrupts for falling edge events even if
gpiolib requests a threaded irq triggered by rising edge only (and vice
versa).

We're introducing a new function: irq_sim_fire_edge() which takes
another argument allowing to specify the trigger type for the dummy
interrupt. We then use it in gpio-mockup.

Patch 1 applies on top of my previous irq_sim changeset[1]. Patch 2
applies on top of the recent changes to gpio-mockup[2].

Since test breakage in user-space after 4.20-rc1 can be considered
a regression, it would be great if this could go into 4.20.

[1] https://lkml.org/lkml/2018/11/9/1418
[2] https://lkml.org/lkml/2018/11/8/1012

Bartosz Golaszewski (2):
  irq/irq_sim: provide irq_sim_fire_edge()
  gpio: mockup: use irq_sim_fire_edge()

 drivers/gpio/gpio-mockup.c |  5 +++--
 include/linux/irq_sim.h    |  2 ++
 kernel/irq/irq_sim.c       | 30 ++++++++++++++++++++++++++++--
 3 files changed, 33 insertions(+), 4 deletions(-)

-- 
2.19.1
