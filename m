From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: mockup: use devm_kcalloc() where applicable
Date: Thu,  1 Jun 2017 13:47:02 +0200
Message-ID: <1496317623-24026-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

This is a follow up to [1]. The patch proposes to use devm_kcalloc()
when allocating arrays of elements.

Bartosz Golaszewski (1):
  gpio: mockup: use devm_kcalloc() where applicable

 drivers/gpio/gpio-mockup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.9.3
