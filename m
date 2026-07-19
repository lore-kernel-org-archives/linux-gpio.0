Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849BB392C50
	for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784463114; cv=none; b=klSyoStz2GtAsjPkqzxVEXe/Y8+ctH6orDG8Nri69bjSW6dgIa30mybIAcJOxWPGXORK1eXEAkQc1QFDiyydiWMLnKOcRaALJiR6Pt1KO2YIMJYorKowPl2kUNTCCbA6LdET4SFz4QQMvv/nY5xlc+HedwmZ6EMI7DKOwu3X0Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784463114; c=relaxed/simple;
	bh=5VMovNs5r6OHs/wcX2aDD1qfvLwXJxRv8Jf5x/+peMc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kqr5RuV9fqAF158z+tGaHcXD4qrYNSl1UiJ/AyZKXfsQlNx0GzKKHFlo+0vaROdaI7SCrBg81kAF5H1FcK//JNwiuzEt9aG/NgRBsYRLd45b0mOxKtl/u6ZLfAhJbo4GJvIRm9xeOmtKJ0ejF3OEV+5lOENoeHQLHtQ1/7iNG9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTk6X1rN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTk6X1rN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493f75f7172so71878965e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 05:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784463111; x=1785067911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DogqYPGisrMHm1D/3xJuw8fk3DrWTbuaVsByeLIrnm8=;
        b=OTk6X1rNgNDGEnrF/sXouhIGXU/re7R5PHMbQtY/Jh7jRGNa0DJRMLjrlT54GwCXLO
         1PfDb8ZUJ0X0mpjhv+t6ox36jK63loZ6L64vOyriJ5qlbjXq7PjqMy4/kwDN+z6/UkVB
         D0jfJcICYiLi9Xcj6go6pkyHp2HI3pqniDvtBa1XC4iwCBMbn7B1GgbK9LGsbyfCTHTw
         mWO3AO4DYnmVXhWbMPsUym9Z2QcCV17+qsiDfpuKvIc2ByH0OqS1jgXyL2CfIEz1yQnK
         OEWVkDBJK4YV2cqL75RLUX+cOwfQE1jYpxMZSPz8Xs9cboLfKUQpbtPOXhjxslJAq0Cf
         RThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784463111; x=1785067911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DogqYPGisrMHm1D/3xJuw8fk3DrWTbuaVsByeLIrnm8=;
        b=gJt8InHVh/Yqvrx7igmaEScI7qpgyWy82/NqVNwDRlo+1TLF7ZL3gN2OwtNHLjzr2Q
         i4e7ECd3ouuekEww5mje8WFV7bpp/PsENDiGx+LxTKsGQYoHhhXhgiG7iOf9IWmIypWr
         /4D4mV2QU4wSkufvg3SQ+KZLVDF6LULMZjF3HeTtZXpZYfygLSqDpZV+P7k/VHIZPbeW
         +xNzy98fgRmRyfBBcaF9CWsXBQm4pHvHE2uoYB2gBVTpk/XtX1Z2x8DFa2Oi8s6CA83u
         f8Wcw431fvYWBLV9mwbIQaA1NuCh0AbYTuatv1/x/nVHENwadhl5bA+H1uCLVgvIk+Mo
         9RVg==
X-Forwarded-Encrypted: i=1; AHgh+RpPhobGruZbbcEyyTxSlUqpDt8bK/VQ5hNGxhbptYouLfBD0Tkhresn+l8RQZ2v3mEAWOeTN9H3JiR4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzfi1Uy9e5qutz9/vPNFUNVpYajs19zf64d6LLQpzDIXwvaTkn
	PAyeYCUcNr9qNaSFlEcwLHJ+C1w+dtha0v+I7ym7exPOMOfrob7wzFcx
X-Gm-Gg: AfdE7clWI7cvlwCvdFIMDw8y2C+3KpEk/H803vcrRExVZDrzKeYumd6Bbztx0g59J1h
	Uxx+eFEtgY/a12sfHgdSxtdGSFiZzOqfB+eckRDjEtSSBpvx3/Bldb6lMQmjdQbhOGW6LyY+wZY
	woSWvMOxOt5h4Tthppl8DJp+OeL8EPmxTcsYX93QJsHahMolgcZc0ZhXAdp3v7C4fNsldGFreZg
	Mdm9YffC0NmA1IV93XyHO7uXPsFId4fd0RAU98+MckkHYmG9+hGNZeaQUGcvB6CuMXPL0KbS9F4
	+6NEmTK/L3vf1METx7yYvnHiWRL3rXlH5GxlFMWWOOFf8iEoXVI+fxykOomDu9BJKcllBDf8dXR
	n6hal5NyUEnvip3CtRrdNahw+XerVQtztnAgDdxo2xgBzV534KyBcKbWAwPl9rHtx6qEmpYiA65
	icjVnNbABn/BwmLQeujdWy74FePXmbQKFLUY6Z2Mq87bPfsGwwrnby9Dr4iBZWYbTXWeK/Uki8J
	K0Xqc8GkGGLVBoxFQXxaBNXoxEcLV+ENzGVAPehg3cRVY1yjJOSJiD7nDERLK1BLZ9mVEeexqe5
	ocSkUZrBCg==
X-Received: by 2002:a05:600c:1382:b0:495:699:5c8b with SMTP id 5b1f17b1804b1-4954a3e206dmr104802035e9.7.1784463110404;
        Sun, 19 Jul 2026 05:11:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm21750744f8f.22.2026.07.19.05.11.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 05:11:49 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: devicetree: don't free uninitialized dev_name on error path
Date: Sun, 19 Jul 2026 14:11:40 +0200
Message-Id: <20260719121140.28730-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dt_remember_or_free_map() duplicates dev_name for each map entry. If
kstrdup_const() fails, dt_free_map() frees dev_name in all num_maps
entries, including entries that have not been initialized.

Some pinctrl drivers, including pinctrl-imx, allocate the map with
kmalloc() and leave dev_name for the core to initialize. The untouched
entries therefore contain uninitialized data which is passed to
kfree_const().

Reproduced on qemu's mcimx6ul-evk (pinctrl-imx) with failslab injection
while binding the pinctrl-consuming device, under KASAN:

  BUG: KASAN: double-free in dt_free_map+0x34/0xa4
  Free of addr c425a900 by task init/1
   kfree from dt_free_map+0x34/0xa4
   dt_free_map from dt_remember_or_free_map+0x184/0x198
   dt_remember_or_free_map from pinctrl_dt_to_map+0x33c/0x4c8
   pinctrl_dt_to_map from create_pinctrl+0x9c/0x5c0

Initialize all dev_name fields to NULL before duplicating the device
name, making the full-map cleanup safe after a partial failure.

Fixes: be4c60b563ed ("pinctrl: devicetree: Avoid taking direct reference to device name string")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/pinctrl/devicetree.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 02a271dd292f..465b43092eb7 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -69,6 +69,10 @@ static int dt_remember_or_free_map(struct pinctrl *p, const char *statename,
 	int i;
 	struct pinctrl_dt_map *dt_map;
 
+	/* Initialize dev_name before any allocation can fail */
+	for (i = 0; i < num_maps; i++)
+		map[i].dev_name = NULL;
+
 	/* Initialize common mapping table entry fields */
 	for (i = 0; i < num_maps; i++) {
 		const char *devname;
-- 
2.53.0
