From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] simulated interrupts
Date: Wed, 19 Jul 2017 14:20:11 +0200
Message-ID: <1500466814-32679-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Some frameworks (e.g. iio, gpiolib) use irq_work to implement simulated
interrupts that can be 'fired' from process context when needed and
requested just like normal interrupts. This is useful for testing and
development purposes.

Currently this code is reimplemented by every user. This series
proposes to add a new set of functions that can be used by drivers
that want to simulate interrupts without having to duplicate any
boilerplate code.

The first patch adds a simple irq simulator framework. The second
extends it with resource management. The third uses the new
functionality in the gpio-mockup testing driver.

NOTE: The next candidate for using this API would be iio-dummy-evgen.

Bartosz Golaszewski (3):
  irq/irq_sim: add a simple interrupt simulator framework
  irq/irq_sim: add a devres variant of irq_sim_init()
  gpio: mockup: use irq_sim

 Documentation/driver-model/devres.txt |   1 +
 drivers/gpio/Kconfig                  |   2 +-
 drivers/gpio/gpio-mockup.c            |  77 ++--------------
 include/linux/irq_sim.h               |  41 +++++++++
 init/Kconfig                          |   4 +
 kernel/Makefile                       |   1 +
 kernel/irq_sim.c                      | 161 ++++++++++++++++++++++++++++++++++
 7 files changed, 216 insertions(+), 71 deletions(-)
 create mode 100644 include/linux/irq_sim.h
 create mode 100644 kernel/irq_sim.c

-- 
2.13.2
