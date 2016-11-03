From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] pinctrl: sh-pfc: Fixups for bias handeling
Date: Thu,  3 Nov 2016 16:34:19 +0100
Message-ID: <20161103153421.15527-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:45894 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752132AbcKCPey (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Nov 2016 11:34:54 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

Hi Geert and Laurent,

This series fixes two issues I encounter for bias handling in the PFC 
while preparing my drive strength patch set.

I do believe we should try to get the r8a7795 specific fix in to v4.9, 
do you agree (if the fix itself is acceptable ofc)?

Niklas Söderlund (2):
  pinctrl: sh-pfc: Do not unconditionally support
    PIN_CONFIG_BIAS_DISABLE
  pinctrl: sh-pfc: r8a7795: Use lookup function for bias data

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 350 ++++++++++++++++++-----------------
 drivers/pinctrl/sh-pfc/pinctrl.c     |   3 +-
 2 files changed, 182 insertions(+), 171 deletions(-)

-- 
2.10.2

