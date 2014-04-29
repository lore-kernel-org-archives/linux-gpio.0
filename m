From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 00/17] gpio: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:29:35 +0900
Message-ID: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46646 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755268AbaD2I3h (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:29:37 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S00B5YA9CWS90@mailout4.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:29:36 +0900 (KST)
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message. For example,
k.alloc and v.alloc failures use dump_stack().

Jingoo Han (17):
      gpio: adp5520: remove unnecessary OOM messages
      gpio: adp5588: remove unnecessary OOM messages
      gpio: davinci: remove unnecessary OOM messages
      gpio: em: remove unnecessary OOM messages
      gpio: janz-ttl: remove unnecessary OOM messages
      gpio: lynxpoint: remove unnecessary OOM messages
      gpio: moxart: remove unnecessary OOM messages
      gpio: mvebu: remove unnecessary OOM messages
      gpio: palmas: remove unnecessary OOM messages
      gpio: rc5t583: remove unnecessary OOM messages
      gpio: rcar: remove unnecessary OOM messages
      gpio: rdc321x: remove unnecessary OOM messages
      gpio: SPEAr: remove unnecessary OOM messages
      gpio: tegra: remove unnecessary OOM messages
      gpio: tps6586x: remove unnecessary OOM messages
      gpio: tps65910: remove unnecessary OOM messages
      gpio: zevio: remove unnecessary OOM messages
---
 drivers/gpio/gpio-adp5520.c     |    4 +---
 drivers/gpio/gpio-adp5588.c     |    4 +---
 drivers/gpio/gpio-davinci.c     |    4 +---
 drivers/gpio/gpio-em.c          |    1 -
 drivers/gpio/gpio-janz-ttl.c    |    1 -
 drivers/gpio/gpio-lynxpoint.c   |    4 +---
 drivers/gpio/gpio-moxart.c      |    4 +---
 drivers/gpio/gpio-mvebu.c       |    4 +---
 drivers/gpio/gpio-palmas.c      |    4 +---
 drivers/gpio/gpio-rc5t583.c     |    4 +---
 drivers/gpio/gpio-rcar.c        |    1 -
 drivers/gpio/gpio-rdc321x.c     |    4 +---
 drivers/gpio/gpio-spear-spics.c |    4 +---
 drivers/gpio/gpio-tegra.c       |    4 +---
 drivers/gpio/gpio-tps6586x.c    |    4 +---
 drivers/gpio/gpio-tps65910.c    |    4 +---
 drivers/gpio/gpio-zevio.c       |    4 +---
 17 files changed, 14 insertions(+), 45 deletions(-)

