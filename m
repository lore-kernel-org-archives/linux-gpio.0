Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EFF3C0A16;
	Tue, 16 Jun 2026 03:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781580612; cv=none; b=gm55nqITBQmbZ/0zXdGrBGeOElRe9ZJ7ZrVxhgYDUwvR1OYLK3ox+zQO2JRdJ6ykl8Yr7GPhT/ZeBsEwAMWS8XxFRPf7lv7rmSkleB07NW0iJlBddOeI6za0dW47eOjBzKCMK/NOgs1aDUItzXAhOmFP68756lS/IMlYbnQUUS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781580612; c=relaxed/simple;
	bh=clIW3mqQh+QXIWxnyxrFoyC5AKtAFPYDP4kc7EQtnBk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=W6lIEaQ8FJ3Zd8oc86ClHbew1eCjs50lK7xFJdY1bUkbzwFv7CSAIpfBZolidbpvvMC/lQYdQTK4MdO/tjsXPZ9b3gIl+jo5DRPZ1bcYhfnDs1/UDYeKnahwhIGvSXo8PqbG8bv54l/iw5Z0qnGPDgmxf3UD/cMaQrshwv/typ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 16 Jun
 2026 11:30:02 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 16 Jun 2026 11:30:02 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH 0/2] pinctrl: aspeed: Make AST2700 SoC1 JTAG master TRST
 optional
Date: Tue, 16 Jun 2026 11:30:00 +0800
Message-ID: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnDMGoC/x2MQQqAIBAAvyJ7bsE1UOgr0SG2rRbCRCOC8O9Jx
 xmYeaFIVikwmBey3Fr0jA2oM8D7HDdBXRqDs85bTw6TRr7ygas+SEwSuA/OE0MrUpam/9s41fo
 Bl38dYV0AAAA=
X-Change-ID: 20260612-pinctrl-fix-1c1e7c37261c
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij
	<linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Billy Tsai" <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781580601; l=1278;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=clIW3mqQh+QXIWxnyxrFoyC5AKtAFPYDP4kc7EQtnBk=;
 b=IE+rJ0KmC/MBgTobjoqpYiPsgcvPlPwuwhMeeVU4dF0pNKrT6GZt9EOwOIxSurQTiqnGq0nO1
 qCKtBnQTG5XCTz+5Y8OLyAPwhetW1bytcJRT4PmhZdI54cI6St0qwPJ
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

The JTAGM1 pin group of the AST2700 SoC1 includes ball D12, which
carries the TRST signal. TRST is an optional signal for a JTAG master:
designs that do not wire it may need the D12 ball for other functions,
but with TRST embedded in the group they cannot use the JTAG master at
all.

Split D12 into a new JTAGM1TRST group under the existing JTAGM1
function, so TRST is only muxed when a board explicitly requests it.
Patch 1 adds the new group to the device tree binding and patch 2
splits the group in the driver.

Note that this changes the meaning of the existing JTAGM1 group: boards
that do use TRST now need to select both the JTAGM1 and JTAGM1TRST
groups.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Billy Tsai (2):
      dt-bindings: pinctrl: aspeed,ast2700-soc1: Add JTAGM1TRST group
      pinctrl: aspeed: Split TRST out of the AST2700 SoC1 JTAGM1 group

 .../devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml    | 1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c                     | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 761af93c9f1a100b8d9f71aa744b8f9abbbbbfb2
change-id: 20260612-pinctrl-fix-1c1e7c37261c

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>

