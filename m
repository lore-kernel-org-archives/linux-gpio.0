Return-Path: <SRS0=WqBB=ZO=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC58DC432C0
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Nov 2019 06:11:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 957312068F
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Nov 2019 06:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574403097;
	bh=puEy/f7+ZYZ6FdHQS/eQpBxy58+YBZzkDNytPQt3Aww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=zdI/CpFsROyNFqrdkG31lo1SgFsEscEplaqEpkeF3ls+AHfJf1ctfrUhcwvnOw/hY
	 HCnvzjSKmMpU0qPZLe3ygDOQInpxBtRFGPt5h9mOjicyIsGyQ3JJs0FXH/g8uZyBQw
	 3BL3dQ4sYhc9xIWtsEZJOLw3qsiu7g55zoDJHA40=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbfKVF42 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 22 Nov 2019 00:56:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:34256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729147AbfKVF41 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Nov 2019 00:56:27 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 149862071F;
        Fri, 22 Nov 2019 05:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574402186;
        bh=puEy/f7+ZYZ6FdHQS/eQpBxy58+YBZzkDNytPQt3Aww=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t0+y3+AGfuGZ/i70OG2tq9mZXQ+d1vkKCV1qOuVmY0hE43dHtJfQPD1MbvlL9IQeU
         0xi06HaEC3WAHU/U92f5AXqZQB2GXCtW4h52a9cPhSlTR1FSiSr/mzXvfYUkAqDMQ5
         Bki2SUFu8VHmyVCiRcGJKaH0sJiBiNBwR7mwZn/I=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Martin Schiller <ms@dev.tdt.de>, John Crispin <john@phrozen.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 037/127] pinctrl: xway: fix gpio-hog related boot issues
Date:   Fri, 22 Nov 2019 00:54:15 -0500
Message-Id: <20191122055544.3299-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122055544.3299-1-sashal@kernel.org>
References: <20191122055544.3299-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Martin Schiller <ms@dev.tdt.de>

[ Upstream commit 9b4924da4711674e62d97d4f5360446cc78337af ]

This patch is based on commit a86caa9ba5d7 ("pinctrl: msm: fix gpio-hog
related boot issues").

It fixes the issue that the gpio ranges needs to be defined before
gpiochip_add().

Therefore, we also have to swap the order of registering the pinctrl
driver and registering the gpio chip.

You also have to add the "gpio-ranges" property to the pinctrl device
node to get it finally working.

Signed-off-by: Martin Schiller <ms@dev.tdt.de>
Acked-by: John Crispin <john@phrozen.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-xway.c | 39 +++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index f9e98a7d4f0ce..1b0c5958c56a7 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1748,14 +1748,6 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 	}
 	xway_pctrl_desc.pins = xway_info.pads;
 
-	/* register the gpio chip */
-	xway_chip.parent = &pdev->dev;
-	ret = devm_gpiochip_add_data(&pdev->dev, &xway_chip, NULL);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register gpio chip\n");
-		return ret;
-	}
-
 	/* setup the data needed by pinctrl */
 	xway_pctrl_desc.name	= dev_name(&pdev->dev);
 	xway_pctrl_desc.npins	= xway_chip.ngpio;
@@ -1777,10 +1769,33 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* finish with registering the gpio range in pinctrl */
-	xway_gpio_range.npins = xway_chip.ngpio;
-	xway_gpio_range.base = xway_chip.base;
-	pinctrl_add_gpio_range(xway_info.pctrl, &xway_gpio_range);
+	/* register the gpio chip */
+	xway_chip.parent = &pdev->dev;
+	xway_chip.owner = THIS_MODULE;
+	xway_chip.of_node = pdev->dev.of_node;
+	ret = devm_gpiochip_add_data(&pdev->dev, &xway_chip, NULL);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register gpio chip\n");
+		return ret;
+	}
+
+	/*
+	 * For DeviceTree-supported systems, the gpio core checks the
+	 * pinctrl's device node for the "gpio-ranges" property.
+	 * If it is present, it takes care of adding the pin ranges
+	 * for the driver. In this case the driver can skip ahead.
+	 *
+	 * In order to remain compatible with older, existing DeviceTree
+	 * files which don't set the "gpio-ranges" property or systems that
+	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
+	 */
+	if (!of_property_read_bool(pdev->dev.of_node, "gpio-ranges")) {
+		/* finish with registering the gpio range in pinctrl */
+		xway_gpio_range.npins = xway_chip.ngpio;
+		xway_gpio_range.base = xway_chip.base;
+		pinctrl_add_gpio_range(xway_info.pctrl, &xway_gpio_range);
+	}
+
 	dev_info(&pdev->dev, "Init done\n");
 	return 0;
 }
-- 
2.20.1

