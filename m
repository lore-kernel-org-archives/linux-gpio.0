Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303831;
	b=XETLJBl1nxk/TvFnHdP6omiiGqND+KSVlinBBG/J8fF8lipbnxMBWCh1k/yHoeE2TquB
	 hoqNOrchk9sZDsSg93w32lXnfzRWy0RiM+1wvAMiBlYuVGOCrIehLcHbmcN1QxYbLZA/O
	 VoWLG/hRCXGx11OzaYAcAo0Ymvs5/lN/2bFqFHCamZsLrDnqRQZ2clqlxA+pDtKD6YhVV
	 MoIInnJalk4AVTf4nKrglNdvxaaqfOvoYGepRh8SJHRpa6vAbyJOkMTvNrK3p5pQISBLD
	 b3YAPBOffeZBDmwqhenN3Scd76fA9VWXFy1QSx8T410sMQwPVx7Nl8VI28W/SIAnNRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303831;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=ABGgDRVwGV2v5HDXz46KiBH+OUpckTODrt/huCpfQR4=;
	b=yoPswr9wnuQrOZIliHFU7oLndAxl802E3xRtmEuWNc7mMHH7hwCGAp/kFPGrGTiYaCQ3
	 q/sfr89dAetVTRY6v+lWh26jajkLHvc1UzeLD31TesgB0PBIBhgRYrNGJPKtDy+a2YJuN
	 dqoIaAHl6PKV8saIaxLsc2OB5d0TFHzJD74mfGgYD2KV7ICV6/azi6xC7dOUyX2kaBz5U
	 w1bCUIVmYnttG9doeRfcgq+2UTFhuy3u4NI/j/RtB+HXurDIJ6nRXxd2Xwe7WpXFGKRvn
	 BOodKHx8Ly5UeGBxVwLr0qP00eBz7i69ARs8THBxTTLcM/a6WupJkd/+dRwmpaWg30Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=peLSh0Ge;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8167E606B9D5;
	Tue, 10 Nov 2026 09:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8167E606B9D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=peLSh0Ge
X-UUID: 3900f092dceb11f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ABGgDRVwGV2v5HDXz46KiBH+OUpckTODrt/huCpfQR4=;
	b=peLSh0Ge8xvg+hVTXxlbsPFL4TBpmu68lDTQjsaNIvHoj42Ybaqn6eC0f09KfQl871SS2CKEatFf8vr2Uwua7AMGzm1vVJ8HuzCXvrBb1TFHkKYgu15Kiz2qdTjd+BJSivmKPDoVaCYeF4OHQ7ILzATw3h5AerfjPCZnLgEFjKY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1c3fef73-6224-4bc0-b7ac-265d72169ba3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:164392eb-7d0c-4db4-a7e5-d44f18b7500b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3900f092dceb11f18dc8c9802ae25ab1-20261110
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2019201984; Tue, 10 Nov 2026 17:43:45 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 17:43:44 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 10 Nov 2026 17:43:44 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: <linusw@kernel.org>, <lorenzo@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <mikhail.kshevetskiy@iopsys.eu>, <naseefkm@gmail.com>,
	<benjamin.larsson@genexis.eu>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <lei.dong@airoha.com>,
	<ansuelsmth@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
	Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 01/12] pinctrl: airoha: fix setting of GPIO direction
Date: Tue, 10 Nov 2026 17:43:28 +0800
Message-ID: <20261110094339.749110-2-zhengping.zhang@airoha.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094339.749110-1-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

The GPIO_CTRL registers have two bits per GPIO where the values 0x2 and
0x3 are reserved. It can happen that both bits in GPIO_CTRL of a GPIO
are set when the pinctrl driver is probed (e.g. modified by bootloader),
but the current code just clears the LSB. Thus when switching a certain
GPIO to output, the updated GPIO_CTRL register can contain the reserved
value 0x2 for that GPIO. This can result in not driving the GPIO pin at
all.

Always clear both bits per GPIO and just set the LSB when the GPIO is
configured for output.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 52a768c859b71..8dd0881bba4ad 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -164,7 +164,7 @@ static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned int gpio,
 {
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(chip);
 	u32 mask, index;
-	int err;
+	int err, offset;
 
 	/* set output enable */
 	mask = BIT(gpio % AIROHA_PIN_BANK_SIZE);
@@ -176,12 +176,13 @@ static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned int gpio,
 		return err;
 
 	/* set direction */
-	mask = BIT(2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN));
+	offset = 2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN);
+	mask = GENMASK(offset + 1, offset); /* always clear the two bits per GPIO */
 	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
 
 	return regmap_update_bits(pinctrl->regmap,
 				  pinctrl->gpio_regs->dir[index], mask,
-				  !input ? mask : 0);
+				  !input ? BIT(offset) : 0);
 }
 
 static int airoha_gpio_direction_input(struct gpio_chip *chip,
-- 
2.43.0

