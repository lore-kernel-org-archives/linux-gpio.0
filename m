From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 0/8] gpio: mockup: updates for 4.13
Date: Fri,  9 Jun 2017 13:41:24 +0200
Message-ID: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f176.google.com ([209.85.128.176]:36176 "EHLO
        mail-wr0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751524AbdFILll (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 07:41:41 -0400
Received: by mail-wr0-f176.google.com with SMTP id v111so30018930wrc.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 04:41:41 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

v1 -> v2:
- omit applied patches
- use kstrtoint_from_user() for debugfs input sanitization
- add a patch improving the code in gpio_mockup_event_write()
- bail out from gpio_mockup_event_write() on invalid input even when
  nobody is listening for events

v2 -> v3:
- added the patch replacing devm_kzalloc() with devm_kcalloc() where
  applicable

Bartosz Golaszewski (8):
  gpio: mockup: improve the debugfs input sanitization
  gpio: mockup: tweak gpio_mockup_event_write()
  gpio: mockup: refuse to accept an odd number of GPIO ranges
  gpio: mockup: improve readability
  gpio: mockup: don't return magic numbers from probe()
  gpio: mockup: improve the error message
  gpio: mockup: add myself as author
  gpio: mockup: use devm_kcalloc() where applicable

 drivers/gpio/gpio-mockup.c | 67 ++++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

-- 
2.9.3

