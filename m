From: Octavian Purdila <octavian.purdila@intel.com>
Subject: [PATCH v2 0/4] DLN2 fixes related to suspend/resume
Date: Tue, 16 Dec 2014 17:57:11 +0200
Message-ID: <1418745435-2851-1-git-send-email-octavian.purdila@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:28514 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750936AbaLPP5t (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 16 Dec 2014 10:57:49 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, lee.jones@linaro.org
Cc: johan@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>

This 2nd patch set addresses Johan review comments:

 * Fix an issue introduced by v1 where we can get a use after free in
   the error path of probe

 * Add start/stop RX URBs helpers

 * move the suspend/resume routines above the module device table

 * used GFP_NOIO in resume

Octavian Purdila (4):
  gpio: dln2: fix issue when an IRQ is unmasked then enabled
  gpio: dln2: use bus_sync_unlock instead of scheduling work
  mfd: dln2: add start/stop RX URBs helpers
  mfd: dln2: add suspend/resume functionality

 drivers/gpio/gpio-dln2.c | 141 +++++++++++++++++++----------------------------
 drivers/mfd/dln2.c       |  71 ++++++++++++++++++++----
 2 files changed, 117 insertions(+), 95 deletions(-)

-- 
1.9.1

