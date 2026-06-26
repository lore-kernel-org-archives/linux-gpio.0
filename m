Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E623A3E96;
	Fri, 26 Jun 2026 04:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782446486; cv=none; b=Gla2j3jA4IzZkrpsfmhm9c0qophUJLJ5MfbwFoH5Fimqv9MXzGulOfYakzSsBRptG6mpOHfBkMWBV/f9/bGXbRZV8kjRcmerXzFp4Ona8+CfhJpFxpi08p4KH+SuKcHT5gjs53aca3xi1WEt8A2igDQHp6PFJ5lhrTIgZ8Pded4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782446486; c=relaxed/simple;
	bh=YcHs+6tmFeYCLAlueSnnUZHZNtV55f6sC5EaDaZ9LzY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XOV63f4Ka4bAPFuewLSWxzRVOhHMfTm3DFyxGJR7F56+NsTepYV7HeJ5oolwsSDNCtMCVuDhxyhvpfE/w2nSGxS3Oz1HTN4imOwtFJYCqzHPkQN5go/0EQtCpCiSEI3RXV4MDBOokEQBUAZY8EFxSC9XtlLi0GFgCt8Ku7m2F1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VS0ppQKs; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VS0ppQKs"
X-UUID: ae61c530711311f1b1788b6acf885367-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=THz+deibZ2X+KLLputd/+Rrk4g4Gk+00Og+uxgjFC1c=;
	b=VS0ppQKstlWaSlT+357oS3OkVuEI6BpLkmfi36WzVEIeeFY3lhbk62ck7mq8vJEtW67TtJJAvsb/eeLJVszzOvttmQbWYlHA6iKEzpiE/yoGBIrMYlISEuZJ3zo5MMdfRz5s6mu20h0h5JWjfl8qTBzlGt4oZi5ezFilr2szxg4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:7390be1a-ea2a-43e8-97a3-15a109a69190,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:961b8da5-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ae61c530711311f1b1788b6acf885367-20260626
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 956263562; Fri, 26 Jun 2026 12:01:16 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 12:01:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 12:01:15 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v4 05/32] pinctrl: mediatek: mt7981: Enable module build support
Date: Fri, 26 Jun 2026 12:00:34 +0800
Message-ID: <20260626040112.2436185-6-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626040112.2436185-1-justin.yeh@mediatek.com>
References: <20260626040112.2436185-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add MODULE_LICENSE("GPL v2") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: 6c83b2d94fcc ("pinctrl: add mt7981 pinctrl driver")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 82733753fa33..b16e93b0afdf 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -194,7 +194,7 @@ config PINCTRL_MT7622
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7981
-	bool "MediaTek MT7981 pin control"
+	tristate "MediaTek MT7981 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 22c8f2480346..12f187061c60 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -1058,3 +1058,6 @@ static int __init mt7981_pinctrl_init(void)
 	return platform_driver_register(&mt7981_pinctrl_driver);
 }
 arch_initcall(mt7981_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7981 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2

