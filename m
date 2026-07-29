Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82487419FDF
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785359454; cv=none; b=HpOfRXVu6Zl0uTMHn24MiIiRCEOSafFlmAZEZFAjCeg2H0J2KkZeTeMdW824GyCC7LdOQ9iTltuyjTC9dfzfalA8p5i4SY2N7UZ4pQfVXioUJeJ22E3P/X0oGnY9WGpjX+vdyK/2TJ03l0Ytxph4Jl8x+cSZWG51WI0H/EyMd4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785359454; c=relaxed/simple;
	bh=H0aFLG3MFFBKWVcvhCRoYh08sHTAKsG5YqC+1qUpWMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a0nx0ZNKcPe6xFs4+H9qxvc2HaPDhf7GEvsgkmFS6etRb3MDaTizdp9NTaDCDeSSwD9vPyMl6KFSz5WSFBFqKC8ZzeOlM4lbv0cXDWdiu1cLgJvj0/64zOBO4bOzKtIAdTD6W/vPkFTohB2ybGon1cQGX/neB87frtAEUJCgImg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryBl3y0A; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryBl3y0A"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c2149571dso12913251cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 14:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785359452; x=1785964252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHVmoZCHZtsfvLfBGuSRcDlbyKpqS10aa00TLVwEfMk=;
        b=ryBl3y0AdmLiSisGVrZ7/nq+RzAU/sqw80BcW9Tr9YUnO99VNmXzhui2wvZ6yafG9U
         XoBzRL3szhEr8Yz2MRG+GAGSpe2hSas5pBgEs3kRMoSc9uhmCAZTVLzQOe43SVftiu6i
         9NC6TtJDHT5jVfofCa/JbiuoKruGq7i9Gq29Vc03/ssJ1vXitJHXXnxzsQ3w9NoRAFA9
         tJVprpbKBqSBHU10ylAS1iPekeQY4WU5/wU60gCWT/IrU5l+pdsM/gEW3a6RrJpxvW6+
         bo35LAcfRbHqUX9b6mgVgTz9rtX05/EDJ+osgMJpTvlODpfCQAEYgbdOXNbUZ+8Osayj
         VRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359452; x=1785964252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHVmoZCHZtsfvLfBGuSRcDlbyKpqS10aa00TLVwEfMk=;
        b=aavcHWnSB9dSYxjWW0X3/g9qbpdG4kwdnOTyOgGRy7O37lOhC2qHiK34wdu59X9F9o
         2RgkaXD9YdUbH2hgqQWYRsDrgjokUOjeHj0Y/tSL4uBf8guImwDuy/3L3J4rKAZACBs/
         B0Jb8j5FqG6ZIDCZwN1XI7BwWRAy9URmnqSPfdGkMMXeZy7boa645e5TL7fFpzGeZXg9
         45ZyJRdY6kKrp4RwkxOyP6ztMIW+RwtUTrEi/G4SwG9naucceuTi7XBl0+BPe3yH+hck
         7nAIVRyKZAWQ2Zl+dk+goSz52MAZ47WZtW3B7PwRDk7E7Zb6HgWwxcgsq77qUKpdPQE4
         SE2w==
X-Gm-Message-State: AOJu0YxOqFt1zNXaXmRNaYlmLvLbEhMjer0ZoADR5NzayjQ6rRCLiNsm
	Ts0zdeU31poY+Q7ZWU7xEuRL/1W+6gtaGgnu87ucrs0AmqrtRl7BPvRLQiKomRM1
X-Gm-Gg: AR+sD11I/oUSFQaE/+16iHa2QncYch3Kc0fzzuXG3GAMcDOGSqi8qQxMgU7+oKbJi5z
	5qje2+49ZXLm21nvPDWfWMUb43sRJFO4dxchvq8lTiuJgFR70bYZCHxgrLFlhf5tyq7XfrepkEi
	v9naMlNmuvapeEcNSRO28I2QZIdBo4uDwR5TTPLwsg4goIrz49o/PeqyVUrB7sv4DlLAld6XcPq
	KydAQuM19lDvfLMX1DvaXddyKlxIrrBEJ+KsMpBpc4n9NFIIJJYWFmNgAg/5OpvRHqf7GrP/5zZ
	qX7oKdNEI/PrBmHmh59QlpiMnDyIw+wbZNTeyM5oMM9n7dvLKTe0EUSrLz0AvXsTG0eITMVtt9P
	6irQo24x/W7mD6sL8/RRpqgvvGvtdLxgbHbRbdxPmvfUppGq42ChQcYmYuozAN3Vedmba5SKt+i
	2y1ozPnIdhI33BLmS+f6c8vATDYRBHZHWBW8MdPOWTM7I2B97IChIxqjgRgXmx5PIz1brxXIESw
	yASH2taF24ntlb57PkcEbF6EIhq9/ZGIqRNmZ0bfc8k7XhQZ7PUayMihhA0mCXJYNx4KX5xcxFs
	O66U9o0vDhHiFqhVdyHgibpc5YgaUnrKLfV3uUbxkRlgvz2MAg==
X-Received: by 2002:a05:622a:11c8:b0:521:8ef0:b4e1 with SMTP id d75a77b69052e-52b384b3c84mr1685651cf.29.1785359452463;
        Wed, 29 Jul 2026 14:10:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2b1ecbfsm27393041cf.2.2026.07.29.14.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:10:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] gpio: pc104: Add COMPILE_TEST coverage
Date: Wed, 29 Jul 2026 14:10:48 -0700
Message-ID: <20260729211048.719757-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These drivers used generic APIs and have nothing PC/104 specific that
prevents compilation.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: split up menuconfig patch.
 drivers/gpio/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a7b18fd59110..94ffeb335161 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -984,7 +984,7 @@ config GPIO_I8255
 
 config GPIO_104_DIO_48E
 	tristate "ACCES 104-DIO-48E GPIO support"
-	depends on PC104
+	depends on PC104 || COMPILE_TEST
 	select ISA_BUS_API
 	select REGMAP_MMIO
 	select REGMAP_IRQ
@@ -999,7 +999,7 @@ config GPIO_104_DIO_48E
 
 config GPIO_104_IDIO_16
 	tristate "ACCES 104-IDIO-16 GPIO support"
-	depends on PC104
+	depends on PC104 || COMPILE_TEST
 	select ISA_BUS_API
 	select REGMAP_MMIO
 	select GPIO_IDIO_16
@@ -1012,7 +1012,7 @@ config GPIO_104_IDIO_16
 
 config GPIO_104_IDI_48
 	tristate "ACCES 104-IDI-48 GPIO support"
-	depends on PC104
+	depends on PC104 || COMPILE_TEST
 	select ISA_BUS_API
 	select REGMAP_MMIO
 	select REGMAP_IRQ
@@ -1037,7 +1037,7 @@ config GPIO_F7188X
 
 config GPIO_GPIO_MM
 	tristate "Diamond Systems GPIO-MM GPIO support"
-	depends on PC104
+	depends on PC104 || COMPILE_TEST
 	select ISA_BUS_API
 	select REGMAP_MMIO
 	select GPIO_I8255
-- 
2.55.0

