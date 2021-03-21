Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,RDNS_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (unknown [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D97FC433E2
	for <linux-gpio@archiver.kernel.org>; Sun, 21 Mar 2021 03:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 470FA619A1
	for <linux-gpio@archiver.kernel.org>; Sun, 21 Mar 2021 03:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCUDcw (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 20 Mar 2021 23:32:52 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:43874 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229834AbhCUDcX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Mar 2021 23:32:23 -0400
X-UUID: 1a65ac699edd4bfcaa8754dfa25f540e-20210321
X-UUID: 1a65ac699edd4bfcaa8754dfa25f540e-20210321
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1502329506; Sun, 21 Mar 2021 11:32:16 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Mar 2021 11:31:54 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 21 Mar 2021 11:31:53 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
        <jg_poxu@mediatek.com>, <biao.huang@mediatek.com>,
        <hongzhou.yang@mediatek.com>, <erin.lo@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <sj.huang@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v2 0/1] Mediatek pinctrl patch
Date:   Sun, 21 Mar 2021 11:31:49 +0800
Message-ID: <20210321033150.15380-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes 1 patches:
1.add lock in mtk_rmw function.

Changes in patch v2:
1)add mutex lock init in "pinctrl-moore.c".

Zhiyong Tao (1):
  pinctrl: add lock in mtk_rmw function.

 drivers/pinctrl/mediatek/pinctrl-moore.c         | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 ++
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 ++
 4 files changed, 10 insertions(+)

--
2.25.1


