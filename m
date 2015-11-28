From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 0/4] gpio: pxa: integrate with pincontrol
Date: Sat, 28 Nov 2015 22:37:41 +0100
Message-ID: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:17198 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751544AbbK1Vln (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Nov 2015 16:41:43 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <zonque@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>

Hi Linus, Alexandre and Haojian,

This serie aims at several cleanups and improvements in the pxa gpio driver, to
support integration with pin control.

Amongst the changes, the main points are :
 - removal of as many global variables as possible
 - use of devm_*() function when applicable
 - use of irqdomain
 - use of pinctrl functions when available

Haojian, I've tested that on pxa27x, in both platform_data and devicetree
builds. Nevertheless I'd feel better if others architectures were tested,
especially mmp ones and pxa1928, which I don't have home.

Happy review.

Robert Jarzmik (4):
  gpio: pxa: convert to one gpiochip
  gpio: pxa: convert to devm_ioremap
  gpio: pxa: change the interrupt management
  gpio: pxa: add pin control gpio direction and request

 drivers/gpio/gpio-pxa.c | 370 ++++++++++++++++++++++++++++--------------------
 1 file changed, 214 insertions(+), 156 deletions(-)

-- 
2.1.4

