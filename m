Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B650E45BD60
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134569; cv=none; b=GPG9H6ONM9VEHioYZr7gT4D4y1AtsxjZTQLw03ieEpKG261rCeK+5HRCWlI1v4kTvzBPfU9CIXXpr0rE4dwJdnatSz+yVCsU6nqII7eiYiR1OOER4tLSDR0ViEAhhFt9UHdKWZhg5Fw3BxobyKDM3aHRkr6FxMhzFNFDLOlB2u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134569; c=relaxed/simple;
	bh=6MDfYdI0ZmxlfD1bTgikvWpX0kJXba/hXa+XbdptlOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9mmCdsi70SEMbHQDoDmthBPA553V/w062JGAemtPcNXuWlBOTkfbSCgpabHWeeqApsPHCTKtuib4gBBkQAOnUyU6y/aVHcltdLkY+C7tYGtzWmu8rGoa+mP+TVcG7RPdHPqSzA1Y4NYbNcXSv9NyGOyO6pXLJ2uKgyvAhXKClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LZVu8wEY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LZVu8wEY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso3933940f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134566; x=1784739366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=szfb7HEKMZkd5ESg+Lm/LZKV6rBdRkAe3oyDtE6GKZc=;
        b=LZVu8wEYCRyN7jCzmnM6Wy5fwzZSasWxntSmvrKUJnri2hg4cIvZgUVxA2ViW+m90s
         dDCGgGdIZ7At/ftxPDgO0FqHQNH70BfbZPVnRQDRlSZjXNl257xd6C2TDMAOiEKDdS7a
         UIjbnF8OMXMs5PKoMrnzZ1YtNP75rDv8QCM7ZLavfDX93xpnYOwoCg4ibSX713nF1rj0
         8kMYTOXD6Aw41jzYn8ySIPUyaoq6EtJN4uJ5u2p5PJNPJC7oWVu8F5Jr5ZDpveNdyCRL
         mJCuENmQYGGZc8k0YeDOBXA/APj3pJCnGf32BbDBEKQ3FPJ0pFHk3g2nRF0GFJ+Ym4LR
         rFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134566; x=1784739366;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szfb7HEKMZkd5ESg+Lm/LZKV6rBdRkAe3oyDtE6GKZc=;
        b=hXKUJ2VXBAGdNd4/IQtV5QP2pSH/F9c9RUGREMfR8Hw00IdxXHJbbyUpmOLqE8TZO/
         PITqp/LLM8J6GJDreFcsPoNmjTwsxst/2pdVtTv+0vH3LucLEaCev6eGZK/yaBIn0b40
         MNUE0Yj24IWIEMHlCMHKdGHhUXrBb01mXWNkhQPbrc+OBvdNnjDzfVVcVRllM09m4uCJ
         Uyn5FEORTg5beH6+ClHfxMKpukuytu3HP9uO+7SpYz2wp/j0apzYawDsWs1xfP609nHD
         HTa877Qam60FKC+TIrmbnVd5IneOTruWrINs9/n2ovJT5PmrmsvP0FDe2rDgiwZgxhNV
         79Wg==
X-Gm-Message-State: AOJu0Ywu5c6B/43juVX5uZco4thXviaZYfXqkol/ZsVjKLFazT6YmnAO
	ZwZrIXbc0m7s2JU510MsuXvP/fHm9utVHVz0vrCzUTQ0+X71jcUMb/akOyX/WSF81ek=
X-Gm-Gg: AfdE7clffppMyzebjEDa5zQMjoTazu0kSBotL6qXMwzTp+jHzp6xQzJVsmuRYjZCvb+
	wXgOgZc8Z4FxNz0jE5MsLLQXZVBu6jCde7j7HMct40IuOTbpfmHF5smKSeWQ/bhqKhxmpSAuUp5
	/NncoIKf/4VMUp2RaWtixNJRzjLYfqijRTYTHg2DNYIL/sEmxDylTgXbg52BQCO8eP6xCMCbPvA
	YDq0Ycj3i99eQKGqvCnD1e+lxRLS3GHksEEpQtvshPbPROUse53PT3tVjPHrzm38r1iv7f1mbKe
	iEiTDJ11LNFIhGJ1OxEqZFJXCYaG0OBE87PmUQ4ZHz0lpw6K3MpyCCMdcDhnfa2s32b7r5UJbsE
	ANFrfTpEaWBK/XTyfZTKDdJf4rPFTENHhGCz4z9NoiohULM3+mSmyg67xoR1wJvR3uJrt9Eyq72
	2QMuxs1eeQltXEVEWWQIyTNCWaUZqJLVYBd9cEu62aq7K3TSJ1GrQO8hGrKqISMP2aWYdD6RDci
	dY=
X-Received: by 2002:a05:6000:2288:b0:46e:997e:b4c5 with SMTP id ffacd0b85a97d-47f46340a72mr11948608f8f.18.1784134566044;
        Wed, 15 Jul 2026 09:56:06 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4634e0e4sm18986274f8f.4.2026.07.15.09.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/21] gpio: fxl6408: Remove __maybe_unused annotations from of_device_id array
Date: Wed, 15 Jul 2026 18:55:07 +0200
Message-ID:  <c94c502d38e05d1d875dc645f3c88a0be3eab558.1784133987.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6MDfYdI0ZmxlfD1bTgikvWpX0kJXba/hXa+XbdptlOs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7tvupc1x6O6XT28kKgbi4pQ1jZQNlsYZRNkd 8DMaJ8l9cSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7bwAKCRCPgPtYfRL+ To9mB/999Z0XZVbUY6S7f4dL2QTmV22wiL3nCaFu7Pog3i9otmcvqOt3YTOXN2+ymdI5Bv2CH0U Wl/Mgu0lykIcGAFOaGrHvJqB/T8x5tTc9vqsEppwDe5yWSRtwIcmSmas+Qs+b7RKazLpu1AW4ZX ud8Py1h2vZJAqbaPXuYsX1ZdP4yurASjfNBpyE1NnvwClujgrjcd1zqDmLnyrmFHNrp9/vRm+3R lUi9Z36D9tVzZA6r9yQ7ksvI4koRueIKt350v/IIc17VHuuyeBrDoX1X6f9k/IMmhVTj8nilaGU UFNY/Q0UH1QE04XiN04HAgV7ALlGowyJ8gu3jUHI87CrSRTZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So the OF device-id array is always
used, thus the __maybe_unused marker serves no purpose and can be
dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-fxl6408.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 45b02d36e66f..8a7e70180efd 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -143,7 +143,7 @@ static int fxl6408_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(fxl6408_pm_ops, NULL, fxl6408_resume);
 
-static const __maybe_unused struct of_device_id fxl6408_dt_ids[] = {
+static const struct of_device_id fxl6408_dt_ids[] = {
 	{ .compatible = "fcs,fxl6408" },
 	{ }
 };
-- 
2.55.0.11.g153666a7d9bb

