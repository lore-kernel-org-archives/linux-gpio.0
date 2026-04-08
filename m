Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB134A3C5;
	Wed,  8 Apr 2026 02:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775616943; cv=none; b=bHLl1SSnF9bAD87jDRkGKdZ9EPwJxr+cPGljl2oeDuIBbYh6+k1b22xsBgDvs/f5L+oH1h/wX2fFIEZ5IXmhlscmj7zkT7l4lYEDP8uNV0diJZX3LBgo+p/C7IwcgWJocarfcK7iigrx9ItPk8EDur5K4z4F3neN7hd4LSnEnfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775616943; c=relaxed/simple;
	bh=XFvWllJSsLOijhHnkQ2L4DsQgBChEq3/WnfXA5Q0B7c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TQ9938asoqbKdB5qnbYAKwigREZP7aZ/O3b4e0RQXB5MAiXAUrYCUBt0FvIFICh1zNHZveFo61jKxGs3MZOsu1ckdbWHJGO+Ytknimg4TvGfOb5Hmeq0bcYX9rEUCtm7rVcVkrwv5DGnUiJnr9NkVUTZCJWemDWwE89NY+ZfKbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=jeLorVzT; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="jeLorVzT"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6382qiW432349140, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775616764; bh=mBZ+9wwU9W5WTYXOus5oBw4pUKaX3Z9YycBoP/w4eV4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=jeLorVzTDLiqko5yaNCFmMS4xzdHQJqlhy9URTx2H43991fsL3N79veBoQHtXotQw
	 q2TL+pbd5kVxLHZYRqoizgxKjzyp5x7pLmHmc0UPiPCqplpq1n7nj5iRSLDm+2+09W
	 PtysiRVyEL3AahHlnUBZhCWN8lHOZYOhZRxkpGJl5GFsDCzbRQdfizoiyuyv/hT1m9
	 EGWTDiDGWRythgW9WKtaF+athLm5AcRwjpcfFwcJezzrwVJGoGNPMQdyNsJbVT+WHz
	 jjTQbDifbtzkMBalZI1FlUqDmqz8W8UJ++764un9U5mMzIjUpCX8NRoFdu5G9AmoJY
	 um76F+C7h1lRw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6382qiW432349140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Apr 2026 10:52:44 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 10:52:43 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 8 Apr 2026 10:52:43 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>
Subject: [PATCH v2 0/4] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Wed, 8 Apr 2026 10:52:39 +0800
Message-ID: <20260408025243.1155482-1-eleanor.lin@realtek.com>
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

The device tree changes in this series (Patch 3) depend on the RTD1625 pinctrl
driver, which is currently under review and has not been merged yet.

The dependent pinctrl patch can be found here:
https://lore.kernel.org/lkml/20260317115411.2154365-9-eleanor.lin@realtek.com/

Best Regards,
Yu-Chun Lin
---
Changes in v2:
- Move DTS patch to the end of the series.

Patch 1 (gpio: Remove "default y" in Kconfig): 
- New patch.

Patch 2 (dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio):
- Merge two memory regions into one.
- Add a description for the reg region.

Patch 3 (gpio: realtek: Add driver for Realtek DHC RTD1625 SoC):
- Remove "default y".
- Add base_offset member to struct rtd1625_gpio_info to handle merged regions.

Patch 4 (arm64: dts: realtek: Add GPIO support for RTD1625):
- Merge two reg memory regions.
- Remove redundant status setting.

v1: https://lore.kernel.org/lkml/20260331113835.3510341-1-eleanor.lin@realtek.com/

Tzuyi Chang (2):
  dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
  gpio: realtek: Add driver for Realtek DHC RTD1625 SoC

Yu-Chun Lin (2):
  gpio: Remove "default y" in Kconfig
  arm64: dts: realtek: Add GPIO support for RTD1625

 .../bindings/gpio/realtek,rtd1625-gpio.yaml   |  82 +++
 arch/arm64/boot/dts/realtek/kent.dtsi         |  39 ++
 drivers/gpio/Kconfig                          |  12 +-
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rtd1625.c                   | 584 ++++++++++++++++++
 5 files changed, 717 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
 create mode 100644 drivers/gpio/gpio-rtd1625.c

-- 
2.34.1

