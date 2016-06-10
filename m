From: Dan O'Donovan <dan@emutex.com>
Subject: [PATCH v2 0/3] pinctrl: cherryview: fixes and enhancements
Date: Fri, 10 Jun 2016 13:23:33 +0100
Message-ID: <1465561416-29732-1-git-send-email-dan@emutex.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:32856 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932826AbcFJMWQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 10 Jun 2016 08:22:16 -0400
In-Reply-To: <1464904543-4094-1-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, linus.walleij@linaro.org
Cc: heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Dan O'Donovan <dan@emutex.com>

This series includes a number of fixes and enhancements for the
Cherryview pinctrl/gpio driver, developed during integration on the
UP Board (based on the Intel X5-Z8350 "Cherry Trail" Atom SoC).

Patch 1 provides a workaround for a documented silicon bug which
causes data corruption of concurrent accesses to the GPIO controller
registers on this SoC.

The other patches implement additional pin config functions/options
for this driver.

Changes since v1:
 * Addressed review comments from Mika Westerberg:
   - Drop clean-up of checkpatch warnings (impacts back-porting)
   - Re-order series to put fixes ahead of enhancements
   - Rename a variable
   - Tag concurrency fix (patch 1) for stable
   - Drop fix restoring PADCTRL1 bits when GPIO disabled (rejected)

Dan O'Donovan (3):
  pinctrl: cherryview: prevent concurrent access to GPIO controllers
  pinctrl: cherryview: add option to set open-drain pin config
  pinctrl: cherryview: add handlers for pin_config_group_get/set

 drivers/pinctrl/intel/pinctrl-cherryview.c | 155 ++++++++++++++++++++++-------
 1 file changed, 119 insertions(+), 36 deletions(-)

-- 
2.1.4

