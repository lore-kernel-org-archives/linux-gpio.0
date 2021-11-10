Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BCBC433FE
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Nov 2021 07:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28761611F2
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Nov 2021 07:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhKJHWE (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 10 Nov 2021 02:22:04 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:44892 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229595AbhKJHWC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Nov 2021 02:22:02 -0500
X-UUID: fb885c975e1d4567a438e779bbdd3394-20211110
X-UUID: fb885c975e1d4567a438e779bbdd3394-20211110
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1100266974; Wed, 10 Nov 2021 15:19:03 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 10 Nov 2021 15:19:02 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 10 Nov 2021 15:19:01 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <rex-bc.chen@mediatek.com>, <guodong.liu@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v4 0/1] Mediatek pinctrl patch 
Date:   Wed, 10 Nov 2021 15:18:59 +0800
Message-ID: <20211110071900.4490-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes 1 patches:
1. fix global-out-of-bounds issue.

Changes in patch v4:
1. fix sort signed-off-by name.
2. add Reviewed-by.

Changes in patch v3:
1. keep original patch author
2. fix version issue.

Changes in patch v2:
1. change check eint number boundary condition.

Guodong Liu (1):
  pinctrl: mediatek: fix global-out-of-bounds issue

 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--
2.18.0


