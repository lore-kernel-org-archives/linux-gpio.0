From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/7] gpio: mockup: updates for 4.13
Date: Tue, 30 May 2017 10:58:33 +0200
Message-ID: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

This series contains a couple bug fixes and other minor updates for
the GPIO testing module.

v1 -> v2:
- omit applied patches
- use kstrtoint_from_user() for debugfs input sanitization
- add a patch improving the code in gpio_mockup_event_write()
- bail out from gpio_mockup_event_write() on invalid input even when
  nobody is listening for events

Bartosz Golaszewski (7):
  gpio: mockup: improve the debugfs input sanitization
  gpio: mockup: tweak gpio_mockup_event_write()
  gpio: mockup: refuse to accept an odd number of GPIO ranges
  gpio: mockup: improve readability
  gpio: mockup: don't return magic numbers from probe()
  gpio: mockup: improve the error message
  gpio: mockup: add myself as author

 drivers/gpio/gpio-mockup.c | 61 ++++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 29 deletions(-)

-- 
2.9.3
