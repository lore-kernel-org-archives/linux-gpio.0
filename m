From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 0/2] Few fix on armada-37xx pinctrl for v4.13
Date: Tue,  1 Aug 2017 17:57:18 +0200
Message-ID: <20170801155720.10229-1-gregory.clement@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:47047 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751829AbdHAP7m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 11:59:42 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@free-electrons.com>, =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>

Hi,

In v4.13-rc1 a regression appeared on Ethernet support on the Armada
3720 DB which occurred to be caused by a wrong configuration of the
pinctrl (due to obsolete documentation).

The first patch fix this issue, and the second one fix an other bug
found during the debug of the first one.

Please apply them for v4.13-rc.

Thanks,

Gregory

Gregory CLEMENT (2):
  pinctrl: armada-37xx: Fix the pin 23 on south bridge
  pinctrl: armada-37xx: Fix number of pin in south bridge

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.13.2

