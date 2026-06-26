Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC782F0680;
	Fri, 26 Jun 2026 01:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782437571; cv=none; b=r/RtrMs331gQ3hwuDEl5Y9ZD1cIy7r6IFFerlLgnf46etRtti3dqX1+D6kyG4UrFLa0GBa1XYfTgTP2gGliSsmGLjkCI6dcN7WdW+2Q/uFsKrWx+KwAk8FjsmvvFCnEjacPQeFFO3KQJ9VEkXPAuCkU9kYV0iZ0ZO3yV7zh3q6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782437571; c=relaxed/simple;
	bh=T8VD+LatfrMP3XOme9/Bc8mpNw+vn1vD9PkoRSn/x+0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W0RUiaDrpbCfSOG2kTdTfDg543956QYArnWt0HhRuWdGqFNEezdaAQC/0IxCmEy3/KpbnF1aG51V5hf6O4azeICHSVbBKPTAeHAOz9agj9EuchUBrh+JBR/9Zen1iEgzEctvw6Z9MOr5fHzywCM1tZKJLk6f4PBjEZ6P1g+zZDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HAwTfML7; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HAwTfML7"
X-UUID: ed5aedee70fe11f1b1788b6acf885367-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zqkuTEiWdQhgYA1NIGIsxlcfMGPU4W+47mlSC6Zi0c4=;
	b=HAwTfML7aTUohg/gBdeaeQR8DDoBRro+YrPB0RPnpv/fJBr33aiVQCOhYvvolqP6TPMzXIM71jGy1kLBUvwadHWKYqOe3KQO9+Lm6AvU9RkaK5tauohHW3LV02vxGYOMlziAA330j1DcEI7fXqUqM0gHSi0ZuB3PlSqP4VbcL8w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:2f73daa8-cd5b-45db-a3c8-b829821b1293,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:14e1bc53-4902-453d-ab3a-e0854d5c03df,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ed5aedee70fe11f1b1788b6acf885367-20260626
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1328433290; Fri, 26 Jun 2026 09:32:43 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:32:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:32:40 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v2 15/32] pinctrl: mediatek: mt8196: Enable module build support
Date: Fri, 26 Jun 2026 09:31:41 +0800
Message-ID: <20260626013217.2373808-16-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626013217.2373808-1-justin.yeh@mediatek.com>
References: <20260626013217.2373808-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add MODULE_LICENSE("GPL") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: f7a29377c253 ("pinctrl: mediatek: Add pinctrl driver on mt8196")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8196.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 00fb05dc742c..7bb9cb15dfba 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -296,7 +296,7 @@ config PINCTRL_MT8195
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT8196
-	bool "MediaTek MT8196 pin control"
+	tristate "MediaTek MT8196 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8196.c b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
index dec957c1724b..502fd985e2ff 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8196.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
@@ -1856,3 +1856,4 @@ static int __init mt8196_pinctrl_init(void)
 arch_initcall(mt8196_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8196 Pinctrl Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2

