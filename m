From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [REGRESSION next] gpio-keys broken with commit 2233bf7a92e7 ("gpio:
 mvebu: switch to regmap for register access")
Date: Fri, 9 Jun 2017 08:50:38 +0200
Message-ID: <20170609085038.4af4f038@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34768 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751506AbdFIGum (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 02:50:42 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>

Hi Thomas,

Commit 2233bf7a92e7 ("gpio: mvebu: switch to regmap for register
access") in next-20170607 breaks gpio-keys on an armada-385 (Linksys
WRT3200ACM), noticed due to missing /dev/input/event0 and the below
dmesg output.

  # dmesg -l 0,1,2,3
  [    2.421130] genirq: Setting trigger mode 3 for irq 49 failed (mvebu_gpio_irq_set_type+0x0/0x168)
  [    2.429953] gpio-keys gpio-keys: Unable to claim irq 49; error -22


After reverting the offending commit all works again.

Ralph
