From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 00/15] pinctrl-sx150x: Various bug-fixes and code simplifications
Date: Mon,  7 Nov 2016 08:53:08 -0800
Message-ID: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35377 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752174AbcKGQyC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2016 11:54:02 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com

Linus, Neil:

Here's the second version of sx150x patches, it's all pretty much the
same code with the following differences:

     - Commit removing OF tree match tables changed to code properly
       matching aginst OF data
     - Added REGMAP dependency in Kconfig
     - Documented "semtech,sx1503q" compatibility string

I also added Neil's Tested-bys and Acked-bys to the patches that
didn't change since v1.

Let me know if I missed someting.

Thank you,
Andrey Smirnov

Andrey Smirnov (15):
  pinctrl-sx150x: Improve OF device matching code
  pinctrl-sx150x: Add SX1503 specific data
  bindings: pinctrl-sx150x: Document SX1503 compatibility string
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

 .../devicetree/bindings/pinctrl/pinctrl-sx150x.txt |   3 +-
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/pinctrl-sx150x.c                   | 766 ++++++++++++---------
 3 files changed, 433 insertions(+), 337 deletions(-)

-- 
2.5.5

