From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH 0/2] Add CAN & CAN FD pinctrl support for R-Car H3 ES2.0
Date: Fri, 10 Nov 2017 13:58:48 +0000
Message-ID: <20171110135850.32904-1-ramesh.shanmugasundaram@bp.renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:56963 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751313AbdKJOAH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Nov 2017 09:00:07 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, chris.paterson2@renesas.com, fabrizio.castro@bp.renesas.com, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

Hi Geert, All,

   This series adds CAN and CAN FD pinctrl support for R-Car H3 ES2.0. The
   pin config is identical to H3 ES1.x.

   This series is based on renesas-drivers repo
   commit: cdf382160c46b29ce99532ed4378ddc044a5a1c9

Thanks,
Ramesh.

Ramesh Shanmugasundaram (2):
  pinctrl: sh-pfc: r8a7795: Add CAN support
  pinctrl: sh-pfc: r8a7795: Add CAN FD support

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 89 ++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

-- 
2.12.2

