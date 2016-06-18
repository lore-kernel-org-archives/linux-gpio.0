From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/3] tools/gpio: switch to tools buildsystem
Date: Sat, 18 Jun 2016 18:24:45 +0300
Message-ID: <1466263488-94457-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:44449 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751343AbcFRPYy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 18 Jun 2016 11:24:54 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Current environment is not allowed to easily build the tools.
Move to tools buildsystem to allow user build gpio tools using only existing
kernel sources. Besides that support O=/path/to/build/dir option.

In v2:
- remove $(Q) for now for shell commands
- add cover letter

Andy Shevchenko (3):
  tools/gpio: remove old Makefile
  tools/gpio: move to tools buildsystem
  tools/gpio: add install section

 tools/Makefile      |  7 +++--
 tools/gpio/Build    |  3 ++
 tools/gpio/Makefile | 85 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 84 insertions(+), 11 deletions(-)
 create mode 100644 tools/gpio/Build

-- 
2.8.1

