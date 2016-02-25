From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH 0/2] CAN & CAN FD pinctrl support for r8a7795 SoC
Date: Thu, 25 Feb 2016 16:48:51 +0000
Message-ID: <1456418933-3948-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:8762 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752104AbcBYQ7f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Feb 2016 11:59:35 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, chris.paterson2@renesas.com, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

This patch set adds CAN & CAN FD pinctrl support for r8a7795 SoC.

This set is based on linux-next repo(tag: next-20160225).

Ramesh Shanmugasundaram (2):
  pinctrl: sh-pfc: r8a7795: Add CAN support
  pinctrl: sh-pfc: r8a7795: Add CAN FD support

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 102 +++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

-- 
1.9.1

