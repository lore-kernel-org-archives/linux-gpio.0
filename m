From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 0/2] Couple of fixes for pinctrl-armada-37xx
Date: Fri, 23 Jun 2017 14:29:50 +0200
Message-ID: <20170623122952.9871-1-gregory.clement@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42688 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750932AbdFWMaP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2017 08:30:15 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ken Ma <make@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Stefan Roese <sr@denx.de>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>

Hi,

Ken Ma found few issues in the driver. I wrote the first fix is based
on his report and the second one was written for U-Boot but as they
use the same driver it can be applied on linux too.

thanks,

Gregory

Gregory CLEMENT (1):
  pinctrl: armada-37xx: Fix number of pin in sdio_sb

Ken Ma (1):
  pinctrl: armada-37xx: Fix uart2 group selection register mask

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.11.0

