Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07B6ECAAD5
	for <linux-gpio@archiver.kernel.org>; Thu,  1 Sep 2022 01:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiIABaV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 31 Aug 2022 21:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbiIAB3z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 21:29:55 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B72D614D
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 18:29:50 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id 598899004C8;
        Thu,  1 Sep 2022 09:29:48 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 2/3] gpio: rockchip: get pinctrl node from 'gpio-ranges' property
Date:   Thu,  1 Sep 2022 09:29:43 +0800
Message-Id: <20220901012944.2634398-5-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901012944.2634398-1-jay.xu@rock-chips.com>
References: <20220901012944.2634398-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSRhIVh1KGU0aGB1OQxpOH1UTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktITkhVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NC46NRw5TD0xCU0WSA4VFho*
        CkMwFA5VSlVKTU1KQkJOTENDQ01NVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUlCSkM3Bg++
X-HM-Tid: 0a82f6ab28f32eafkusn598899004c8
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The dt nodes for rockchip soc designes as

    pinctrl: pinctrl {
        gpio {
	};
    };

Currently, we get the pinctrl dt node from parent of gpio, this patch
try to get pinctrl dt node from 'gpio-ranges' property.

After this patch, the dt nodes possible to be

    gpio {
        gpio-ranges = <&pinctrl xxx>;
    };

    pinctrl: pinctrl {
    };

then the gpio driver could register as platform device itself, but not
populate from pinctrl driver.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 1da0324445cc..46c54dff92db 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -690,6 +690,9 @@ rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
 	int i, found = 0;
 
 	info = pinctrl_dev_get_drvdata(pctldev);
+	if (!info)
+		return NULL;
+
 	bank = info->ctrl->pin_banks;
 	for (i = 0; i < info->ctrl->nr_banks; i++, bank++) {
 		if (bank->bank_num == id) {
@@ -705,15 +708,16 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *pctlnp = of_get_parent(np);
+	struct device_node *pctlnp = NULL;
 	struct pinctrl_dev *pctldev = NULL;
 	struct rockchip_pin_bank *bank = NULL;
 	struct rockchip_pin_output_deferred *cfg;
 	static int gpio;
 	int id, ret;
 
-	if (!np || !pctlnp)
-		return -ENODEV;
+	pctlnp = of_parse_phandle(np, "gpio-ranges", 0);
+	if (!pctlnp)
+		pctlnp = of_get_parent(np);
 
 	pctldev = of_pinctrl_get(pctlnp);
 	if (!pctldev)
-- 
2.25.1

