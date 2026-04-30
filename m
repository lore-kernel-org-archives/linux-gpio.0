Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504902E7657;
	Thu, 30 Apr 2026 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562693; cv=none; b=Y09wYv9QvSmKTyzLPDoo3EoM6Z5gD/2Z4gh5Omg2E2INK88NhTvAldJtMTIOKaidMJ9BHwWnYJ61o1ppShd2YazQWH4IeyMeVmvKwBuWyqMK22/JjuT7pJAbN5rQx7AZtgKrc/ehnLwDvNKykbwcNB1O5SjoS6fIpurrF+SQMjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562693; c=relaxed/simple;
	bh=Go5IO0ICsgjbSg2VRkkV0bj8rpVzNKrIIPdwX1/qHOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iRVpGdvutBZfLOMrcdgLzI9SKmTlX9fMdeCZn0xa5kxMy6LLIFdN8Gk6f0PFks7A+zSXKtg/gEFxSK+fKVwXUJqTgbayb0sngevgcfhKGldsiU9Ie62SVk2CfnFGxEawXjQtEJiCJgExazDAVRoqCBgf2OWibRc2HVH2jGZm788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A14C2BCB3;
	Thu, 30 Apr 2026 15:24:51 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: sh-pfc: Implement .pin_config_group_get() callback
Date: Thu, 30 Apr 2026 17:24:42 +0200
Message-ID: <130ce567f23fd6eef8f5fa7273480a0e3ff2d1d9.1777562482.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When reading /sys/kernel/debug/pinctrl/*.pinctrl-sh-pfc/pinconf-groups
while CONFIG_DEBUG_PINCTRL is enabled, the user is confronted with a
seemlingly endless stream of identical messages on the console:

    sh-pfc e6060000.pinctrl: cannot get configuration for pin group, missing group config get function in driver

Fix this by implementing the sh_pfc_pinconf_ops.pin_config_group_get()
callback.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on R-Car M2-W, R-Car H3 ES2.0, and R-Car V4M (more to follow).
To be queued in renesas-pinctrl for v7.2.

 drivers/pinctrl/renesas/pinctrl.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 3a742f74ecd1dcdf..8585ed4bcfe0961d 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -719,6 +719,30 @@ static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
 	return 0;
 }
 
+static int sh_pfc_pinconf_group_get(struct pinctrl_dev *pctldev,
+				    unsigned int group, unsigned long *config)
+{
+	struct sh_pfc_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
+	const unsigned int *pins = pmx->pfc->info->groups[group].pins;
+	unsigned int num_pins = pmx->pfc->info->groups[group].nr_pins;
+	unsigned long prev_config = 0;
+	int ret;
+
+	for (unsigned int i = 0; i < num_pins; ++i) {
+		ret = sh_pfc_pinconf_get(pctldev, pins[i], config);
+		if (ret)
+			return ret;
+
+		/* configs should match for all pins in the group */
+		if (i && prev_config != *config)
+			return -ENOTSUPP;
+
+		prev_config = *config;
+	}
+
+	return 0;
+}
+
 static int sh_pfc_pinconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 				    unsigned long *configs,
 				    unsigned num_configs)
@@ -745,6 +769,7 @@ static const struct pinconf_ops sh_pfc_pinconf_ops = {
 	.is_generic			= true,
 	.pin_config_get			= sh_pfc_pinconf_get,
 	.pin_config_set			= sh_pfc_pinconf_set,
+	.pin_config_group_get		= sh_pfc_pinconf_group_get,
 	.pin_config_group_set		= sh_pfc_pinconf_group_set,
 	.pin_config_config_dbg_show	= pinconf_generic_dump_config,
 };
-- 
2.43.0

