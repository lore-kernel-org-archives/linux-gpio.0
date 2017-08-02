From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a7796: Add USB2.0/3.0
Date: Wed,  2 Aug 2017 21:51:08 +0900
Message-ID: <1501678270-922-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:5189 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751180AbdHBMyU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 08:54:20 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

This patch is based on the renesas-drivers.git /
renesas-drivers-2017-07-18-v4.13-rc1 tag.

Takeshi Kihara (2):
  pinctrl: sh-pfc: r8a7796: Add USB2.0 host pins, groups and functions
  pinctrl: sh-pfc: r8a7796: Add USB3.0 host pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

-- 
1.9.1

