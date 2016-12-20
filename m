From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/3] gpio: mockup: bug fixes and tweaks
Date: Tue, 20 Dec 2016 12:28:17 +0100
Message-ID: <1482233300-20078-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wj0-f175.google.com ([209.85.210.175]:33214 "EHLO
        mail-wj0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754888AbcLTL2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Dec 2016 06:28:34 -0500
Received: by mail-wj0-f175.google.com with SMTP id xy5so173175033wjc.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Dec 2016 03:28:34 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

While trying to use the gpio-mockup driver for testing purposes I
noticed there's an issue with the gpiochip's label. It turned out
the label pointer points to invalid memory area. This series fixes
it and adds some minor changes in other places too.

Bartosz Golaszewski (3):
  gpio: mockup: make pins_name_start static
  gpio: mockup: dynamically allocate memory for chip name
  gpio: mockup: coding style fixes

 drivers/gpio/gpio-mockup.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

-- 
2.9.3

