From: Oleksij Rempel <linux@rempel-privat.de>
Subject: [PATCH v3 0/2] Add driver and documentation for Alphascale asm9260 pinctrl
Date: Sun,  5 Apr 2015 08:26:23 +0200
Message-ID: <1428215185-14190-1-git-send-email-linux@rempel-privat.de>
References: <1427476243.2334.12.camel@x220>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:55642 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750759AbbDEG0l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 5 Apr 2015 02:26:41 -0400
In-Reply-To: <1427476243.2334.12.camel@x220>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Oleksij Rempel <linux@rempel-privat.de>

Oleksij Rempel (2):
  pinctrl: Add driver for Alphascale asm9260 pinctrl
  pinctrl: asm9260: add pinctrl add device tree bindings documentation

 .../pinctrl/alphascale,asm9260-pinctrl.txt         |  76 +++
 drivers/pinctrl/Kconfig                            |   8 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-asm9260.c                  | 733 +++++++++++++++++++++
 4 files changed, 818 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/alphascale,asm9260-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-asm9260.c

-- 
1.9.1

