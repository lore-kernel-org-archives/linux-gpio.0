From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/4] gpio-stmpe: Adjustments for two function implementations
Date: Fri, 12 Jan 2018 21:00:40 +0100
Message-ID: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:65040 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965081AbeALUAq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jan 2018 15:00:46 -0500
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 20:58:42 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use seq_putc() in stmpe_dbg_show()
  Improve a size determination in stmpe_gpio_probe()
  Move an assignment in stmpe_gpio_probe()
  Delete an unnecessary variable initialisation in stmpe_gpio_probe()

 drivers/gpio/gpio-stmpe.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.15.1

