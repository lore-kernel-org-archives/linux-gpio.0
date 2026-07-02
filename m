Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A7647278A;
	Thu,  2 Jul 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982923; cv=none; b=GZyb6OamunRudTiH4DzO7wmNOeoXhV+EFtmyMaweMI4pOrpjINg2z0i4y2jOSimvPQ2wo82dcGno0B2O2JTkMKBy1nfgkbskRwAeuyeE3P41Nc9kP27x1CVqCjyLdGQps6OQ5YDTQBRazEgc+Y6GHzvkHt+NkBbmuYTMOkXEf+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982923; c=relaxed/simple;
	bh=Lv3rBhMeyd0Y/+BXZtSvwu5u5WXfB4ICmiuALzEx3ZI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hn3+u+pyYu7BQOZ9UAkFgjbH6pKBJCmAXj1t+amTrmsqymplU40qP9IzvQtb7Dpl5UCT6MmqVPgPlEJvpE6kWhq4ASfQUz93G3tF42gr1PdzYozykyJ+tepeiaa006r6XhH2HPBOUs2qXjH3ExNRp/VQXn3DBkKwOhIURinxNH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=XMA1+0XY; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="XMA1+0XY"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66291GtB41817125, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782982876; bh=gzQoeRgMOQEy5QoesyLaayJt4jwJeSCbUvLYGvtHwRg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=XMA1+0XYxo7snCCC5JU5dhYvRBi24nPfiiAsGFVisf1Lo5Fzj2EBlGQtZBI03u+1g
	 c5XF5zAN4fCqWhUi4DVw/eYvMtDm6nq4ot8l0EltVyZ+lUf+Yj1/G3DyPvasHs0JKV
	 SLWUVsXABxQYKZcQRsrEdEYGvR1ElVH/ZTSgSfHTIw0QFMpouGxa5LXy35OS6z5kcS
	 bvAjaNye6rnS4SxO58kt3snOmb0/VktR/TVOmkzFcUV4ciFIv4MeUieGfXivIBP5X6
	 mJiCO7/X3IUPH8BVJ4NHgSRaPTM8hdgAY0R0BO2y/ltmsW6Yd22W3A51B0K5MR87ix
	 E+mVscO5sGiWA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66291GtB41817125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jul 2026 17:01:16 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 2 Jul 2026 17:01:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Jul 2026 17:01:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
	<mwalle@kernel.org>, <andriy.shevchenko@intel.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
	<james.tai@realtek.com>
Subject: [PATCH v5 0/4] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Thu, 2 Jul 2026 17:01:11 +0800
Message-ID: <20260702090115.2564318-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series adds GPIO support for the Realtek DHC RTD1625 SoC.

Unlike the existing driver (gpio-rtd.c) which uses shared bank registers,
the RTD1625 features a per-pin register architecture where each GPIO line
is managed by its own dedicated 32-bit control register. This distinct
hardware design requires a new, separate driver.

Best Regards,
Yu-Chun Lin
---
Changes in v5:

Patch 3 (driver):
- Add comment for @base_offset.
- Rename the local 'gpio_irq_chip' pointer to 'girq' to match common
GPIO IRQ naming.
- Drop the intermediate variable.

v4: https://lore.kernel.org/lkml/20260622092335.1166876-1-eleanor.lin@realtek.com/
v3: https://lore.kernel.org/lkml/20260512033317.1602537-1-eleanor.lin@realtek.com/
v2: https://lore.kernel.org/lkml/20260408025243.1155482-1-eleanor.lin@realtek.com/
v1: https://lore.kernel.org/lkml/20260331113835.3510341-1-eleanor.lin@realtek.com/

Tzuyi Chang (2):
  dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
  gpio: realtek: Add driver for Realtek DHC RTD1625 SoC

Yu-Chun Lin (2):
  gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
  arm64: dts: realtek: Add GPIO support for RTD1625

 .../bindings/gpio/realtek,rtd1625-gpio.yaml   |  71 ++
 arch/arm64/boot/dts/realtek/kent.dtsi         |  39 ++
 drivers/gpio/Kconfig                          |  14 +-
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rtd1625.c                   | 610 ++++++++++++++++++
 5 files changed, 734 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
 create mode 100644 drivers/gpio/gpio-rtd1625.c

-- 
2.43.0

