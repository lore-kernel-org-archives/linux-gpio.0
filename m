From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH v2 0/2] gpio driver for NXP LPC18xx family
Date: Sat,  2 May 2015 23:11:33 +0200
Message-ID: <1430601095-31984-1-git-send-email-manabian@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:34322 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757271AbbEBVNE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 2 May 2015 17:13:04 -0400
Received: by laat2 with SMTP id t2so82874628laa.1
        for <linux-gpio@vger.kernel.org>; Sat, 02 May 2015 14:13:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, Joachim Eastwood <manabian@gmail.com>

This patch set adds a gpio driver for NXP LPC18xx/43xx devices.
Patchset is based on Linus master 4.1-rc1.

changes in v2:
 - use PBYTE register for gpio set/get
 - refactor direction setup
 - add lock for direction set RMW cycle
 - expand doc example

Base support for the family can be found here:
http://marc.info/?l=linux-arm-kernel&m=143016894704253&w=2

DTS changes will come once base support and clk patches goes upstream.

Joachim Eastwood (2):
  gpio: add lpc18xx gpio driver
  doc: dt: add documentation for lpc1850-gpio driver

 .../devicetree/bindings/gpio/nxp,lpc1850-gpio.txt  |  39 +++++
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-lpc18xx.c                        | 180 +++++++++++++++++++++
 4 files changed, 228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.txt
 create mode 100644 drivers/gpio/gpio-lpc18xx.c

-- 
1.8.0

