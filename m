Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ECE331EBC;
	Wed, 12 Aug 2026 02:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500018; cv=none; b=KZxMhMuHN/zcq4xBs+Igz95fKnEWUs341Wtzp5HUL1hnI3EjCXstsedV5QROYWEd+H/Yz/vB2EljaP12TgZo7RaKKvcD405vrw3mQgN+JozqHlt7qSGew66X62T+i5Mt8jEBmaejdXoeT0sUfGGn/DMm0GOOlXKnyBxw8HxczWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500018; c=relaxed/simple;
	bh=hTnztSTfgwNnZ8ajqrw8M7Y8a4h1qKupxMFXddj/8ZM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZwrIvZkGrbj7+CDJC5OZYkSHR1QRhqf3MTC6ebWytMswh493Eazx5KOpLh6Wewl/vK9619rdYHBQTEoNCzqE9GZ1gZExcX/t6d1UzY9e1dChkgSqMKM8zxui93TLFhZkPmpTXLlxMxdNuzPejKuhmw40l74vxSRIuNSlfZp+9Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=hxxYr+ZT; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="hxxYr+ZT"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67C1xH1N13194414, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786499957; bh=Hxvs1qKqYZ45tqEecqh3hweSSHYNecuaYnp9+xZFJcM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=hxxYr+ZTTCIhIvMqkzyXx0Plk02H3a3SUETSbF4qCwXxnoQwCxyC3cFu2iTZpqzez
	 22Oqf/z54t11beaeLz1hFvf/8pTnSut2otXOiudFG/y28ZQqp+TeiV8VnAXl6oR7dL
	 uUs6mtWVvHEDf1UuOniMcVrdiYqYh47FXaCYtuJN2pKxyv39G2vxVHq+lSKXsgYeuE
	 pQXGuCUblXq3WDqbN/kEVp+jv2KN1NsKvqmyiHmZsvs5WeXLKNspsrQllwqFMPrC0b
	 ENHGOv8uew6ypxHAkv4Cbw78+joxNv+nGMRvJVi2b8vUMFlBcwiOwgkNQhJh4+V4va
	 5IA2UI41RxLew==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67C1xH1N13194414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 09:59:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Wed, 12 Aug 2026 09:59:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tychang@realtek.com>, <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <james.tai@realtek.com>,
	<eleanor.lin@realtek.com>, <linux-realtek-soc@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<afaerber@suse.com>, <stanley_chang@realtek.com>, <cy.huang@realtek.com>
Subject: [PATCH 1/2] pinctrl: realtek: rtd1625: fix base_bit for VE4 GPIO 13
Date: Wed, 12 Aug 2026 09:59:14 +0800
Message-ID: <20260812015915.3477180-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812015915.3477180-1-eleanor.lin@realtek.com>
References: <20260812015915.3477180-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fix a typo in the base_bit of RTD1625_VE4_GPIO_13.
It was incorrectly set to 18, which overlaps with GPIO 16.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd1625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1625.c b/drivers/pinctrl/realtek/pinctrl-rtd1625.c
index 2d623bdbf9ca..796e51f9dff9 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1625.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1625.c
@@ -2867,7 +2867,7 @@ static const struct rtd_pin_config_desc rtd1625_ve4_configs[] = {
 	[RTD1625_VE4_GPIO_6] = RTK_PIN_CONFIG_V2(gpio_6, 0x1c, 24, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
 	[RTD1625_VE4_GPIO_7] = RTK_PIN_CONFIG_V2(gpio_7, 0x20, 0, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
 	[RTD1625_VE4_GPIO_12] = RTK_PIN_CONFIG_V2(gpio_12, 0x20, 6, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
-	[RTD1625_VE4_GPIO_13] = RTK_PIN_CONFIG_V2(gpio_13, 0x20, 18, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
+	[RTD1625_VE4_GPIO_13] = RTK_PIN_CONFIG_V2(gpio_13, 0x20, 12, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
 	[RTD1625_VE4_GPIO_16] = RTK_PIN_CONFIG_V2(gpio_16, 0x20, 18, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
 	[RTD1625_VE4_GPIO_17] = RTK_PIN_CONFIG_V2(gpio_17, 0x20, 24, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
 	[RTD1625_VE4_GPIO_18] = RTK_PIN_CONFIG_V2(gpio_18, 0x24, 0, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
-- 
2.43.0

