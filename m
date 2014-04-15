From: Barry Song <21cnbao@gmail.com>
Subject: [PATCH 0/4] pinctrl: sirf: switch to one gpiolib and gpiolib_irqchip helpers
Date: Tue, 15 Apr 2014 14:43:45 +0800
Message-ID: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:65283 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930AbaDOGoR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Apr 2014 02:44:17 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so8931403pdj.8
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2014 23:44:16 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, workgroup.linux@csr.com, Barry Song <Baohua.Song@csr.com>

From: Barry Song <Baohua.Song@csr.com>

This patchset depends on Linus Walleij's "pinctrl: sirf: rename inlined accessor".
and "pinctrl: sirf: switch driver to use gpiolib irqchip helpers" is rebased
from Linus Walleij's patch too.

Barry Song (3):
  pinctrl: sirf: wrap all gpio banks into one gpio_chip
  gpio: make handler_data configurable while using gpiolib_irqchip
  pinctrl: sirf: move to use irq_get_handler_data
Linus Walleij (1):
  pinctrl: sirf: switch driver to use gpiolib irqchip helpers

 drivers/gpio/gpiolib.c              |   10 +-
 drivers/pinctrl/Kconfig             |    1 +
 drivers/pinctrl/sirf/pinctrl-sirf.c |  264 ++++++++++++-----------------------
 include/linux/gpio/driver.h         |    2 +-
 4 files changed, 97 insertions(+), 180 deletions(-)

-- 
1.7.5.4

