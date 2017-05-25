From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/10] gpio: mockup: updates for 4.13
Date: Thu, 25 May 2017 10:33:37 +0200
Message-ID: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35713 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756020AbdEYId4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 04:33:56 -0400
Received: by mail-wm0-f43.google.com with SMTP id b84so83939018wmh.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2017 01:33:55 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

This series contains a couple bug fixes and other minor updates for
the GPIO testing module.

Bartosz Golaszewski (10):
  gpio: mockup: fix direction values
  gpio: mockup: add prefixes to the direction enum
  gpio: mockup: be quiet unless something goes wrong
  gpio: mockup: support irqmask and irqunmask
  gpio: mockup: improve the debugfs input sanitization
  gpio: mockup: refuse to accept an odd number of GPIO ranges
  gpio: mockup: improve readability
  gpio: mockup: don't return magic numbers from probe()
  gpio: mockup: improve the error message
  gpio: mockup: add myself as author

 drivers/gpio/gpio-mockup.c | 82 ++++++++++++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 28 deletions(-)

-- 
2.9.3

