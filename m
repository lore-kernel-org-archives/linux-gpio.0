Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6A34AB14
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 20:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124632; cv=none; b=HJdfvzlKsXsBHkdx3IBjQNr1RocV2EshG6ZuS4Em/UvBmcs3jvslAKNOy6NNr1pZYcsDSZoTAUkRcMTYJUj3O1kAgPPjj+VtRJoKByK2d8NzA/tnQ9ZkDvPNiNmQL5Rouqu3xCUlHCppWXR7uRUvvpkEDDg/nD3AUFJZG/0UmvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124632; c=relaxed/simple;
	bh=MOi3FlyqBAZS/LeInRvXfCPgutS1gBxgc0TSUOQXHl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y40jKXtwv5o3Cm5HybzLC0wrg8IpdG5fqHPBrnSLG+vVAmKBmZyCf4FHFUfod3UeeC7I7l8n+8rDFJb1UdXLvx7er4098EeGsNMtH2HERvzKK4tvs2f8RIo0OdX385cxMzohcJ9/ZigyCx7DkPC3W9j5mcRDIG4XSPjt8CxvT2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZNZY5n2; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZNZY5n2"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-138129a622dso6236377c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781124631; x=1781729431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XuNClIsyupwwOLOoKw2P1oIpg71j2eDgSVBuzqqsVvA=;
        b=YZNZY5n2oN7hQhQA3mh648Nuw7kXitDRsqWnQcl8ExMTnsrCBUzzzK1PBhco2ivUU4
         8rJ4NEuinaRzmZtRUToJyLkh8eFPWlJzcRoSwfzE9ZVoHyJ+f/NDQqdBQzsB1ghCLbpS
         nSoC6IMg26iE81LwsgMSQS3QOlugTi101VOGsRjg8YaLtj7u3Mje8CJ2Y273yEUDGFMR
         7sHiVPDy7UNHdZOHIoqz68L6jMfBluLHlwgym5BUkVLKtZNawhKG+NQV0RtIzAIwyTXC
         6Bd0elkUjAX3qvaUKHo1jsHJhtMMnEUl/6DALfb0zLTWXS4rLbxlEnCldPvTaQHvb/8W
         t3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781124631; x=1781729431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuNClIsyupwwOLOoKw2P1oIpg71j2eDgSVBuzqqsVvA=;
        b=gC/kFVsxK9pmEvAYMuMZgjF2j/6/nWYN3XU3xLrdj++9mvICFqQf9WhqsQ/1l7EqP/
         3HeEWeWzimTvbDKTnniDQUI+W0JHgYEDG/T1FW9REd7kew/wNI/V80zGrqdf6/+8vneT
         HpUX12NrfRFqunk2U1pzGbc/lZMoEbVhR3yBgndiXMpr2GRNqmuOMQrJL2kkfLTf30mG
         bGpcRVytCuI4Ecvq75rIbNVc2EmnkdyhviNz7p3H0uFXW4n7Pr0dfY29iXTFhAcd8N38
         dPCIk5FlHJNc+3XsC1COdHX9QFiewY2NM/H7jmZcAHx5+8EkSty9Sv9lFBxDXPWCAaEm
         w12w==
X-Gm-Message-State: AOJu0Ywjyw04Q0YWbXh38fvOnFJk54DZbOfdI7fVR3zxsB5zE8Qw3FQ1
	IMpiIU956IbRk518SZBYKad8HMusRtAEKwehRozzuatB7pFY5xXutqYA4ckCbLOI
X-Gm-Gg: Acq92OFDEmANa6yamK62PwdUFBAFrxNL2VzQt5iuUb5v5rk196eClesWzSKNll2gYp2
	WUwjO/usieiKInd98hG/tYGuFtRq3bUgXcQ0Xt5TjPO+aJNiNF3lBkWeAE7hzuVnqFCZ+QIwKu1
	sg0DPl+7wjCe57NTmhX8qYVxmMOrYXhKSpah7q8l2rLgGOmrAgb7FVwR59UP129ZJ3ozU4OER/z
	NyoHHIRu81liKK4qLVfuVAziVDbZiig2fCSNPLiIb2Sm2YfaTbc2ROCs22KRB8dW+ClpVowZppG
	r6ZyafWpJLHNbGv2AADDu52EbCH4DIxavVZIj92C2k4hN9xOkRtnBCDzNOlbcZRM7Kfy1dfGeDb
	FL3tTD4cIudkMBfB3UHwf0N9pEnc8hM5GPv6OMIUFx0bcaO3oShSbitP5TNgOhsvv8VVXf2yom4
	w5AjCNKbomsAJ1+NxlRmLWT2rF3nH0zSrBCDQXesSvu3FsKceOTDKJ5mfh+lsnaOYwnlS3gQ4eK
	6bMVMfFP0PwhuisGA3JE96sqaBE1a3hSvk/aguazv7/SS1kkSANZnfPRHc2+mXMtb7GOMZDWxtz
	GpruWu/OCNnkWsRa4qrYzjzWC17f
X-Received: by 2002:a05:693c:2c06:b0:2d9:fa9c:87a9 with SMTP id 5a478bee46e88-307d5fc2c7fmr7836159eec.5.1781124630724;
        Wed, 10 Jun 2026 13:50:30 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8708sm28751397eec.15.2026.06.10.13.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:50:30 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH] gpio: nomadik: remove dead DB8540 code from <gpio/gpio-nomadik.h>
Date: Wed, 10 Jun 2026 13:50:07 -0700
Message-ID: <20260610205007.44881-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DB8540 support was removed in commit b6d09f780761 ("pinctrl: nomadik:
Drop U8540/9540 support"), but a couple small pieces of related code
remained in <gpio/gpio-nomadik.h>. Remove them.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 include/linux/gpio/gpio-nomadik.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/include/linux/gpio/gpio-nomadik.h b/include/linux/gpio/gpio-nomadik.h
index 8061b9826361..44c47645649c 100644
--- a/include/linux/gpio/gpio-nomadik.h
+++ b/include/linux/gpio/gpio-nomadik.h
@@ -32,9 +32,6 @@ struct fwnode_handle;
 #define NMK_GPIO_RWIMSC	0x50
 #define NMK_GPIO_FWIMSC	0x54
 #define NMK_GPIO_WKS	0x58
-/* These appear in DB8540 and later ASICs */
-#define NMK_GPIO_EDGELEVEL 0x5C
-#define NMK_GPIO_LEVEL	0x60
 
 /* Pull up/down values */
 enum nmk_gpio_pull {
@@ -236,19 +233,6 @@ nmk_pinctrl_db8500_init(const struct nmk_pinctrl_soc_data **soc)
 
 #endif
 
-#ifdef CONFIG_PINCTRL_DB8540
-
-void nmk_pinctrl_db8540_init(const struct nmk_pinctrl_soc_data **soc);
-
-#else
-
-static inline void
-nmk_pinctrl_db8540_init(const struct nmk_pinctrl_soc_data **soc)
-{
-}
-
-#endif
-
 struct platform_device;
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.43.0

