From: <kamlakant.patel@linaro.org>
Subject: [PATCH v1 0/5] convert to use basic mmio gpio library
Date: Mon, 1 Dec 2014 17:39:33 +0530
Message-ID: <1417435778-21879-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:29411 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753051AbaLAMI5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Dec 2014 07:08:57 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, linux-gpio@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel@linaro.org>

This patch converts GPIO drivers to use BASIC MMIO GPIO library
(i.e GPIO GENERIC library) which makes drivers smaller and simpler.

V1:
Following are the changes compare to previous patch 
* gpio-moxart.c: Removed unnecessary private structure moxart_gpio_chip and use
  bgpio_chip.
* gpio-timberdale.c: Register correct gpio_chip and update code to use
  bgpio_chip elements.
* gpio-iop.c: Pass correct parameters to bgpio_init.

Kamlakant Patel (5):
  gpio: moxart: convert to use basic mmio gpio library
  gpio: timberdale: convert to use basic mmio gpio library
  gpio: iop: convert to use basic mmio gpio library
  gpio: ge: convert to use basic mmio gpio library
  gpio: document basic mmio gpio library

 Documentation/gpio/driver.txt  |  50 ++++++++++++++++++++
 drivers/gpio/Kconfig           |   4 ++
 drivers/gpio/gpio-ge.c         |  96 ++++++++++++++++-----------------------
 drivers/gpio/gpio-iop.c        |  96 +++++++--------------------------------
 drivers/gpio/gpio-moxart.c     | 101 +++++++++++++----------------------------
 drivers/gpio/gpio-timberdale.c |  96 +++++++++++----------------------------
 6 files changed, 168 insertions(+), 275 deletions(-)

-- 
1.9.1

