From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4] provide irqchip in gpiolib
Date: Tue, 25 Mar 2014 13:51:30 +0100
Message-ID: <1395751894-7110-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:55491 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752177AbaCYMw3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Mar 2014 08:52:29 -0400
Received: by mail-wg0-f49.google.com with SMTP id a1so290227wgh.20
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2014 05:52:28 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

This series provides a central facility for registering a chained
(cascaded) irqchip as a sibling to a certain gpiochip. Patch one
adds the API, patch 2, 3, 4 convert three drivers that I can test
to use this facility.

Linus Walleij (4):
  gpio: add IRQ chip helpers in gpiolib
  gpio: pl061: convert driver to use gpiolib irqchip
  pinctrl: nomadik: convert driver to use gpiolib irqchip
  pinctrl: coh901: convert driver to use gpiolib irqchip

 drivers/gpio/Kconfig              |   4 +
 drivers/gpio/gpio-pl061.c         |  80 ++++-----------
 drivers/gpio/gpiolib.c            | 188 +++++++++++++++++++++++++++++++++++
 drivers/pinctrl/Kconfig           |   4 +
 drivers/pinctrl/pinctrl-coh901.c  | 204 ++++++++++----------------------------
 drivers/pinctrl/pinctrl-nomadik.c | 123 ++++++-----------------
 include/linux/gpio/driver.h       |  29 ++++++
 7 files changed, 329 insertions(+), 303 deletions(-)

-- 
1.8.5.3

