From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] pinctrl: gemini: Fix GMAC groups
Date: Mon, 13 Nov 2017 14:42:23 +0300
Message-ID: <20171113111357.4nxo7cgawpwdhkoq@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:32027 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752493AbdKMLmh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Nov 2017 06:42:37 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org

Hello Linus Walleij,

The patch 756a024f3983: "pinctrl: gemini: Fix GMAC groups" from Nov
6, 2017, leads to the following static checker warning:

	drivers/pinctrl/pinctrl-gemini.c:2190 gemini_pmx_set_mux()
	error: buffer overflow 'gemini_padgroups' 21 <= 26

drivers/pinctrl/pinctrl-gemini.c
  2180          /* Print changed states */
  2181          tmp = grp->mask;
  2182          for_each_set_bit(i, &tmp, PADS_MAXBIT) {
                                          ^^^^^^^^^^^
We boosted this from 20 to 27

  2183                  bool enabled = !(i > 3);
  2184  
  2185                  /* Did not go low though it should */
  2186                  if (after & BIT(i)) {
  2187                          dev_err(pmx->dev,
  2188                                  "pin group %s could not be %s: "
  2189                                  "probably a hardware limitation\n",
  2190                                  gemini_padgroups[i],
                                        ^^^^^^^^^^^^^^^^^^^
so we need to add more strings to this array as well.

  2191                                  enabled ? "enabled" : "disabled");
  2192                          dev_err(pmx->dev,
  2193                                  "GLOBAL MISC CTRL before: %08x, after %08x, expected %08x\n",
  2194                                  before, after, expected);
  2195                  } else {
  2196                          dev_info(pmx->dev,
  2197                                   "padgroup %s %s\n",
  2198                                   gemini_padgroups[i],
  2199                                   enabled ? "enabled" : "disabled");
  2200                  }
  2201          }
  2202  

regards,
dan carpenter
