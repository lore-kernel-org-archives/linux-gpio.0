From: David Cohen <david.a.cohen@linux.intel.com>
Subject: [PATCH 0/3] gpio-langwell: initial support for Intel Merrifield
Date: Fri,  4 Oct 2013 13:01:39 -0700
Message-ID: <1380916902-23791-1-git-send-email-david.a.cohen@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:50672 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752610Ab3JDT5o (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 4 Oct 2013 15:57:44 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>

This patch set does initial support for Intel Merrifield and does non-function
changes to make gpio-langwell more friendly to other Intel Mid SoC's.

After these initial changes are accepted, more Merrifield stuff will come :)

David Cohen (3):
  gpio: langwell: add Intel Merrifield support
  gpio: rename gpio-langwell to gpio-intel-mid
  gpio-intel-mid: update prefixes and names from langwell to intel-mid

 drivers/gpio/Kconfig          |   6 +-
 drivers/gpio/Makefile         |   2 +-
 drivers/gpio/gpio-intel-mid.c | 471 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpio-langwell.c  | 397 -----------------------------------
 4 files changed, 475 insertions(+), 401 deletions(-)
 create mode 100644 drivers/gpio/gpio-intel-mid.c
 delete mode 100644 drivers/gpio/gpio-langwell.c

-- 
1.8.4.rc3

