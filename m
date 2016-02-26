From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH v2 0/2] Add CAN & CAN FD pinctrl support for r8a7795 SoC
Date: Fri, 26 Feb 2016 11:10:03 +0000
Message-ID: <1456485005-37035-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:35821 "EHLO
	relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751021AbcBZLOh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 06:14:37 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, chris.paterson2@renesas.com, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

Hi Geert,

   Thanks for the comments (https://lkml.org/lkml/2016/2/25/531).
   I have incorporated those and created this v2 patch set.

   Changes since v1:
   * Inserted pin block in alphabetical order
   * Corrected controller name in comment

Ramesh Shanmugasundaram (2):
  pinctrl: sh-pfc: r8a7795: Add CAN support
  pinctrl: sh-pfc: r8a7795: Add CAN FD support

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 89 ++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

-- 
1.9.1

