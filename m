From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 0/3] simulated interrupts
Date: Mon, 14 Aug 2017 16:53:15 +0200
Message-ID: <20170814145318.6495-1-brgl@bgdev.pl>
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

v1 -> v2:
- added a call to irq_work_sync in irq_sim_fini()

v2 -> v3:
- added the license header to new files
- added Acked-by's and Reviewed-by's

v3 -> v4:
- moved the .c file to kernel/irq

Bartosz Golaszewski (3):
  irq/irq_sim: add a simple interrupt simulator framework
  irq/irq_sim: add a devres variant of irq_sim_init()
  gpio: mockup: use irq_sim

 Documentation/driver-model/devres.txt |   1 +
 drivers/gpio/Kconfig                  |   2 +-
 drivers/gpio/gpio-mockup.c            |  77 ++--------------
 include/linux/irq_sim.h               |  48 ++++++++++
 kernel/irq/Kconfig                    |   5 ++
 kernel/irq/Makefile                   |   1 +
 kernel/irq/irq_sim.c                  | 164 ++++++++++++++++++++++++++++++++++
 7 files changed, 227 insertions(+), 71 deletions(-)
 create mode 100644 include/linux/irq_sim.h
 create mode 100644 kernel/irq/irq_sim.c

-- 
2.13.2
