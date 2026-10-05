Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338946AF08;
	Mon,  5 Oct 2026 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194008; cv=none; b=O/QhpPGrl6l6yL83fxdQME0mwdNyr86/UY3x79BPsTHhusgPbVHq0XwX2oj+FySXvC27LraZqoZd0PmMjGeX5xAPnHy/JpVNZxjKNC0HXYVyOB0dzvzbPDU8t8oqdRCS85kKSVyLKgOdPQ5lRILr5CfXrWeGPWHJC7ppmiDYCU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194008; c=relaxed/simple;
	bh=LNqzIQN12+KevA3Fefu7eyIahVYCN1xTaJ2lsyhNSfA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F9EFxVePoCHT3Sm4fuxKmbwGIbLh6N25xuDBHH6H132DfLXKJbTOZZlTwaEIBPuVKpQRs1Bk2TuMTFjopZJs1yB6mcIMy4BIC4F2xFuUt30u6c7PZZmwCwVJ0mzxu7HarrHx7d32PuoodsbzO8kV8Vn+9GvpPczYSKVIj0cb3aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4PK+X+X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4PK+X+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970491F000FF;
	Mon,  5 Oct 2026 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791194006;
	bh=aUTU86Aq6p6cPLwOLgflfpEbmUAAgBX3kPIXjRKq4JM=;
	h=From:Subject:Date:To:Cc;
	b=n4PK+X+XI3hb7SFrCgZwZnhcnmMEzeBBY4a5oZOM/IAaW/oTL4P/+8cUcGRWRq6Lu
	 vRjT8noThGv7CC4zPqk5O/KxBqx6Xr0dwhc215sK0VPc7EzQaCK1t1NUaiDMLXNA3O
	 lm+kuIHjQE2sLN7B/LBalyTbn36LdnHYxqcv4RPMinJl0iFrFD4BvdxZ2uEG7cgZzg
	 jTolNDIsPorjy60cix/ix5p6hufIPt9359fB23Lq+QIPUZbmVBF//Iubm3PqqmPyUE
	 SefLhAi7xTXI5fui5IwIdIgKAkimTYCRM4yONFrxFE8V0aLrahFnffkeLzQxo31VcW
	 nZ7BOBYPRP56A==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v3 0/4] firmware: arm_scmi: Some fixes to address conflicts
 with fw_devlink
Date: Mon, 05 Oct 2026 10:53:09 +0100
Message-Id: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIhzw2oC/3WNyw6CMBBFf4V0bU0fFoor/8MY0pYB6gNMC42G8
 O+2uNEYlydzz5kZeXAWPNpnM3IQrLdDH4FvMmQ61beAbR0ZMcJySgjD3txspSdfNfYBHtNSNyB
 rbiQwFKW7g/UQnePpzX7SZzBjqqRFZ/04uOf6MdC0+xsPFBMs81IYrTRvoDhcwPVw3Q6uRake2
 KcvfnwWfb5TgnIuZSHUl78sywssqFLU/wAAAA==
X-Change-ID: 20261002-scmi_bus_fixes-19bfe8d3c8e2
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Peng’s [1] identified the problem of multiple SCMI devices sharing one
protocol fwnode. His [2] shows the consequence: the first device owns
the fwnode but does not bind, so fw_devlink can leave consumers deferred
even when another device binds successfully.

This four-patch series reduces those cases within SCMI. It prevents
protocol device creation in exclusive raw mode, stops treating core
created standard devices as driver owned requests, and makes the i.MX
pinctrl driver match the standard `pinctrl` device instead of creating
a second device for the same fwnode. It also omits the `perf` device
when the firmware node does not describe a performance domain provider,
without changing `cpufreq` device creation. IIO/HWMON don't have any
fw_devlink dependency and having two devices shouldn't be an issue.

These changes address the SCMI cases above; they do not provide a
general driver core solution for devices that share a fwnode.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

[1] https://lore.kernel.org/all/20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com
[2] https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com

---
Changes in v3:
- Removed a redundant check when creating requested SCMI devices: standard
  protocol/name pairs are no longer recorded as requests, so they cannot
  appear in this list. No functional change - reported by sashiko
  https://sashiko.dev/#/message/20261005091843.13F271F000FF%40smtp.kernel.org
- Link to v2: https://patch.msgid.link/20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org

Changes in v2:
- Dropped "pinctrl-imx" from scmi_std_id_table array correctly this time.
- Updated the trailers received so far(Thanks Peng Fan and Hans de Goede)
- Link to v1: https://patch.msgid.link/20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org

---
Sudeep Holla (4):
      firmware: arm_scmi: Avoid protocol devices in exclusive raw mode
      firmware: arm_scmi: Skip requests for standard protocol devices
      pinctrl: imx: Match the standard SCMI pinctrl device
      firmware: arm_scmi: Skip unused performance-domain devices

 drivers/firmware/arm_scmi/bus.c              | 110 ++++++++++++++++-----------
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c |   2 +-
 2 files changed, 67 insertions(+), 45 deletions(-)
---
base-commit: aac4e67d6eb93118cfa70c6562b5f9c81a7042ef
change-id: 20261002-scmi_bus_fixes-19bfe8d3c8e2


-- 
Regards,
Sudeep

