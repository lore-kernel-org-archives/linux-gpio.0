Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E437C001B0
	for <linux-gpio@archiver.kernel.org>; Thu, 10 Aug 2023 12:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjHJM0G (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 10 Aug 2023 08:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233483AbjHJM0F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 08:26:05 -0400
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035CA2129;
        Thu, 10 Aug 2023 05:26:04 -0700 (PDT)
Received: by air.basealt.ru (Postfix, from userid 490)
        id 679AF2F20233; Thu, 10 Aug 2023 12:00:00 +0000 (UTC)
Received: from shell.ipa.basealt.ru (unknown [176.12.98.74])
        by air.basealt.ru (Postfix) with ESMTPSA id AA1882F20238;
        Thu, 10 Aug 2023 11:59:54 +0000 (UTC)
From:   Alexander Ofitserov <oficerovas@altlinux.org>
To:     oficerovas@altlinux.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] pinctrl: tigerlake: Add Alder Lake-P ACPI ID
Date:   Thu, 10 Aug 2023 14:59:38 +0300
Message-Id: <20230810115938.3741058-5-oficerovas@altlinux.org>
X-Mailer: git-send-email 2.33.8
In-Reply-To: <20230810115938.3741058-1-oficerovas@altlinux.org>
References: <20230810115938.3741058-1-oficerovas@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Intel Alder Lake-P has the same pin layout as the Tiget Lake-LP
so add support for this to the existing Tiger Lake driver.

Signed-off-by: Alexander Ofitserov <oficerovas@altlinux.org>
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index bed769d99b8be0..3ddaeffc04150a 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -748,6 +748,7 @@ static const struct intel_pinctrl_soc_data tglh_soc_data = {
 static const struct acpi_device_id tgl_pinctrl_acpi_match[] = {
 	{ "INT34C5", (kernel_ulong_t)&tgllp_soc_data },
 	{ "INT34C6", (kernel_ulong_t)&tglh_soc_data },
+	{ "INTC1055", (kernel_ulong_t)&tgllp_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tgl_pinctrl_acpi_match);
-- 
2.33.8

