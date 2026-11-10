Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303844;
	b=WloRiC1SbPaaCPXQux3arhW6kxcteL1QdUey6NASjQEIq3VKhfJ04ba97OO1NyzrL3UW
	 uBn1rzC2JJOBImyfxuwV1QYQTRIcnabdMLpnlVmuThtaKYDLWie+LeGeJSjKjpLkI4ZCC
	 xCAUnPdkyGd+Ztle59GJobCXyePiu1yTl5ZQfJp2NQcGXQ7fvu8+vfjeG/ps2kxb7pwrB
	 /JoeY8MGNGmrqPzqm0+OHT4eVYkaMZmW1lmpw/5pwGCW24cLAacOT3SPdE5M8pNKU3WHs
	 0+TW7BuZ2t/zWUKfmXbp4oBfeQ+V7KK9HocRlu8wSNgjbn9tSU6KeWoPTRZVvdN3fWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303844;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=LV7wGzxaXG/Oe3tQF8GuKXXW5mTVHFKeI3Ufw+M4FAM=;
	b=iVPzR5qqs8grui0IQgZPfRXLuWUER5efzTyUWYxZqhQYsooAkzdkD1jxmEvx3VgDVPA2
	 e0tMSpyfbzmHY32wo0ZtPNPt5Js/lxZYgEoT+jgkXSg835z+BhEPJSy7+Y9pzCGfU78fM
	 jI93/nvbxnRSwsXYbHCtbizU4ZfOERArfzGNK9nCOXX1t29jFG0JSJMcHRe7CYET7xAnP
	 KAm/PM7SPdWalnm6M+s/eLl3VtQ2J5Iq3lBbQhn5XSsSqM9wEl0DWyTto9jAYMSv3Jd0u
	 GdGjVPGz7VZG6bZL2AfIzSijOcwRSEpN5mm31fCxOESJys8n92V6modHFaORTB+fvEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fW7UytSU;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A43E6076125;
	Tue, 10 Nov 2026 09:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A43E6076125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fW7UytSU
X-UUID: 3c400630dceb11f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LV7wGzxaXG/Oe3tQF8GuKXXW5mTVHFKeI3Ufw+M4FAM=;
	b=fW7UytSUHU+ZUh9ga796m0WcbwjuB+2KqfvtZTzz7F3wU5igDUCK5sePqJ+c4Xn4OcK9yDnqDYfmg4+OkSiQgANx1Z/bhIAQFFmnV8G5Mjo8SrxTlS9RvI/QjgLYTX9/R63saObqWjpzTri3qRS/7YQSv/NEWsmDCJ56k4W1834=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1dc0876e-c71f-491e-809f-fa1e022d58f1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:167d1357-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3c400630dceb11f1b1788b6acf885367-20261110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2028572541; Tue, 10 Nov 2026 17:43:51 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
	<ansuelsmth@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
	Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 07/12] pinctrl: airoha: an7583: fix SPI pin mux config
Date: Tue, 10 Nov 2026 17:43:34 +0800
Message-ID: <20261110094339.749110-8-zhengping.zhang@airoha.com>
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

The SPI function does not advertise the base "spi" group or provide its
mux configuration, so a DTS state using function = "spi" and
groups = "spi" cannot be selected successfully.

On AN7583, pinctrl pins 45-48 correspond to GPIO43-46 and are shared
with the first SPI bus. Bits 19-22 of REG_GPIO_PON_MODE select GPIO
operation when set. If the bootloader leaves these bits enabled,
selecting SPI must clear them to release the GPIO overrides.

Add the "spi" group to the SPI function and clear its GPIO mode bits
when selecting it.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 1cd0f442ddc1d..986f10c9f1786 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -43,6 +43,7 @@
 #define MDC_0_GPIO_MODE_MASK			BIT(25)
 #define UART_RXD_GPIO_MODE_MASK			BIT(24)
 #define UART_TXD_GPIO_MODE_MASK			BIT(23)
+#define SPI_GPIO_MODE_MASK			GENMASK(22, 19)
 #define SPI_MISO_GPIO_MODE_MASK			BIT(22)
 #define SPI_MOSI_GPIO_MODE_MASK			BIT(21)
 #define SPI_CS_GPIO_MODE_MASK			BIT(20)
@@ -584,7 +585,7 @@ static const char *const uart_groups[] = {
 static const char *const i2c_groups[] = { "i2c0", "i2c1" };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
-static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
+static const char *const spi_groups[] = { "spi", "spi_quad", "spi_cs1" };
 static const char *const pcm_spi_groups[] = {
 	"pcm_spi", "pcm_spi_rst", "pcm_spi_cs1"
 };
@@ -861,6 +862,15 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
 
 static const struct airoha_pinctrl_func_group spi_func_group[] = {
 	{
+		.name = "spi",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			SPI_GPIO_MODE_MASK,
+			0
+		},
+		.regmap_size = 1,
+	}, {
 		.name = "spi_quad",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-- 
2.43.0

