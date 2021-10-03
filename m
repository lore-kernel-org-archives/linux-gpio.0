Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22F6C433F5
	for <linux-gpio@archiver.kernel.org>; Sun,  3 Oct 2021 08:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FB1D61108
	for <linux-gpio@archiver.kernel.org>; Sun,  3 Oct 2021 08:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhJCIdw (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 3 Oct 2021 04:33:52 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:37936 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229940AbhJCIdv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 3 Oct 2021 04:33:51 -0400
Received: from g550jk.portal.nstrein.ns.nl (unknown [145.15.244.215])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 4A762C9115;
        Sun,  3 Oct 2021 08:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633249923; bh=Dnqi2pXbnY/JNzz6QlVr9FCTaGk42dEDlrk2dXM7fDo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ixe/6P/RXoBLCQNiexM1gGA3jlZKR6RMnA14fuv3xs+pS/xJF6omVwHD+TBVU1z9a
         Iw+xYKxSIqt1kIAUFivf6LmAVV1zfklXegeIWveXE8iAN2it1MhZQaxXfe9Ux0Df5h
         8TvS15mmYhzc6rLfXh9NpG/xIJ4W3yHTW8EKzi2w=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] pinctrl: qcom: spmi-gpio: Add compatible for PM6350
Date:   Sun,  3 Oct 2021 10:31:28 +0200
Message-Id: <20211003083141.613509-6-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003083141.613509-1-luca@z3ntu.xyz>
References: <20211003083141.613509-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the GPIO controller in the pm6350 PMIC.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 98bf0e2a2a8d..55a9227a87fd 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1110,6 +1110,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm6350-gpio", .data = (void *) 9 },
 	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8008-gpio", .data = (void *) 2 },
-- 
2.33.0

