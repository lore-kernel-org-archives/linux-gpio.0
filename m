From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/7] gpio: mockup: extensions for testing purposes
Date: Mon,  6 Feb 2017 13:10:34 +0100
Message-ID: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

I would like to create an automated test-suite for libgpiod, but
the gpio-mockup driver is quite limited when it comes to current
user space functionality - I can't test neither line event
notifications nor finding GPIO lines by name.

This series proposes to extend the gpio framework by allowing to
inject line events from the kernel code and by providing a debugfs
interface for that to the gpio-mockup driver. We also allow the
user to request that the mockup driver name the lines.

The first two patches only contain coding style changes which, I
believe, will make the driver easier to maintain.

The third patch adds the option to have the lines named.

The fourth patch adds a devres flavor of irq_alloc_descs() to be used
in patch 5, which actually adds the dummy irqchip.

The last two patches implement the debugfs directory structure that
can be used by the user space to inject line events.

v1 -> v2:
- made the event injection self-contained within the driver by using
  the irq_work as suggested by Lars-Peter Clauses

Bartosz Golaszewski (7):
  gpio: mockup: readability tweaks
  gpio: mockup: code shrink
  gpio: mockup: implement naming the lines
  irqdesc: add memory managed version of irq_alloc_descs()
  gpio: mockup: add a dummy irqchip
  gpiolib: include <gpio/consumer.h> from gpiolib.h
  gpio: mockup: implement event injecting over debugfs

 drivers/gpio/Kconfig       |   1 +
 drivers/gpio/gpio-mockup.c | 349 ++++++++++++++++++++++++++++++++++++---------
 drivers/gpio/gpiolib.h     |   1 +
 include/linux/irq.h        |  19 +++
 kernel/irq/devres.c        |  38 +++++
 5 files changed, 338 insertions(+), 70 deletions(-)

-- 
2.9.3
