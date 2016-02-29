From: Andreas Werner <andy@wernerandy.de>
Subject: [PATCH v2] introduce MEN 16Z127 GPIO controller driver
Date: Mon, 29 Feb 2016 19:44:18 +0100
Message-ID: <cover.1456771093.git.andy@wernerandy.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:58586 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750860AbcB2So3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Feb 2016 13:44:29 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, morbidrsa@gmail.com, andreas.werner@men.de

This patch adds the MEN 16Z127 GPIO Controller driver, which
is 32bit wide and located within a MCB FPGA.

changes in v2:
	- ported driver to use the generic MMIO library
	- added open drain support
	- added debounce support

Andreas Werner (1):
  gpio: add driver for MEN 16Z127 GPIO controller

 drivers/gpio/Kconfig        |   7 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-menz127.c | 200 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 208 insertions(+)
 create mode 100644 drivers/gpio/gpio-menz127.c

-- 
2.6.2

