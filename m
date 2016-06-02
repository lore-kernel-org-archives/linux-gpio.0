From: Dan O'Donovan <dan@emutex.com>
Subject: [PATCH 0/5] pinctrl: cherryview: fixes and enhancements
Date: Thu,  2 Jun 2016 22:55:38 +0100
Message-ID: <1464904543-4094-1-git-send-email-dan@emutex.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:60782 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932788AbcFBVyT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 2 Jun 2016 17:54:19 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, linus.walleij@linaro.org
Cc: heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Dan O'Donovan <dan@emutex.com>

This series includes a number of fixes and enhancements for the
Cherryview pinctrl/gpio driver, developed during integration on the
UP Board (based on the Intel X5-Z8350 "Cherry Trail" Atom SoC).

Of particular note is a workaround for a documented silicon bug which
causes data corruption of concurrent accesses to the GPIO controller
registers on this SoC.

Other patches include clean-up of checkpatch warnings, implementation
of additional pin config functions and options, and a fix for a loss
of pin config register state that can occur when switching in and out
of GPIO pin mode.

Dan O'Donovan (5):
  pinctrl: cherryview: convert bare unsigned to unsigned int
  pinctrl: cherryview: add option to set open-drain pin config
  pinctrl: cherryview: add handlers for pin_config_group_get/set
  pinctrl: cherryview: prevent concurrent access to GPIO controllers
  pinctrl: cherryview: restore padctrl1 reg when gpio is disabled

 drivers/pinctrl/intel/pinctrl-cherryview.c | 296 +++++++++++++++++++----------
 1 file changed, 196 insertions(+), 100 deletions(-)

-- 
2.1.4

