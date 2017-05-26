From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH v2 0/4] Add iomux-route switching support
Date: Fri, 26 May 2017 15:20:19 +0800
Message-ID: <1495783223-28857-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:44014 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967296AbdEZHRM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2017 03:17:12 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, dianders@chromium.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>

The rk3228, rk3328, rk3399 have an interesting new feature,
some things like one specific uart can use multiple pins to
output data, but control of that seems to be split. The actual
pin config is identical for all pins - each needs to be configured
to function 2.

Use one pin of a specifc group to be set to its special pinmux function,
then configure the corresponding routing bits. If the pinmux setting is
wrong for that pin the ip block won't work correctly anyway.

David Wu (4):
  pinctrl: rockchip: Add iomux-route switching support
  pinctrl: rockchip: Add iomux-route switching support for rk3228
  pinctrl: rockchip: Add iomux-route switching support for rk3328
  pinctrl: rockchip: Add iomux-route switching support for rk3399

 drivers/pinctrl/pinctrl-rockchip.c | 321 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 320 insertions(+), 1 deletion(-)

-- 
1.9.1


