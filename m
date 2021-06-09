Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5526C48BCD
	for <linux-gpio@archiver.kernel.org>; Wed,  9 Jun 2021 06:34:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADDDC61183
	for <linux-gpio@archiver.kernel.org>; Wed,  9 Jun 2021 06:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbhFIGgu (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 9 Jun 2021 02:36:50 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:39534 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232185AbhFIGgt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Jun 2021 02:36:49 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 1596Ylxp013759
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 9 Jun 2021 08:34:47 +0200
Received: from localhost.localdomain ([139.22.32.109])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 1596RRxQ012013;
        Wed, 9 Jun 2021 08:27:27 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH] pinctrl: intel: fix NULL pointer deref
Date:   Wed,  9 Jun 2021 08:27:22 +0200
Message-Id: <20210609062722.9132-1-henning.schild@siemens.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

match could be NULL in which case we do not go ACPI after all

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 85750974d182..dca17bb76cac 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1601,12 +1601,12 @@ const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_
 	const struct intel_pinctrl_soc_data *data = NULL;
 	const struct intel_pinctrl_soc_data **table;
 	struct acpi_device *adev;
+	const void *match;
 	unsigned int i;
 
 	adev = ACPI_COMPANION(&pdev->dev);
-	if (adev) {
-		const void *match = device_get_match_data(&pdev->dev);
-
+	match = device_get_match_data(&pdev->dev);
+	if (adev && match) {
 		table = (const struct intel_pinctrl_soc_data **)match;
 		for (i = 0; table[i]; i++) {
 			if (!strcmp(adev->pnp.unique_id, table[i]->uid)) {
-- 
2.31.1

