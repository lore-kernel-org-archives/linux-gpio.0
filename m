From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a7796: Add drive strength and bias support
Date: Fri, 11 Nov 2016 21:38:49 +0100
Message-ID: <20161111203851.3900-1-niklas.soderlund@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:39904 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933880AbcKKUjI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2016 15:39:08 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Hi,

These patches add drive strength and bias support for both GPIO and none 
GPIO pins to r8a7796. Similar to the none GPIO pins for r8a7795 the 
system to derive unique pin numbers are the R-Car M3SiP pin layout.

Tested on M3-W and the series depends on the series '[PATCHv2 0/6] 
pinctrl: sh-pfc: Fixups for bias handling and preparation for none GPIO 
pins'.

Niklas Söderlund (2):
  pinctrl: sh-pfc: r8a7796: Add drive strength support
  pinctrl: sh-pfc: r8a7796: Add bias pinconf support

 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 636 ++++++++++++++++++++++++++++++++++-
 1 file changed, 624 insertions(+), 12 deletions(-)

-- 
2.10.2

