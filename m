From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 00/10] pinctrl: freescale: Fine-tuning for ten function
 implementations
Date: Fri, 14 Apr 2017 11:00:20 +0200
Message-ID: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:54936 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753125AbdDNJAn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Apr 2017 05:00:43 -0400
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Gary Bisson <gary.bisson@boundarydevices.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Apr 2017 10:45:43 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (10):
  imx: Use kmalloc_array() in imx_dt_node_to_map()
  imx: Use devm_kcalloc() in two functions
  imx: Return directly after a failed devm_kcalloc() in imx_pinctrl_parse_functions()
  imx: Improve another size determination in imx_pinctrl_parse_functions()
  imx: Use devm_kmalloc_array() in imx_pinctrl_probe()
  imx: Use seq_putc() in imx_pinconf_group_dbg_show()
  imx: Use seq_puts() in imx_pinconf_dbg_show()
  imx1-core: Use kmalloc_array() in imx_dt_node_to_map()
  mxs: Use devm_kcalloc() in two functions
  mxs: Use kcalloc() in mxs_dt_node_to_map()

 drivers/pinctrl/freescale/pinctrl-imx.c       | 31 +++++++++++++++------------
 drivers/pinctrl/freescale/pinctrl-imx1-core.c |  2 +-
 drivers/pinctrl/freescale/pinctrl-mxs.c       | 13 +++++------
 3 files changed, 25 insertions(+), 21 deletions(-)

-- 
2.12.2

