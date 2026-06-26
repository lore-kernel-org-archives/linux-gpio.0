Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED62B3033C6;
	Fri, 26 Jun 2026 01:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782437573; cv=none; b=NWJaQBydkFtHCz0Xjf1c3HZZFNxD/mBTI4X26xPnj/R4/Q8PfZN7RV/x/SUTYtigA5h+i3R/L/nyTYJaP/5boRag2FAY7hybvJDinpSaAshB8zWACaDBBNftuQ+DgEMleueQ49xAQ7FcvOE7E6EkbDvCi/eROceVCd8asnKIcdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782437573; c=relaxed/simple;
	bh=Dy9ewNNkZJJyAANzb6w7+y4+6CVJGI8wrG1oypUy6+Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+9xVf6FnTSclc08QnERMDoqrlCEpmU3gG/e2qnaGwIrRhUf1Scp8IMPNySrBTsZ0SurdYgGfeY8guZnLsKlJ8g5+QsEohU1LWB5eOaO3FZGraf2Z0v1GLL7BbVxqSmKjYKh/a3VIno4FHCQQ+9mzUt1M6uO7ezbohDsIGwsAsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=l4OyxZaY; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="l4OyxZaY"
X-UUID: ede483e270fe11f1b1788b6acf885367-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=L0cqa7Gw7fTKkzicFRMFC+aNduU2fBc2Ea6mYXwQXHE=;
	b=l4OyxZaYk1Pq3IuNRBO5PDfTvlugU/t4uldPdL6jIx1cYhIvPthK8L6y7VimsFFZ1PaFGxDcH75tf1drRwT+biZxNcrNVq9JUmQD7g3rM6gHcC2R83UFXSnXR50ogCEUnbBbMDzuJJLeQv+lWIwJSWmc6n6MCpLHnPCfcG9UMKU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:52e46bf2-b0fd-4430-933b-c2eb7cb2150e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:3fe1bc53-4902-453d-ab3a-e0854d5c03df,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ede483e270fe11f1b1788b6acf885367-20260626
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1919528985; Fri, 26 Jun 2026 09:32:44 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:32:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:32:42 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v2 31/32] pinctrl: mediatek: mt6795: Enable module build support
Date: Fri, 26 Jun 2026 09:31:57 +0800
Message-ID: <20260626013217.2373808-32-justin.yeh@mediatek.com>
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

Fixes: 2e1ccc6a75cc ("pinctrl: mediatek: add mt6795 support")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt6795.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 85639e0a1460..b0989157b1c8 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -168,7 +168,7 @@ config PINCTRL_MT6779
 	  map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT6795
-	bool "MediaTek MT6795 pin control"
+	tristate "MediaTek MT6795 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6795.c b/drivers/pinctrl/mediatek/pinctrl-mt6795.c
index ee3ae3d2fa7e..7729dbb96f10 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6795.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6795.c
@@ -622,3 +622,6 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mt6795_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT6795 Pinctrl Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2

