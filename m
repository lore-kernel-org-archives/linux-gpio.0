Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843A5C63798
	for <linux-gpio@archiver.kernel.org>; Fri, 20 Nov 2020 09:31:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A55322226
	for <linux-gpio@archiver.kernel.org>; Fri, 20 Nov 2020 09:31:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbgKTJbF (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 20 Nov 2020 04:31:05 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:59954 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727431AbgKTJbF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 04:31:05 -0500
X-UUID: 15420518b3bc4f9087a37f5262ce3e6e-20201120
X-UUID: 15420518b3bc4f9087a37f5262ce3e6e-20201120
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 610309655; Fri, 20 Nov 2020 17:31:02 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 17:31:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 17:31:00 +0800
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
Subject: [PATCH 0/1] Mediatek pinctrl patch 
Date:   Fri, 20 Nov 2020 17:30:57 +0800
Message-ID: <20201120093058.7248-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes 1 patches:
1.fix low level output voltage issue.

Zhiyong Tao (1):
  pinctrl: fix low level output voltage issue

 drivers/pinctrl/mediatek/pinctrl-paris.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--
2.18.0


