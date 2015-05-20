From: Grygorii Strashko <grygorii.strashko@linaro.org>
Subject: [PATCH v2 0/3] gpiolib: debugfs: update to show more info for gpios requested as irq
Date: Wed, 20 May 2015 13:30:20 +0300
Message-ID: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:36796 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512AbbETKab (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2015 06:30:31 -0400
Received: by wizk4 with SMTP id k4so149759859wiz.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2015 03:30:30 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@linaro.org>, Johan Hovold <johan@kernel.org>

This series updates gpiolib debugfs code to show more information about
GPIOs requested as IRQ.

First patch ensures that information about GPIOs requested as IRQ only
will be provided through GPIO debugfs.

Other two patches extend information for GPIOs requested as IRQ
- show Linux irq number
- show marker '<irq-only>' for GPIOs requested as IRQ only

After this series sys/kernel/debug/gpio will produce following output:
  ...
 GPIOs 160-191, platform/4805d000.gpio, gpio:
  gpio-171 ((null)              ) in  hi IRQ-209 <irq-only>
 ^^^ GPIO requested as IRQ only and its Linux IRQ number is 209
  gpio-172 (xxyy              ) in  hi IRQ-210
 ^^^ GPIO requested as IRQ and as GPIO and its Linux IRQ number is 209

 GPIOs 192-223, platform/48051000.gpio, gpio:
  gpio-203 (vtt_fixed           ) out hi
 ^^^ GPIO requested as GPIO only

Changes in v2:
- split original patch on three patcehs
- apply comments from Linus and Johan

v1:
 https://lkml.org/lkml/2015/5/15/364

Cc: Johan Hovold <johan@kernel.org>

Grygorii Strashko (3):
  gpiolib: debugfs: display gpios requested as irq only
  gpiolib: debugfs: show linux irq number for gpios requested as irq
  gpiolib: debugfs: identify gpios requested as irq only

 drivers/gpio/gpiolib.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
1.9.1

