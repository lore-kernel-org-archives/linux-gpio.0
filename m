Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098247;
	b=nmSQfVee+iJ3VzvpW+2y86yjnJE4zzN6wMOo7KxPLNc7THvSSwOC9dRw3V/g7SVGe95z
	 668R+j++LWhXQc3dAZHyFcLh9xuyWFjuD95LNioqL9w0yJXTt2iQo8WN1bUKins0eWIXM
	 NkY5VFThzI+PHxe4pFobXachx5GOGsrQ43Ou3E/Qokt9acruhRQNFcbXQYQl8wIMzsMje
	 0FngI4EGkPuYBhRWpZOY8auvzqjxOIFvhbmoKDZlrEQTf5zB3Xpv47+AfxD1AwV56tCF6
	 Xg2f6alS91Y+K7SpGtx0IZR+LV57GmVkUPhgaCJHt7XyelVmn9WPdK113QdkqSUg1SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=iput7aG/xiCvSa/y4WK5WCJXc9/uU3fOh5nemna7zUM=;
	b=GoeCA3ANn9uxFOHoDCsQJHA9OQSzS3NUnR2tS8LxWgmbrqrNOUUH+wDtCePAx4ky3pHr
	 +t4/rMAxLQrvdab3MUQ/CHZ4Kyl1xslgvWqxlmkwr/L6qu0agz3aB8w+waEg22yfvUO93
	 cfnu1/syiR5GcSiB7cSiQ6zZWGgTwjJxz4ir1bKjQPd/QasJR10alRPyhYxQmH9ml09BE
	 qBkL4MGh8/uwmVilwXXLkzskPCcmt8RMI6ckTbfh9Aw98VPkYi06my09UZ/ux82sQPjqJ
	 uyyCyz8wSqJ9ViJhLOHxuvov71HK3Rpg410iT6sECxlfkF4Xf30fcGRVx03BQgdmWqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CBA606ADE4
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0CBA606ADE4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3624418f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098245; x=1793703045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iput7aG/xiCvSa/y4WK5WCJXc9/uU3fOh5nemna7zUM=;
        b=DpOZGB7ih8PWwcpYlkx7xlFOKFuhpaKS0nJWMllNS9JnYWPAsIpQS/OL+ebTC0MFFg
         4gnWW2MAKtItRLBN6FKencazG6Uz7fJOtx7H3MjEAhIBC8uEHGwW4hXODWknTNm7PEF/
         QQJDQjG51aCpLaOEbW9ebZWx/rpn2+ti35PVMKpHUVIiU6JEZXbCBbXbKwwTx/xqZFiT
         LofLxiGKKkAc6Xso0oADA59HTGcNcmnCchER5A9TKuF8sT07CN/W/tKzEvEk2IkYSHX9
         uvADtSZXd29qFCNoViAJDxSHQ5COJXFVDhoFVr2Of5WpnndarRMeTQZ2j+h6UQ6qEvqa
         Pimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098245; x=1793703045;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iput7aG/xiCvSa/y4WK5WCJXc9/uU3fOh5nemna7zUM=;
        b=S677Qj4VOWR7BTPMc4uI8DXK+AENsAlrBXkIXLj7hz159zTySFLP5BtxG9BrcTYzBH
         urSoTBhBSvIhQJS3eVqlrHkT9EohK4Cdua2KhAdCRluUGku1eYUTwRrXNtAKvpEeoNw3
         cpK4bnQ8WbEzKReq3JEnCAMaqx68rx9z3Fsrpv1WMEAL7uQk+KAafFo8SdQDj+RJ8K+I
         ZFsp4yxHe0NqAh4DMaOhag4B1fv4grzhqdaszWU3kgJWG82XbHgDcsH34wtKooIcFMSm
         cX3noQ0MCHJ2PHnWnHsWRdm4Fjs6YIF+5tdXv76OasOdrDnVg6JiYB3qdtR7Sz3KBLj4
         Mjgg==
X-Forwarded-Encrypted: i=1; AKwUvBxBIeU7RLnWSPO3PkaJ2uMYEKaNZ+RfTWxnCF9IF8sjG+ENDy2j4aK2Q8zPDI/rQeiRm3UMQk7dSCv6@vger.kernel.org
X-Gm-Message-State: AFq9FYKEOZ/05YG7PcniEAd1gJzLz1pLM1WTcanu9+bEXXAJauZShKe5
	s44IPfjlwMgdhdm/DscvjITWKr1xsgB/qhNCi6tdhSUNyFsegoB94bHQ1Y0R+IXA/hK8v+OhN6n
	lzZJoYxI=
X-Gm-Gg: AYBFou34MTC7bZF8l8N/NqQvxibVCcimTT3gtu3oOxF6pJb9XJtgYQWy0WLeGGdiTbm
	kkDq+LIdYLcKOlkFBp/ortHE93uCIJtJIfwfCsELgQ+aTVkH3Q5VdUXI3cUTxHemjr37BbNifmp
	C9ZAPBBmxo5XbyKj1PyQwPUH1aZ8YKAKrOie6Y9rGppKNq5Wpt1z/JZN2XhUU8Cmv89UefGmzWc
	Wnmv3hLkSYv22QsnfVeNecIIw0vETxMyd0/2GrFsyk6hzd5knSSul/SVIJ2Dc4Mnysx0+9fRSDq
	0A2EDW2+BAsrLodo+Tmu1jBcoOs0tcd83aBj/8MIExwBCn+a5YhYr8/1loqCSKKjOftttNYkb+l
	ghCwmbQ/SIQU85lGDGJbDun/CjV6n9JPOJgDrOz+7k92Pr0lRGoEtKAYTBktgiw5mcmBlQv4gUt
	+33U0X0n4KYtJAIl0KoH4t61/P7/IL1QkA7Ij7iRVNiktNEwWhme8m7kddRHYm81zyao0lqIfMY
	vJdQnia99x0UWJVxkOzSVv3OqzGGEh15qq6KjF4eqapPvuAQ6twEJcCCOG32Z5SCRXLp6h5nbtq
	qZNUXa6llUxqgnw61bwnKo6Q1XUkeHL1hSvmpyEJXps=
X-Received: by 2002:a05:6000:220a:b0:48e:20ed:27f9 with SMTP id ffacd0b85a97d-48e3eac10b1mr18208716f8f.0.1793098245195;
        Tue, 27 Oct 2026 03:50:45 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc4d76sm22611211f8f.12.2026.10.27.03.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/23] gpio: bd73800: Use named initializers for platform_device_id array
Date: Tue, 27 Oct 2026 11:48:52 +0100
Message-ID:  <c956437a51c89f5158fc79d61c8cadc2f7f81477.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=dtKVjzO953dNgnO1/VKUCTW9qRuHv/M+w0O6aXTtYzs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHDgwBuDuXM1Jwsh/47McVKLAOph7zZzdC6q Ql/KZTmPeqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBwwAKCRCPgPtYfRL+ TuUMCACfjZ5ayS9TtmPoY3mSYYdDukc977i2yQ7d8qjGNoX67KArndVz0ijSMl6/z0fVMZnhbvi tX437Ap0ID6WMNrQtNUUqO99zbJ8ICSU9LXPE5D2eY82SRFQs1LKIgq67D2J0k8uEA/AaMjKZWG sxFGMNOoOvmK37QD5b+g+ccUlXRS9P5YrI+HtjYY+9Rk6/PYOzveSVHCvu3VMCTInyecM/nmWYF doorUmLp7rBqc6HFW3LTD56srQSp8xcjSEcNzkrz6HXFMyO+8w7bbydkWcErBV7AFMOWferCPxf 7FeFhDujl6bk3DYHWz6ZMKjcfWk+wgUSJ7C5bCdokvKRCEbw
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

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
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

