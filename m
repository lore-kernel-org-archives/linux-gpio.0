Return-Path: <SRS0=dqG7=WL=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBF8C31E40
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Aug 2019 06:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5DCE2084D
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Aug 2019 06:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2iP5iut"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730267AbfHOGJ2 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 15 Aug 2019 02:09:28 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37175 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfHOGJ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 02:09:28 -0400
Received: by mail-pf1-f194.google.com with SMTP id 129so862035pfa.4;
        Wed, 14 Aug 2019 23:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VonLxeXzm4d5qgoc9ChWSBtiaAORF6M5FiOxTHR0FaY=;
        b=J2iP5iutURjJjQKpPhMsqotyTVgy4kaEFsVG9SvobCSwa9cvGquNPu+HKjcvHSBB40
         p2fTpi2c3dGpZePogrVcYQ0OKFRhZI1sKd4MR7oYXud8K3I5DNus262O6idvIv+NJHg2
         hHjccjcf3+UW89L/iN0R4T1oDOm1A4sJwaDRkbkfoertZ8smI/P0fO4pEopyRNSfdV5r
         tJNE0lvLNUbtIMeZCihZ7iFWaZA/NgOZdtg2V+CGIGsK9WxDtWMfCV48NV4dEUGXtzgt
         8oEm4ucMguBG0OdPAq4Hi8CF7opkW8lGwZZN7oS87Z/rcb5ZQWe2Afj2M37inNHrkDb+
         lhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VonLxeXzm4d5qgoc9ChWSBtiaAORF6M5FiOxTHR0FaY=;
        b=S5lzhizh4n5Hlry2OMSawpKLszN64/mm6jLF2fF0H83ebvtozNKKfmOA1QV40kvS90
         EoUQfyGEFuGEINz1jImd4QvhuDtbgbBo/N/Xs3SPmN1W/KDsUJZ8Ox0TgT1hMW0A1TMA
         pELE/YVbc98hMVGBxZMK+9/0tXr5L/nwYrxmjSLJuEN2PaQ+FVDrB2HJ8EkcxyISK30Y
         SXuNHZMlzXHDvjf2jpS2PkayacRGU4F1ZKBvqW4lekXWT4u6ffHvEmRzgFXFZ2tYQtzM
         H0xXeYTiiG/fSiddMDyhC2qRO0/VBPll6Q0ztfam9rWwPA2/TtvL36R0WGwy1rJF6XZV
         XrOQ==
X-Gm-Message-State: APjAAAX8HiqXeFLEVAZalTXlbZWq3W9yXd4iq07fZtPMhKuU5PF6ELis
        Jyr/ci2rMusHdmSrhvonqMw=
X-Google-Smtp-Source: APXvYqxUhefp2R8HfrMdPrwR2ARx5U4c5Cb1brTLU/ukqF6cLxx2E3cxlLle/qkuYMoOqkdd+FV0Sw==
X-Received: by 2002:a17:90a:1b0d:: with SMTP id q13mr831549pjq.102.1565849367548;
        Wed, 14 Aug 2019 23:09:27 -0700 (PDT)
Received: from localhost.localdomain ([110.225.3.176])
        by smtp.gmail.com with ESMTPSA id ce20sm728846pjb.16.2019.08.14.23.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 23:09:27 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     tomasz.figa@gmail.com, krzk@kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: samsung: samsung: Add of_node_put() before return
Date:   Thu, 15 Aug 2019 11:39:14 +0530
Message-Id: <20190815060914.3572-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return in
three places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index de0477bb469d..b24ac8f61ccd 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -272,6 +272,7 @@ static int samsung_dt_node_to_map(struct pinctrl_dev *pctldev,
 						&reserved_maps, num_maps);
 		if (ret < 0) {
 			samsung_dt_free_map(pctldev, *map, *num_maps);
+			of_node_put(np);
 			return ret;
 		}
 	}
@@ -785,8 +786,10 @@ static struct samsung_pmx_func *samsung_pinctrl_create_functions(
 		if (!of_get_child_count(cfg_np)) {
 			ret = samsung_pinctrl_create_function(dev, drvdata,
 							cfg_np, func);
-			if (ret < 0)
+			if (ret < 0) {
+				of_node_put(cfg_np);
 				return ERR_PTR(ret);
+			}
 			if (ret > 0) {
 				++func;
 				++func_cnt;
@@ -797,8 +800,10 @@ static struct samsung_pmx_func *samsung_pinctrl_create_functions(
 		for_each_child_of_node(cfg_np, func_np) {
 			ret = samsung_pinctrl_create_function(dev, drvdata,
 						func_np, func);
-			if (ret < 0)
+			if (ret < 0) {
+				of_node_put(func_np);
 				return ERR_PTR(ret);
+			}
 			if (ret > 0) {
 				++func;
 				++func_cnt;
-- 
2.19.1

