From: kbuild test robot <fengguang.wu@intel.com>
Subject: [PATCH pinctrl] pinctrl: pinconf: pinconf_show_config() can be static
Date: Fri, 17 Jul 2015 21:37:09 +0800
Message-ID: <20150717133709.GA122054@snb>
References: <201507172143.e7QtgNrM%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:41045 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753385AbbGQNhj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 17 Jul 2015 09:37:39 -0400
Content-Disposition: inline
In-Reply-To: <201507172143.e7QtgNrM%fengguang.wu@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: kbuild-all@01.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org


Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 pinconf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index cbf26a6..078e58d 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -202,7 +202,7 @@ int pinconf_apply_setting(struct pinctrl_setting const *setting)
 
 #ifdef CONFIG_DEBUG_FS
 
-void pinconf_show_config(struct seq_file *s, struct pinctrl_dev *pctldev,
+static void pinconf_show_config(struct seq_file *s, struct pinctrl_dev *pctldev,
 		      unsigned long *configs, unsigned num_configs)
 {
 	const struct pinconf_ops *confops;
