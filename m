Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098231;
	b=vzBAu2WhE+NLewfWSa2UwS8UFk2x0C4SvaFaWxjlxLcPBR91v1uLkOkGkijogWJ8rfsz
	 ellBdm40ZmHaWgxSavwCjYep6Zw8BVvwSurecrDMVs56VaVMEhVD44bxWngP2+nEo7iZs
	 lgL4Zvn9yL239MbhDqHR9Q9OtpFqXc9Q+7rinND3Ux6lHdzYlu91s7Vlq3/loEMbfpC1B
	 dP32cgWhL7a13AB3ub8BSBpDRWiLglDhHh9OIRz+ylCYiUYwBIrrsh7MRuQ4ahq734mu/
	 s5qjxKAKfEFYJpXUTs7qo7p+Pe1CcpDcJQoTGogwsKQec1aiEyW/gOMLMIagrqcLSKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=DufeBrqyUbSnmQ8skjhQG6l+F7Ults2Rkyo8mZPpFPY=;
	b=JsiZVYFH+IKcQ4po4j+KPL0/8hQKIpCUv91xnsRNZHSnADiCMCYQ6g+mYxBahwDaGHe2
	 WRy1pY6G1mCY1AVK9iRYXJEZj/r3RKkUYdT+E3HQvk1mORl8Bd+aXPQ8j8E9rntH44owW
	 Oy3cpD5tUZ5/FLKOz+Ptv0dtZOs9vkpF0daXZHr7sQjEDNJyOVCWhW1CLtNZUFAigCTGE
	 JoJa8oAT9MFbK2T/2PmG2gtYbIWfISah4CXUBv0VUL975BI3GIZ9qr1pLymq2Xac0XoQT
	 q3t8zJ7+a6WhC5jA1lqxjE5TSGB9htP/QHA5uJdSv6mk+EQ1vsjqE/rVja9XR4RBE9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ecB6596H;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB41660A260F
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB41660A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ecB6596H
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e47347279so1731291f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098229; x=1793703029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DufeBrqyUbSnmQ8skjhQG6l+F7Ults2Rkyo8mZPpFPY=;
        b=ecB6596HtOJNyVOW0IQr5NfjFDPH6zgyqpUII9qLvZ9wFpZPt1854g/OezLwwZIGlx
         hMd4eFiqaDRrUWC0gAcgM1/W6cGbAP0eyI1DTxUsYsFlyYuO/74scWBJHrkpqO1m4MPM
         0Kb3kMIHI4LxRFr3jku92PHmyheb8MxtjsOvHYO3GFOWDe/0i4o/f1az+ZL+jvo4ESbz
         z4Nl0OYkHKhpFsStJEkN9MFeKdddYaOGza/b5hGyiSiMHn2e6B/LRVuBI9Bp5+HO8cva
         apqI6IezBLZ1BPjOwC2DHUDeC2Il1zpwPiXqVcfTnIj0HS0vOyIAQPkIj4mafOTpxliZ
         muOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098229; x=1793703029;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DufeBrqyUbSnmQ8skjhQG6l+F7Ults2Rkyo8mZPpFPY=;
        b=0tFUBHam6xCkqlt439wA2DwMhWow2BO6P5SjyRJL65xolKzOyHjdXSpAG7jtAHEfi5
         AJ1yNM+qRMmU1947ds171a5ihTHtwbVloEzNU/39wKHkiteACpoABitHf37f1y23Od58
         WLS+gNnSX8ZCvYwmaHxCvkLF4ivH9zmFQaFRVkW5G8i9aXzDn+HveVZDKP3c03NTak0P
         MxPHF8Rtslzyn3jD1tYmYP/XsXJGjCx29khciCJ4f3CUZmB1wX8kWOd+HmacERKxTC/e
         KO8YLnpT3xXw6RYJf1xf/rLCT0spgFeOLZsbiEG7u9uv3tVy5qYvU+ZLqX8K53zTbr0a
         ZyXA==
X-Forwarded-Encrypted: i=1; AKwUvBwtFCeJnTr4+csJstvml0NotoCI1BQgqM6McDx/G2xJhhgCeGKDCSyDn0AJUyV3Z5M7hovpyCCCu7Qi@vger.kernel.org
X-Gm-Message-State: AFq9FYJZGarW+jHu0MWHlsGqe4rR2W8w9rNzyUKvkKdh0Gby38wIUWD6
	89vgEyLcfa6Dbxsss81ucTVqqx++MT1HUs+K0pHI8bSbb4Gj1xHV6yVeuUyZFwCA+co=
X-Gm-Gg: AYBFou1yIBX+XH8E8YDeX82mQ3cLMFqWWzgKTLlFs3R9XQtHblvaycQVNKvfPQGnyl9
	OlHxbGAb/ArRMRvcwOwh72vrfX2dTAj3fx2Tw+Pl7yweXsTCJeMNe5YL88qK0klUiMpOgI1K/EX
	u4bd1hFzbY3V6+cNWQ8HMituqOVTMIEKkwY63kQEoKryoRTsNE9+nBQi5lxBMYgXcCZJgIFj5BP
	wdajSbu3QpE3MfdGecDcTbI3v8f4d3TYB6nE/pSloWUL6WMfhxl/A2a8K+x8KokyAYaigASIvBS
	p5QTL45slvoIv3qS2Wi/ilzI5u8Y+xmUcWTDVIuo74yZ65aGZJcXNiz4RkozeHXd25IsQW7h2dS
	SDu0OBGmSkH2s9w15TUwlQoKd9rkhOjkMq0TZ6QZadni+Xn+r/hA8SV46Pr/DxJ1eSf+T1kNwX8
	udENtGEDoGm0HnUYt1r30fI5zSExWAVc3V59HhAzjjz/iSdBZVm3PdJZ4YmO7rGaZdHAJCFg/be
	eWj1ygDRDXGPmRPzloUMhZjBTFxo/4V8ZYLVPZlT97rQNIpFBI3cBGurRjo2t0XkPY71TcK2ULx
	RKpBASzghPdm5F7tU7AdmVvH9BkN8Z0fbD8ENsaBTvM=
X-Received: by 2002:a5d:584c:0:b0:48e:56fa:9645 with SMTP id ffacd0b85a97d-48e56fa96c1mr3303066f8f.29.1793098229260;
        Tue, 27 Oct 2026 03:50:29 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecde7easm22352475f8f.52.2026.10.27.03.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/23] gpio: xgene: Add missing ACPI module annotation
Date: Tue, 27 Oct 2026 11:48:44 +0100
Message-ID:  <19f784b91a0aa51e83a85d69a933fdc197fb83f0.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=781; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xq5mEKXuCDf/ep4/z+js4VuJ0kfEYf1RuGm8A0Z4zms=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGm6YO+TcXKBdlcvHmveG3G04xES01Nq4bFX EtAVF/OlCCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBpgAKCRCPgPtYfRL+ Tj5iB/0ZWdAujVmwhrVlbS6aFROKC/zqJvBOGgXKxcRcNirOgZd2zSuUsSfayH0TnerX+EiJp7v xdF27LAdBSL0egS1CZvf3jQQE4owlESkv6V502kXB551V7pgvW4CXqZ+yuWltUOiOZcvWIMNxVP iloVrv04cdvSuLfV+sKvVP00QJDxTLiVstZBBUftPn6soYwxvWRyHAgFtl8B/q5xNr87+djfATV VLvT9Sb5RyPaI2KOz8Igx7xBi02Zhl7SxuZB1uxsG/3kEG9ffzWhIuvN/yAdqmnNvOHP175p6pB O6uKY/O7VKhtrskyJPpE57NnODN/shyh68sV0WRdfBolbhUB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using an ACPI device id table is
supposed to declare that in the module's metadata. Add this information
for the xgene gpio driver that failed to declare this.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-xgene.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 22d22962963b..ad0f1551c271 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -197,6 +197,7 @@ static const struct acpi_device_id xgene_gpio_acpi_match[] = {
 	{ "APMC0D14" },
 	{ },
 };
+MODULE_DEVICE_TABLE(acpi, xgene_gpio_acpi_match);
 #endif
 
 static struct platform_driver xgene_gpio_driver = {
-- 
2.56.0.rc1

