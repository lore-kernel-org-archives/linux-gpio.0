Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823AB3537F8;
	Mon, 21 Sep 2026 06:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973411; cv=none; b=WwCnKVB578xj+X/PWiStNM4CZyHHwT9NMZsVTslbqWjwM9tPU6wmWcjPT6lUiLHXASvao90PIU7NygRoN1hOVGRcKYjPzURNJVRtLhtRIVwn1uSUBePWV45dwmQHwNtIUx1SLnkC4Dc0z2QvwxaRYgw6IjdClWTGsYuZQusohp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973411; c=relaxed/simple;
	bh=YjBCVLqCHQD3Fetjj78+6WDxGt2H4Yqkq5DkhePkbwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oyp98lprH8a+hm3i/l4ZbIykw0niIsu17zWeBs30LqA5sknUY2CjN2cZYPFMwQP7vd5r2ERDoRynY2yHzPElJ4EusvWZcp4C3ftu+UYELT1/K7q69o7GsS5l7Aa+WRAeg5PapnXXc6e+6Czj//mtxRnRNrtRnrFYiuErxCY/g28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2A902200291;
	Mon, 21 Sep 2026 08:50:00 +0200 (CEST)
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v9 0/2] clk: add support for TI CDCE6214
Date: Mon, 21 Sep 2026 08:49:58 +0200
Message-Id: <20260921-clk-cdce6214-v9-0-f2ea74fd38a2@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJbTsGoC/3XRy2rDMBAF0F8JWldlNHpn1f8oXeiZiBY72KlJC
 f73yoE2QVWXd2AOw50rmdNU0kz2uyuZ0lLmMg412KcdCUc3HBItsWaCgBIEGBo+3mmIISlkgkL
 QAgSPAZUmdeU0pVwuN+71reZjmc/j9HXTF7ZN/4EWRoH6KJIGi86y/HJKw+HzPI1DuTzHRDZtw
 UfBNgJWQYBH6TViCr4r8AeBQSPwKkTNQ7Y582igK4gHgbdCbYTazGTSDJULqivIu6BY24PcBMu
 NNymCt6IrqLtggTeC2prEEMCpjAb7PehfgQGwRtBVkNl4IaKz0smuYH4EVW9of2G2X8TsuJSBZ
 fVXWNf1G/uAMdV7AgAA
X-Change-ID: 20250408-clk-cdce6214-0c74043dc267
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 linux-gpio@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789973400; l=5660;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=YjBCVLqCHQD3Fetjj78+6WDxGt2H4Yqkq5DkhePkbwg=;
 b=bY27kLS2WhmfmwE3zATZIC589WzWGf4iVtRiZG1dJ0O1S2SyV8bROTPsjTLpuAY23lR68VzzS
 Dvbq6agy0I2B6HW2tFBLm8Uik3ssz8qmDkTGAMnHHTkvHBUT8g4aSjY
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
Differential Outputs, Two Inputs, and Internal EEPROM.

This series adds a common clk framework driver for this chip along with
the dt-bindings document. The cdce6214 needs several pins to be
configured for different input/output modes which are abstracted with a
pinctrl driver.

This version fixes several bugs found by the Sashiko AI review of v8,
see the changelog below for details. As the binding changed
non-trivially, the Reviewed-by tags are dropped.

Sascha

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v9:
- Drop Reviewed-by tags from binding patch due to non-trivial binding changes
- binding: apply per-pin constraints to ti,io-standard instead of the
  non-existent io-standard property (Sashiko)
- binding: reject 0 for ti,cmosp-mode and ti,cmosn-mode (Sashiko)
- binding: disallow duplicate clock-names (Sashiko)
- binding: fix ti,cmosp-mode description (Sashiko)
- binding: reference the pin configuration from pinctrl-0 in the example
  and sort example properties (dt-check-style --mode=strict)
- fix OUT0 parent count, reading past the parent_data array (Sashiko)
- fix OUT0 set_parent writing REF_CH_MUX instead of REFSEL_SW (Sashiko)
- fix OUT0 doubler rate calculation (Sashiko)
- fix LP-HCSL setup for OUT3 and OUT4 writing to wrong registers (Sashiko)
- fix swapped CMOS N/P bits on OUT4 (Sashiko)
- mark unused output mux input invalid instead of falling back to DT
  clock index 0 (Sashiko)
- avoid division by zero for rate 0 and orphaned parents (Sashiko)
- fix PLL rate overflow on 32-bit (Sashiko)
- allow more time for PLL lock (Sashiko)
- write PSA/PSB register value instead of relying on FIELD_PREP()
  truncation (Sashiko)
- match XO property names with binding (ti,xo-cload-femtofarads,
  ti,xo-bias-microamp)
- fix reading back IO standard of PRIREF, SECREF, OUT2 and OUT3
- fix default values of XO pinconf parameters
- drop dead denominator check in PLL set_rate
- Link to v8: https://lore.kernel.org/r/20260909-clk-cdce6214-v8-0-4dfa355c1f65@pengutronix.de

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

 .../devicetree/bindings/clock/ti,cdce6214.yaml     |  198 +++
 drivers/clk/Kconfig                                |    9 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-cdce6214.c                         | 1594 ++++++++++++++++++++
 include/dt-bindings/clock/ti,cdce6214.h            |   25 +
 5 files changed, 1827 insertions(+)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20250408-clk-cdce6214-0c74043dc267

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

