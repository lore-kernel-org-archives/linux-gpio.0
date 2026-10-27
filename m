Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098236;
	b=ot/+5+IFpRCQxLxpmCjQut9ABjcRnVYr8nGhEgWBbS2gnrtar0hKQA2G7cVGyuy29jQl
	 v+qoN6ineBgLWfMmR+dZKuPFxm1wWJvrB0QR900hCFSpxfryMUfdDQzhSZJRYXEEHtkol
	 BHnXt/KU2j/03OjWZs3YNOl90UR2GbkSbSi9JLBOPWi3tJQbIx1mLTYtUGH04Knhmpiwd
	 GNgnlUp5pQmJtYajDtPKd807QThaJwi547vDRxc1ZttrfEKeJMuESAhNbV6NGQY/cSy4/
	 EUIBMOOi0JBXyz+JeLgQBwQsgZvwJXGi5k0AiCsEbRl7FXN2pP4SxfD5mZYwlQMPdeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
	b=lQXkt9IlkpLTh9YQCHBQQJ2w4JMWfhlzFOT8cZWn4D+HPvhxR1PfQHf5EHbf07xwgV8s
	 g3CRRdmrYc5riQX0eGCtPMxWu7PHfooD2xEfuMvv5mnoMyVeEgp+vvzOeJEw06+S3B0Ka
	 Hh4R4/M3iy9626Cjx4WBRCGoyDUznkzvNONnKLtFPEBKEx9b6FrX6gO4mOBO5qOUfJ1sX
	 IS1QNAIholTSuImhLJlE7Eyn/LyqXkwvjMEcuNUh0I2O8rahtY6ftdA9tHzgz5mPvVPh2
	 6d8odwfdfGqye5h5kODRQ4CZUDsmRSK7VA25ZI46WN51SVpSO819a9mLq4WVrWmU4pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TAe0XraH;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434C960A2634
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434C960A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TAe0XraH
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1587841f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098234; x=1793703034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
        b=TAe0XraHeo/hpQoegSgKVK18eP4n28NIa1xj9jqmb/FMj8bXltCoyIwpmQUAJbh+MI
         kYWFFnzN8RNi3w9SBOIYOhKBP5B02UYZ7HJSzWVOgBSk63H3G+BtCuEGI30HWBhoipV1
         gpXDSJZvvEvuVCaTkwHbmZbNPSC2Ozb2zLfIAdCT0kb5vjOeIYFVP+IPdngkz9flR1Ae
         GhxtF4tts45UlVuAay3rErWFIE2a0dN2QsST+evKKP37Mt4pp23woqIQOpgeSReEni5C
         wcPLZv2oLk4tAUm7ixI+MqhS3lo9U3zIt2nrK1dOglMpZXC+gbiNxmlO7Wr8+gANoMu/
         F1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098234; x=1793703034;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
        b=Pebsu1nAXM/cm7bqRShFiH0cqeVztdhbxkQDOP04zjBJEsLeXLc0Ki1sPp1BzPwQDH
         Hu/Sr4QuidxCLoyQGEUOIt49XfcDYgsLsWbYpbVvc5J65BXzhvY9aAJVZ8oiVkYodRic
         cKpAW60D3m9oeljt3XzVFaoj1XVLTsu2Mv+SPKdCZIPhH/qN9En+IwZKzdQ2S9GE+Q2/
         6lCiH6k/D/0I5Objl2Lk6OB0Ul3catzl7k+n+x557gVWt0rlVpKTbiXWLMfaIVU5KoMX
         mmlrImwiXADc0wyQgqEaTrkGxJ2QmlT9FKKPUmAEaoD50k87fy9daJw8vQHUNIRDAD/N
         3c8A==
X-Forwarded-Encrypted: i=1; AKwUvBzhrae3/tzJrYZd0mHelyBSvFbaS/cWOXDiHUU1P06BNuS3AUEt2Ydpj7bxV3toVG9VNlIWFbBu5fjt@vger.kernel.org
X-Gm-Message-State: AFq9FYKz37EqoCjlg5EZYouTrWxS/uE+lQp4mGizmPmm3ql+7RiNiTHC
	QCV6kbHf9W4cZuQTr+Jeo4yx7HbRW7ShYZgPyWDwFXUQ/H5CgrWi4zN8/LkNcU585LfZJcKqhBj
	dYFHbhjw=
X-Gm-Gg: AYBFou0UBlqbfeOR4xI1D+zqKcglEscAmmM0+YjGxSZX+oKk8ZGCiIDnoGoNpKHsw3b
	9lrh2QDmMu/qzlfKioWSJURvEASjBPbQYp0Wnf/CWkpQSCN1a3qX3zzXM9xdQTQCEfXETf4nsV8
	tQzR2dbNqMwJKfOrqWkFIL78WqubBkw1UQ6D6utgkwh6EC8Goc9QYQ+l/OTxrTwHkZ+k3+RR1sz
	ToWseNSSsevm2P2PHWwKtzbbOfkSnirZHyk80eODN0GAfX+tB1c1BrM9kaSUvpNRShdw9reeo7P
	9zZtgRv58JZDmJGxN8iBs9CzHAN6CkUc6A7gnAwxJXDZDdPN0JiGaNfBqt2ICTej6YSdZFj0HDx
	IcPlO7qesuCYla/UVcCckPDYLBo0Yyeb5i6lNfEL8HnsP0bk7GZnh//iMoVyJCiIZ85kE0Mmvog
	nKa+V4XXH4kPpzYiDE4IWeAWP8e8GykbpSaxSt3ppCVn3TUnv1Phcb/SqXjzP9AGajMX5NgLeDa
	opsLvoKVhzrsIuzir9oRK0JrLuHgwnwB4JvpM5b9KRemfc1nKJDrY7saCf2t0bM77a8hoQmtU15
	6v4E2vQU+sEQ0qNqa2w2kLrhsVUQKFaX2n60pLVhpPf5bHLHl03GXNTe+Tvlpu9l
X-Received: by 2002:a05:6000:25fc:b0:48a:fb1c:c2a1 with SMTP id ffacd0b85a97d-48e3eb946b0mr17431195f8f.47.1793098234650;
        Tue, 27 Oct 2026 03:50:34 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3eb8f387sm21810301f8f.4.2026.10.27.03.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:34 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/23] gpio: pxa: Add missing platform module annotations
Date: Tue, 27 Oct 2026 11:48:47 +0100
Message-ID:  <c5a23e1dfa25307d4c4605278f3922e39d25579d.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=836; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=0N+lDmQgRDGBU1BCwydX6YgET7LObGjwfjhS8sLguR0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGwtHuGroERSBcGC91nedVJAu5uU5IHfc0C7 kgT8qtNFriJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBsAAKCRCPgPtYfRL+ ThCCB/913FFk4g9QGCuPgFmwjg73gNT6Ilij3/UT+I0Hged+Kx2+UUheR3Sh1BUZ792x8sZ+OFX 6/OXgWWtVZGX/E4PiUDligBrWeD8EEZ4WprAQhdjcFPWrY5ztfzPGSaasbLYkQRaM57jviXANd1 L3vOqhoZST4s90PTZIJyYWOrd4j6WuY3VJmZ4Oyf9AFOWDOUc3Hc6VTHc2rfyFhlbQYV/iMjh+p rvsINQ1NQRM0/uOUI53pBOT1Arz3VfMrZNzPA8EBjA/sXJJn/17CuStFx3/AZYDY+uTEp3u/QpJ sDXApOo+WaN8m6+9MH2pPZuRXJ3MFVgU4e4vCbpopkHi+1Fg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using a platform device id table is
supposed to declare that in the module's metadata. Add this information
for the gpio-pxa driver that failed to declare this.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index fa2087acc025..d241fd4c3d31 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -719,6 +719,7 @@ static const struct platform_device_id gpio_id_table[] = {
 	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, gpio_id_table);
 
 static struct platform_driver pxa_gpio_driver = {
 	.probe		= pxa_gpio_probe,
-- 
2.56.0.rc1

