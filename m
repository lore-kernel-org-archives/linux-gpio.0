From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 0/9] pinctrl: sh-pfc: r8a7795: Fix pin assignment definitions
Date: Fri, 28 Jul 2017 20:41:12 +0900
Message-ID: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:36589 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751595AbdG1Ll3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2017 07:41:29 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org

This series fixes pin assignment definitions for R8A7795 SoC.
This series is based on the for-next branch of linux-pinctrl tree.

Takeshi Kihara (9):
  pinctrl: sh-pfc: r8a7795: Fix MOD_SEL1 bit[25:24] to 0x3 when using
    STP_ISEN_1_D
  pinctrl: sh-pfc: r8a7795: Fix MOD_SEL2 bit26 to 0x0 when using SCK5_A
  pinctrl: sh-pfc: r8a7795: Fix SCIF_CLK_{A,B} pin's MOD_SEL assignment
    to MOD_SEL1 bit10
  pinctrl: sh-pfc: r8a7795: Fix FMCLK{_C,_D} and FMIN{_C,_D} pin
    function definitions
  pinctrl: sh-pfc: r8a7795: Fix NFDATA{0..13} and NF{ALE,CLE,WE_N,RE_N}
    pin function definitions
  pinctrl: sh-pfc: r8a7795: Fix MOD_SEL register pin assignment for
    TCLK{1,2}_{A,B} pins group
  pinctrl: sh-pfc: r8a7795: Fix to delete FSCLKST pin and IPSR7
    bit[15:12] register definitions
  pinctrl: sh-pfc: r8a7795: Rename CS1# pin function definitions
  pinctrl: sh-pfc: r8a7795: Fix to reserved MOD_SEL2 bit22

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 93 +++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 48 deletions(-)

-- 
1.9.1

