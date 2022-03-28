Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E67C433F5
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Mar 2022 03:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237836AbiC1DgW (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 27 Mar 2022 23:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbiC1DgV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2022 23:36:21 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AAADFA2;
        Sun, 27 Mar 2022 20:34:37 -0700 (PDT)
X-UUID: 51dadd8ee35d4b25ada0d76fd284df98-20220328
X-UUID: 51dadd8ee35d4b25ada0d76fd284df98-20220328
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1984873051; Mon, 28 Mar 2022 11:34:32 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 11:34:31 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Mar
 2022 11:34:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Mar 2022 11:34:31 +0800
From:   Miles Chen <miles.chen@mediatek.com>
To:     <fparent@baylibre.com>
CC:     <linus.walleij@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>, <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8195: enable driver on mtk platforms
Date:   Mon, 28 Mar 2022 11:34:31 +0800
Message-ID: <20220328033431.22149-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220327160813.2978637-1-fparent@baylibre.com>
References: <20220327160813.2978637-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Set the pinctrl driver as built-in by default if
> ARM64 and ARCH_MEDIATEK are enabled.
> 
> Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 
