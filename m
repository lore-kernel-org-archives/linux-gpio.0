From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] pinctrl: cherryview: Drop ctrlX prefix from the pin debugfs output
Date: Mon, 31 Oct 2016 16:57:34 +0200
Message-ID: <20161031145734.193016-3-mika.westerberg@linux.intel.com>
References: <20161031145734.193016-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:46335 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S943768AbcJaO5j (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 Oct 2016 10:57:39 -0400
In-Reply-To: <20161031145734.193016-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Steiner <christian.steiner@outlook.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Printing the prefix does not provide any additional information. In
addition this makes the output look more consistent with pinctrl-intel.c.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index c43b1e9a06af..5e66860a5e67 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -762,7 +762,7 @@ static void chv_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 		seq_printf(s, "mode %d ", mode);
 	}
 
-	seq_printf(s, "ctrl0 0x%08x ctrl1 0x%08x", ctrl0, ctrl1);
+	seq_printf(s, "0x%08x 0x%08x", ctrl0, ctrl1);
 
 	if (locked)
 		seq_puts(s, " [LOCKED]");
-- 
2.9.3

