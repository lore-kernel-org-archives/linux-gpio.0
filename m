Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44733B83F9;
	Fri,  2 Oct 2026 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933817; cv=none; b=cm7OrRi2D5nddTWZf3wAl4mkO0l8rvWzI2OrWNkLskXz2sviwCv7s4SlCE2lyoY14GnPTWBCPJCektcjaU8G3VHinvU1mUGEdbG2Rp8IFscYCLc1O6h9AKey9VvxDaf42fxmSq1u766KuGqlpZ9k9Ri+YpjMcNI7YvtMUKE6FzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933817; c=relaxed/simple;
	bh=/GfNECuJdkqXezhYinA+FNDEzAtfy42UYelDqdwBooY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jJYlNBOdst4yPGeUBe/7Vi+1+Ge+nt3cB7z0pciudZNVNXNongwXkKDF4Btxfd5eS2wv/49sdDC5Bs2JnZNghkBvS21UhWe9jOEgXOtC5v+KKawHGCFRrAqaPbVkN7oHpK6E+u5tyImJB4LeoLdgR47FhMM4z9EyYkksy0PdgoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebB/JMfz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebB/JMfz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB5C1F00893;
	Fri,  2 Oct 2026 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790933816;
	bh=2zacSBy3pWdNyxuOzW8QLLGA2yw/df9t7jn7f0sl3BI=;
	h=From:Subject:Date:To:Cc;
	b=ebB/JMfzi8Ja4MzJOV4Ds2U2MBGdex/OgXnTfGu4Yn4u/a5YGDeF982pt3dF1Hsvo
	 ClqcIi0aETsb17xAGjDrRCakq8YFio8lYwmNYZPaG10sBN6saWbVFquSJnLYB2+oCN
	 dU+AvQX6UiVn1nYr6ZgrHOwTx65ED6Fgjm7h3/V1g9JmLjqKCZSZEq5/Udm/25TNyQ
	 kXlFPx/AzNFFJUCqg0Yv3N+HKLJq6Mn1stoC6bFz5bP0VAvctHXWm/XtM9C3mB/TFZ
	 nK/hMWn9VKm/+YyG7lJZ8/3nln/iDlBu2SUEkzHmBYM41d61v0kDhpZHdRfk9pP1VH
	 RlLCEUNf+UpxA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH 0/4] firmware: arm_scmi: Some fixes to address conflicts
 with fw_devlink
Date: Fri, 02 Oct 2026 10:36:29 +0100
Message-Id: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB97v2oC/yXMUQrCMBCE4auUfTaQrCC1VylSTDLVFVol24gQc
 ndTffwY/imkSAKloSuU8BaV59rgDh2F+3W9wUhsJrZ8ctay0bDI5LNOs3ygxp39jD4eQw+mFr0
 SfkNrxsvfmv0DYdtfqNYvPvJ1JnIAAAA=
X-Change-ID: 20261002-scmi_bus_fixes-19bfe8d3c8e2
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@oss.nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev
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
Sudeep Holla (4):
      firmware: arm_scmi: Avoid protocol devices in exclusive raw mode
      firmware: arm_scmi: Skip requests for standard protocol devices
      pinctrl: imx: Match the standard SCMI pinctrl device
      firmware: arm_scmi: Skip unused performance-domain devices

 drivers/firmware/arm_scmi/bus.c              | 107 +++++++++++++++++----------
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c |   2 +-
 2 files changed, 68 insertions(+), 41 deletions(-)
---
base-commit: aac4e67d6eb93118cfa70c6562b5f9c81a7042ef
change-id: 20261002-scmi_bus_fixes-19bfe8d3c8e2


-- 
Regards,
Sudeep

