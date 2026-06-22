Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2756739479F;
	Mon, 22 Jun 2026 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120865; cv=none; b=Dm8Sd7201wWbtrDFvmQSd8jkj4u5m1IOUeJehCWlShhUFqqvQLFI4LEAG+lTEDWUWb3lQbYLbWOnKDGiawpHHXkVWsNrDZxPGJjqTUu+bAyKmx+GF2PRs2iT1PM9cjAuraY5HGDvEvAw90H2xgOztY9vi4lKdH4blrA4g5ycSqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120865; c=relaxed/simple;
	bh=4Re2c8rM/TE+j1XS23DSjHwh/fP1KAiyddqcjfiZQQM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LErwrovk722rn3n+fR/tPxltJnWt9TRUP2q/nIRyUBAoJdau2yAzViinfMiPytl+f3XN/wa/AsvZ30e7QEeaXuPEv/Oa46EOV6seq2tkp7DUMASt0xkRnmIelqNOBX517p0URWitEax1HjwO7uWnStuYVnuAmn/jFvXo5VZZfgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=CKXEtWzL; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="CKXEtWzL"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65M9NbEkA2430969, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782120217; bh=JAvMWp3yV0UTP12dgfv3/z2EdSGGYSGEiFSysn5LsLY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=CKXEtWzLLLYhjKHD7r1SKkJ+3IAGbLPs+QJLE2jeouEb3+MmdQwSLZwS/LzZKm/ZW
	 fKikilddzEuDwVE9LoJFqbIb3wp3b9uiL29QgvtilD3ih3N7yHff2zUHXy5LMQyJH7
	 ko5zahpSNrwksFBJWnmqAgQoqC0EnIAYg9gRbVervhpQGJCjdTZLcv19sfAqNrIdCj
	 P9svMI6OnWiyfRYo14hCwjykdS8x5QSvNIrO5Ol3MjxecyzcIEWy/WnznxjQjdPpvs
	 hCOey+Rxr8ENC8jD/M6UIClDvgMs82ssVY4A5JUR3eBiFE7FRa0y4C3lz7TstO+wTQ
	 j83HVPFxqauKA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65M9NbEkA2430969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Jun 2026 17:23:37 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Jun 2026 17:23:37 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Jun 2026 17:23:37 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 22 Jun 2026 17:23:37 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
	<mwalle@kernel.org>, <andriy.shevchenko@intel.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
	<james.tai@realtek.com>
Subject: [PATCH v4 2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
Date: Mon, 22 Jun 2026 17:23:33 +0800
Message-ID: <20260622092335.1166876-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622092335.1166876-1-eleanor.lin@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Replace "default y" with "default ARCH_REALTEK" to avoid bloating the build
for non-Realtek platforms when COMPILE_TEST is enabled on other platforms.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- None.
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 28cf6d2e83c2..ed2bc3113374 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -646,7 +646,7 @@ config GPIO_ROCKCHIP
 config GPIO_RTD
 	tristate "Realtek DHC GPIO support"
 	depends on ARCH_REALTEK || COMPILE_TEST
-	default y
+	default ARCH_REALTEK
 	select GPIOLIB_IRQCHIP
 	help
 	  This option enables support for GPIOs found on Realtek DHC(Digital
-- 
2.43.0

