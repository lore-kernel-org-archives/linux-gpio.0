Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F057D48BD40
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134592; cv=none; b=FLDpL/IR/aE4N93CPxmYm4yXrRkFusuPnuPIHgft/f4WFTaIoovNXeoGFWUV3Sl3BWyWyS3W+mJKlDD02tRFaZOJofqiaNkhzLcuZ4UDAWEiM2knGJAmRlKSZeRWcb8Kdf6RxSE8NZM1T0DGpMrykTZaP2YjOTEyEi/9q6OpEs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134592; c=relaxed/simple;
	bh=RpIRMTWZ8MttlPK03fnuszXJ+wTnFZwAX9zeYPpcfuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rgCQRczZToWxL2FQWW3n3S1efTBVK06qEPM9qGvQtc/57iHqzwizAU+LiZ+Fab4qKZqeY0AXPiaHKF+4lFsu1M7GDEaZvxSrBPHvzc+LMd+ThstvZT2tew0m9QT30UK/6MNnIySvrVX1637WhVcL83SuP0Y4FAMqe66ay6KIco4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OsaIebhd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OsaIebhd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso20237815e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134588; x=1784739388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AHd9rAFKjbxYMiTiN956h6hY84nCbjYBspgrZSqw28w=;
        b=OsaIebhdNBXRiJrJgB53zM6n3XVIn3Lw7VAARRHuDVRLVF0+HBB/SEVvriJM+PNucZ
         Zi65YS0kzT1ZsQvCLxKQENtzjbjIrfJ53rL9vFVdFBY22M6xnFgIH4nK56XfH1iSKkZ4
         W2zdLTU60YaEUG/zF6UcCLlTret5h5OqPGPUfGm8ME0VkkYfwTmvbqj+vktKfWaGDFCV
         I2kdtYLpNOMXG6CjajqUYAwYyZQ8u4ANGCMjO33VXvEMgmsC7v4rCD3wwouBTensFfaF
         P2TCxlbbWlm6fs3LwjdygFdrvMVrTdwba4EBuqrBVgl8Vl5Ncfoand73Pt/SeaEghqsu
         Vf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134588; x=1784739388;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHd9rAFKjbxYMiTiN956h6hY84nCbjYBspgrZSqw28w=;
        b=p6MgiWnZ13Jz5iXGL+kX/2jBDHFralcQaB5Bahf2urHU4ed/CLOicIAQfV9nIrhksl
         X0BmZCB5mp2h04lkyH4CLgKMDQtz4GHc+SDaJCrR22B0kq/HOfS4lsb2cSoiZQriqqTs
         DBN2EXBGJUDSse4lwTU/jBPAEZ95IHg74xkdZWg50XgaqJaXhSUJ+lazzk6myhBwAULk
         27+G626EVRHyezTRrfj4NbfMLvMwO0FwtQUYWljdtW3Jkii02FGgtm47qfQDUon14o1X
         HCDS2igTWIjpjghupg6HcM57FTUAEXCWC1ulOpOImHXxjCykI3jA/XMRy2xi8dF9kuzn
         4TWg==
X-Gm-Message-State: AOJu0YyEij195Pv+xHxADJwgHydGnFLpIzu8FEsM9uq24Q8jE3OHFGgf
	iU/Q5xX4AdjzwaQ4vdmbSqJ2eCmBkVZlzP+4qoX2A96q5H/dwM9/v1AP1wN5mMz5u3o=
X-Gm-Gg: AfdE7cl0E/c+BIw7gcEXi5SbAs311IdJvzssRDjVbtWEpIPox9X2ds98VhH4H3ISWxn
	R2UPLpAtOXvmZhqpHnu9mNuxrY9PcFy3L79MrZXWf6GC8M5bCuuikNNDWqkj98ikbtE+1vowtJa
	5yB1EzRIfsjQ5MBBG0ukoXE7mLvRQWBZxHaEMtF8T3PyFZPTlm4Lol1r6dAHXHyellf7WhF8zhh
	Ki6PtZdW2AlGT3+XxIbz8/NjBAld7No0TvoBUD9TjYpDpdNvqrk5EImbIRUDQHOoaHRs/obOBhU
	95/Eip+YvxNEg11awkx5C9Iw4qQZWq8e1H6nQvg4553eZAYG4Kkgjyyg3gsG2XFO92RjKuDmUn6
	AjgDx/Y/2jWdkuNGXp8fB604ET+Wa430IgHxc5SyymEj1mgsIL0WmgmZe3VMvwgqNB7U+kBQpi9
	irZrovb1Fdj/uWoKWLx8Sx/BK7zDTit6F7mea3r/pDcW89d+Lf5c+WOSu6EkoSQemQx0NjIh4Nl
	7w=
X-Received: by 2002:a05:600c:1f8f:b0:493:e79e:da6b with SMTP id 5b1f17b1804b1-493f8815d42mr243970945e9.21.1784134588374;
        Wed, 15 Jul 2026 09:56:28 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-495087366c0sm294796345e9.7.2026.07.15.09.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/21] gpio: Unify style of spi_device_id arrays
Date: Wed, 15 Jul 2026 18:55:24 +0200
Message-ID:  <9ae5878ab2000e8795deb9ac46ab33bbc507805a.1784133987.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=RpIRMTWZ8MttlPK03fnuszXJ+wTnFZwAX9zeYPpcfuc=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqzw3dOTE87ovckzlFvEckvv0ew23bWz3OU3vw/Ovn9mb 9XmilMOnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMJLSFg6GxY4LfNPfs3XmV PVdObtPhVfj2f/mrgglrPl15I827oaFj4dfFF9LX2xxVia68n3ljvbq+R06bP+ORnjuvIgS0ixT dmOyln7w5m3OD7YMn24WULB5LPaeZx3ofHLvCfcC2WCZnXkjafA7+irz13LpSCSs3JdU1267NtV 7+3FjrdxaHlpUEn0b5ibn/vyn23zLTVNih1MfwkfeEkn+Di1H1s943ix8GCXMnHn3N87je+i2DQ 79sqeVMjZdBR5iP/ZmeMKO2JLfct7CSq8o9bEF93lSJqN0/48/9vlPbELSMKcv70CvHrGVTz32X y8jpVpL2ruzMfsuQG5XA+6Vx7u2rd5d8vPg/+3eT3H05AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various spi_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-74x164.c  | 2 +-
 drivers/gpio/gpio-xra1403.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index eeed612e7c80..acda26cc4cc8 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -182,7 +182,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 static const struct spi_device_id gen_74x164_spi_ids[] = {
 	{ .name = "74hc595" },
 	{ .name = "74lvc594" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
 
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index 03c216d6d03f..5089377b67ff 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -186,7 +186,7 @@ static int xra1403_probe(struct spi_device *spi)
 
 static const struct spi_device_id xra1403_ids[] = {
 	{ .name = "xra1403" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, xra1403_ids);
 
-- 
2.55.0.11.g153666a7d9bb

