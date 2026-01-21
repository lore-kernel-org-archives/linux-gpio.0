Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A0E2DF13D;
	Wed, 21 Jan 2026 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005258; cv=none; b=VtoXe+lcQTUvweb4I9zcSOGiyrGGeJ/VfVEHyRX2PImYosjRaSNygTaMS595DNxM2pUBPMEG3A/e5YLV8qQe3WMQgw74TKsHgWFzuFmdqAftxInSKdu4U4HTW94+Cziy+vqZYvuWD5EcI9FWtq6RBZEgWkY7lFQWWTu1F2ShBsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005258; c=relaxed/simple;
	bh=jeXEgpP+V9qFmcpgwhBun21iImEiA4QYpWK+iPST8oY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POGyKY6S/OMx0cWfg3VeYXWg6/KuR79pv1rJp1ddYhA3exjXFB3B18tmPApIarYZIfmIB3AIZIGV3CmamJN2AeKZxPQ9G/Xt6fVnWX3NJ7QBpro1nHS99DK7x/FQJRChj5ksctLU/trbv1dO6bhicPfYPddk2UfHDKLpp1AB8kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQIsxrqH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQIsxrqH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB22C116D0;
	Wed, 21 Jan 2026 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769005257;
	bh=jeXEgpP+V9qFmcpgwhBun21iImEiA4QYpWK+iPST8oY=;
	h=From:To:Cc:Subject:Date:From;
	b=cQIsxrqH1U0dsS9PCEKkOM5Gek7TfdO1z4VzudwuizC4ywmQzcotq+A9ztr0rH6lA
	 CYp8+0Br6pJ5MpfDGU6ygt9ayyIstPao9MmexDdh32ubLqvNL2T+Bg09qGxKT3499o
	 FeBaKhL+RXIQy5/hb1MAHzBNaryyqrCD2gWwM8qDxL+uYtRMd3J6tpEICAM9Q72JtN
	 LU8RjLsIR+rDI7E4VU6KQJ7RxNBu0iXJnhO2TuNuLgIrAEg4Kyf/cq1AzbqYGz52pP
	 h0bIZVIbTF3brY0Dg1etlWDt9th0YSpEN6gTOwQsdz4wb3IW82xyC92MZzsAe4KoV3
	 Scr0egsL8TnNQ==
From: Shawn Guo <shawnguo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer
Date: Wed, 21 Jan 2026 22:20:47 +0800
Message-ID: <20260121142047.10887-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shawn is no longer interested in maintaining i.MX platform, and would like
to step down.  On the other hand, Frank seems to be the best successor
for this role.

 - He has been one of the most outstanding contributors to i.MX platform
   in the recent years.

 - He has been actively working as a co-maintainer reviewing i.MX
   patches and keep the platform support in good shape.

 - He works for NXP and could be the bridge and coordinator between
   NXP internal developers and community contributors.

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..a294b4e952a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2745,14 +2745,14 @@ F:	arch/arm/include/asm/hardware/dec21285.h
 F:	arch/arm/mach-footbridge/
 
 ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
-M:	Shawn Guo <shawnguo@kernel.org>
+M:	Frank Li <Frank.Li@nxp.com>
 M:	Sascha Hauer <s.hauer@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 R:	Fabio Estevam <festevam@gmail.com>
 L:	imx@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
 F:	Documentation/devicetree/bindings/firmware/fsl*
 F:	Documentation/devicetree/bindings/firmware/nxp*
 F:	arch/arm/boot/dts/nxp/imx/
@@ -2767,22 +2767,22 @@ N:	mxs
 N:	\bmxc[^\d]
 
 ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE
-M:	Shawn Guo <shawnguo@kernel.org>
+M:	Frank Li <Frank.Li@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
 F:	arch/arm/boot/dts/nxp/ls/
 F:	arch/arm64/boot/dts/freescale/fsl-*
 F:	arch/arm64/boot/dts/freescale/qoriq-*
 
 ARM/FREESCALE VYBRID ARM ARCHITECTURE
-M:	Shawn Guo <shawnguo@kernel.org>
+M:	Frank Li <Frank.Li@nxp.com>
 M:	Sascha Hauer <s.hauer@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 R:	Stefan Agner <stefan@agner.ch>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
 F:	arch/arm/boot/dts/nxp/vf/
 F:	arch/arm/mach-imx/*vf610*
 
@@ -20562,7 +20562,7 @@ F:	drivers/pinctrl/pinctrl-amd.c
 PIN CONTROLLER - FREESCALE
 M:	Dong Aisheng <aisheng.dong@nxp.com>
 M:	Fabio Estevam <festevam@gmail.com>
-M:	Shawn Guo <shawnguo@kernel.org>
+M:	Frank Li <Frank.Li@nxp.com>
 M:	Jacky Bai <ping.bai@nxp.com>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 R:	NXP S32 Linux Team <s32@nxp.com>
-- 
2.43.0

