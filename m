Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFD1C433EF
	for <linux-gpio@archiver.kernel.org>; Sat, 18 Jun 2022 13:10:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiFRNKr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 18 Jun 2022 09:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiFRNKr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jun 2022 09:10:47 -0400
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225E517048;
        Sat, 18 Jun 2022 06:10:41 -0700 (PDT)
X-QQ-mid: bizesmtp78t1655557745taoefuin
Received: from localhost.localdomain ( [125.70.163.206])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Sat, 18 Jun 2022 21:09:01 +0800 (CST)
X-QQ-SSF: 01000000002000D0I000B00A0000000
X-QQ-FEAT: mp05QlZ6er31q1MrCHV1u0rzmqaMNdwuu85emdj4nemWnmenvIbukvyKp3Ayx
        9vIsiLGSMyz+7BzxjsSRiTUW/uBTcKFOpJq0OuX6DowBSqayWbdP4mDNpsgh3H+tLNSbLt3
        iN4JQsIc4fY62m5iaz8kvQ7MSXqtO6vAY9UqX6+gXa84X3RCRdzg+uiIoIK6RyPGooVW+56
        W1hUJzI+tHBjlJRkYHLCnnJllUTcf5LFL9Ka0sICt8npjubbVMYjCHQJVZr/1zqjSuelemA
        p+4T7MBBZETzvho73jWovfaGdeenUx7b6r0u8dXa0YzxeDpQxPoqPNytYodzgldmq12qGSi
        xRC/O5G
X-QQ-GoodBg: 0
From:   Xiang wangx <wangxiang@cdjrlc.com>
To:     andrew@aj.id.au
Cc:     linus.walleij@linaro.org, joel@jms.id.au,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH] pinctrl: aspeed: Fix typo in comment
Date:   Sat, 18 Jun 2022 21:08:54 +0800
Message-Id: <20220618130854.12321-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Delete the redundant word 'and'.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index 4d7548686f39..aaa78a613196 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -632,7 +632,7 @@ struct aspeed_pin_desc {
 	SIG_EXPR_LIST_ALIAS(pin, sig, group)
 
 /**
- * Similar to the above, but for pins with a dual expressions (DE) and
+ * Similar to the above, but for pins with a dual expressions (DE)
  * and a single group (SG) of pins.
  *
  * @pin: The pin the signal will be routed to
-- 
2.36.1

