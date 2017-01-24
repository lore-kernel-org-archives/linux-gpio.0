From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 0/5] gpio: Utilize devm_ functions in driver probe callbacks
Date: Tue, 24 Jan 2017 15:00:21 -0500
Message-ID: <cover.1485287208.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f196.google.com ([209.85.161.196]:34530 "EHLO
        mail-yw0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750718AbdAXUAb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2017 15:00:31 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

The devm_ resource manager functions allow memory to be automatically
released when a device is unbound. This patchset takes advantage of the
resource manager functions and replaces gpiochip_add_data calls and
request_irq calls with devm_gpiochip_add_data calls and devm_request_irq
calls respectively.

A convenient outcome of these changes is the removal of the respective
driver remove callback functions for these drivers; now that clean-up is
handled automatically when devices are unbound, custom driver remove
functions are no longer necessary for these drivers.

William Breathitt Gray (5):
  gpio: 104-dio-48e: Utilize devm_ functions in driver probe callback
  gpio: 104-idi-48: Utilize devm_ functions in driver probe callback
  gpio: 104-idio-16: Utilize devm_ functions in driver probe callback
  gpio: gpio-mm: Utilize devm_ functions in driver probe callback
  gpio: ws16c48: Utilize devm_ functions in driver probe callback

 drivers/gpio/gpio-104-dio-48e.c | 27 +++++----------------------
 drivers/gpio/gpio-104-idi-48.c  | 28 +++++-----------------------
 drivers/gpio/gpio-104-idio-16.c | 27 +++++----------------------
 drivers/gpio/gpio-gpio-mm.c     | 12 +-----------
 drivers/gpio/gpio-ws16c48.c     | 28 +++++-----------------------
 5 files changed, 21 insertions(+), 101 deletions(-)

-- 
2.11.0

