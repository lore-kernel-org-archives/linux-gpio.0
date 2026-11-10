Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303840;
	b=POR+il2c+b4wfiXxDdgQdTjGST+LKnsIUcktar2/T3EZi0LPKpNmm1c+9+6YNR4KAwAk
	 LAcaH+8OOEdK8wNBeHHSux+T8bRHoSS76/K37tPv9jA/H25INJmlvSRTzsUMQRWmojlhn
	 I+FhGTn1Yb1EtSroJQ+wum3scB/4OUaZt4TDAmDw6iDVpbRkU8IA4aMtbBijt6fIp5nv0
	 LwaxnggSoYNDKYfHs1BpCzVal/iIdJ+ye48hke9rsnVPYl124Y5EYtcpOdtehZ/sTUSgj
	 B+J45NDcJYX24jvwy8yuXwOUxogWzmFrtRO8Lnzwj+MhF5WJ3/EA2Z+c2I+hPOvr9Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303840;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=16bS82YVyP5/PKFj/qTEOZNq2kDjfVEF4QQ8JRJyM6A=;
	b=rVd3/GDX42e5EH9nmDUrecyrc7X/174L+kZTgMkcALRnRPI3g4zSsWofcTljs8X5fo7H
	 meaG5bOIodZhPwzf+d+67sw4QIPi8k0pzZhIBFspNMu5oXMn1/atEinEENqxgbzD4GIjD
	 61muVdISnjo2GjonL2nty6DoctJyMdiUnUoM49EZ/+lAGPIFNRAVfN7UbfOl6NRBQyTg/
	 gfORCKd/uxcEKL7rIwESVHkQlOsbNP00iKi5vvxow4wF3vRUHvkV+tjnujWGLODxEz6De
	 mrgyUK/ZRdj52gHWYZmOECaARPRCC51JjJAx8+KmsqTzqoHBQFYJljN1XxVbjFSfScg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=bEiX+hW7;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A54606C64C;
	Tue, 10 Nov 2026 09:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A54606C64C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=bEiX+hW7
X-UUID: 3c5f77fedceb11f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=16bS82YVyP5/PKFj/qTEOZNq2kDjfVEF4QQ8JRJyM6A=;
	b=bEiX+hW7RCpWaQpTeX3aq2bwVEx4fpiHrAq22dV+E2zHBVtmRPvm9VCTpcSjU9JDx3odEGC7t4EQ33L3fQkkX0WZU+6aZtn5+gaUayiTnt4TY21eAiuQvxmPFaVukk9mU/UxQQW0WcN5UlWiUF2U9tBB5NpzApR32/lorwarUtc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:40b8da91-69da-4f04-bd89-ae5359c51bd3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:62e61766-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3c5f77fedceb11f18dc8c9802ae25ab1-20261110
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 370227049; Tue, 10 Nov 2026 17:43:51 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 17:43:50 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 10 Nov 2026 17:43:50 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: <linusw@kernel.org>, <lorenzo@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <mikhail.kshevetskiy@iopsys.eu>, <naseefkm@gmail.com>,
	<benjamin.larsson@genexis.eu>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <lei.dong@airoha.com>,
	<ansuelsmth@gmail.com>, Robert Marko <robert.marko@sartura.hr>, Zhengping
 Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 08/12] pinctrl: airoha: an7583: fix eMMC pin mux config
Date: Tue, 10 Nov 2026 17:43:35 +0800
Message-ID: <20261110094339.749110-9-zhengping.zhang@airoha.com>
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

From: Robert Marko <robert.marko@sartura.hr>

The AN7583 eMMC group includes three pads shared with the first SPI
bus: pinctrl pins 45-47, corresponding to GPIO43-45. Their GPIO
operation is selected by bits 19-21 of REG_GPIO_PON_MODE.

The eMMC mux configuration only enables GPIO_EMMC_MODE_MASK, leaving
these pads in GPIO mode if their overrides were enabled by the
bootloader.

Clear the GPIO mode bits for these three pads when selecting eMMC.
Preserve bit 22, which controls the SPI MISO/GPIO46 pad outside the
eMMC group.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 986f10c9f1786..74628a03ca909 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -44,6 +44,7 @@
 #define UART_RXD_GPIO_MODE_MASK			BIT(24)
 #define UART_TXD_GPIO_MODE_MASK			BIT(23)
 #define SPI_GPIO_MODE_MASK			GENMASK(22, 19)
+#define EMMC_GPIO_MODE_MASK			GENMASK(21, 19)
 #define SPI_MISO_GPIO_MODE_MASK			BIT(22)
 #define SPI_MOSI_GPIO_MODE_MASK			BIT(21)
 #define SPI_CS_GPIO_MODE_MASK			BIT(20)
@@ -991,7 +992,7 @@ static const struct airoha_pinctrl_func_group emmc_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			GPIO_EMMC_MODE_MASK,
+			GPIO_EMMC_MODE_MASK | EMMC_GPIO_MODE_MASK,
 			GPIO_EMMC_MODE_MASK
 		},
 		.regmap_size = 1,
-- 
2.43.0

