From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 0/7] VF610 GPIO fixes/improvments
Date: Sun, 10 Mar 2019 23:27:30 -0700
Message-ID: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: linux-gpio@vger.kernel.org

Everyone:

This series contains a number of fixes/improvements I came up with
while working VF610 GPIO code. Hopefully each commit is
self-explanatory.

Feedback is welcome!

Thanks,
Andrey Smirnov

Andrey Smirnov (7):
  gpio: vf610: Do not share irq_chip
  gpio: vf610: Simplify vf610_gpio_set()
  gpio: vf610: Simplify vf610_gpio_get()
  gpio: vf610: Use devres to disable clk_port
  gpio: vf610: Use devres to disable clk_gpio
  gpio: vf610: Use devres to remove gpiochip
  gpio: vf610: Don't use explicit &pdev->dev in vf610_gpio_probe()

 drivers/gpio/gpio-vf610.c | 85 +++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 49 deletions(-)

-- 
2.20.1
