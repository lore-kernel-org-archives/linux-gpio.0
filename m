Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2A6ECAAD2
	for <linux-gpio@archiver.kernel.org>; Fri, 26 Aug 2022 07:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245543AbiHZHo7 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 26 Aug 2022 03:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245586AbiHZHoq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 03:44:46 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F422D346D;
        Fri, 26 Aug 2022 00:44:40 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MDWwd2F9QzkWg7;
        Fri, 26 Aug 2022 15:41:05 +0800 (CST)
Received: from CHINA (10.175.102.38) by canpemm500009.china.huawei.com
 (7.192.105.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 26 Aug
 2022 15:44:37 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH -next 1/2] genirq/irq_sim: Allow both one and two cell bindings
Date:   Fri, 26 Aug 2022 08:02:29 +0000
Message-ID: <20220826080230.1712978-2-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826080230.1712978-1-weiyongjun1@huawei.com>
References: <20220826080230.1712978-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The IRQ simulator only support one cell binding now, this patch make it
works with either one or two cell bindings, where the cell values map
directly to the irq number and irq flags.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 kernel/irq/irq_sim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index dd76323ea3fd..73a90b7b6022 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -149,6 +149,7 @@ static void irq_sim_domain_unmap(struct irq_domain *domain, unsigned int virq)
 static const struct irq_domain_ops irq_sim_domain_ops = {
 	.map		= irq_sim_domain_map,
 	.unmap		= irq_sim_domain_unmap,
+	.xlate		= irq_domain_xlate_onetwocell,
 };
 
 /**
-- 
2.34.1

