From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] pinctrl: Add support for Intel Broxton SoC
Date: Wed, 21 Oct 2015 13:08:42 +0300
Message-ID: <1445422125-72075-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:44805 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932192AbbJUKJV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 21 Oct 2015 06:09:21 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

Hi,

This series adds pinctrl/GPIO support for Intel Broxton SoC. The GPIO
hardware is based on the same design already found in Intel Skylake
(Sunrisepoint PCH).

This series adds a new driver pinctrl-broxton.c which reuses the existing
Intel pinctrl core functionality and provides Broxton specific pin
configuration.

Mika Westerberg (3):
  pinctrl: intel: Add support for multiple GPIO chips sharing the interrupt
  pinctrl: intel: Allow requesting pins which are in ACPI mode as GPIOs
  pinctrl: intel: Add Intel Broxton pin controller support

 drivers/pinctrl/intel/Kconfig           |    8 +
 drivers/pinctrl/intel/Makefile          |    1 +
 drivers/pinctrl/intel/pinctrl-broxton.c | 1065 +++++++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-intel.c   |   68 +-
 4 files changed, 1123 insertions(+), 19 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-broxton.c

-- 
2.6.1

