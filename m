From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 00/14] pinctrl-sx150x: Various bug-fixes and code simplifications
Date: Tue,  1 Nov 2016 08:57:34 -0700
Message-ID: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33941 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750824AbcKAP6F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Nov 2016 11:58:05 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>

Linus, Neil:

I've had some help and got my hardware setup modified to enable IRQ
functionality testing, so ended up looking at the code of SX150x more
resulting in some code improvements (hopefully) and bugfixes.

There are many small changes each of which is probably better
described by corresponding commit's message, however the most
porminenet changes of the whole patchset are the switch to regmap API
(patches ## 7,8) and reduction of locking (patch # 9)

Please let me know what you think.

Thanks,
Andrey

Andrey Smirnov (14):
  pinctrl-sx150x: Rely on of_modalias_node for OF matching
  pinctrl-sx150x: Add SX1503 specific data
  pinctrl-sx150x: Replace magic number in sx150x_init_hw
  pinctrl-sx150x: Fix incorrect constant in sx150x_init_hw
  pinctrl-sx150x: Move some code out of sx150x_init_hw
  pinctrl-sx150x: Improve sx150x_init_misc for SX1504/5/6
  pinctrl-sx150x: Convert driver to use regmap API
  pinctrl-sx150x: Replace sx150x_*_cfg by means of regmap API
  pinctrl-sx150x: Remove excessive locking
  pinctrl-sx150x: Improve oscio GPIO functions
  pinctrl-sx150x: Simplify interrupt handler
  pinctrl-sx150x: Use handle_bad_irq instead of handle_edge_irq
  pinctrl-sx150x: Remove magic numbers from sx150x_irq_set_type
  pinctrl-sx150x: Remove magic numbers from sx150x_reset

 drivers/pinctrl/pinctrl-sx150x.c | 753 +++++++++++++++++++++------------------
 1 file changed, 416 insertions(+), 337 deletions(-)

-- 
2.5.5

