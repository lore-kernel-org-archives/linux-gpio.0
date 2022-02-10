Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617C1C433FE
	for <linux-gpio@archiver.kernel.org>; Thu, 10 Feb 2022 14:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242743AbiBJOTh (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 10 Feb 2022 09:19:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242737AbiBJOTh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 09:19:37 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8407BF5;
        Thu, 10 Feb 2022 06:19:38 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id CCACB1F4656A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1644502777;
        bh=sQ+FKkicNUDc/dNX696E1r1KBxy8rCFNJOXpjtexupY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZM0WFhkt1W5EvBOeUJpFadV9V97cO6GR6en/cvtgJtW2zYjFEGTgI6cCNtDul8Zgm
         SqHciHMaFJrknyO9tr8lImjDW6ArvKNQjc2YOfmjFJ8Qzf7l1o3uAHRO1gL44HF/Az
         5ejkGtb+uRTdytPAs2oWQz72Rp7sxrPgtJFVOJjHDJGjp3ovUyZdaxmp9jx3PU4GZV
         LdY6/iovw4q2SGd3CjG3qRlC/WpltpHLBbevtQ1BtCeJTY6+YyNUbz7r7BJVjv7bJY
         oIK82HNjxoGZhKB8dvpoMgtePTXQlqRtPZ916fdPLGY2knsUgf7CqZCdR/Z8T2lPJy
         msHrq6V9Am/rg==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     sean.wang@kernel.org
Cc:     linus.walleij@linaro.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/5] pinctrl: mediatek: common-v1: Add common probe function
Date:   Thu, 10 Feb 2022 15:19:28 +0100
Message-Id: <20220210141931.291712-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As a preparation to cleanup the probe mechanism of mediatek pinctrl
drivers that are using the v1 controller, add a common probe function
to this driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 11 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 6f8dfa6ae5a0..007da39b68c9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1115,3 +1115,14 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	gpiochip_remove(pctl->chip);
 	return ret;
 }
+
+int mtk_pctrl_common_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct mtk_pinctrl_devdata *data = device_get_match_data(dev);
+
+	if (!data)
+		return -ENOENT;
+
+	return mtk_pctrl_init(pdev, data, NULL);
+}
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
index 98f27cdc609a..cd264cc3547b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
@@ -277,6 +277,8 @@ int mtk_pctrl_init(struct platform_device *pdev,
 		const struct mtk_pinctrl_devdata *data,
 		struct regmap *regmap);
 
+int mtk_pctrl_common_probe(struct platform_device *pdev);
+
 int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
 		const struct mtk_pin_spec_pupd_set_samereg *pupd_infos,
 		unsigned int info_num, unsigned int pin,
-- 
2.33.1

