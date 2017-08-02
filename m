From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/6] gpio: use devres for irq generic chip
Date: Wed,  2 Aug 2017 09:51:20 +0200
Message-ID: <20170802075126.17637-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

We now provide resource managed versions of irq_alloc_generic_chip()
and irq_setup_generic_chip(). Use them in all relevant gpio drivers.

Bartosz Golaszewski (6):
  gpio: sta2x11: use devres for irq generic chip
  gpio: ml-ioh: use devres for irq generic chip
  gpio: pch: use devres for irq generic chip
  gpio: mxc: use devres for irq generic chip
  gpio: mxs: use devres for irq generic chip
  gpio: sodaville: use devres for irq generic chip

 drivers/gpio/gpio-ml-ioh.c    | 12 +++++++-----
 drivers/gpio/gpio-mxc.c       | 15 ++++++++++-----
 drivers/gpio/gpio-mxs.c       | 14 +++++++++-----
 drivers/gpio/gpio-pch.c       | 12 +++++++-----
 drivers/gpio/gpio-sodaville.c | 15 ++++++++++-----
 drivers/gpio/gpio-sta2x11.c   | 13 +++++++++----
 6 files changed, 52 insertions(+), 29 deletions(-)

-- 
2.13.2
