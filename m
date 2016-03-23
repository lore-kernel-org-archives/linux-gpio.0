From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 0/2] r8a7795 pinctrl: Add drive strength support
Date: Wed, 23 Mar 2016 16:05:59 +0200
Message-ID: <1458741961-4039-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

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

Changes compared to v1:

- Fix conversion from register value to mA
- Fix boundary checking when setting drive strength

Laurent Pinchart (2):
  pinctrl: sh-pfc: Add drive strength support
  pinctrl: sh-pfc: r8a7795: Add drive strength support

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   4 +-
 drivers/pinctrl/sh-pfc/core.c                      |  15 ++
 drivers/pinctrl/sh-pfc/core.h                      |   3 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 218 +++++++++++++=
+++++++-
 drivers/pinctrl/sh-pfc/pinctrl.c                   | 111 +++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  17 ++
 6 files changed, 358 insertions(+), 10 deletions(-)

--=20
Regards,

Laurent Pinchart
