From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 0/2] pinctrl: sh-pfc: r8a7796: Add drive strength and bias support
Date: Sat, 12 Nov 2016 17:10:00 +0100
Message-ID: <20161112161002.13070-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: linux-gpio@vger.kernel.org

Hi,

These patches add drive strength and bias support for both GPIO and none
GPIO pins to r8a7796. Similar to the none GPIO pins for r8a7795 the
system to derive unique pin numbers are the R-Car M3SiP pin layout.

Tested on M3-W and the series depends on the series '[PATCHv3 0/6]
pinctrl: sh-pfc: Fixups for bias handling and preparation for none GPIO
pins'.

Changes since v1
- Update use of bias information helper function to match changes to the series 
  which this patch depend on.

Niklas Söderlund (2):
  pinctrl: sh-pfc: r8a7796: Add drive strength support
  pinctrl: sh-pfc: r8a7796: Add bias pinconf support

 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 638 ++++++++++++++++++++++++++++++++++-
 1 file changed, 626 insertions(+), 12 deletions(-)

-- 
2.10.2
