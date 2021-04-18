Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854ECC43461
	for <linux-gpio@archiver.kernel.org>; Sun, 18 Apr 2021 14:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64B556135B
	for <linux-gpio@archiver.kernel.org>; Sun, 18 Apr 2021 14:44:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbhDROpP (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 18 Apr 2021 10:45:15 -0400
Received: from out28-121.mail.aliyun.com ([115.124.28.121]:35990 "EHLO
        out28-121.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbhDROpO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Apr 2021 10:45:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.077516|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00333635-0.000227116-0.996437;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.K.sSkG._1618757074;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K.sSkG._1618757074)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sun, 18 Apr 2021 22:44:42 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        stable@vger.kernel.org
Subject: [PATCH v6 01/12] pinctrl: Ingenic: Add missing pins to the JZ4770 MAC MII group.
Date:   Sun, 18 Apr 2021 22:44:22 +0800
Message-Id: <1618757073-1724-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618757073-1724-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1618757073-1724-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MII group of JZ4770's MAC should have 7 pins, add missing
pins to the MII group.

Fixes: 5de1a73e78ed ("Pinctrl: Ingenic: Add missing parts for JZ4770 and JZ4780.")
Cc: <stable@vger.kernel.org>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    Add fixes tag.
    
    v3->v4:
    1.Add Cc: <stable@vger.kernel.org>.
    2.Add Andy Shevchenko's Reviewed-by.
    3.Add Paul Cercueil's Reviewed-by.
    
    v4->v5:
    No change.
    
    v5->v6:
    No change.

 drivers/pinctrl/pinctrl-ingenic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index f274612..05dfa0a 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -667,7 +667,9 @@ static int jz4770_pwm_pwm7_pins[] = { 0x6b, };
 static int jz4770_mac_rmii_pins[] = {
 	0xa9, 0xab, 0xaa, 0xac, 0xa5, 0xa4, 0xad, 0xae, 0xa6, 0xa8,
 };
-static int jz4770_mac_mii_pins[] = { 0xa7, 0xaf, };
+static int jz4770_mac_mii_pins[] = {
+	0x7b, 0x7a, 0x7d, 0x7c, 0xa7, 0x24, 0xaf,
+};
 
 static const struct group_desc jz4770_groups[] = {
 	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data, 0),
-- 
2.7.4

