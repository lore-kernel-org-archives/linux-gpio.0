Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032186;
	b=GhCSAMCj4hr+G96XlsdEuxzjNGQHUEFre52A9uIBXY+MGygw/SRJv7n3DGjbTK6TsafP
	 Vm+MMzv41hDXlhG7ovqfrgntpV9Rg3ygLjKQ1KN9krnnwdYT+G561Ls/8ZXt9Mj7Jf712
	 mpoR0xkr4ZqIi7ic6hP9wDvU7kbPZP3L4OoRyolRVyg+ZoV3V9YztdnZiWLAfZipjgV21
	 COEZC5SgalHgPSxIHt59FFqbJzzoCoJ/fCRobuZRvzk7yUcQw4nw8Rg58ztlqvwWU0oR1
	 1REcmYQJVIg0dZcjxjRRDFoz+9fvI+JcJokWRhBMVF2NBUYIkk+kJ8C3LwXSK4dL0Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=mVqOMpq3Ta7/EkEuSA8a9XwsNItOYVhbbTfvvwa7Cic=;
	b=WXsH2PPsGXmK+FcL1IgaGHkcA7C5YVwpAuQQR0R/6EfTJ54jDzyKG3tbH2kPC5hbNCIK
	 tpk0P3QRXHYht8dGRZTtCMENTq3oSQEMneudXF8Gf6fwsG3yv5zec7HUOw+q0+gFyrjF2
	 Qr0YrxE0UpFR1OgOzQ4iG2bjXUaOWB0S3yNcTPY8nyN454Q1x6IjVbSWUIuNx9nvvgvgc
	 WvYI7lsgLAnP8fT1izjsw5zIwsgOvtbr3e+QN5NXIE3ZdRNnqqs6XzHf068PQZPRRfn77
	 XBGfgASIi4Bh5TeEb+T8VDgBn78M0pL0YrOsWFwpFxNZmHU1PheaAMNCodw7pF0thbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M0H1m06w;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D7A60A380A
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D7A60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M0H1m06w
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a215e64962so23822995e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032179; x=1793636979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mVqOMpq3Ta7/EkEuSA8a9XwsNItOYVhbbTfvvwa7Cic=;
        b=M0H1m06w86qx83avAUunAWljGDYrXBDGWAJqT5FWkttcbsrLbj7O9cQrcJpgE/fEmS
         jfJrrRIW32a4OPion1nYpxHFBp4iihJyR1fbH6DwYxe+eYo763pd/IUGxjkrWZ53rEPt
         87LlcVXqhrFNonv6BpmMQzQOYJrz5dfY0u6HfabCKf6j051j1AjPr6EGUgn9NOB4ezV0
         /cNP7/0TDdtXXIjj6DD8CNavz6DbKqyhSkdzWuZQQ1EUC0vDkwMRytv3SChXyRLIigVC
         EGVEwYjDvskZY3lu2C2PqLq58ZY+VBupSYPEVlMPaEQa2Oz0XBIZsSDtkKV9Wam7weLw
         DdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032179; x=1793636979;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVqOMpq3Ta7/EkEuSA8a9XwsNItOYVhbbTfvvwa7Cic=;
        b=oX88S11Oi5YJYmb432RqIr5E+doKvXezl0Ixl443EM0etZi7IR5KC4zqWw985D9NIJ
         Yp4qDXegcufrI/iHNUSf2PpkiCy8LT9rtx6xxHtASArX0L3GSktddGG9L2uK024MMCbg
         A/VzFLN5vKkuxHxQuhRoYATYP8hpn+CnMN1zrxdrkfZOmKEblu8VAMn344DGU0iLEQZ5
         Ygi2yNRhgUDUSIPsYUkxfy2IBXA+pDjL8UpBow3k09QvKhPimRXwZyaJGJ2i2Vri1sD0
         8lPsLqZEr0kP39dbr55uGNHqaubKswpvFLX7vrrqTK5f/naKcix+E+nChuhUYL2VnMD+
         N9Yw==
X-Forwarded-Encrypted: i=1; AKwUvBz1GDZulOJqJRTvVNrKh6Oa5qcTTJP7PpF5Hq8jsCG0tGD9fPqc/ydl0DApZt7CwEpJrOItUz+KdSdP@vger.kernel.org
X-Gm-Message-State: AFq9FYITlkSLkA+paeMGA2WBr/SXrmUr+64lnfsqvwNS9XrhQA9TIyNV
	DmZNj/b/tCxa+0LA2sjzKChvjL1NF/BYtBv1XNpbOsmPoaTEZ5oKBtPAhJMRYVoS0n0=
X-Gm-Gg: AYBFou116iPc0HAIbrmPkDyP4teTwluxPZYEnENLOJUplvsjFaxVdIxUttavLCfEiNU
	eII/bHLsKDrpDis64Nq4vXqK7QtXnuQO4FiLnYfwXt31XH68Bt+noAk2hr7kA3+5Yy9pZ4JuaB0
	l0fHfAKV13qtepHoG258pn0BXl4Ozz+PpXpFbAPKWcRAhRK85QVK3uKsous36gfV7qptA2jC4+z
	SeFg9DqWtCI3yiWE2q5hau+LE57RxvDOwJBq6EvmXl3ddwJNfV+zla+C578/ttFbIfWw5nu7zEF
	Ga0nj3rK4bUa1DLRAyUxeYPSxiX5bmw/Detzw0PxhCyaBFdoU9X8lTYLDo8hBof+JKmYNgkWTWx
	bUvtko7JYysF81yTYIDe0xKnj2ifKMMLfV1N9WrQct3tkO1CIMX3Fs/BqGN0uAGy+V2UyQwb9G6
	pkRN+zG5aRzcA3UODzqCiU6vz59FU+KRchWTQj+2txEsv2ykHSr+SXmKqINlR7YDrUHnmEB65EQ
	IZCCfafK5i69d3PubQjtroaXVa/0pJy5pKRPdQnVhH+sEmCkjlHyZIhAQ217LwBAA515m4xsKTY
	F1GDDWUF6lOElPhynFgDWDN1Pv29Gq7DnyhTrS0M9x1mN9yYjhLSjUFlCgX8J5fW
X-Received: by 2002:a05:600c:4688:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a35aca5a1amr130369075e9.22.1793032179209;
        Mon, 26 Oct 2026 09:29:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3932sm18572513f8f.18.2026.10.26.09.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/22] gpio: sodaville: Add missing PCI module annotations
Date: Mon, 26 Oct 2026 17:28:19 +0100
Message-ID:  <5c0a0be0cc9af836f43e6ec97d9bd0616e0f1cd1.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ruqHUCemP+4NGXs/vpESgcahf11H3mu+ndRqYcbEJvg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+wlz4Fiffhbb1mjTj99I33vPqfYXp0myaDc miD6YeG4T6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/sAAKCRCPgPtYfRL+ TiT4B/4geXkTgEd1SXkO88ts83dqRPpTmMd2OUe7+jrjna+H9U4VtbaOzYRaTtx3GeotFyL+QRB rb+GgvAKQLQWHl5PjK34oXzv7ux5uJKvLYtNjXrgalIUY2TCUIFU/qEuBr8PMdSMmMH6LyVcStb aVR1ohT9ZnvdDIp1NHI9T1X/Oq/10QT7q2/fPuu7qZsB5tCD8hyyN41IZ+fIWa81RVskDWrxioM qFhq9DPV6j7AS9NDsnJk8154EjBmnc+/R4d/YUFZnHumM9Nmo6PZLQh9INgJOn2vq6/3xSFZvkC FyZJ5w5Gdf85BWrrEeobJ+6UNCn1VN5hlqb2KPyHXCiFEAbx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using a PCI device id table is
supposed to declare that in the module's metadata. Add this information
to the sodaville driver.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-sodaville.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index e2a784df275c..950aa12815eb 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -241,6 +241,7 @@ static const struct pci_device_id sdv_gpio_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_SDV_GPIO) },
 	{ 0, },
 };
+MODULE_DEVICE_TABLE(pci, sdv_gpio_pci_ids);
 
 static struct pci_driver sdv_gpio_driver = {
 	.driver = {
-- 
2.56.0.rc1

