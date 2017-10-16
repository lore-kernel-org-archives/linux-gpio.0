From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] gpiolib: improvements in linehandle_create()
Date: Mon, 16 Oct 2017 11:32:28 +0200
Message-ID: <20171016093230.5329-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Two minor fixes for creating user space line handles. The first patch
simplifies checking the request flags. The second adds an additional
sanitizing check.

Bartosz Golaszewski (2):
  gpiolib: only check line handle flags once
  gpiolib: don't allow OPEN_DRAIN & OPEN_SOURCE flags for input

 drivers/gpio/gpiolib.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.13.2
