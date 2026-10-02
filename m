Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5019B3B83F9;
	Fri,  2 Oct 2026 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933821; cv=none; b=U3Ko+i4NnMoq+S2/+wLUuYv0eD3WXSlUpI8OJ62tKaiwcP4lriu+aNl7fcKl8ZNS2QJokXixhYkd2Wy8VWB3RMpibfFm/uALE4MLWqlq80CC8J7CymcePrTxC2jus0tFPlG/p757RBTbZNAkfHzl0FdtfLf4BLB2SYhsSPnTYg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933821; c=relaxed/simple;
	bh=wxPxDzf60NfDkRRwcf/rD6BY9TZOdvJTYEIsqJGwCh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkYEMhxrnnnl0ttjyAldwuv+v8U/DZFQK7NIJtbeVjlaaYy2QFrqyQdJF4sBBL+WuOnaZgdpBy71tYyl3xASedUVii0FrBBkOziz9dXM7bPtFdyf4KvGE72RLReB/U8uDXIMtvrmA289BFJNIaP3tDf/jXVOh5qd7ADR2WVjJAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ss2uvRC3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ss2uvRC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DD61F00898;
	Fri,  2 Oct 2026 09:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790933820;
	bh=C91pYmqwoCPj5ds5y0XPr6mBfKnGNebX4Pwv2DLP2PQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ss2uvRC37JZSY1BrSGhwbaQsoLYNu6MWmjNlyNFcLJqqsepxnoMw2ddT8G33PwmE9
	 zY+Egi6u5jDQnOd3tmvjHzeqIpWVok9ypfnLVx3MMOqKasAa8kPe2rWcqOEzVnuUjj
	 xwzvPOSICzD9MgKaG873G8LBIZggqLzpPb14U23TFF7m/sh/WU9wPInsLKfEsd/SgY
	 qmdWjKtkbCarXAeu/Y2ztNBsmaMK+BPAw5vilj/1fNBMWTpMZBLLGIv1mkNxbVXq6j
	 nsL59JUuW6vZk2cR8k4iKjZ5askx7l0KHxMAOsZMuPrkDHDmMzd9wVO0oGOsRBoN54
	 Nn58CQju/sGqA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 02 Oct 2026 10:36:32 +0100
Subject: [PATCH 3/4] pinctrl: imx: Match the standard SCMI pinctrl device
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-scmi_bus_fixes-v1-3-8695cbab3fe7@kernel.org>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
In-Reply-To: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@oss.nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev
X-Mailer: b4 0.16.0

Use the standard "pinctrl" SCMI device name instead of the i.MX-specific
"pinctrl-imx" name. Standard devices no longer have exclusive request
tracking, so the i.MX and generic pinctrl drivers can register for the
same protocol/name pair. Their probe checks select the appropriate
driver for the platform.

This solves the issue that occurs when both "pinmux" and "pinmux-imx"
devices that share the same fwnode as only the first device registered
is assigned as the owner of the fwnode. If this owner device fails to
probe (e.g., its driver is blocklisted or missing), it never reaches
the driver_bound() stage and the system skips cleaning up its supplier
links. Even if a alternative device binds successfully, the system
still looks to the broken original owner. As a result, all dependent
hardware components (I2C, SPI, UART, USB, MMC, PCIe) defer probing
forever, halting the boot process.

Note that the solution doesn't support same fwnode being shared by
multiple devices and associated fw_devlink feature.

Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: NXP S32 Linux Team <s32@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: imx@lists.linux.dev
Reported-by: Peng Fan <peng.fan@oss.nxp.com>
Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 613552e35070..b259a526ccc1 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -354,7 +354,7 @@ static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 }
 
 static const struct scmi_device_id scmi_id_table[] = {
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
 	{ }
 };
 MODULE_DEVICE_TABLE(scmi, scmi_id_table);

-- 
2.43.0

