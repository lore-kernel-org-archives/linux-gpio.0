Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BE4377EDE;
	Thu,  5 Mar 2026 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701518; cv=none; b=CvGTvSfniESg/AVP/or6kv/kt47INMrpIMX+5SsyT7fxVlSTp1IAQoQvlAxbMeuhxBM7TnmCTpQ72ujHWGzbSD+Zh0Np5hUsmHd3ePXqeCXx9JB8ADx5exElnHoQgUUZ5S+eOTwePlpzp0TucmW7R0tRxtVGU5DbW399yrock3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701518; c=relaxed/simple;
	bh=N8fts9LMnCE1UC5jbqujvOELhIZP25Ky0sIJSBG71kQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDBsKhfD7XfsbLNmGeVDFpxAJIvYxnwG4yEIyQaniQOtaQBhysWDfFbeP9s9q8+pIyccj68PuA3nmk7PTQqEn0PX+YEr1liAJhiqtZasexbDErRDanJgQ11+7ZaaZ7yUQNFBBlIdu4Wy5gUUHh9JATzNo34ovHKPwEOejJl5A2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA162C19425;
	Thu,  5 Mar 2026 09:05:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] pinctrl: imx: PINCTRL_IMX_SCMI should depend on ARCH_MXC
Date: Thu,  5 Mar 2026 10:05:12 +0100
Message-ID: <d5aff6931bbc95a16f049163c682ad08d1f0f04b.1772701307.git.geert+renesas@glider.be>
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

While at it, relax the dependencies on ARM_SCMI_PROTOCOL and OF when
compile-testing.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop Fixes tag,
  - Relax dependencies on ARM_SCMI_PROTOCOL and OF when compile-testing.
---
 drivers/pinctrl/freescale/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 8d24decd3f074ece..fd53cf5bb843dfaf 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -9,7 +9,7 @@ config PINCTRL_IMX
 
 config PINCTRL_IMX_SCMI
 	tristate "i.MX95 pinctrl driver using SCMI protocol interface"
-	depends on ARM_SCMI_PROTOCOL && OF
+	depends on (ARM_SCMI_PROTOCOL && OF && ARCH_MXC) || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
-- 
2.43.0

