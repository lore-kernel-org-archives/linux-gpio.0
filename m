From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] gpiolib: gpio_device label improvements
Date: Thu, 14 Dec 2017 15:29:18 +0100
Message-ID: <20171214142920.32683-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Joe Perches <joe@perches.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Avoid unnecessary memory allocations with kstrdup_const().

v1 -> v2:
- use a ternary operator instead of an if/else in patch 2/2

Bartosz Golaszewski (2):
  gpiolib: constify label in gpio_device
  gpiolib: use kstrdup_const() for gpio_device label

 drivers/gpio/gpiolib.c | 9 +++------
 drivers/gpio/gpiolib.h | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)

-- 
2.15.1
