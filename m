From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 0/2] tools/gpio: switch to tools buildsystem
Date: Sun, 19 Jun 2016 23:41:10 +0300
Message-ID: <1466368872-99495-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:41011 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751630AbcFSUlQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 19 Jun 2016 16:41:16 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Current environment is not allowed to easily build the tools.
Move to tools buildsystem to allow user build gpio tools using only existing
kernel sources. Besides that support O=/path/to/build/dir option.

In v3:
- fold patch 1 & 2 (Alexandre Courbot)
- add CROSS_COMPILE prefix to ld (Alexandre Courbot)
- move definition of bindir to last patch

In v2:
- remove $(Q) for now for shell commands
- add cover letter

Andy Shevchenko (2):
  tools/gpio: move to tools buildsystem
  tools/gpio: add install section

 tools/Makefile      |  7 ++---
 tools/gpio/Build    |  3 +++
 tools/gpio/Makefile | 77 +++++++++++++++++++++++++++++++++++++++++++++++------
 3 files changed, 76 insertions(+), 11 deletions(-)
 create mode 100644 tools/gpio/Build

-- 
2.8.1

