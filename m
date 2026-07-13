Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE813B71C4;
	Mon, 13 Jul 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931908; cv=none; b=Aldm4nyEcvxDq4auNwDsBP0d7QetDq0Ss75nyg/OEFAZdwng/zbSf1OY5MfRQOEg+RhPLUZdQKEt5twTeRj4+Qpzuan5wiVmYWWdLHdCdAQlckQYBez7Ht+qv1nP3MoiBnpK9bLJC1+gDPO8ej+/9GkVU6pQGn9auLsx34VCPVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931908; c=relaxed/simple;
	bh=51rIbr3C5gbwywnETF+Wsf+uapYRIxdDcZSNjIjvka0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fdrOrDnxb6xFRys0VRADO2W9WJYeYOPeCgJHTLwJJ8bZIoZd0lI/2oPJRXFLcuZ39RDWucFMnz1QTTvMEpr5IKPc2MeqDlWrOZMtZZRdBPT7DdddaaOnuBLypS/LuVr3sF6JZxj5spmLyWvEAguTPK+qf65kGO04Z3Hxe86a4TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CWnHJa57; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CWnHJa57"
X-UUID: 30683c287e9611f1b1788b6acf885367-20260713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=p1PZnOGeUu2VInYWfVlPBxJM1TfFS1WSojIp0dBKp9s=;
	b=CWnHJa576gT9BLukZ+5nQFd6xR44k1ayGH60NavTgsEByyotPXLC7te9qEBQhEjm9L8YNmxAv+U5V8mWQPJoggXmSmgF95l3VObAXq2UaP1ZtT+mWdODb6sQKBoOQRTtpEkSfrZmRSSDTh43P3Q7uxgkA4mnTtvHJaYqVrpb+hA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:6b6a44a1-3491-4e92-9d68-f31f902fe687,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:9e2046f9-4b72-4a52-91ca-f4585405c3b0,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 30683c287e9611f1b1788b6acf885367-20260713
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 187457483; Mon, 13 Jul 2026 16:38:14 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Jul 2026 16:38:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Jul 2026 16:38:13 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v6 0/5] pinctrl: mediatek: Enable module build support
Date: Mon, 13 Jul 2026 16:37:52 +0800
Message-ID: <20260713083808.168957-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This series lets the MediaTek pinctrl drivers be built as loadable
kernel modules. This is required for Android GKI + vendor_dlkm
deployments, where vendor-specific drivers must be kept separate from
the GKI vmlinux and loaded as modules from the vendor partition.

Enabling the individual SoC drivers as modules is a single logical step,
but it has a few prerequisites, so the series is:

  1. Fix a pre-existing GPIO chip lifecycle bug. The gpio_chip lives in
     device-managed memory but is registered with the non-managed
     gpiochip_add_data(). While the drivers were built-in only this was
     harmless, but once they can be unbound/rmmod'd, devm frees the
     backing memory while the chip is still registered (use-after-free).
     Switch to devm_gpiochip_add_data() in the shared probe/init paths.

  2. Fix a pre-existing EINT resource leak on unbind. mtk_eint_do_init()
     creates an IRQ domain, an interrupt mapping per EINT line and a
     chained handler on the parent interrupt, none of which were ever
     released. Once the drivers can be unbound/rmmod'd this leaves a
     dangling IRQ domain, mappings whose chip data points at freed
     memory, and a chained handler still firing into that freed data.
     Tear them down with a device-managed action, matching the devm
     lifecycle used for the gpio_chip.

  3. Make the shared common code modular. The SoC drivers link against
     pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c,
     whose Kconfig symbols were bool and which exported nothing. Without
     this, selecting a SoC driver as =m forces the common symbol to =y
     and the module fails to link against the unexported entry points.
     Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
     tristate, export the entry points, and add MODULE_LICENSE()/
     MODULE_DESCRIPTION(). The already-modular v2 common code
     additionally needs mtk_rmw() exported, since it is called directly
     by SoC drivers such as mt7623. The shared symbols are exported in
     the "MTK_PINCTRL" symbol namespace (EXPORT_SYMBOL_NS_GPL()), and
     each SoC driver that uses them declares MODULE_IMPORT_NS().

  4. Convert the MT7986 driver to a single initcall. It registers two
     platform drivers (mt7986a/mt7986b) and used to call arch_initcall()
     twice. A module has only one module_init(), so two arch_initcall()s
     break the module build with a redefinition of
     init_module()/__inittest(). Fold both drivers into one
     platform_register_drivers() call from a single initcall. No
     functional change when built-in.

  5. Flip every SoC driver's Kconfig from bool to tristate and add the
     module metadata.

The series builds cleanly under allmodconfig on arm64 (all SoC drivers
as =m).

Changes in v6:
 - Export the shared common symbols in the "MTK_PINCTRL" namespace using
   EXPORT_SYMBOL_NS_GPL() instead of the global EXPORT_SYMBOL_GPL(), and
   add MODULE_IMPORT_NS("MTK_PINCTRL") to every SoC driver that consumes
   them, as suggested by Chen-Yu Tsai while reviewing the common-driver
   patch (patch 3/5).
 - Added a new patch, "pinctrl: mediatek: free EINT resources on unbind"
   (patch 2/5). Chen-Yu Tsai pointed out that the manual cleanup removed
   in patch 1/5 also used to cover mtk_eint_init(), and that converting
   to devm without an EINT counterpart would leave a dangling IRQ domain
   and an active-but-stale chained handler on rmmod/unbind. As suggested,
   this is a separate patch rather than folded into patch 1/5.
 - Added Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> to patch 1/5
   (devm_gpiochip_add_data) and patch 4/5 (mt7986 single initcall).

Review status: patches 1/5 and 4/5 carry Chen-Yu Tsai's Reviewed-by;
patch 5/5 carries AngeloGioacchino Del Regno's Reviewed-by (from the
per-driver patches reviewed in v4, preserved across the squash). Patches
2/5 and 3/5 have not been reviewed yet.

Justin Yeh (5):
  pinctrl: mediatek: use devm_gpiochip_add_data() for GPIO chip
  pinctrl: mediatek: free EINT resources on unbind
  pinctrl: mediatek: allow common drivers to be built as modules
  pinctrl: mediatek: mt7986: register both platform drivers from a
    single initcall
  pinctrl: mediatek: enable module build support for all SoC drivers

 drivers/pinctrl/mediatek/Kconfig              | 70 +++++++++----------
 drivers/pinctrl/mediatek/mtk-eint.c           | 21 +++++-
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 11 +--
 drivers/pinctrl/mediatek/pinctrl-mt2701.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt2712.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt6795.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6797.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6878.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt6893.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt7620.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7621.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7622.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7623.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7629.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7981.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     | 19 ++---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt8127.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt8135.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt8173.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-mt8183.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8186.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8188.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8192.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8365.c     |  2 +
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     |  4 ++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 22 +++---
 drivers/pinctrl/mediatek/pinctrl-mtmips.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  2 +-
 drivers/pinctrl/mediatek/pinctrl-rt2880.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-rt305x.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-rt3883.c     |  4 ++
 39 files changed, 190 insertions(+), 59 deletions(-)


base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
-- 
2.45.2

