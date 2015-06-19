From: Michael van der Westhuizen <michael@smart-africa.com>
Subject: [PATCH 0/2] Make generic MMIO GPIO aware of the pinctrl subsystem
Date: Fri, 19 Jun 2015 14:58:15 +0200
Message-ID: <1434718697-31335-1-git-send-email-michael@smart-africa.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:35714 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751670AbbFSM6b (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2015 08:58:31 -0400
Received: by wiga1 with SMTP id a1so18341244wig.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2015 05:58:29 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Kamlakant Patel <kamlakant.patel@linaro.org>, Michael van der Westhuizen <michael@smart-africa.com>

While adding pinctrl awareness to gpio-dwapb it became clear to me that
all but one GPIO driver using generic MMIO GPIO lacked pinctrl
awareness.

I moved my pinctrl integration efforts to the gpio-generic driver and
cleaned up moxart-gpio, the only pinctrl-integrated gpio-generic user
in-tree.

This generic integration is quite safe, as the pinctrl subsystem has
been written to gracefully handle GPIO pins that are not mapped to a
pin controller by returning success in those cases.

Affected drivers:
 - gpio-dwapb     : gains pinctrl integration
 - 74xx-mmio-gpio : gains pinctrl integration
 - clps711x-gpio  : gains pinctrl integration
 - gpio-ep93xx    : gains pinctrl integration
 - gef-gpio       : gains pinctrl integration
 - grgpio         : gains pinctrl integration
 - moxart-gpio    : remove custom pinctrl integration
 - gpio-mxc       : gains pinctrl integration
 - sdv_gpio       : gains pinctrl integration
 - xgene-gpio-sb  : gains pinctrl integration
 - vexpress-sysreg: gains pinctrl integration

Michael van der Westhuizen (2):
  gpio: bgpio: Teach gpio-generic about the pinctrl subsystem
  gpio: moxart-gpio: Use generic-gpio pinctrl integration

 drivers/gpio/gpio-generic.c | 10 +++++++++-
 drivers/gpio/gpio-moxart.c  | 13 -------------
 2 files changed, 9 insertions(+), 14 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
