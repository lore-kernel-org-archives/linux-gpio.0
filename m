From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] gpio: check the return value of irq_alloc_generic_chip()
Date: Thu, 25 May 2017 10:37:35 +0200
Message-ID: <1495701458-12444-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:35602 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756691AbdEYIhm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 04:37:42 -0400
Received: by mail-wm0-f46.google.com with SMTP id b84so84013508wmh.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2017 01:37:42 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

While hacking on some irq devres stuff I noticed that the return value
of irq_alloc_generic_chip() is not being checked in a couple GPIO
drivers.

Those routines can fail, so check it and bail out if they do.

Bartosz Golaszewski (3):
  gpio: pch: check the return value of irq_alloc_generic_chip()
  gpio: sta2x11: check the return value of irq_alloc_generic_chip()
  gpio: ml-ioh: check the return value of irq_alloc_generic_chip()

 drivers/gpio/gpio-ml-ioh.c  | 16 +++++++++++++---
 drivers/gpio/gpio-pch.c     | 15 ++++++++++++---
 drivers/gpio/gpio-sta2x11.c | 12 ++++++++++--
 3 files changed, 35 insertions(+), 8 deletions(-)

-- 
2.9.3

