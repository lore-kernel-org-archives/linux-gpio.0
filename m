Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC00428495;
	Mon,  5 Oct 2026 09:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191220; cv=none; b=KhnIJwylGjAlSPt9JQaMTjIOQGHVtbbQTyoaewk6ABpROQF7rRcWncKRzruT52Bcim9aBYiY5aQXNBgRGPHJG7bWqeFGs2my4gILe1L/eYwdrGrD8FWcpMsVpc2QGHF/KBkTDcPO3swms1jLCnZDxxjRCYum0XpKaANgk8q0Snw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191220; c=relaxed/simple;
	bh=Z4UjjnP4c2rqqazNRMisYxkWuQLGy9xyRGBsyjg/sN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aOAPAxKfNTzGkinEGQUcPBkO9E0xYMrYIJz8iMU9o2dCW00YFeBGFn7cTvKafADLXGIO7WSP8NY4vIUfBrYwgdooJ0Oev6/3TJ5IwAmDdv0arZDy2ONLpcS/yLrbm4pk8k2xTj0nzgkcXS4RREZGrKooLJSPt9ckXQ44iGllyPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLCVyhvU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLCVyhvU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9FD1F000FF;
	Mon,  5 Oct 2026 09:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791191218;
	bh=S9LLP3L3r4GfzGbBu98Bx9XvNPWkG8mpmi7bZfdLOis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fLCVyhvUW0Y6Hyh3TwXYubczgHA0pJplKACRk1toqj5MpXSNhfeRy472sDjnFJayv
	 HAsRLWfDjGw2wohTx8CaOpL3aiyHf3CrMAgREgF0M7McBOlfTeGzd1d9pHi29+L8ki
	 GrQbWtXWfNIs9SSfxl968lLIJsuTIfAOUDtVNsH98ySQ55JVOoPnvmPBOPz8+/PPhB
	 k5bc76vmM/1z9mBRcJxp2+mZXp6FAOL5Qe0u91CEkG7QaIs8O9YTWY8/jq70lxb17y
	 zTkx9PPasc/Qcwf3pfgxuig5COONhnLut0gMunougeLkT/EzVxeBL5NrauK/PveE5+
	 CI95gakIcm4ng==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:04:34 +0100
Subject: [PATCH v2 3/4] pinctrl: imx: Match the standard SCMI pinctrl
 device
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v2-3-34a51338875a@kernel.org>
References: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>
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
Reported-by: Peng Fan <peng.fan@nxp.com>
Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c              | 1 -
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 230ee9f6f1aa..6be31b5121b3 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -199,7 +199,6 @@ static const struct scmi_device_id scmi_std_id_table[] = {
 	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
 	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
 	{ },
 };
 
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

