From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [RFC v2 0/3] pinctrl: imx: add support for dt-overlays
Date: Fri,  2 Dec 2016 17:35:17 +0100
Message-ID: <20161202163520.22927-1-gary.bisson@boundarydevices.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wj0-f170.google.com ([209.85.210.170]:34592 "EHLO
        mail-wj0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752580AbcLBQf2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2016 11:35:28 -0500
Received: by mail-wj0-f170.google.com with SMTP id mp19so237139093wjc.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Dec 2016 08:35:28 -0800 (PST)
In-Reply-To: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, fabio.estevam@nxp.com
Cc: shawnguo@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, pantelis.antoniou@konsulko.com, vladimir_zapolskiy@mentor.com, Gary Bisson <gary.bisson@boundarydevices.com>

Hi all,

This RFC series is a follow-up to my previous RFC patch [1].

This time the series includes one possible of_notifier implementation
for people to understand the need of radix_tree (or similar mechanism)
as suggested by Fabio.

However, if you wish to try this on, you'll need a tree with patches
from the renesas-drivers tree to have configfs support [2].

To ease that process, my testing tree was pushed to github [3] which
is based on today's linux-next tree.

Finally, the device tree overlay was also pushed to github [4]. This
last repo also contains what is needed to build the overlay out of
tree plus some helper script to load the overlay.

With this tree and overlay, two spidev devices can be added from
user-space with the proper pinctrl being applied.

The patches of this series include some comment on their purpose /
implementation.

Regards,
Gary

[1] http://www.spinics.net/lists/kernel/msg2391326.html
[2] http://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/overlays
[3] https://github.com/gibsson/linux-next/tree/for-next-20161202
[4] https://github.com/gibsson/dt-overlays/tree/dt-overlays-next/overlays

Gary Bisson (3):
  pinctrl: imx: remove const qualifier of imx_pinctrl_soc_info
  pinctrl: imx: use radix trees for groups and functions
  pinctrl: imx: add of_notifier for dynamic pinctrl changes

 drivers/pinctrl/freescale/pinctrl-imx.c | 301 +++++++++++++++++++++++++++-----
 drivers/pinctrl/freescale/pinctrl-imx.h |   5 +-
 2 files changed, 261 insertions(+), 45 deletions(-)

-- 
2.9.3

