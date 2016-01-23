From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: [PATCH 0/3] gpio: Intel Baytrail support
Date: Sat, 23 Jan 2016 17:32:06 +0100
Message-ID: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:34695 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753262AbcAWQcM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2016 11:32:12 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: ptyser@xes-inc.com
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

This series introduces the GPIO Intel Baytrail support, using both the
lpc ich and the gpio ich drivers.

Antoine Tenart (3):
  gpio: gpio-ich: add support for Intel Baytrail
  mfd: lpc_ich: use a correct mask for the GPIO base address
  mfd: lpc_ich: add GPIO support for Baytrail

 drivers/gpio/gpio-ich.c     | 12 ++++++++++++
 drivers/mfd/lpc_ich.c       |  6 +++++-
 include/linux/mfd/lpc_ich.h |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.7.0

