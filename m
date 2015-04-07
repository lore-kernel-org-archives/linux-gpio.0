From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V3 0/2] pinctrl: Support for IMG Pistachio
Date: Tue,  7 Apr 2015 12:44:20 -0700
Message-ID: <1428435862-14354-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f201.google.com ([209.85.220.201]:34258 "EHLO
	mail-qk0-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752472AbbDGToZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 15:44:25 -0400
Received: by qkbw1 with SMTP id w1so12266238qkb.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 12:44:24 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>

This series adds support for the system pin and GPIO controller on the IMG
Pistachio SoC.  Pistachio's system pin controller manages 99 pins, 90 of
which are MFIOs which can be muxed between multiple functions or used
as GPIOs.  The GPIO control for the 90 MFIOs is broken up into banks
of 16.  Pistachio also has a second pin controller, the RPU pin controller,
which will be supported by a future patchset through an extension to this
driver.

Tested on an IMG Pistachio BuB.  Based on mips-for-linux-next.

Changes from v2:
 - Removed module stuff that ends up being compiled out.
Changes from v1:
 - Documented pin + function generic binding.
 - Changed compatible string to "img,pistachio-system-pinctrl".
 - Addressed some review comments.
 - A couple of bug fixes.

Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Cc: James Hartley <james.hartley@imgtec.com>
Cc: James Hogan <james.hogan@imgtec.com>

Andrew Bresticker (2):
  pinctrl: Add Pistachio SoC pin control binding document
  pinctrl: Add Pistachio SoC pin control driver

 .../bindings/pinctrl/img,pistachio-pinctrl.txt     |  217 +++
 drivers/pinctrl/Kconfig                            |    6 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-pistachio.c                | 1502 ++++++++++++++++++++
 4 files changed, 1726 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-pistachio.c

-- 
2.2.0.rc0.207.ga3a616c

