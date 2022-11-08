Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D35EC4321E
	for <linux-gpio@archiver.kernel.org>; Tue,  8 Nov 2022 09:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233602AbiKHJrM (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 8 Nov 2022 04:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233660AbiKHJrJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 04:47:09 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3552A278;
        Tue,  8 Nov 2022 01:47:06 -0800 (PST)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N63Ch4rlSzRp50;
        Tue,  8 Nov 2022 17:46:56 +0800 (CST)
Received: from localhost.localdomain (10.175.103.91) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 17:47:03 +0800
From:   Wei Li <liwei391@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <huawei.libin@huawei.com>
Subject: [PATCH] dt-bindings: pinctrl: Correct the header guard of mt6795-pinfunc.h
Date:   Tue, 8 Nov 2022 17:45:29 +0800
Message-ID: <20221108094529.3597920-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename the header guard of mt6795-pinfunc.h from __DTS_MT8173_PINFUNC_H to
__DTS_MT6795_PINFUNC_H what corresponding with the file name.

Fixes: 81557a71564a ("dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl bindings")
Signed-off-by: Wei Li <liwei391@huawei.com>
---
 include/dt-bindings/pinctrl/mt6795-pinfunc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/pinctrl/mt6795-pinfunc.h b/include/dt-bindings/pinctrl/mt6795-pinfunc.h
index bd1c5a9fad06..dfd3f6f13e0d 100644
--- a/include/dt-bindings/pinctrl/mt6795-pinfunc.h
+++ b/include/dt-bindings/pinctrl/mt6795-pinfunc.h
@@ -4,8 +4,8 @@
  * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
-#ifndef __DTS_MT8173_PINFUNC_H
-#define __DTS_MT8173_PINFUNC_H
+#ifndef __DTS_MT6795_PINFUNC_H
+#define __DTS_MT6795_PINFUNC_H
 
 #include <dt-bindings/pinctrl/mt65xx.h>
 
-- 
2.25.1

