Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D270F4766BF;
	Wed,  9 Sep 2026 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944064; cv=none; b=ecg+bnInbbCi3vBHLw/q9grykRHf0ity9R/5UA7r4af+aeIajIgv7/9kifI5xKaxbBf06VnRjFQjPqO9A1WTPk/JX3xMshqmNbxkUL8j8bIephT6m+HG/ByPV64MJxD79nW7MpPvVcP1EgbqeT2/2M9+t1D6o627XBYH/8gZen8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944064; c=relaxed/simple;
	bh=v7juKd59SdSi35ZOsN2GZkkMsxEM0IS+3BbA2yQhJ6Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jj+4009mtgrRx08oo1XLbKyrs+6Tx3cAPbtZlpnn2Nvst2cu1fZaBQrGJFwOevIhcWxeHNMDilFC9wkQpYZkV32IANd7C4r7ty/rMmw9Xwevx2v3x1TZNn9i+9/1E8ZNCOSRCpLPZJ383P3AHD13DHxN+8CFVaS/4FIKnafRShM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: alvin.sipraga@analog.com
X-PTX-Original-Recipient: linusw@kernel.org
X-PTX-Original-Recipient: conor+dt@kernel.org
X-PTX-Original-Recipient: sboyd@kernel.org
X-PTX-Original-Recipient: krzk@kernel.org
X-PTX-Original-Recipient: robh@kernel.org
X-PTX-Original-Recipient: krzk+dt@kernel.org
X-PTX-Original-Recipient: mturquette@baylibre.com
X-PTX-Original-Recipient: devicetree@vger.kernel.org
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.hauer@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BC29B201B5A;
	Wed, 09 Sep 2026 10:54:12 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1x4E4K-0003in-21;
	Wed, 09 Sep 2026 10:54:12 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1x4E4K-00000006WeY-2Edz;
	Wed, 09 Sep 2026 10:54:12 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v8 0/2] clk: add support for TI CDCE6214
Date: Wed, 09 Sep 2026 10:54:06 +0200
Message-Id: <20260909-clk-cdce6214-v8-0-4dfa355c1f65@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK4eoWoC/3XQy07DMBCF4VepvMZoPL6z4j0QC1/GrQVKqqRER
 VXeHacLGoWwPCPNt/hvbKSh0sheDjc20FTH2ndtuKcDS6fQHYnX3DZDQA0KHE+fHzzlRAaF4pC
 sAiVzQmNZezkPVOr1zr29t32q46Ufvu/6JJbrP9AkOPCYFVnwGLwor2fqjl+Xoe/q9TkTW7QJ1
 4LfCNgEBRF1tIiU4q4gV4KAjSCbkK1MxZcis4NdQa0EuRVaEe6L0GQFmpDMrqAfghHbDnoRvHT
 RUYbo1a5gHoIHuRHMUhJTgmAKOtzvYH8FASA2gm2CLi4qlYPXQf8R5nn+Afnv40c5AgAA
X-Change-ID: 20250408-clk-cdce6214-0c74043dc267
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 linux-gpio@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788944052; l=4045;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=v7juKd59SdSi35ZOsN2GZkkMsxEM0IS+3BbA2yQhJ6Y=;
 b=zPzUM48IcQklErQpH4X2rhJ/tq2QDVgTFdHSO42f5Ldlej0IwlQunrMpWsjR4iAcDVoTzJ5xv
 YtXkir2ZWm3D9oBLh1nG0q5y7YWCU+IAcLI6ywHzBuhUddNfggke60c
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
Differential Outputs, Two Inputs, and Internal EEPROM.

This series adds a common clk framework driver for this chip along with
the dt-bindings document. The cdce6214 needs several pins to be
configured for different input/output modes which are abstracted with a
pinctrl driver.

Only changes to v7 are Reviewed-by tags added to the binding patch and
rebase to v7.3-rc2

Sascha

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v8:
- Add reviewed-by tags to binding patch
- Link to v7: https://lore.kernel.org/r/20251001-clk-cdce6214-v7-0-5f8b44da95a5@pengutronix.de

Changes in v7:
- add missing blank line between properties in binding (Rob)
- drop unnecessary #size-cells #address-cells in binding (Rob)
- add vendor prefix to custom properties (Rob)
- Use standard units where appropriate (Rob)
- add dependency to PINCTRL and select GENERIC_PINCONF (0day bot)
- re-add missing SPDX in ti,cdce6214.h
- Link to v6: https://lore.kernel.org/r/20250903-clk-cdce6214-v6-0-b2cc0a6f282b@pengutronix.de

Changes in v6:
- merge split up patches back together (forgot to mention when sending v6)
- use pinctrl subsystem to configure pins
- Link to v5: https://lore.kernel.org/r/20250618-clk-cdce6214-v5-0-9938b8ed0b94@pengutronix.de

Changes in v5:
- Reword commit message for binding patch (Krzysztof)
- Make clock binding yaml simpler (Krzysztof)
- add link to datasheet to driver code (Stephen)
- Drop inclusion of linux/clk.h (Stephen)
- Add missing #include <linux/bitfield.h> (Kernel test robot)
- simplify cdce6214_clk_out0_get_parent() (Stephen)
- Use divider_get_val() where appropriate (Stephen)
- Add Rxx defines for registers (Stephen)
- Add define for magic value 24 (Stephen)
- introduce and use cdce6214_clk_psx_mask() (Stephen)
- Use clamp() instead of open code (Stephen)
- declare const arrays const (Stephen)
- more use of dev_err_probe() (Stephen)
- use determine_rate() instead of round_rate (Stephen)
- split out pin configuration to separate patches
- Link to v4: https://lore.kernel.org/r/20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de

Changes in v4:
- add missing '>' modifier in include/dt-bindings/clock/ti,cdce6214.h
- fix clocks maxItems should be 2
- add missing license in include/dt-bindings/clock/ti,cdce6214.h
- Fix checkpatch issues
- Link to v3: https://lore.kernel.org/r/20250410-clk-cdce6214-v3-0-d73cf9ff3d80@pengutronix.de

Changes in v3:
- Use string properties instead of int for enums
- Use units from property-units in dtschema
- Link to v2: https://lore.kernel.org/r/20250409-clk-cdce6214-v2-0-40b25b722ecb@pengutronix.de

Changes in v2:
- Use consistent quotes in binding document
- make clock-names an enum to make each clock fully optional
- drop '|' in binding description where not needed
- encode clock input mode into integer
- encode clock output mode into integer
- do not use defines for reg properties
- support setting load capacity for the oscillator via device tree
- support setting Bias current for the oscillator via device tree
- support setting polarities of CMOS outputs via device tree
- fix compatible string in driver
- remove unused struct cdce6214_config
- Link to v1: https://lore.kernel.org/r/20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de

---
Sascha Hauer (2):
      dt-bindings: clock: add TI CDCE6214 binding
      clk: add TI CDCE6214 clock driver

 .../devicetree/bindings/clock/ti,cdce6214.yaml     |  192 +++
 drivers/clk/Kconfig                                |    9 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-cdce6214.c                         | 1620 ++++++++++++++++++++
 include/dt-bindings/clock/ti,cdce6214.h            |   25 +
 5 files changed, 1847 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20250408-clk-cdce6214-0c74043dc267

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

