From: <kamlakant.patel@linaro.org>
Subject: [PATCH 0/5] convert to use basic mmio gpio library
Date: Wed, 29 Oct 2014 19:26:40 +0530
Message-ID: <1414591005-30961-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:18133 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932834AbaJ2N5J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Oct 2014 09:57:09 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, linux-gpio@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel@linaro.org>

This patch converts GPIO drivers to use BASIC MMIO GPIO library
(i.e GPIO GENERIC library) which makes drivers smaller and simpler.

This patch needs to be tested on different platforms.

Kamlakant Patel (5):
  gpio: moxart: convert to use basic mmio gpio library
  gpio: timberdale: convert to use basic mmio gpio library
  gpio: iop: convert to use basic mmio gpio library
  gpio: ge: convert to use basic mmio gpio library
  gpio: document basic mmio gpio library

 Documentation/gpio/driver.txt  | 50 ++++++++++++++++++++++
 drivers/gpio/Kconfig           |  4 ++
 drivers/gpio/gpio-ge.c         | 96 +++++++++++++++++-------------------------
 drivers/gpio/gpio-iop.c        | 96 ++++++++----------------------------------
 drivers/gpio/gpio-moxart.c     | 76 ++++++++++++---------------------
 drivers/gpio/gpio-timberdale.c | 90 ++++++++++++---------------------------
 6 files changed, 162 insertions(+), 250 deletions(-)

-- 
1.9.1

