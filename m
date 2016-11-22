From: Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a7796: Add CAN/CAN FD support
Date: Tue, 22 Nov 2016 13:49:01 +0000
Message-ID: <1479822543-4804-1-git-send-email-chris.paterson2@renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:53937 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755681AbcKVNt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Nov 2016 08:49:26 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, ramesh.shanmugasundaram@bp.renesas.com, Chris Paterson <chris.paterson2@renesas.com>

This patch series adds pinctrl support for CAN and CAN FD to the r8a7796.

Based on renesas-drivers-2016-11-15-v4.9-rc5.

Chris Paterson (2):
  pinctrl: sh-pfc: r8a7796: Add CAN support
  pinctrl: sh-pfc: r8a7796: Add CAN FD support

 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 89 ++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

-- 
1.9.1

