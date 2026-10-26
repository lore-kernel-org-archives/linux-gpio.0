Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032205;
	b=C257bTwg8wWUB/MeAy+vyh3ZOcmEHMqpvtE2Wx3BxvkI7PFtHoD1i4Lqi3OEtzxqa+iX
	 jhLUGz+zjUNgwAlSBl0XDvW+oHFIrzfg2G/Ry61fsCT//OJjjUNi0WcAqmGbjfLzVMbLh
	 jGzpk8II9NzIfOa9g1HSlxnWcxszIv/KFMjnSJFrA8gH9hziQF6uoc+EC/vFmO8CdcEvt
	 wdmht+mHs1Br8posV2WG+v3znhZ5lV7J3ffXFnAsvcTEzMmPx7iqAD3nycWmOol1iAjc7
	 GmNvDNarYeuq516DzUUz1IZG9z7e8GveXLAYc6DUg244s2M1zuiueNHQ6HJoGIupUog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=4Ev4Q++YzojM8jhK0gqwyICK0B7tnR3S7VN4aaA1E4s=;
	b=QS5i1Fs4WRe1xM2FvPHXpR1/GSJP64q2RRR/qKMvOghaGCpo0CFZTa9DTGzEFqT7aQ0W
	 D/t3/2dr0ySc1yivX6r//M2C4uRzt83bXAxu9qoZK1u3z2PTPzwLKv9eTmULXKygMkqlt
	 sFGc25wLc1PP0b0N70AlFGO1P7aFLIu+dwGBdtdYmZX/FU5QtfoXifUUTOpTjQ8fxGAMW
	 jsqsND+FBNBmEr7tpx3KudSbM5wJ3Wv9F48pu1G8KhNx+R/LpOc5jEkJmWKvbuMuf+ead
	 KUXMTaIac4bK8MN44iiWaKH53quPAPHVOhXjX234+IuKhDk372lTnj9UagN3gPMd7tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K7J4xKHf;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAA960A5BD3
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDAA960A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K7J4xKHf
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df54150dfso1748215f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032203; x=1793637003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Ev4Q++YzojM8jhK0gqwyICK0B7tnR3S7VN4aaA1E4s=;
        b=K7J4xKHf7GBnR+aSRuIhHvzGh9UvwjQg/EJA2HzxhBJ5okakYdFVF8fmqrmZStSFL9
         +yKhwn1GJZPlNPzzrxEVrXiwqI38EJ4nU7XzPe+RXa/0W6D7YJw7DfLsHeoI9/PnYRKj
         XP3SZP4bF4PGHDP3xxfEqj9vU9aqxLFU4KJDzKYjZAFWvoXCfsscijBP3Sjdwlab+UH3
         Yc7pgSmG8f/L8ULk52f6Z8OdNs88c7RQvpmAQ7hUYtDCs3IQrim46p4bSssaQT9SwPYz
         IRfcxjvGf1BkoszeajuCyqS5H049EBP7UfzrbGHCwQrBZkRZMI3NZcTWFmlKnS14c4Z8
         QliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032203; x=1793637003;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Ev4Q++YzojM8jhK0gqwyICK0B7tnR3S7VN4aaA1E4s=;
        b=LsY/wG2LwUu1g4LSvhLFFvWskDQEfEsnx8KBclLZ3D6TWpi6+Ixe9vSS1oPs+gSGX5
         UFa7BRaJ9oGTlJw+QvomY1+vRDMGPp+dy/soOWB4/y2/BhTgeMXEkZQGgxw63c/2gTcQ
         WuVVvVvb6hJbxHaI5xe8BFIbQC7zbslFj8WlFGBm3tYYw3RCOW48kZpJn64BtXWG8THd
         oceAbNAkCZVII3DoTgofCl3bT/FKdIo6BMcXtHHrKpMLjgFAwSXXEcWI390SX+KMNaBD
         Y7pWNv5QHQQ7mzJ1TKL4wncO5bwwgTbSbHBc6DyAvYQJmR2UJ6XRN3Q6rmYDF2TWhdbb
         /u8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz+Q3G6yA4ocUfUk8b7soAR3+dvF0W3YFU+Q6oRtAUOjr7/UunNc1WEzIKvGbu/BnGslHA4Vt2ZwPIr@vger.kernel.org
X-Gm-Message-State: AFq9FYJuwtI3KYdHAQoasKwSPR98tDAGSqARA6Q+PToPclTZnsWlFB8F
	+anyCkECqUtAgQw84jiGBGAIP5uNApmZo5XT0wGMrfydXJtvTl6CZ7h0H8B6Idp/5yY=
X-Gm-Gg: AYBFou2V7CGhqyOU7r12XEiwavmO/t8TvE9lqAVzSHdtSnzQAItnltZ0PFH2puSAbSk
	rIQq/Fuw7rF+5OljO/msmoZI5Jt42XPeDxypebVQ769hiRORwxqYbG+dt5pwtr86nmD02RZRVV0
	+b1h+YmL39r5VhCaKoHzpKp7RbzWZvurTP1LcQCbzgl1et/VOP7yD+PTPiK6pZVkiI2chux8Y/u
	iB4OUZv3TgCFi7ftpVYRhAvHXjPD1VjIo1euOLT5drlxLRuHNTPWMKAm57MOk48HwQefYOGxBFM
	RggghZZMWRow/cV+ztDLfwQhF2rtezL2AaFMIG2DT6zV7/bCXtFDpBqyPwXWtUlNHBFJS8XLP6O
	ryMBVIA9ziRK9MVoaf6mm4PekdJKmT9itEyou47QtCVI9bVXYqLhWwkj7nfUPqZwrc3p8LG7atT
	IEL1L/8IwH5chFOYMs0opkRl5mZot7KSTIO5Nu7Ohurfm3rxLBbcRj8gkF8fabShdV88wU1aTl0
	1t0gI0lTe51TYQMRC9lkUaUW0L4GIfeijamNm2VegIEjrbZyxnuO+xh0vhgYnJ34iZWPPBMMiC6
	IgxtWhFzEsp2dSyUVBGRwtxwy3eRB06+Yv9DO+axvnE=
X-Received: by 2002:a5d:4d07:0:b0:486:f907:ebec with SMTP id ffacd0b85a97d-48e3eb912dcmr11404593f8f.31.1793032203266;
        Mon, 26 Oct 2026 09:30:03 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3cfasm17554368f8f.17.2026.10.26.09.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:30:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/22] gpio: Unify style of spi_device_id arrays
Date: Mon, 26 Oct 2026 17:28:31 +0100
Message-ID:  <a31cc13115c84c0ad27c7642920a6f7c34d3bc53.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/4Z9VsdZSag1oZ46enQb7zlX6AH9IP2d+Vb14r2Q/YA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/Usae5RcqPzpwnu/+Y45OLLY24zVhgTd7GL K8QmZ450t2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/1AAKCRCPgPtYfRL+ TkptB/9Hby5e2nSSTyAbkf9hlbf/+OmWjwLwfhbW4OIfL4clCi1oUS6Jkf1Z2dWtqfuQc3aH6DB /EgRQesvfmGBlkSr1mF03F8YoZeRMOj7QTumNpaksYc9u6piwGbdJHrucbyBWlAKF4xAfc0FfUl M9o910z09TwK3RAHay7mWdNa+AHYgnefh8Cd28tCkmm9GKFon9FCjdRZoxnthYicr3jRfM/WqYc nNyrMf89rRg+uW7NCSIMVQ9YHMj9geKSnnLQITGDBTmiSihGJVjAR2xfe5ZTi4SryeBp/t57+h0 UlLdM5k5rEwmPejCR+xnINDi4qWcmWmA4K+LbRADZGh+25sC
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
2.56.0.rc1

