Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166DCC77B75
	for <linux-gpio@archiver.kernel.org>; Fri, 19 May 2023 17:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjESRJ3 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 19 May 2023 13:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbjESRJX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 May 2023 13:09:23 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9306A170B;
        Fri, 19 May 2023 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ermZR
        AVuUoVUkWCNUZOtH1iovxjOCeT0E8mJeG1r0+I=; b=c8bg5UGkN+QKNMc7GUCVj
        nbRykxbHGXSq6kDTA0CCIynXgQiwtfU+WEMBP3GV44WqWelTu0N1XuTqmk7NZZLL
        SB6hTSYVDUWIEJK5Bc1WqJhVi21tUxRQHmFoum6OR3mQWH+bIZgNMzrEfhL4UUoM
        aniNd2AfBAOBN7fiGizrVk=
Received: from lizhe.. (unknown [120.245.132.248])
        by zwqz-smtp-mta-g5-3 (Coremail) with SMTP id _____wCnJg_FrGdktqNhAA--.38178S4;
        Sat, 20 May 2023 01:07:59 +0800 (CST)
From:   Lizhe <sensor1010@163.com>
To:     lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
        daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
        linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lizhe <sensor1010@163.com>
Subject: [PATCH] drivers/pinctrl.c : Remove redundant clearing of IRQ_TYPE_SENSE_MASK
Date:   Sat, 20 May 2023 01:07:16 +0800
Message-Id: <20230519170716.3459-1-sensor1010@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnJg_FrGdktqNhAA--.38178S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy8uF1xGF4UZF1kWr1rJFb_yoWfGrX_uF
        W5J39Fq3y8WF1ayrWxKr43ZFZ0yF4UXFnYgasYqan3CrW5Aw4jyrn7uF15Cws3uryUuFyj
        yryrXr4Fyry7AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKpBTDUUUUU==
X-Originating-IP: [120.245.132.248]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBdBF0q1gi6LwzcwAAsU
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Before executing microchip_sgpio_irq_set_type(),
type has already been cleared IRQ_TYPE_SENSE_MASK, see __irq_set_trigger().

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index 4794602316e7..59f232a68b5a 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -719,8 +719,6 @@ static void microchip_sgpio_irq_ack(struct irq_data *data)
 
 static int microchip_sgpio_irq_set_type(struct irq_data *data, unsigned int type)
 {
-	type &= IRQ_TYPE_SENSE_MASK;
-
 	switch (type) {
 	case IRQ_TYPE_EDGE_BOTH:
 		irq_set_handler_locked(data, handle_edge_irq);
-- 
2.34.1

