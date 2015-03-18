From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 0/6] pinctrl: st: Fix disparity between Pinctrl & GPIO in /sysfs
Date: Wed, 18 Mar 2015 10:51:33 +0000
Message-ID: <1426675899-19882-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:36867 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753969AbbCRKvu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 06:51:50 -0400
Received: by wixw10 with SMTP id w10so36015821wix.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2015 03:51:49 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: lee.jones@linaro.org, kernel@stlinux.com

ST's hardware differentiates between GPIO mode and Pinctrl alternate
functions.  When a pin is in GPIO mode, there are dedicated registers
to set and obtain direction status.  However, If a pin's alternate
function is in use then the direction is set and status is derived
from a bunch of syscon registers.  The issue is; until now there was
a lack of parity between the two.

Further explanation with examples can be found in the commit logs.

Karim BEN BELGACEM (1):
  ARM: STi: DT: STiH407: Fix retime pin mask for PIO5 and PIO35

Lee Jones (5):
  pinctrl: st: Introduce a 'get pin function' call
  pinctrl: st: Move st_get_pio_control() further up the source file
  pinctrl: st: Supply a GPIO get_direction() call-back
  pinctrl: st: Show correct pin direction -- even when in GPIO mode
  pinctrl: st: Display pin's function when printing pinctrl debug
    information

 arch/arm/boot/dts/stih407-pinctrl.dtsi |  2 +
 drivers/pinctrl/pinctrl-st.c           | 83 +++++++++++++++++++++++++++++-----
 2 files changed, 73 insertions(+), 12 deletions(-)

-- 
1.9.1

