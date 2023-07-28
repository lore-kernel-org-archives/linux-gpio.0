Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A4AC001DF
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Jul 2023 17:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234466AbjG1R7d (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 28 Jul 2023 13:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234290AbjG1R7a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2023 13:59:30 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE1A3C2A;
        Fri, 28 Jul 2023 10:59:27 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bed101b70so140981566b.3;
        Fri, 28 Jul 2023 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690567166; x=1691171966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qatUUeArBbRmA2Gc7rvoocZRI8Ab2ktUs8bqBiPUFH8=;
        b=lXw74ReCrCjAbCD/MqF9gCFTcl+Z76kOA5vMJqKYhjYpGG0DDNJVsFEzmUw0naj2p7
         Fi9+A8T1CAAcALBp/j4MyDjCuNqqco8ZA0ZY4P2VarjsVdSMs9iT2O+buXKukoCKwHSD
         CTxs8NLvh9BpqG1Fi24jISsoWnH6sZi/FhOkzaJjvNsDI/KfTV6JhhxSpatnZXHc1/Xw
         bbZQ+8wjpl11MP+wEtcRsxZrLHvGy2eCmKIdFIIfeVhWjx2sElgp1IUeBQlrP76sywE6
         PhJRKtt53egU3y/G1WCMETBGbwSMPgCcL0wbrA1PP6F9/ofUDeQs+pbxrK/BTXItbp4H
         J5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690567166; x=1691171966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qatUUeArBbRmA2Gc7rvoocZRI8Ab2ktUs8bqBiPUFH8=;
        b=KFGWeEL1koErIe3V3oQWmc+r4I0BrU3XIb2d3ZMtItKa6rKhjr0jq0jj1D+TdsmZCn
         VFigjNMyjS4/jw5Z51y409NT58VB15qJOESG2VuDyvFyhbd/JBn9ArUpWlIZ8IqDWWts
         xB1pzI4FhmZovz1QLNhTqoVFCgOR0yIkLimMocVJVQaUUkbCTMCfc47MGGsnaroogjV8
         434RdPTc3YFigwW8+7fwDX9dhfaKgWIzkYL/sYmwHecK7U25sZ/IhWilrv/VBy/tu8qF
         6003mU8NGtFD6z/CmsQo3FMKdtWQynnPs+RZtO1toNCy8tQL2uVkC+Qo4/AYngPV7EFD
         HwBg==
X-Gm-Message-State: ABy/qLZNqhUKkQIJgvwBzEKlUfn6wYmc9b+jI2pnv0lWhF9i+AYwR1sQ
        ee7B2q26TiK3ZPhoZK9WsWjl2T7nWTM0ng==
X-Google-Smtp-Source: APBJJlFNdNlz7+3/8YyF56bTqFSmk4lTMam+vi2QuPeJQcKEMixtS4OgxMmlokjibB8BLH4fV8n0ug==
X-Received: by 2002:a17:906:8a5c:b0:991:37d2:c9f0 with SMTP id gx28-20020a1709068a5c00b0099137d2c9f0mr66834ejc.68.1690567165863;
        Fri, 28 Jul 2023 10:59:25 -0700 (PDT)
Received: from localhost.localdomain ([78.97.234.98])
        by smtp.gmail.com with ESMTPSA id fy10-20020a170906b7ca00b0099bd646e727sm2318415ejb.80.2023.07.28.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 10:59:25 -0700 (PDT)
From:   Andrei Coardos <aboutphysycs@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     andy@kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org,
        Andrei Coardos <aboutphysycs@gmail.com>,
        Alexandru Ardelean <alex@shruggie.ro>
Subject: [PATCH] gpio: palmas: remove unnecessary call to platform_set_drvdata()
Date:   Fri, 28 Jul 2023 20:59:14 +0300
Message-Id: <20230728175914.18088-1-aboutphysycs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This function call was found to be unnecessary as there is no equivalent
platform_get_drvdata() call to access the private data of the driver. Also,
the private data is defined in this driver, so there is no risk of it being
accessed outside of this driver file.

Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
---
 drivers/gpio/gpio-palmas.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index bac10c2faf56..dd8a287ff6d0 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -184,7 +184,6 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, palmas_gpio);
 	return ret;
 }
 
-- 
2.34.1

