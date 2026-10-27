Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098226;
	b=AL0jCk3K8D/m0AlMIMd5fyO3QgX1B1BTpTfQaCvUojzF/+svIrbCuytmNskXA7ETOUCa
	 1N5nI45gOjUXSgNCcUkjvYQSrRRWiuz1LNKhB278K4NRRVm3+UCPBRD3y8NE4Aj4aMwsv
	 haH/iQ71WZkikGMukhV6cXNYKzRx3svK6bbuu8EcjxHMgGplnGd65+/dc7qLfr2qtm5+5
	 GEvx7vhgL2vyu+m5HBmAeMoovggISRyyxniAVhjahoDMkQ3BlmQ0iVqz5bOtAb/ZILeTt
	 q8/KtCbiv56WTPai4VdazZkmPIHhhWv6ShgZuSdAUgoArq60LU6wRj5Hh5loyIidDLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
	b=Ku+2bsZ51wZSoZ6zYgCvzRscIW4eIa7GxNgFf4EEe3sFPTsZ1lDSw4KNC9PT26W7HBAL
	 OIwqp78Y0VFE3NFGUP7p03nlUslRz0ZwKzJGKso5vzMyj/CmZf4Vg9MJrs8sanGs5Ndlz
	 yn8Ugd0bLgVzxZCUZvEhX457H/jiX6Sg9ygeLae04NZfF9O5pu0AhBdrZveS2T4ytIj2d
	 gbUKGLxnVI+uWi1ARE329kYeprxI7hj0n5jOb9m6nkAoiHS2AbQWXZ3C9wECVviqQ6WuL
	 2w9Rmt5Sy4rLHaZ403zy9tzYNYdCLqquwFa01ukxXahCAKneiPDsL9mjwShi3s+y/FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="M/yRXoaJ";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B80D60A381F
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B80D60A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M/yRXoaJ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so2316193f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098224; x=1793703024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
        b=M/yRXoaJk4sp19a63En/CBYR/onHEWEbUZlPor8Idrvj253ISHc3rjbFZqUlrrENDF
         isSCGq8+o8V6oWKbgYVkE6wnJd7+DMwJcOnzthLC2UG/y9JoNqLyr1s2hTAZcrHVYvxO
         WGPfMEgGGqZrn8VFI/4TgdsY18xVZTW7NBvZRomMEacnuK0TIdOVvHRNWCFfSFPplsBT
         KD6DiTHSmUD6WIv8OErXLQarqcrUdzndxmW9IE1fkXB/6yehi3pG9a/4KG1slgRFIrdG
         pBaO7UJLLhUmZV7KTebwfo6e+yFrZp7DqRtNDGpNzbWD6jDMHE428pgZZrTrHTeu/jEs
         E96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098224; x=1793703024;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
        b=MxcTPlmEwJHPz3pfuuNNb/ylXYSVB3gWZoBSqnvEFcqkIJMdKvu8Nio7Bh37qIWjjJ
         w4QCZxzBvnLjCtect/s54mbKhBDjxGmR5yJa6gkjwCiq4qv6abc5gyKFr9rF+vFrltPs
         gdR5yRFpuSpGyM7Eo8a0P8isx27HE0gJ86GAmioGjryxjxmsdGrTgvC2nOHbK/UjfHaH
         ZJw2rVun1VxWPss+ZOZakRCVnDFg4fgMTEt39yH+na6qcFvkAmk/4PfM4EP5juXU6tG3
         RmjWo0r6UKESyVL4vecR4wnkZeNsaVkvjZ3vBQTud2OrB/MNTu1D7xFQhJpE6IVYD3O9
         A/jA==
X-Forwarded-Encrypted: i=1; AKwUvBywP8UAvz1N4jGlQPKK4M5ObLyIDOrls6Flthw79ZAa4VYMs3k/XcuQb0EE6Cg6qn3Gl90BfRr1drDz@vger.kernel.org
X-Gm-Message-State: AFq9FYLPzSI1gU8OIOmvkJdCKXqyFTSdYFYL0EVWlwkSaVyXz1I7+jq0
	K0RO4YF/51c/iVhylsa5j0M8nF0NfTewo/5k91h8zWUlXFwEtGL/Vj38EcZMVZC2Q2M=
X-Gm-Gg: AYBFou1k27UyMlC5tqXL4YESgMm+lR/Bx4iIiyf3mOnh5OI3AdNdI66vbnt3XPOSMb1
	haO1zE9snYF6UXRAzR/Y1IofnrYsFe0HZlEB1YMBlm7bvXDiOUn1YvJ/xhIOvQXPSOo2KSjFW5s
	ve4d/v1I+OBQGgXSVOJf44hILZan3kj3xIqBfoyAjr3jZYnMshZqTpcq9+6Q7axvbkjPP3nJeAE
	2X65OSaxJsexzHYhaWgqpPNVGJTDK4XB5SkdQpWQ9yCP2hk6Oovk6yHKEljj1uuqkL0TbxL3Bo/
	0GiqVmYvGI/Xmum+irhM5qsS6QsoRmkqZKJ+Zqcwj1qLzSEogdADSKLnvVlCaZSm1y+JL5I/1Cs
	2SlsOAMeyaNis1HdpRw/qqj/hfgZ/yApwciOnVUPaTvp9d4JwIuSwE8vyOD1Hx2I14VQ7VSA5k6
	TKDjRpkjV5sgBIFStXctpCir62SWslYk5+J9Wz38Uz693CVom35/+yC8YhGreoBYCprFLfumSUu
	cyW/fi89UMOOMYuRjQ4nVj3ULwfzAXSiCydbE0FrGg+VkzdQkrezHszgIhs39IKgIV0pRgpQupJ
	q44RzT5jzipukELngBkHh0c0shOYbFljTcSyx0CRJkA=
X-Received: by 2002:a5d:5e8a:0:b0:48d:f56d:be56 with SMTP id ffacd0b85a97d-48e3eb7642cmr18140835f8f.13.1793098224502;
        Tue, 27 Oct 2026 03:50:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebd48fasm21905009f8f.31.2026.10.27.03.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/23] gpio: mmio: Drop unused assignment of platform_device_id driver data
Date: Tue, 27 Oct 2026 11:48:42 +0100
Message-ID:  <e5b01e7aa3f39b1dc4c794340f7463531e2fc37c.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=874; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6ijQYwjczGie5kQc8ROmUpQycONZ/hY8dLBsJPtE8rg=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqwHjXPXlj4NCK7UsL8Y3dfSbdRZOKH0ROrzOim5y9I89 3L0d7/oZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiV0M4GNZIf+WWPKrdce2y 1MP+X5z6ak8dZ82Zk9NVtXF7rsy1126fEnmfLahiXpO8/eafYNZfH3Q3RZuv9z0fJjnr5BW+8pu fNWNPvivlPOLiz/XnZ8y5fZxuoWHpPL1yOT/25e1rnGxWqdEVElP65teWjsC9OcsXz71dNKVr5/ Z5nx7JTzHmccwzd/jBXuqYE2wbbFzg+nuF5zT9wNrSiL7djkXnBfrXXD787O++9E0sLu16IoKq3 zuKlrG9qLrJebPeW7tmcXG97vJ/3fbzPqZtb2B18fJmV7TMlfl07+CpytO5N/kO+hzR6WYv0vSR f6vlKisZ6l793VSo81b1xjffny0Rv5mbJSN0+J2h8UYdAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-mmio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 0709ffaab4de..ec7c2b73f2f6 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -870,8 +870,7 @@ static int gpio_mmio_pdev_probe(struct platform_device *pdev)
 
 static const struct platform_device_id gpio_mmio_id_table[] = {
 	{
-		.name		= "basic-mmio-gpio",
-		.driver_data	= 0,
+		.name = "basic-mmio-gpio",
 	},
 	{ }
 };
-- 
2.56.0.rc1

