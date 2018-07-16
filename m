From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] gpiolib: linehandle_ioctl() tweaks
Date: Mon, 16 Jul 2018 10:34:22 +0200
Message-ID: <20180716083424.11157-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

I noticed that - unlike sysfs - it's possible to set values of input
lines from user space using the character device. There's actually
even a TODO in the linehandle_ioctl() code.

This is not correct so the first patches fixes that and the second
removes a TODO that's not really needed.

Bartosz Golaszewski (2):
  gpiolib: don't allow userspace to set values of input lines
  gpiolib: remove an unneccessary TODO

 drivers/gpio/gpiolib.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1
