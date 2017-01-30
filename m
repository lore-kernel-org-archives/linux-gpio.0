From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 0/5] gpio: Remove unnecessary driver_data set operations
Date: Mon, 30 Jan 2017 09:39:24 -0500
Message-ID: <cover.1485786703.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f195.google.com ([209.85.213.195]:34094 "EHLO
        mail-yb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753462AbdA3Oj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 09:39:57 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

In a previous patchset ("gpio: Utilize devm_ functions in driver probe
callbacks") the device remove functions for several drivers were removed
as no longer necessary due to the patchset changes within. Setting
driver_data had been necessary in these drivers in order to access
private data in the respective device remove function. Now that the
device remove functions are gone, setting driver_data is no longer
necessary for these drivers. This patchset removes the relevant code.

William Breathitt Gray (5):
  gpio: 104-dio-48e: Remove unnecessary driver_data set
  gpio: 104-idi-48: Remove unnecessary driver_data set
  gpio: 104-idio-16: Remove unnecessary driver_data set
  gpio: gpio-mm: Remove unnecessary driver_data set
  gpio: ws16c48: Remove unnecessary driver_data set

 drivers/gpio/gpio-104-dio-48e.c | 2 --
 drivers/gpio/gpio-104-idi-48.c  | 2 --
 drivers/gpio/gpio-104-idio-16.c | 2 --
 drivers/gpio/gpio-gpio-mm.c     | 2 --
 drivers/gpio/gpio-ws16c48.c     | 2 --
 5 files changed, 10 deletions(-)

-- 
2.11.0

