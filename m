Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFF8C77B7F
	for <linux-gpio@archiver.kernel.org>; Sun, 14 May 2023 17:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235504AbjENRAJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 14 May 2023 13:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjENRAI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 May 2023 13:00:08 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6E3B73A8F;
        Sun, 14 May 2023 10:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=IENsN
        D1np6J/rLyHblKjvAzLL1b2z/sAgmijvedzrLM=; b=OQgMQLuFxOPi2gynFpw7R
        EIrruI9dqi764WomABsUY3q1nsvOJETragCYY75b22Oi30+iqWcxnI5jfduEBymd
        Mc/vurOHOeIXtdscmHQX144HamLwZWVU9jbbe6jOA11Jhd6df4zX4AL6ow+ewRku
        GHTUjtSxvQCynB4NgDoMj4=
Received: from lizhe.. (unknown [120.245.132.205])
        by zwqz-smtp-mta-g3-2 (Coremail) with SMTP id _____wB3pRl2E2FkWM+gBw--.149S4;
        Mon, 15 May 2023 01:00:00 +0800 (CST)
From:   Lizhe <sensor1010@163.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lizhe <sensor1010@163.com>
Subject: [PATCH v1] drivers/pinconf.c: Remove redundant check for the existence of the member
Date:   Mon, 15 May 2023 00:59:32 +0800
Message-Id: <20230514165932.251200-1-sensor1010@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3pRl2E2FkWM+gBw--.149S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ury5CryUurW5CFyfXry3twb_yoW8Gr47pa
        yfWr15Ar1rKFs8Ca1UGay0gFyYk3Z7GanrCw47tas3AF13AFyDArn5Kw4Iy34jkrn5uw1a
        q34ruFyY934kKFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi1rWxUUUUU=
X-Originating-IP: [120.245.132.205]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBlxBvq2I0ZA6V4wAAsJ
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

"pin_config_set" in pinconf_ops.

In the function of registering pinctrl_dev, pinctrl_init_controller(),
a non-null check has already been performed on the members
pin_config_set and pin_config_group_set in the ops structure.

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/pinctrl/pinconf.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index d9d54065472e..7b078d4ab61e 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -158,10 +158,6 @@ int pinconf_apply_setting(const struct pinctrl_setting *setting)
 
 	switch (setting->type) {
 	case PIN_MAP_TYPE_CONFIGS_PIN:
-		if (!ops->pin_config_set) {
-			dev_err(pctldev->dev, "missing pin_config_set op\n");
-			return -EINVAL;
-		}
 		ret = ops->pin_config_set(pctldev,
 				setting->data.configs.group_or_pin,
 				setting->data.configs.configs,
@@ -174,11 +170,6 @@ int pinconf_apply_setting(const struct pinctrl_setting *setting)
 		}
 		break;
 	case PIN_MAP_TYPE_CONFIGS_GROUP:
-		if (!ops->pin_config_group_set) {
-			dev_err(pctldev->dev,
-				"missing pin_config_group_set op\n");
-			return -EINVAL;
-		}
 		ret = ops->pin_config_group_set(pctldev,
 				setting->data.configs.group_or_pin,
 				setting->data.configs.configs,
-- 
2.34.1

