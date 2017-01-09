From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 0/3] pinctrl: sh-pfc: r7s72100: Add IO mode selection
Date: Mon,  9 Jan 2017 20:32:23 +0100
Message-ID: <1483990346-26998-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:36808 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763361AbdAITch (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2017 14:32:37 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Hello,
   sending this RFC series out as a follow up of
"[PATCH 0/3] Renesas RZ PFC and GPIO driver" patch series.

This RFC patches extend the RZ series PFC driver to support selection of pins
IO mode.

[1/3] extends the existing register settings to set all configured peripherals
groups in direct I/O mode, with input buffer and bi-direction control disabled.
As I have not been able to extensively test the functionalities enabled by
the original driver version, I cannot tell if this is a proper bug-fix, but
according to HW manual, there are few use cases for non-direct IO mode and none
of them is currently part of PFC enabled groups.

As reported by [2/3] commit message, the original driver did not allowed
selection of IO mode though PIPC, PIBC, PBDC and PM registers.
While this has not apparently been an issue for the peripherals enabled by the
above mentioned patch series, the ability to select a different IO mode is
required for some peripherals, according to v3.14 Renesas' BSP
(https://github.com/renesas-rz/linux-3.14/)
Unfortunately, extending the existing PFC driver to allow this, results in a
un-desired multiplication of possible function selector marks.

The last patch enables LVDS, which is a use case for selection of a non-direct
I/O mode.
Chris, as you have plans to work on LVDS enablement for Renesas' BSP, if you
have any time to test this settings and provide some feedback I would really
appreciate that :)

Thanks
   j

Jacopo Mondi (3):
  pinctrl: sh-pfc: r7s72100: Enable DIO mode
  pinctrl: sh-pfc: r7s72100: IO mode selection
  pinctrl: sh-pfc: r7s72100: Add LVDS pin group

 drivers/pinctrl/sh-pfc/pfc-r7s72100.c | 137 +++++++++++++++++++++++++++++-----
 1 file changed, 118 insertions(+), 19 deletions(-)

-- 
2.7.4

