Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502E44963B1
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134583; cv=none; b=asJmWkXlB3sIQ/5lEVCzN5/rwvamv8Gxve6BBgaQTQB9BtcEFX/MaBlsaLh3hmggJeY0w/i5MA84VD7QjAuyvk4FBhhAgFbzjIkdgQ5oWNeCqYVa8cln6Ug3Nk0EQlMVcpkMPwnPTr+GSjS9CHluYxqzunJh0SuYgK5xytsSopw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134583; c=relaxed/simple;
	bh=sgUY0S/Wf6RKVdL/O7MaAprFuyCblfcodNo+HtW7MRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DoIbrU6TXnt7oEtnvQUzgJUQYlJrDsT0TY7b+LANinTtNw3RTTv7nArjgmYpbhUNnnADEZaBLgm+QruTx0uRXNizbBvRxdW1H3NrJRWPH9r11MW/n5BXHlDF0xHamUYHlAvdwwV3/Mh1RyR0xzNQpBlIVIJNcTjqMDcZUl9yGWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=A0nMwWsY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="A0nMwWsY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso11688405e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134580; x=1784739380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7XEu1anbxbFM/7L/MYZGDwApZe9SlYQE5kSCv2TCY90=;
        b=A0nMwWsYbbSY+cS46NG5v9QsEG3ONsCHxzU3kbrpPBIpmAthrPrU0vifCW/WCnaYcv
         /tuxwCQxjJRuk2URWdxS4LxWnBY6VNp7gyaaz7rRy+6D1qA6e4GQZRQaeQSNqXSCSJ0v
         /pbbSY+tL2DHvvxdHEK5OgNeCAYbNhrKsw0nfRH1cMy7Hlj55LiMV1VlDH69cC82EVqd
         /invF8SfaD4yK40okcQLrGn0jt8uJqHHmcwOSnCcX+wTeE4l3xB+Jkq8HPY/KRtF6OFI
         PqjXVw6nyLiLuBvXvePNhpqz95GwgZVFYWyR7i8AcLG84Q02uwzzAx+gta3GsxeZl8w0
         l4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134580; x=1784739380;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XEu1anbxbFM/7L/MYZGDwApZe9SlYQE5kSCv2TCY90=;
        b=Vrjre/H67qF/Km+gcxX18sSA5IsxPYXTTS2o8YrcpgxZYi+utw6/e4ollOqAcFvXsb
         vJxydNNlin8zfE7rHb+cHo3WPSn0vZp5TiiBIXDPxqwtZAoKcmPZMCoNkgLYr0+Ij7m0
         ayaT42SH3nI1iCbctSI6Uva9U5fcMLDULBc3FRCygqSiYeWWz4K/4dxz/UTHkKcHNXaT
         GrKPD1b5h/Owxc2IPpE/Z4SuKP235rCZmNAPJ4zhQKEkqqQeeloavv3Cgh12GxdbCy8D
         WI5ZFQUwz6gf88HLYpA3ya+dsd+Gr08gg1y8pzaPfmw02US5VmlK9IYbgc1DalsIW3/S
         33sQ==
X-Gm-Message-State: AOJu0YwL8Etml/2lydIk2lasTzuwaouIjgo2XXZgGkXXtHXShDL+/o14
	XNqhUu+TBXsryuK9O+uAVB6Ojn/V8Hm3WeuAeKm6SHyc1g+emvhcy232bRInotxWr/Q=
X-Gm-Gg: AfdE7cl3Oe28K5ahqKUOIEz+Hj1Gu6KCn5irNEKcmPSK0u6x6L1WYLjus02O8qfsH88
	LysoUe70370JJMB9ZEtJOgHcgJz5fAbtBoRordDKcBtfinrDW6Atig8/UF90uuvpuX7j19i/wr3
	eTWid3EfsLVpRJQbs28aRCkM3fhKnWfVHHG1R0IxRLXChNdYcpsWIoDJUUKAXrDCEbjrVpUJX+f
	dmHtxnKkmbQKMwOBoJ1nXrgN3CYOHEKtYwcoV2CtpVGRwBBMuSVn4DAycvXWWPx1l7jT1Hs+3IA
	M1RBjgOR0TJwaqWBHPrCdx06q6bfCnniQy48Eo0NrkjtUOHEtDYdenrquTC1bmbb7Q4dfqRNORx
	EFPweh6Rfkb76Ulipl8WCK7FzsUkI9xt4QuO2p62iJiAcMs26ZZIr0okpd1WJnsgLi1m85m4QOS
	A1dKukXUuMyoJ3EYKEYW7i+LNSsa1VKhf7IWIuq4t9YIyCFEzSgzekg4xg465RSwL5n2CrS+8KL
	no=
X-Received: by 2002:a05:600c:4e09:b0:493:bc92:2a2f with SMTP id 5b1f17b1804b1-493f87d858emr193903605e9.1.1784134580502;
        Wed, 15 Jul 2026 09:56:20 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a2ed840sm157197805e9.10.2026.07.15.09.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:20 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/21] gpio: Use named initializers for spi_device_id array
Date: Wed, 15 Jul 2026 18:55:18 +0200
Message-ID:  <dae8bef1c5b92515cb9d95f53b89c3d9b337eb15.1784133987.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2944; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=sgUY0S/Wf6RKVdL/O7MaAprFuyCblfcodNo+HtW7MRQ=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7uJLCqQB3aMjxplFwN5ltUUkA29tNMB7MBLc Nyo1crF4BGJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7iQAKCRCPgPtYfRL+ TjLdB/jGxu8JXc7v1Ni124jZRMJjK6JegW3EP5uUQG81qbiWHuQFoi4sillCJnPQtAswTBnF+2Y YrkiYgeVDsBM+s0i40sPCaoTXO5eGsD29fWQk+h4v0DF4w3MabkdlqgT0TruxmfuygFlM9InOEL 2Ex1lVXjCXs5oSrytAdOutAbiqdL1Zdj1ZrsL3ErIKtd2HkI4LvY22mSDHJwP1VGcSIed3gABmP doyo0MINyUMMwqPmDDhbnA36v4D+xIlmgm9v781XWNUmluDxzhNopwrOyPvEqc2tmDfwgk3TSND 7edgbWHlQ39OA7s43EArKjIuhACHTxyMog+oCVoFjKMyrjc=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
spi_device_id that replaces .driver_data by an anonymous union (though
none of these drivers uses .driver_data, so this patch isn't strictly
necessary for the plan, but still ok for consistency).

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max3191x.c | 12 ++++++------
 drivers/gpio/gpio-max7301.c  |  2 +-
 drivers/gpio/gpio-pisosr.c   |  2 +-
 drivers/gpio/gpio-xra1403.c  |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index 6e6504ab740a..b06fecc98633 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -449,12 +449,12 @@ static const struct of_device_id max3191x_of_id[] = {
 MODULE_DEVICE_TABLE(of, max3191x_of_id);
 
 static const struct spi_device_id max3191x_spi_id[] = {
-	{ "max31910" },
-	{ "max31911" },
-	{ "max31912" },
-	{ "max31913" },
-	{ "max31953" },
-	{ "max31963" },
+	{ .name = "max31910" },
+	{ .name = "max31911" },
+	{ .name = "max31912" },
+	{ .name = "max31913" },
+	{ .name = "max31953" },
+	{ .name = "max31963" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max3191x_spi_id);
diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index c8bf6a9c3de0..9db20c22ba9f 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -70,7 +70,7 @@ static void max7301_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id max7301_id[] = {
-	{ "max7301" },
+	{ .name = "max7301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max7301_id);
diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 2732ea8c16b7..75a8f3efaf94 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -150,7 +150,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id pisosr_gpio_id_table[] = {
-	{ "pisosr-gpio", },
+	{ .name = "pisosr-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, pisosr_gpio_id_table);
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index fe0fba6ea902..3713475bdb75 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -185,7 +185,7 @@ static int xra1403_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id xra1403_ids[] = {
-	{ "xra1403" },
+	{ .name = "xra1403" },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, xra1403_ids);
-- 
2.55.0.11.g153666a7d9bb

