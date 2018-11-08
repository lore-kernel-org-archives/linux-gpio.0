From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] gpio: mockup: misc updates
Date: Thu,  8 Nov 2018 17:52:52 +0100
Message-ID: <20181108165255.9940-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

The first patch is a fix that should go in for 4.20.

Next two patches introduce features for 4.21 - lock protection of the
dummy chip structures and implementation of the get_multiple() callback.

Bartosz Golaszewski (3):
  gpio: mockup: fix indicated direction
  gpio: mockup: add locking
  gpio: mockup: implement get_multiple()

 drivers/gpio/gpio-mockup.c | 71 +++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 9 deletions(-)

-- 
2.19.1
