Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DDF3A542F;
	Fri, 26 Jun 2026 04:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782446487; cv=none; b=FXenVJ1jFR0xSezmksgryPFnqDhK7BziTpYdWKwZKTBx1fTV7T1rtsGgd6W6sVSiEmX288MHX3aFXm8qjne7U3FqMo5jlIGBRmdbSZfYzBRWmIIENd1X5lIdTtWQ9GO9HUIv80BU2Xbapkl9I73MsxeTOimAKNCkRlqEz87PlSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782446487; c=relaxed/simple;
	bh=iYfkxk/Xf9Ikj2rBj69XrNYR1s6LzrMr8E5qsqxvbEY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G6khEQ6X+soTEDSkSosLxgOrOKt9V7Y7RgeeP89y/pAM+Z9vElL9EiFO/3o7gmm2tOSsnOmhuEs1AuCImiueguDN4PG2VDuPCmzIIAOi2e/10Mk8sJIjl2RQZCfl22GSucwElJiZQ7ZTqoErdIs2IJYpsXwHPZE8MvEmf9X1W1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TWaNbg+i; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TWaNbg+i"
X-UUID: ae0b5bf0711311f1b1788b6acf885367-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CGN9K5CkudogXI39R/izMSSpUjCnX9aZlZ+UiqVw3jw=;
	b=TWaNbg+iAl3dX4B0LlfyaAPlTLxQvGWYDHheQ5qo/GWjbV9UiLlKNX3PCy/Dw3mR3BdZsUW3IUbqCYg8KdBkWlhTyQTIBg5vXPsjuvhp+g81uf0QVY1CsFvljpN3lCTaNdF9soniwnNbFa7SJxs62aVpdsBCrJaANbv+9BNgKRU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:34f2ae5a-f64f-4943-809b-122b6a1545af,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:5cc2013e-d78a-4ead-a7dd-d931571248ad,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ae0b5bf0711311f1b1788b6acf885367-20260626
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1539844337; Fri, 26 Jun 2026 12:01:16 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
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
Subject: [PATCH v4 02/32] pinctrl: mediatek: mt6878: Enable module build support
Date: Fri, 26 Jun 2026 12:00:31 +0800
Message-ID: <20260626040112.2436185-3-justin.yeh@mediatek.com>
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

Fixes: 89c13ea3ab6d ("pinctrl: mediatek: Add support for MT6878 pinctrl")

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt6878.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index e79139700d72..5985fa69a278 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -167,7 +167,7 @@ config PINCTRL_MT6797
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT6878
-	bool "MediaTek MT6878 pin control"
+	tristate "MediaTek MT6878 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6878.c b/drivers/pinctrl/mediatek/pinctrl-mt6878.c
index b59ae089128a..9e832227391b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6878.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6878.c
@@ -1476,3 +1476,4 @@ static int __init mt6878_pinctrl_init(void)
 arch_initcall(mt6878_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT6878 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2

