Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032194;
	b=uazjO4MhMlJdn3FIY6ZuoCDo+pYTwFhvGi2TwhFsCbwZAQWWKrDKWgRw2SwaLXS4TrRr
	 x9I0EkOkn/iXlGggZs5xavJVLyj8bQMBA7WwX+tXZv9klv5Dtmn0mGfTa1CSwWHVya+v4
	 UZLe5CtBkwT5jcqrC6QGT1qSwmWN2xkcAzY9399c0sXa+l90a0Ry6jo2NNhjWL2nx0SEN
	 QV57i1SJe0+sL+bjGbjWfDQkJP04zCtyT8l4yDm1bCChe2G8jTKFYX5m4u2++KAiUyH0p
	 2Qm05R9h6Vw3bNKQYa3/wmu/Yq6HTydgN1nYQZBfmHbNuiYm3vx+zaMBbLf4FmXk4iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=weh8aB1RD2rz2NBxnWcSX+Bp3jr1F11OvC/LQnJmCzo=;
	b=UG7RHcsuAKdU1kCGtPM+Q8N9fkv8I2K/eNoiWjN4f7Xdu43xmLATtqJdYAHXV0d94dlu
	 3rsAOY3xTE1s1t9V4D5c/6eXrBJOwgQUgUHOWR2CR3NWRYDiO1CPIw5Upg3a7RpXZMnoR
	 902iwWUBJ5xqIDPgfFU+hu25jbRTHi6fdhc7LNoBqXIxyfhri8d1G1pLCMfcAFdn8GD22
	 ciiSYWwfMdh7EOcyanQjEV9R2noIrrnlF/tUvyVv5L+ohCwgk8s2P/Lgua5Fl40/qVxdq
	 s8+7BRI8dtNnqSkU0ZOuIhNYjxWDuRZMhOL4gkvn0JMVxXVmcZMSvhyGiIyNm4l9K6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ob1cgA21;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE5C60A3806
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE5C60A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ob1cgA21
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1753637f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032192; x=1793636992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=weh8aB1RD2rz2NBxnWcSX+Bp3jr1F11OvC/LQnJmCzo=;
        b=Ob1cgA21C7u/iX9afc78bokr4oYBgl5p+ChGverPkwTnAl+mNw+3vj0aZx/7Hipp5x
         54+LAXhU1xO1uhePKVj40JuVQ9uudk/SWC92cNtb5yl9AXYq48NvvGWgYmpzuVS7SvhV
         qQQpsCEpSFNNYbnV7dqbSOm4gKMTAT4nU/ZtQHUZCAAhUEqB9pr9Cw4UrmV1H/QsLzkg
         Dsg9n3hXIKIJAZGujHsfbA5KZEOcuDX0UyujB5ai9eecWQWFWb/32sCi0pMVvP5hWpxb
         UbWc/x39Cthu44F4o5VUlrui0vGwM+h0RtNLJxPMvbnWX4sH/ihZpWYOSkbg293odkMQ
         wFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032192; x=1793636992;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weh8aB1RD2rz2NBxnWcSX+Bp3jr1F11OvC/LQnJmCzo=;
        b=i58WfPLw8AH8nFId6XqDLpPSS1J6qlZqaETev9We5uwWFtHNF+jAfhXZJDB6DNBvdp
         BTi3jnbO6RFgjTAjRsB49tRVv0OBo5QVl9n6BZ2IchAynHUGAcFh1sgkgNgnIVcn5fAS
         23IzRu5LEXkdXOyStzJPr+ooVmJUGDLyrXvQzT+VHCytZtbdCqfNsWjr12R3e8xzYBM/
         2otoCv8byEQVANnlZjgjG7sNsS0YGnKXBllzSTB1xuRQHsbp7kDJuRydVVo6DKx0rPUZ
         k04Tem0ftYbycmynKMEPu66OafzpPwLp5sFzWRZVLXupDcyRcH39LZdbvX3ICY1nx8/S
         /Ogg==
X-Forwarded-Encrypted: i=1; AKwUvBzj5seYL45P2LRd4/MKrS6JWHN03L464STyo0yqupUCEm/39kqb5DHJ3KWa9lZmSEqpjSmYZ/JvDb9a@vger.kernel.org
X-Gm-Message-State: AFq9FYLOnS3ax6EVJNXM9V+DJ+9rei0B2/3Jjlnm1Ke62o4LjXCJ//s+
	XAOnJbqH964Vswwc0DGHMVblI2gCBlFaTWmGkmCvBcvyHIsm8+EeqHuO6CP4ITaQy60=
X-Gm-Gg: AYBFou2XMDAZ14kV1my8CbeQxlB5VUDx32mI5H61YyTPk86i5cFQC5NQjwAHiiJpEr/
	R+q/xHZccl81hAMwvjlwSt9mGKj2PA9AMfVnQvxumrXG1Siwz1Em/bmSniyTSE8321OcmQECeUb
	igzNtuOD5xpQFyMyR3wR+oopceyTP7bkUVTBGs/icm9NHTvHGQ9WZBjA/pXHLxxgxHKZsbtVIwW
	nS6CXSNvuwRdRH5vvD+D2L6e9lTSQe+lRsxkHwxL1dc3mS3PLEnd5zQ5S1Uv1AvarNa2Jf8acxf
	Fy02TJlcZa1GPDm94CeV1Xoud04moOds96Tq2FF7OgiM4JKDS2MoDt1pko2mDWilgghc24JGsqk
	GiZqCSnJgXnbEqwYH7LYk3LrJFPviyk7bH+BVYfz6n5uaQoX7F5xp0xqD3MgNByv9YsDpBISEsU
	/XWiPm8NasQagfPKZCVQRyaV2XFZLzilBrF4qiX3k32CGmjew01TV/7pbIPQ+bar9GF7Ko8p05V
	0Ngpq7M8iY8znk7rjCz0d7l1LcBhs5Oizi1QzADiImREPTzx7I2d6Kq2/1JQGTeVOtHR9x8wprA
	l2hZrT1XIUiA+7VNd2quK79KxBo7Of57YNH0/s2lETG1xijh8rWyxVEZJ6a3NnTZ
X-Received: by 2002:a05:600c:1388:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4a35aca74f6mr164640745e9.18.1793032191715;
        Mon, 26 Oct 2026 09:29:51 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a30e22csm205371365e9.2.2026.10.26.09.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:51 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/22] gpio: bd73800: Use named initializers for platform_device_id array
Date: Mon, 26 Oct 2026 17:28:25 +0100
Message-ID:  <fc1ffd672a11b0f89524c6295e4070c954eb81c0.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uMej+WR9EcZGNyY6m48dpaWcf/noITslKqqTKl8iBLU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+/qtiz10JiRQoSkM+IcYR4IkJCCZKRSwEOn KnytOdxz6qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/vwAKCRCPgPtYfRL+ Tg0gB/9yTWWAxuYL2icmvpbASj3ucZ2WYr/yBAb1fg1wpLijxz0UB8ReqStKtEywYdvLeEKFTAc q2aGqdelthjyqRw3pS/VS3mTFLmAcN30ZLHhaog8L8KXtRprUTcaM3o803PavV4cYv+TuQU0f4v xYlkOW1PlCyEJo1SBdGO1hFKlRvMRb1BNSvdDXLmSlPYsEc3AN7mjUoSmz/sbK7P0iEKtfbGDde nBtE1vo9G3iwgf4qxfz9gMtx5MrlFp6EyndyawwKSsGdr1J8G1/UlUgu3P5P0ycUSS8Nu3rpcxt EE2pISFvJVuaPnDEN35IN6BW8Ody3fbRPnEhLn1Dr3qkL+Dp
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union
(though this driver doesn't use .driver_data, so this patch isn't
strictly necessary for the plan, but still ok for consistency).

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-bd73800.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-bd73800.c b/drivers/gpio/gpio-bd73800.c
index 2be2a885820e..c960ea6e8426 100644
--- a/drivers/gpio/gpio-bd73800.c
+++ b/drivers/gpio/gpio-bd73800.c
@@ -189,8 +189,8 @@ static int gpo_bd73800_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd73800_gpio_id[] = {
-	{ "bd73800-gpio" },
-	{ },
+	{ .name = "bd73800-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd73800_gpio_id);
 
-- 
2.56.0.rc1

