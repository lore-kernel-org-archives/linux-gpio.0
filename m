From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 00/14] pinctrl: sh-pfc: r8a7796: Fix pin assignment definitions
Date: Thu, 13 Jul 2017 01:55:33 +0900
Message-ID: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This series fixes pin assignment definitions for R8A7796 SoC.
This series is based on the for-next branch of linux-pinctrl tree.

Takeshi Kihara (14):
  pinctrl: sh-pfc: r8a7796: Fix MOD_SEL1 bit[25:24] to 0x3 when using
    STP_ISEN_1_D
  pinctrl: sh-pfc: r8a7796: Fix IPSR register setting when MSIOF3_SS1_E
    pin was selected
  pinctrl: sh-pfc: r8a7796: Fix MOD_SEL2 bit26 to 0x0 when using SCK5_A
  pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin assignment for SSI
    pins group
  pinctrl: sh-pfc: r8a7796: Fix SCIF_CLK_{A,B} pin's MOD_SEL assignment
    to MOD_SEL1 bit10
  pinctrl: sh-pfc: r8a7796: Fix FMCLK{_C,_D} and FMIN{_C,_D} pin
    function definitions
  pinctrl: sh-pfc: r8a7796: Fix NFDATA{0..13} and NF{ALE,CLE,WE_N,RE_N}
    pin function definitions
  pinctrl: sh-pfc: r8a7796: Fix MSIOF3_{SS1,SS2}_E pins function
    definitions
  pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin assignment for
    TCLK{1,2}_{A,B} pins group
  pinctrl: sh-pfc: r8a7796: Fix to delete FSCLKST pin and IPSR7
    bit[15:12] register definitions
  pinctrl: sh-pfc: r8a7796: Fix to delete SATA_DEVSLP_B pins function
    definitions
  pinctrl: sh-pfc: r8a7796: Fix to delete MOD_SEL0 bit2 register
    definitions
  pinctrl: sh-pfc: r8a7796: Fix IPSR and MOD_SEL register pin assignment
    for FSO pins group
  pinctrl: sh-pfc: r8a7796: Rename CS1# pin function definitions

 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 138 +++++++++++++++++------------------
 1 file changed, 65 insertions(+), 73 deletions(-)

-- 
1.9.1
