Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2071D48C40B
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134575; cv=none; b=XLidxu2ubc0MWNqeNZBajyEiZkhy1uA3+iih4/7+HR9BdSjNSaxY5UJVUIzVG8MMDm5x7luFPQaSaYxzrYy5RD8DZisF056ezhg1WA5P8e6l86PnGT/Oiq4MSC5vubZgS0bBQrjoCBosHPcBnI6tCenjIeFGIANm8Ttnu9Svf1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134575; c=relaxed/simple;
	bh=376ZZD+wPhduikubZ0bZXKk01b1uwRuv+srymK/ZiA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ksGGF/n4HVbyTKhMp2vPvydHJ621DbowH6Ncs+NfKGplNy59HQhkDPu+LADfTCApiY67uhgMYPKPuwdLyMazH9FqrXk85jDsM7fP9Fd+2punUwoq1xe0d7sZEfoOP7vhQw+mVyBSBHSelMoLhUEPU5byMXnjodLSDZItOOMsDU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Nho/HQZ8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Nho/HQZ8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b27c7451so10835605e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134572; x=1784739372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D6nnvVJiFQQaLxlKEaOiAKRWl9WrJpxkHSZHxL5UxXc=;
        b=Nho/HQZ8BLxOJc8YhKancTPjpZkOYbVijxmewHlWvssyN/5uZMkEGUKCWGtiEmQ7Wp
         EF6QnO1nRasl+dxB0GEQIZalGIB/jIWucOgQZxBmD/PIGH0MB0dvcCglA/2tVuQn0k0T
         JNhzopDfoM4REUh1q6Cnun+1J+Z/5RmkE3VuGm7Ug0q++QUSoR7wa4miG13QpyYX+grb
         Erp2XOUQ3tC2FJNnWL/zZpaqYtMt7xr26YaV+erkTTgOGtnAqK/K6th31+aAumQUkhiX
         S2L3TiTbcCKBaRZDP87q1zNyrR13hH2bU+7hQ5WSFsMUOg+XtJp3/kGbC8Up+S1VOCCa
         6UIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134572; x=1784739372;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6nnvVJiFQQaLxlKEaOiAKRWl9WrJpxkHSZHxL5UxXc=;
        b=ldzitsD8AKBWQVNTG/CmSL/gYDD7VY9VSsxDp7uIaxZ8us49IsLhiWkxnwZrEHcjOu
         QdR0AIL2J7YEDy44TwKb5xpVGJPMX0lxMMYZpWfSuB7+mOotDNbJItkN4+Rt/J1UJ0II
         7tqam3YwbrUv7e48n9iq46ZZJMaUV00APWjtHcw68t/ZFWGVqSib0dlKq62X6b71l8r3
         MDtsGCn24p+6EnkMNju+jq5F8uwwBhmjS++4uUx0eFrf+HWr3YLCTLvyh5mFl4x+5JRp
         bnhUUYZlfn5nTyx4OmqnHuN+rvvNTABdYtiIM7+LzVQYAM9Gh12KEh8iSmezOAajpgKM
         6mMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrp2hT8NGFFk56cAEkyw1lWCQIVV9TinwhKEe1C0bn5nvm1LWz9bNFdQRRIrvyLnplWnVbu3RjiZxO5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw31Tgr7h90KPka+XlLR9kW4e+rklf68eql5HLbQM5NxoAQYAIv
	zubA32fyro2zvyAbIIn8J+8ARJ/iRxteJMAcUy15+lOJmIMUTPCiPXTKW1i7oil/hsM=
X-Gm-Gg: AfdE7clVasoR/Cq7/D8D70ywciJ3XQLaL4jH6EZKqAnNjwkYm1VTjnNgY+E1e5tfNo6
	p8y939xWoUwNzGtZ3zJ+VDuKr/Q+Y8bCCaP84nXOvYe8gv6nBpsKhx7+MUtN4em4qqmHCd4bmfd
	8DGFdXWRK/9Dw5uQzO9kfZsU/Pzipg7lco78gGt4LyKC1P1HMoZm72UWVEYSIyugjtO2b6RZz2E
	Q73ciUqHWwAgrH09jL9wXCL0IPiGeeKCsJbmVt5uEXpzdJgl1hP04hbXktnDWVf8oQH4ejbG49p
	v10LwF43tW4QHdAdDtA9JzHPodGCUZ+ePyhjUJUv1naP6ymrHjiPZ6Je8TPviEcg5ErAjtCrULu
	7herLxGifVjTTlo4QX0YRb2q4XlKWU8J7cnj3cymYq2RzEcJsaWy5CpGr1UOB3d4CemMHdQVK7N
	2AMnN4sE7fGgcvTRtYtHXEkSus9m7GU0hWTN3cfRaigDyvAPj+tMIR0BkYkhNcYmUlC2ZrWo4Fz
	rA=
X-Received: by 2002:a05:600c:548a:b0:493:e2c3:af25 with SMTP id 5b1f17b1804b1-49540cefbe3mr2188615e9.12.1784134572404;
        Wed, 15 Jul 2026 09:56:12 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4953c5a4c0csm46958435e9.0.2026.07.15.09.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/21] gpio: Add missing ACPI module annotations
Date: Wed, 15 Jul 2026 18:55:12 +0200
Message-ID:  <777d5c353ff9ceb2fd6fcda11082a21637af5eef.1784133987.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=376ZZD+wPhduikubZ0bZXKk01b1uwRuv+srymK/ZiA4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7t750Z0iXa6s8cHZ/Ct7+vPBJHvPxLqDqki6 B5iNdPeYFGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7ewAKCRCPgPtYfRL+ Tp/QB/94ifld/AV1f/z7vmvP3pH1Sg1LjtmCDhzMaWhRQXS6zrxy2zfPOWKbuDn/0VUP244GxPL AYJkP6kSAP/GKEoTx3bMyeH7NojSXdjQ3eV2GoXavBRzmNiV8JKogYskvE2bWkT1u8JPpz9z/VY mRD3kyeo7vw1p2RizVXVb5GHvvThY71e3C5o9V6XDvtVHNcqTlonKAt8ONX2Pcmzk51V9pyShDk zntAabHHE+qS/sBd9PghS/kFR80eYcSpTVEQaWehLe6/53TK9K2FSXCNamrWAWa2PTD4H7mEq4/ Yf41VoUZmWSjCt2Fva3KXC6+ul0Ou4a6sKrbk6GIVaZfbhaR
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using an ACPI device id table is
supposed to declare that in the module's metadata. Add this information
for two drivers that failed to declare these.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-usbio.c | 1 +
 drivers/gpio/gpio-xgene.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
index 489c8ac6299e..614523d461fe 100644
--- a/drivers/gpio/gpio-usbio.c
+++ b/drivers/gpio/gpio-usbio.c
@@ -34,6 +34,7 @@ static const struct acpi_device_id usbio_gpio_acpi_hids[] = {
 	{ "INTC1116" }, /* NVL */
 	{ }
 };
+MODULE_DEVICE_TABLE(acpi, usbio_gpio_acpi_hids);
 
 static void usbio_gpio_get_bank_and_pin(struct gpio_chip *gc, unsigned int offset,
 					struct usbio_gpio_bank **bank_ret,
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
2.55.0.11.g153666a7d9bb

