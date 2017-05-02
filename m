From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/9] pinctrl: Fine-tuning for some function implementations
Date: Tue, 2 May 2017 11:20:48 +0200
Message-ID: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:61610 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751188AbdEBJU5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 May 2017 05:20:57 -0400
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 May 2017 11:16:54 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (9):
  Use seq_putc() in three functions
  Combine two seq_puts() calls into one call in two functions
  Combine five seq_printf() calls into one call in pinconf_dbg_config_print()
  Replace two seq_printf() calls by seq_puts() in pinconf_show_map()
  Adjust five checks for null pointers
  Combine substrings for a message in pin_config_group_get()
  Add spaces for better code readability
  core: Use seq_putc() in pinctrl_maps_show()
  core: Adjust nine checks for null pointers

 drivers/pinctrl/core.c    | 20 ++++++++--------
 drivers/pinctrl/pinconf.c | 61 ++++++++++++++++++++++++-----------------------
 2 files changed, 41 insertions(+), 40 deletions(-)

-- 
2.12.2

