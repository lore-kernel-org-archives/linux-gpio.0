Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571F22FDC27;
	Fri, 26 Jun 2026 01:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782438299; cv=none; b=K4fzqnirzfKc/cQpXvn6yHqGke4koo0wDn6Adfn4GQakGdVFqXrEseEFCTCftnDRUjDqFthSRt9lH3QG1Iq1PXCLCp4Rc8Jx8PrVOcLH7KLAAsan3Q7hdhOIz7yB/F8pN+WacMXhOlriX8i1rhPkLwttZeYq2sZINR+OeadtcLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782438299; c=relaxed/simple;
	bh=p5b/Y7DN0QOSRKelFUQED8HSr/DTJRhWndefreL9lyQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g0MzdR7Gb6l8tvmf9vB9hVOM4So+i8Af1j+ZOd6A/kg6huC3Ve3qKRluvBANdNDZAwSw291W7OcK8+0wKFWjXxOa/CsO7ul6FoYtNj8sInP7zmgIbvBDrRG+bsM0E8OwAxxp0H4BJURXWDoyv5pAETa+dMV3fGLbhb5yE1yKfj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=mmnBqK9X; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mmnBqK9X"
X-UUID: 9f5c46a4710011f1b1788b6acf885367-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8OvGKmbo6Ls5xAuTXCein36Ccwe4D0wJym5hMrgmoDs=;
	b=mmnBqK9XblRGam4nQ9TDDzkeI0R5O7ll0YrdknWJl2s6hRJJpkl8wnGYLYAO6aryVGSp0vtnvYMdiBz0e6lflc2WuYEuVxEFg8nOZ91AY/EHj3pWTFT+vbzpyH23sDjT8xmDY3jXSNNVLJg7tz5rCkwPQMO7Wa6NwODXCtD3DIE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:eee8ad8a-811c-4138-9da1-78f6c03bb85d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:1f99dcfc-4e5b-4880-a751-e09c9abb260d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9f5c46a4710011f1b1788b6acf885367-20260626
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 875815519; Fri, 26 Jun 2026 09:44:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:44:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:44:49 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v3 28/32] pinctrl: mediatek: rt3883: Enable module build support
Date: Fri, 26 Jun 2026 09:44:27 +0800
Message-ID: <20260626014442.2378513-29-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626014442.2378513-1-justin.yeh@mediatek.com>
References: <20260626014442.2378513-1-justin.yeh@mediatek.com>
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

Fixes: dc6ae2057c9c ("pinctrl: ralink: move to mediatek as mtmips")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-rt3883.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 5b0471b7e920..eb4bb7408f8d 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -83,7 +83,7 @@ config PINCTRL_RT305X
 	select PINCTRL_MTK_MTMIPS
 
 config PINCTRL_RT3883
-	bool "Ralink RT3883 pin control"
+	tristate "Ralink RT3883 pin control"
 	depends on SOC_RT3883 || COMPILE_TEST
 	depends on RALINK
 	default SOC_RT3883
diff --git a/drivers/pinctrl/mediatek/pinctrl-rt3883.c b/drivers/pinctrl/mediatek/pinctrl-rt3883.c
index eeaf344c3647..b968b157817c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-rt3883.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt3883.c
@@ -106,3 +106,6 @@ static int __init rt3883_pinctrl_init(void)
 	return platform_driver_register(&rt3883_pinctrl_driver);
 }
 core_initcall_sync(rt3883_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek RT3883 Pinctrl Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2

