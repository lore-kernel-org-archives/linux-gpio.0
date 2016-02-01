From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 0/4] Pass correct license string to MODULE_LICENSE
Date: Mon,  1 Feb 2016 18:51:48 -0500
Message-ID: <cover.1454342013.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Several of the GPIO drivers have a copyright boilerplate lacking the "or
later" verbiage regarding GPL compliant distribution. The MODULE_LICENSE
string should reflect the actual copyright license terms used.

William Breathitt Gray (4):
  gpio: 104-dio-48e: Pass correct license string to MODULE_LICENSE
  gpio: 104-idi-48: Pass the correct license string to MODULE_LICENSE
  gpio: 104-idio-16: Pass the correct license string to MODULE_LICENSE
  gpio: ws16c48: Pass the correct license string to MODULE_LICENSE

 drivers/gpio/gpio-104-dio-48e.c | 2 +-
 drivers/gpio/gpio-104-idi-48.c  | 2 +-
 drivers/gpio/gpio-104-idio-16.c | 2 +-
 drivers/gpio/gpio-ws16c48.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.4.10
