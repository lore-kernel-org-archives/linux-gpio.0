From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [RFC fixes 0/2] FIX: Renesas RZ series pinctrl driver
Date: Fri, 27 Jan 2017 17:47:06 +0100
Message-ID: <1485535628-17097-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55125 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755143AbdA0QsR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2017 11:48:17 -0500
In-Reply-To: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, Chris.Brandt@renesas.com, wsa@the-dreams.de
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Hello,
   sorry if I'm sending 2 patches on top of an RFC series with comments
still pending, but these patches enabled me to properly test pin configuration
sequence in order to access the internal EEPROM through RIIC2 interface on
pins 1_4 and 1_5.

The outcome is a bugfix to RZ/A1 pincontroller driver which [2/2] applies on.

When sending v2 of the whole series I'll probably squash these, but if someone
is testing the RFC series I wanted to make sure he does not waste his time with
a broken driver.

Thanks
   j

Jacopo Mondi (2):
  arm: dts: genmai: Configure RIIC2 pins
  pinctrl: rz-pfc: Fix RZ/A1 pin function configuration

 arch/arm/boot/dts/r7s72100-genmai.dts |  8 ++++-
 drivers/pinctrl/rz-pfc/pinctrl-rza1.c | 55 +++++++++++++++++++++++------------
 2 files changed, 43 insertions(+), 20 deletions(-)

-- 
2.7.4

