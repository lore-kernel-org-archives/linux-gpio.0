Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF55439C631;
	Mon, 22 Jun 2026 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120867; cv=none; b=jVHQWEZBCfZIY5qvC72uOEYvF2ym8Sv5RHWuKHPkAf3AFawe9B2iTKP7Aai9N85voM04PM70K/67VpFWjArm0a6t1lV++sEWYUgwlih5CCykFY0M4qpC9W8cB6m68cUVbmlRqXcm2F7fKqNdv9HJ3tq34SkLvXL4GM7NAxPbt3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120867; c=relaxed/simple;
	bh=9h95Ko7XMrCEnx9w5cWPQ04NkIDJqJBYijtbOgwg0ZI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KSEuQu2TriM8rg2cDtO6CkJr7w9K4Ei6DJg2mS3P0iFhvNytHbsmNyeqd0lIZtqi2PkpPuxDpbOJFbWtLGbsfbyxgcly7px6Uqgf5ziRIKdpXTTcXwwI+B2GargAoFyGeebqMw5rxMfrrwrvnCKbK+UnVOWWB12DMS86bvtIgqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=RSX8kepe; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="RSX8kepe"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65M9NacgE2430966, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782120216; bh=v9oY5AW6XlPO/ybdItXeUT9so7n8GVoEcj/SAny4ynQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=RSX8kepe6vWf3+/ZuOAKsU0NLhflzTlQNdchZDTiflmk8XDzgJMRbr6SRg8znzAI9
	 LfxykmBUueBpw0PpMYr+OV6OmsuLzrWGZ0aFvhFIJz1lrGzkZGzHIQwMSyNbng47W+
	 PhmMBv1mgUMH0CmDTV1vbDTjzORHhIQ8rjkeWWkSdeg9iNi6vKJnTLSwW+3xRk7mFY
	 VxDNbGyxPsGORyhspGR3lfJE2717Coq+pAOYi063Pro+mc8E28R10uRfEtPWnJSz79
	 dMAW1VRLoUHkoxxNT+bR/zgqNESjmNp2nHwf9PDUQl0Dx/BDMhMQemoGsUyAahUAXC
	 LkgrOW5gz4oBA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65M9NacgE2430966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Jun 2026 17:23:36 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Jun 2026 17:23:37 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Jun 2026 17:23:36 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 22 Jun 2026 17:23:36 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
	<mwalle@kernel.org>, <andriy.shevchenko@intel.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
	<james.tai@realtek.com>
Subject: [PATCH v4 0/4] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Mon, 22 Jun 2026 17:23:31 +0800
Message-ID: <20260622092335.1166876-1-eleanor.lin@realtek.com>
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
Patches 1-3 (fix, dt-bindings, and driver) are targeted for the GPIO tree.
Patch 4 (dts) will be taken via the Realtek SoC tree later. It is included
here for context.

Changes in v4:
- Reverted to the v2 approach (without gpio-regmap integration).
As a result, dropped patches 2, 3, and 4 from the v3 series.

Changes in Patch 3 (driver) since v2:
- IRQ handling fixes:
  - Added enum rtd1625_irq_index with named constants.
  - Documented the hardware quirk.
- Code cleanup and coding style improvements.
- Included the <linux/cleanup.h> header.
- Updated the copyright year.
- Retained Linus Walleij's Reviewed-by tag from v1, as the recent updates are
cleanups and fixes rather than major feature changes.
(Linus, please let me know if you have any concerns regarding this).

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
 drivers/gpio/gpio-rtd1625.c                   | 611 ++++++++++++++++++
 5 files changed, 735 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
 create mode 100644 drivers/gpio/gpio-rtd1625.c

-- 
2.43.0

