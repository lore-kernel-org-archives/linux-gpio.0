From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 0/2] gpio: mockup: extensions for testing purposes
Date: Mon,  6 Feb 2017 15:11:06 +0100
Message-ID: <1486390268-31362-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

this is a follow-up to the gpio-mockup series. I dropped the resource
managed version of irq_alloc_descs() to avoid needing an ack from the
irq subsystem maintainers. I omitted all the already applied patches
too.

Rebased on top of gpio/devel and retested.

v2 -> v3:
- dropped the resource managed irq allocation and added a remove
  function instead
- also selected IRQ_WORK in gpio Kconfig
- included <gpio/consumer.h> from gpio-mockup.c instead of indirectly
  from gpiolib.h

Bartosz Golaszewski (2):
  gpio: mockup: add a dummy irqchip
  gpio: mockup: implement event injecting over debugfs

 drivers/gpio/Kconfig       |   2 +
 drivers/gpio/gpio-mockup.c | 195 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 196 insertions(+), 1 deletion(-)

-- 
2.9.3
