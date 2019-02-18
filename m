From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/6] gpio: mockup: rework the testing driver - alternative version
Date: Mon, 18 Feb 2019 10:47:53 +0100
Message-ID: <20190218094759.14545-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

It's very late in the release cycle and we cannot seem to get the irq
subsystem maintainers' ack on the proposed change in the interrupt
simulator. This series contains only the gpio-mockup patches from the
previous submission in order to at least partially track the line's
state and add a way to verify the results of uAPI calls. The interrupts
are fired regardless of their type configuration. This will be fixed
once irq_sim supports it.

Bartosz Golaszewski (6):
  gpio: mockup: add locking
  gpio: mockup: implement get_multiple()
  gpio: mockup: don't create the debugfs link named after the label
  gpio: mockup: change the type of 'offset' to unsigned int
  gpio: mockup: change the signature of unlocked get/set helpers
  gpio: mockup: rework debugfs interface

 drivers/gpio/gpio-mockup.c | 188 +++++++++++++++++++++++++++++++------
 1 file changed, 161 insertions(+), 27 deletions(-)

-- 
2.20.1
