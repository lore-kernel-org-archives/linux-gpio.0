From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 0/2] Few pinctrl-single clean-ups
Date: Tue, 25 Oct 2016 09:08:58 -0700
Message-ID: <20161025160900.2724-1-tony@atomide.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:45844 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759304AbcJYQJJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Oct 2016 12:09:09 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Nishanth Menon <nm@ti.com>, linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org

Hi,

In preparation for some more generic pinctrl changes, here are two clean-up
patches for pinctrl-single.

Regards,

Tony

Tony Lindgren (2):
  pinctrl: single: Drop custom names
  pinctrl: single: Drop pointless macro

 drivers/pinctrl/pinctrl-single.c | 53 +++++++++-------------------------------
 1 file changed, 12 insertions(+), 41 deletions(-)

-- 
2.9.3
