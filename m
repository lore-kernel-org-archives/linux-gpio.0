Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45C2483BCE
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832440; cv=none; b=K8ieJ3LLowMcMGFauVAGiTX+ysvkaPu8BdKTSkO2sh4Z4IyHdvGRMnMZNgzI5fE6Gq3sYRRfvZSIUqZ2r5DRcH9Fet4bKvNkcqAShpa4wHEz/wTrarWiaOFAOK0MVM08dOkbKMoJU352eGh5Hyi7MzdRa/ZBiWkkaSvjD7jRBpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832440; c=relaxed/simple;
	bh=NmlRNc2Hv7I15iZ5R7bh4z3eyVqCDkhiotE+Q1mYe8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKlGqpRfQoklJd4C3TvRBnpUCSQk69h89FWHsx0tLYYl5KWTYrBSjAl/2MbXVYVw1D5rt4we/VwPd5+kfpFSji0BvWoY5v5IDBVOpC+fE3rRyuwLX0t4FBPf/O1X9sBdRHL0lb9wisM7tmK62UyjkNuWW5TNbYx0XRFi1jnJtsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0om41LZ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0om41LZ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1228319a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 11:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832420; x=1785437220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNEry2bLNg81OguQ9I1ru3wEUBWoj/YG1funVUmQkdk=;
        b=C0om41LZTGOUFcPARp0QOJajKF7NWFnQ/6v5amT65HU6GZxIgDOIwGYZB9c9pKThEk
         Qz/OFisxMaH1xY6LTUAQVAXAbayd7KXxlCsbM8MsWujOpvSxOb3pm5a91bHubMZ20xsn
         2/XUwTqNRFZTYGL8yKoRGePhXca+7l2vvM6qd+7K1hp5H0yfKdPXfk995RBD0/YDAY53
         MDPpzHZt0X3IdHjrgoKQ2azZRVgdPGO4JzEYADBJEOhvIV/mEXGw5ksXU4i4T88fuoji
         8ei0NKRPi5nTxQa7KmQ454jttRr+y/BGuiu7SDdxin7YXLTh2t+wGupaPt2umuZDqUsq
         CCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832420; x=1785437220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BNEry2bLNg81OguQ9I1ru3wEUBWoj/YG1funVUmQkdk=;
        b=JvVkx+dpP3Yrq0pynqCOZi0DBOuuSGm76LuSItOl5x0zwQHmYhe7WDB5aq3NLBQExj
         cN5YcP5sQIpS5uZCtJ64YmcA8dGkLRh+s2+MCkDWUVzWG38ZIs0Mle01Sb3S23LY4tGy
         0UCzzT3i4SQv06KJG0YqxGlAbXYhr9gX48+d9jk1KO5jYPOVp5EkHkN3Y7tfVuhpol2l
         Jqe8gJ/PeVH+N/BaVhNRYvPMNOgdheW5NdePbwpvd45QqQ9NgCPqQ9ODSMvnm811qJI9
         4vAl/DdBjoMgMX5MsKuQx0KktVT1uenVRnPYRn3m24O3kIL8Y8CB3k4mWPZlcP9E2Kr+
         4dmw==
X-Forwarded-Encrypted: i=1; AHgh+RoVKXh9A4cAQ3NgcjBRMYG0m7bO9QOZ53Ue+lXyKsFPEMJRa/hIsHq+w+Hvh4zk4bXXDyU79dpx4Vdk@vger.kernel.org
X-Gm-Message-State: AOJu0YznUUoH9l56o3EWPB1tWvMGBELQq5MErJ/w+2G0gAzZhF8zaj6Q
	idb3t8GRlLRudOfWALUecNIS1YOm10m3Fn/UqXoCTycFQnJh5TlNgHjQ
X-Gm-Gg: AR+sD10a5vEqGaHgaHpKr2io6rJ/BBsnvO4SyAC083DJ+TPaGUDEKTuUPFr1NwjmDfd
	ShPBIh2dBlahg9+xnTs18QpUJ+Igoh6wuTwJFQffrwDxX5DSqjm7xTS+AYgaxxQIhd4zfvpo7FX
	803pCupnRSime9TL6/eq9y+fBnUfLfoahigYStxozAWwme8XN7SsU4sd5WbFwtbBFq0whmXzMFh
	9ZB8G5S99JIfnmQ+G3udK+Z8fqgmIQIuMswOGA/p0v3/hLf+QPvXUtWPOj38uvS3A82/JVFKPhj
	C/aLuk6kzVxHMQCq8l1k5EbulNk/vS6AQx0PciQSz2xcS1m2IJ4HS3JVBooVMC5/NuAuv2hyUgW
	bvtNRovXy+AJL9r+hNLFJlG5S/vfNVFNqBzkC793bZKoclIMGNVfoas5C/tie/PA/lhW0vkks
X-Received: by 2002:a17:90b:53c4:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38ec657558amr4646237a91.10.1784832420077;
        Thu, 23 Jul 2026 11:47:00 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:59 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: cocci@inria.fr,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 24/36] pinctrl: mediatek: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:26 +0900
Message-ID: <20260723184538.3888637-25-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4918d38abfc2..a8ab982d8f21 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -1242,11 +1242,7 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 	if (err)
 		return err;
 
-	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_E1, e1);
-	if (err)
-		return err;
-
-	return err;
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_E1, e1);
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set);
 
-- 
2.43.0

