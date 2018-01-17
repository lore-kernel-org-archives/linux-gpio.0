From: kbuild test robot <fengguang.wu@intel.com>
Subject: [gpio:devel 68/75] drivers/gpio/gpio-stmpe.c:201:2-3: Unneeded
 semicolon
Date: Wed, 17 Jan 2018 10:34:05 +0800
Message-ID: <201801171059.dszJh8JT%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:17948 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750846AbeAQCez (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jan 2018 21:34:55 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Patrice Chotard <patrice.chotard@st.com>
Cc: kbuild-all@01.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre TORGUE <alexandre.torgue@st.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git devel
head:   c187aa4e21c3b2ffd13d7117baee722b7435244f
commit: bb628176dbc5e84ce958f609bbd42ae859b39d07 [68/75] gpio: stmpe: i2c transfer are forbiden in atomic context


coccinelle warnings: (new ones prefixed by >>)

>> drivers/gpio/gpio-stmpe.c:201:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
