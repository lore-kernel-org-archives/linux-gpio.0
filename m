Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032167;
	b=ZRpNE8HmpeSO+LQskjfp4/dcSaO0pk+DmVxDomvuFrEtQU4jpShst92MLO9a1pDLigCU
	 UCkni1FxJDz/1jisbQzUbIUqQQPtVY/VGaLNBkW+/PQmoO1R2GhPP9pwyhz01QkQxf+wI
	 z6gIXixoj9k5ZC1J6TXVWIYE53Q3iUhCmeVoCuF0uEPux1+eYRhfQVIlgxvnlgOHUjyr6
	 rS79PYNROvRulHMdvwlBILwHHTyqFXtTEa1VG2MiyXUcg9Xpoh/no9dlBA6REKynqZoQY
	 t9tacIg2jHQz5vAph93ZrcUGAXjYgiprVGE+iqTeJhJ67o1AtY747ZLj4vlSHPOXX5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=AWcgq0SRGHmPYqmIYgxQKM3GrS7glpdzaZ67Xr+DP3k=;
	b=kU6m4wSYsZfh1fcG5SDm+iBmY/kbvbTCZHej1R/seYoKjztcxvTlkNzZLYfJnDDC0uxP
	 yHGq/GxN1Ztlk4MwmsGAmGeHAj46gGhi//vUvcATPK0YtiQHcaJpbXS7wocITEYDgFKqI
	 9VoKXKTa7C1dXp9wBw0F6ikgIkmlUNDuwyXN2LgeHx3TaEjTMiDBKgkxhQOQR+wCHzxuw
	 VzA7U5hKTiGTJUf/NeiQ9DHEf8HKjhSTi09Cx87yXri8LG4COFeo2+GsFSNqYb0J/lTZx
	 G9EFtZimG8YMOjgGhaaBcjKph9idpFIiP6rhRbvQfbgpbxzR1yjr0AFEyZPFgpc0tow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WX63UnUt;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEB060A2600
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AEB060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WX63UnUt
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1983277f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032166; x=1793636966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AWcgq0SRGHmPYqmIYgxQKM3GrS7glpdzaZ67Xr+DP3k=;
        b=WX63UnUtP4teZOyxR7QOw1WdMpppqxGv8PhyLfRJThwJL+YOBiG05aJ4OgZmbf4Wu2
         wrip9w1oouy28UQ72wX52PItf697nqpChALu140S+kqu23ODWlnzIk5MnhJNesWt8kgr
         mkeqLg1QuJgl2lwvVenpgBPfXCR0OAy8kcCbwl9oXqSlxQzzucWvPbiDMBwacXNCawTH
         uyv7H6N+CzhcuihL3WmzgcMktSf726I78bl6FX5dbJmmDUJs/tsmhiTSGdU2WyBItg6E
         +aIEYp1lGG5IFJlMDVBwIZJx+xp5N4ZGxz9D0/GSNT/F/v94EbZJlNwwJUr6QrAbjnk0
         Y6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032166; x=1793636966;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWcgq0SRGHmPYqmIYgxQKM3GrS7glpdzaZ67Xr+DP3k=;
        b=jScj+6IjjWbfBDErSeTC77LetWm2aRnE15aMzHMGFtfCtVGOJXP9he8AuRa6Kn2dUp
         EQ/mYuOK33N3bVlltjRusBjLPZf8YlZxWQZph4DUCjP4IwxpDeovq48cE9GsWQqd3FpK
         1V+1+pNL5LVp+16AcyI4lbIDpxvBYACn1FfcYPZ+B6PvLR8z/uHA0xnSn0THfcYjbYv7
         TrGBhlCdeOvmEakJN+2cRh/4IuTuHeJdKoltOlzDk0U7JhjWO0iR0o/ZDHew2qRLcLiM
         smo4UqimgGp7zMw8I/+hn13jlasUdcgD7VHoy+mNatGzycIMg3HU9AOc5ejtQnBb7mCS
         LjSA==
X-Forwarded-Encrypted: i=1; AKwUvBw5Z3sk6+ItHHc8k4UntTWhx9iPYOSOmb/xlzPnz7SCPAk7iN/K7pf1dnUF7RmQWGFJSMYOPiclrkJI@vger.kernel.org
X-Gm-Message-State: AFq9FYJWlBYwuPPddpeHHo0SFV0ueEv3FNyNb9LNRPKSGR4ooh6czoJA
	tBLiqy3Qa4Ft7KlY+wdCzlG1eyeC/6w2LnAsl9w0OqtRICyfetvlnh9NICy4uCXBi58=
X-Gm-Gg: AYBFou1N/AgA0cWjM2uDPiB6ffM3I06rMZO663G6EIjv9XDbkPxwDP9344tPEgnytfz
	Nqr5loaNuz/PfqCRTW45t5Wy1Yc15JMac0aQhmSJQdCRYPZCxyB74PDGyPr3gHjdk1MYAN94RXO
	jIRIl7mRPxu9MDYEVwgkESbY8UV3vs96/RUFJdKKAFpVUeppdYRcFyizMKcDBihxO3YevhN77mU
	Kazp7FevPn34odkhWbUOUPDW2rwWofCHhCwjvUX5GVUVyDRayK3zzSm6Nb+MsL0uj7Ef1cUq8dg
	LZ2HRmF+BoMC5BLJv//8hR0B4wUNS/uC4r5GYH1oFuUaf3/zeMFoGxD511dw81/9tS92rG44wxd
	uXllgi9zgZMQYxWDJow9EVW6zHXXSQH4M/uoVZQADsfEDezpbf1HjiC53V0WlugS0iAujsQ6ggA
	YJ7I5pnI5FC8iena9xRkB6iK8eLK3fwW1ctIZvxhWq3pTAbtFA8Ajy1vb1xYFOT+iiNYQ1oQPk1
	Ol9LW2M3cioFsEqMthTnzQNh5D+lq4b89C9UrypQnJvkdH+0BWpt9GrsBsaQr5x9M9kdikBC2nT
	/lRPSpFaavqIP+UHDhPK5+T3qc/Z59J4i7HgKqQgGI+Gj3GZI1ZOdEBgaoA9WxPE
X-Received: by 2002:a5d:64c4:0:b0:48e:2406:57d0 with SMTP id ffacd0b85a97d-48e3eb75f9dmr14086499f8f.19.1793032165725;
        Mon, 26 Oct 2026 09:29:25 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e542ed998sm2542825f8f.13.2026.10.26.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/22] gpio: fxl6408: Remove __maybe_unused annotations from of_device_id array
Date: Mon, 26 Oct 2026 17:28:13 +0100
Message-ID:  <3f4d5ee3d2569d20aaf929edd52e5f3bfa63318e.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=YIMiQUQhyiMHW5J8celUPNjx27FfZEhJJQnBL+5FhKI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+hIAoYU3+kgh8XYo69kiSBk+gjbRI6rh6gu 9CQJ1S7u1yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/oQAKCRCPgPtYfRL+ TkRfB/sHky9XSLJ3zmSCZrOV/tpl8Xj2oAEj3rkv49hNVTEo/HrNGfhfP92K0g9UyFuF3WFUMk0 zEGw3cPjfjEAkKwN8upyHr460cYifLxySKiIuLghu2kEttnGyy/bA9BJ1Qui4+MVWR7qNh0yU6I cHsAH4q7FGrwG9SYs9JOpuUPw3l/krCRRwoDgyxjwUwMPK/jeQb2yRJam7tNEpSzWUyGTtiIr36 yjrbRNIRyDvAjpo2t5lmHkzLebEk1hLRrOJNxrTqRKiBkAvmYJY8/LYOfYIT+ii4jVIxQX647sg 3plylp/ShANqJmpz8BxJcEdCfXmDZof8+1orab/ehS3jTxDi
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
2.56.0.rc1

