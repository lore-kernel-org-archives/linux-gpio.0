From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 0/2] r8a7795 pinctrl: Add drive strength support
Date: Mon, 21 Mar 2016 01:33:37 +0200
Message-ID: <1458516819-3928-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36577 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751118AbcCTXdn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Mar 2016 19:33:43 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Hello,

This patch series adds drive strength control support to the sh-pfc dri=
ver for
the R8A7795 (R-Car H3) SoC.

The SoC can control the drive strength of all GPIO pins, as well as of =
some
dedicated-purpose pins. As the R8A7795 pinctrl driver doesn't support n=
on-GPIO
pins yet, this series is limited to controlling the drive strength on t=
he GPIO
pins.

Patch 1/2 adds drive strength support to the sh-pfc driver. It hardcode=
s a few
assumptions that might be specific to the R8A7795, I'll revisit them if=
 future
SoCs break them.

Patch 2/2 adds R8A7795-specific support by setting the drive strength
configuration flag for all GPIO pins, and defining the drive strength
registers layout.

The series has been tested on the Salvator-X board with the GPIO pins
connected to the on-board LEDs. The 4.7=C2=B5F capacitor to ground prov=
ides a large
enough load on the lines to make the effect of the drive strength easil=
y
measurable with an oscilloscope.

Laurent Pinchart (2):
  pinctrl: sh-pfc: Add drive strength support
  pinctrl: sh-pfc: r8a7795: Add drive strength support

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   4 +-
 drivers/pinctrl/sh-pfc/core.c                      |  15 ++
 drivers/pinctrl/sh-pfc/core.h                      |   3 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 218 +++++++++++++=
+++++++-
 drivers/pinctrl/sh-pfc/pinctrl.c                   | 112 +++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  17 ++
 6 files changed, 359 insertions(+), 10 deletions(-)

--=20
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
