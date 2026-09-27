Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441113806DA
	for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521863; cv=none; b=u+qyxZ0lQFs87Kw/95OCZYSMWQcprkKenEVeHzJhEWKGvriyTiFrK7j7lp6gyTZ7mLAgDfuVA1Q5ljHw9ljcOp7HERi8UfMY+B/RkxTDFEVy8FLa3yXXjPSQ15ZJm9qJepZPcnWwlQEGA3fXzCYN3owlA2GE1YXDUEU3BHeVohs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521863; c=relaxed/simple;
	bh=PUxQWVb7GawpwSubmFAbFA2TUxRXX1OHgxmy1E0FpUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/GzElurBDjYKcbDaM5qqV/qf2KgI5rq3FmjsHD8DzJ39SW4vQ4uT7Rm/GfohWT1rBn7MN3BTGr5cB7bEwKAv4Srk+gId+QOP6pNkY9RVb7ACgt3eRz5DLAnT2EMMT+irNgEezFutJeAeDE3Mj6dPdfFJNTRxk/r6LFXS2S+Qqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QC5+sJK5; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QC5+sJK5"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so1217562f8f.3
        for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521859; x=1791126659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iq7QY59go/yg3a2RnQSLtv6/NhXKFuv9l2HYC5eUWJQ=;
        b=QC5+sJK5n18MRSy0gbMYDPh62yU99Jwe1eFfkesLAh6UE77jfibR5+i5hwdWX82xN7
         lLZfb/qQn738zicqYFtvgrus/dVHHO+pvVWIwOVZ7DcE1tX0uTkL4mwZvXBmK8k78Jqq
         Dncbfc4O5O/oSu5GqqlLR4lLSJoQWg5BoN44u1z2i+UHQ1D8/DxLZraatSATcGqAZhCK
         vdPLlxvjS3/3t8xflNHwMuf+mX/GS10pMP5oJHrCZc6uh4cSiIvwX3yDATpjnP4bPsjM
         WSs3An3MNwHN6KgSq0PEUANDFQmA1/f1lDo2So5ysQyRuE0n7/3m8p6+Pvz/n72gtxLa
         yJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521859; x=1791126659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iq7QY59go/yg3a2RnQSLtv6/NhXKFuv9l2HYC5eUWJQ=;
        b=haxUg9NOoNd0G9gzeCoGkZH2wo3s60fY0fj56ZsakhPPIM8WPaoZzgUqlplSjmqBmh
         UCOBWsAH0qqouucgQ8UbkVAKp82UZ9bQRAgSbnlm3H20ZxIhCMr5nTbkg7f3mX3c+Pb/
         DBIQgUd0YJKfBmYLzH/x2p8EFL/n2E4GN+UrHOXMq458LVQ/JB1QPFV/RoIGrNu57O60
         ScLOfk18rPBxPPFI7YHgdoi2+l9BMoeyH9uFVs7/CgtFxF+FLmriGq1br6tdPJ6Ei88C
         JmbloCxHrhXRYXA6PEqn+s5KF49rL/EThCXEA0M8PI09TwWmO3Z+tV0bekBVjq0AkeMr
         fXRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVGUOZb+aSSWhlcZPjjnIISsXao13/UR1ASPnOMOwWaHx4pLC7Uw0YdOfhEgzrgJD4JJTYmccSk10G@vger.kernel.org
X-Gm-Message-State: AFq9FYKhHL3sKURcj5gcn/OwEURuXOxy/LspqxapDlZBoAPQBHsVdQYH
	qM43nxH1gvhDTJFt7PGtLqpZmHyso5MDs0M38OTESrTSZxdeonKKBvo6yXmPAAr/RAY=
X-Gm-Gg: AYBFou2Saz4fh/mdOV6mYo8il2kMCuRqMRMIe4Pke5LHpuphxk+IgZhIWo6S7d5bs1r
	zOYdEUy/ui/12baNOVEKpZnpXijukN/Fp8C8n1yKdzCO3qjUEoRwJhpGgG5XJBb5ZUEC/yrRSoE
	o9RmW1L7b29p2hvXJC7NP6R3qqT37m/FVSSJ74Nuhn6Zj4E7l05C5g/zWMHsSA9dRJwd5fLrcwM
	XqLMaL2lKToCiFk2mMU/5GXaEMxH2ObR5gPfCpFi/frDukgSQDYV3xeKisx8bGpOFICaDsLIXqc
	0Eo15nPhvMTW13aarGkdlpx6YjbvhnXv+lsaeuhb/xB73skYZY+cndG9R/BigCa17T6hD6gzUG6
	/TAt8ooBrb8Tb7Fk6G7LMURGGG7zzB6/+Yza9QS/9XusRgLBq2BQCL5SPE9syUFnez4oQzI5eIO
	Db/gDsqrMXs9oGhR8w2anNQ0YcWKScnkyaC7395gZDGpkJXdZF43uFLePdBMrERnwirGT7SNcDx
	nGdYmOvkS28haySHzdlC4fCpxYXvFwdF9mVPVEn83s=
X-Received: by 2002:a05:6000:402a:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-4888bc1a693mr4386678f8f.39.1790521859115;
        Sun, 27 Sep 2026 08:10:59 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:10:58 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 00/11] ARM: sunxi: add Allwinner B288 and the PocketBook Verse
Date: Sun, 27 Sep 2026 16:10:05 +0100
Message-ID: <20260927151016.186493-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This series adds the CCU and pin controller drivers, the RTC,
I2C, MMC and NMI compatibles, the SoC .dtsi, and one board: the
PocketBook Verse (PB629), a 6" reader.

The B288 is closest to the A64: most of its PLLs are bit-identical.
The clock and pin descriptions come from Allwinner's BSP, cross-checked
against ccu-sun50i-a64.c. Tested on a PB629, boots to userspace.

Changes since v1:
  - Add this cover letter.
  - Drop both new bindings; add the compatibles to the existing
    allwinner,sun4i-a10-{ccu,pinctrl}.yaml instead.
  - Rewrite the pinctrl driver in the DT-provided pinmux style.

Pablo Mazzini (11):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add Allwinner B288 CCU driver
  dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
  pinctrl: sunxi: add Allwinner B288 pin controller driver
  dt-bindings: rtc: sun6i-a31: add Allwinner B288
  rtc: sun6i: add Allwinner B288 compatible
  dt-bindings: i2c: mv64xxx: add Allwinner B288
  dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
  dt-bindings: interrupt-controller: add Allwinner B288 NMI
  dt-bindings: arm: sunxi: add PocketBook Verse
  ARM: sunxi: add B288 and the PocketBook Verse board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
 .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |   2 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  23 +
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   2 +
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-b288-pocketbook-verse.dts | 122 ++++
 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 304 ++++++++
 arch/arm/mach-sunxi/sunxi.c                   |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 660 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c    |  53 ++
 drivers/rtc/rtc-sun6i.c                       |   1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  88 +++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 21 files changed, 1337 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

-- 
2.53.0

