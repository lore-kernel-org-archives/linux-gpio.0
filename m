Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032203;
	b=I695PFpXwn9A8ecuQpHs2CyIBDD+ve7PNnagAxAU/S+XUu1W7sRdLOUtsFRY07D1fY3K
	 h+16B6SfNvCo2lZ2odSZGkqJKRJqjUY5zjwh7ewfPkCWeotmGoq2u/amljOlA2PtveWSe
	 c4snamgLE1ogF0513OmKevtmrwgeQZNjg2gGMBPnoYL/HJ+KsnP9gfAC3fdRXq8/XYQqN
	 HVUetESYdRb1shw+hjGwBmwFz0D35YjNKKCJaZkWVeM772dCpKkWpqw0Hif9T9zZSz+WU
	 SqQYsIcazs+VF9NPlnPzGR2gv9aziUev/Zk3WJZ6CuzexOf+/CfBtg6Eq2iG003gcxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
	b=ETQwDB2crZHTc1BV9JQ8RH8EuqUxtzM2v9WvN5FTfLgbN79rMYjXpbtx6F1iUjMONVvs
	 uVVuo3j/QoDBewYw5Z3sHAeFqT+JVcGNeV/O6KQXGgvJxXxM8CZvU+N33kNvYDdymjYFo
	 AeOekxwY57ooKHeMFG823wLRFqd6IgJpDCmXiLB8ujuZqKFz24jqJyhGsrCD2cH7sEi/5
	 dOTHmLCb1hwN6LjqxZPW8n3YWlhXqR7c1Sssm9gqO/8dVCQdVm+sPDAjp+a9FWRRXFUnE
	 7jYpFEjgMyg3NBPmm9SnjYrBBbA4TDRRF9dT6oc/NEqEx3g3BbNbtqyMBikjCBzsjTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FOsw1ZWl;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6B260A6F4C
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A6B260A6F4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FOsw1ZWl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214af2076so23061145e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032201; x=1793637001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
        b=FOsw1ZWlC4apQNQ5/kMtL1+StV9MniDxLMQSzrdYpzZfM+HTjQ7Vy3UxOwHETQXwFN
         is0ow5ngAvqPYltMDJOWjQbZjUu0wv0fkB5S1TtwaBT4a9DGAd8KhlOwL1Pnoc5XH0Ns
         komaD10rzSjWz/5nbekvsaFiEhlVPha9yYYYUB3IFFR0pmGBUZCdMxYC88v56lI5QaJa
         watiM4dr5zQTp0Z1CgdHQwkr1htcPsVY8w2ka13O+zVO1p8ZeHUfAxC4evArRPKQ8UBw
         JfZg72AvUey7yzXxQ3SRL2o/4R3cnhJ7BiUAq+CZc9BCjLEC771qzyp4MDRLTtwhJnxL
         NIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032201; x=1793637001;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
        b=ZKW7bYcb43en9RORIm0Ys1g49jF6S6NW3TFogfaqh3KfjCGcqo439Zw3pvpLfoEjRM
         KwsQlv/mykcJb8r3Xjj1xBOWBPpBKQWXNnYqDCCtHpIIKCClxt8xgSXP0Mx401XS5A4U
         Z+95n4C+NqKTzG4nUb1kFTrhqIg9zlOqOoFiE/ZAnttgNZDeice6mo4Nb9jBn7ZkLXTU
         RQ0jgWUYu7DC/bJIN+VW4h8yFmHwBHECOhaxyF0/OUa7IjvL66rzHqug5EF0+JTb4wTP
         d9zFsnbE7njfuF8a7KNQfsCGPTwMlHRqE/NGt82ty3rGjl9xmkXsd7yU1fp3aO7PN2jq
         WRTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxHS6ilqDYk8rXnn51PHf7MHGp1sKKXxFPmNa4NRGLHU0D1iY6gB8EQwRPgtgDsIJZ4xSy1VYP1HvB@vger.kernel.org
X-Gm-Message-State: AFq9FYLoESuyekhj1H5tg/j+EnfP8RA8PLPBHBw4zv1yGEodWxXuAjvX
	aaet17fAggiOU9UkAgiutzAPy+uu3Hx6NrvTj0CxIQS9T4y79zHtO9rkxZXTuro1c4k=
X-Gm-Gg: AYBFou2+Zqq5e62ZtdJF/63mOECH9yXj86aMS9QwhpxV8fEiOvqGJFAIS88cUdhIGSI
	V+7SvOuzPPaAkEng5e5wXF3w8lGhirBsAOqkWby5yIzaNdiyqkCR/TAETN9NdnGM89QQgT/MK86
	VGMxtQBsWTzGrczkSYYVQL5ebKrEnSAkGCdAKP9F1ihZn/ImWWyJnhpKXDfdfclQOcOPC386RvF
	D+6op0tXuW6QEpy9ggYUEWu13pp7oB1NcQg15TxRoVcRhMvJia+SIO5jv4wyZsWUsqnV2Kwr3zq
	JlN8O2gO6PjCBy1WdLjE5e7ZUjLw/tLpRWHBjzRjMC/QA+vhqVbMHMKLD19pODclO9GodTmOMHl
	LI9r7+f6/vpHgE/o0JkgEiTfgjfSERBF/3q6rnkmzkQkfpE1j8CCt1/bQCUKcGwfiLQmVCmpe4k
	hyjjhnCTmdrpzwmWB5qBsnj7eyY1u1Ux2sUyM5OmemrT8Ux3g7+VK3Icbf3vCJN8UGQH745r7AE
	reWS/1b1bc6QC5JDfLY55UXmZzcsJM38WVurYtp3CNQcvuv625Kx40W2W/6zp5nSgCZ7QINTk2q
	bSIH0GvUyxJLI909JHQv4hFWcAJ8zEjLA+hDfA2kuxA=
X-Received: by 2002:a05:600c:c085:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4a78fe81333mr13150915e9.28.1793032200691;
        Mon, 26 Oct 2026 09:30:00 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a359fbb725sm204105535e9.0.2026.10.26.09.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:59 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 19/22] gpio: max77620: Unify style of platform_device_id array
Date: Mon, 26 Oct 2026 17:28:30 +0100
Message-ID:  <3dbbe9d220521f38906651b13f349336d7b26bda.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=PwZq6cSexLoeh84nIBT27WIhYIRtJCbiT1iCV8GXeTE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/Q4dFDbCCfp3NThf57gFGSTcF0s1+A0ZzLR 4dLgPCjkouJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/0AAKCRCPgPtYfRL+ TqfzCACF1Y2UKUsuUZYnOgstlOezvxv27Or0D841whThpcdSD8OITXkrBNrBZ10N/p4BOYrYSK9 K0iNJ/YQwqDMzYKJje0kAmb1mDHakLxtzgVnOo/nvngT93xVrDSd16B0/Anyzzk5/r++a1PquvP AzJ8P6b/BIl7PLRiA8Ic/hKfOjyShyVKjLNRXb9TOz5w9z3IrXERPlcsa/qyoeC37l+39CqNWQg CFqk5r+i4RndYhinhE2opzIcmwZTI4nOUypnmR8WRHoSiaTjmLy7z4+nlMcU6duBd/Kyhltvqcv XG2ra1oaLNJBDRnJTUUu1PnNivCk8irYtsr4iCCWddFNK2wU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the platform_device_id array to conform to the most used
and generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the single offender accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max77620.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 2bf3b55a61b5..99ac7ffb650b 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -365,8 +365,8 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77620_gpio_devtype[] = {
-	{ .name = "max77620-gpio", },
-	{ .name = "max20024-gpio", },
+	{ .name = "max77620-gpio" },
+	{ .name = "max20024-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77620_gpio_devtype);
-- 
2.56.0.rc1

