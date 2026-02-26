Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D382C17A0;
	Thu, 26 Feb 2026 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101034; cv=none; b=LuAZkSUYbeHcuRnErN/yJdA5KgA5S1VokkEITa1fczOfL7cdhhp1d9b7vv5sFTMTWOpqOfgRIRyeyhc9GKuiKamRnJp6se2xw62R38yf13z+aw/eyYfqC6Tp1KCkP/+I4acZtRJ1ib+mCLnyTbCAJlJZp4//VpfrSlkw3zP0G+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101034; c=relaxed/simple;
	bh=DLY/DcLVK5pTmcniy4IqdW38U35cg928LgsYJWBycvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kqbdE99t5ZwTkCYd4Hd/Qpz0bQioZS/Q50fQ55NrM3hY5SXrn+EHCxZJPlU8kukOozAWjaxYcH6QZtPKpa9A8FRRmskKXQkXOxGf7eohZP4XPJUIGlmlMaW+sDrjTdOHqad4eejnW+5eTcXqlin126APnJ+HTyI46Ow0pXP4uEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607FBC19422;
	Thu, 26 Feb 2026 10:17:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: imx: PINCTRL_IMX_SCMI should depend on ARCH_MXC
Date: Thu, 26 Feb 2026 11:17:04 +0100
Message-ID: <8ecad26c23ba35741f167b3753cd19e72c33c0b4.1772100926.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i.MX95 SCMI firmware is only present on NXP i.MX94 and i.MX95 SoCs.
Hence add a dependency on ARCH_MXC, to prevent asking the user about
this driver when configuring a kernel without NXP i.MX SoC family
support.

Fixes: b755521fd6eb22ac ("pinctrl: imx: support SCMI pinctrl protocol for i.MX95")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/freescale/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 8d24decd3f074ece..64ca014ebfc17dfb 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -10,6 +10,7 @@ config PINCTRL_IMX
 config PINCTRL_IMX_SCMI
 	tristate "i.MX95 pinctrl driver using SCMI protocol interface"
 	depends on ARM_SCMI_PROTOCOL && OF
+	depends on ARCH_MXC || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
-- 
2.43.0

