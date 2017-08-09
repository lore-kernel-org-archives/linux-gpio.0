From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/8] gpio: use devres for irq generic chip
Date: Wed,  9 Aug 2017 14:24:59 +0200
Message-ID: <20170809122507.11149-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

We now provide resource managed versions of irq_alloc_generic_chip()
and irq_setup_generic_chip(). Use them in all relevant gpio drivers.

v1 -> v2:
- added three patches which explicitly disable driver unbinding for
  non-modular drivers, only updated those built-in modules which already
  use devres in their probe() functions
- left out the sodaville patch since it explictly says it doesn't free
  any resources

Bartosz Golaszewski (8):
  gpio: mxc: disallow unbinding the driver
  gpio: mxs: disallow unbinding the driver
  gpio: sta2x11: disallow unbinding the driver
  gpio: sta2x11: use devres for irq generic chip
  gpio: ml-ioh: use devres for irq generic chip
  gpio: pch: use devres for irq generic chip
  gpio: mxc: use devres for irq generic chip
  gpio: mxs: use devres for irq generic chip

 drivers/gpio/gpio-ml-ioh.c  | 12 +++++++-----
 drivers/gpio/gpio-mxc.c     | 16 +++++++++++-----
 drivers/gpio/gpio-mxs.c     | 15 ++++++++++-----
 drivers/gpio/gpio-pch.c     | 12 +++++++-----
 drivers/gpio/gpio-sta2x11.c | 14 ++++++++++----
 5 files changed, 45 insertions(+), 24 deletions(-)

-- 
2.13.2
