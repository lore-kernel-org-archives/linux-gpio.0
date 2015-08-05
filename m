From: Eduardo Valentin <edubezval@gmail.com>
Subject: [PATCH 0/2] couple of fixes on IMX gpio driver
Date: Wed,  5 Aug 2015 10:23:06 -0700
Message-ID: <1438795388-22743-1-git-send-email-edubezval@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:35565 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751294AbbHERXT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2015 13:23:19 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: ubrindis56@gmail.com, Fabio Estevam <fabio.estevam@freescale.com>, festevam@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>

Hello all,

Here are two fixes on IMX GPIO driver. One is on
the way we handle GPIO irqs while going into suspend.
Another one is to be able to read the value
of an output GPIO.

Eduardo Valentin (1):
  gpio/mxc: implement reading output gpio value

Ulises Brindis (1):
  gpio/mxc: mask gpio interrupts in suspend

 drivers/gpio/gpio-mxc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.5.0

