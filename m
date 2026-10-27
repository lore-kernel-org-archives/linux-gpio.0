Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098250;
	b=04bkLqBeSFbg4jnBzQSrlD5E36+2ScBKkRhbJwcdFU81u/zjdHzp8/9k3yCmwQx+imx3
	 ZPTCp5MEeh7v43fZb31ydeslPLUwD0w/OCvbkVPa8YtwkUeCRWNFh0Fx6O5EbAzPrWb1d
	 AncFHoAax0nIj0Orwm9E66A7yUkgwTisvXemX/xnF2Yr7x4qpkg+Vn/wiOe2ta/qK1ODp
	 u0GvfAWYQOXB6pzAIQL7zE2EPwExRR2ZGLpX7Cp/5nW67nXG38LfaoTI8R3XfGaVBcQWL
	 H2ID0uX3bUGVaXFL9LU+MB+hP0QOtnum2kD/UjngAlDJfGVV2GrlnFgb6DfK6TZ2Zdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
	b=Usww8jCmEmTjsw/YpFbLVmCcknDNNBk7nqU2Crf0SpnSqYJdX9YoQnAm46hyAghfHAdN
	 7tfOopVmIMyIxHUuFEw4NUxvvd5L3V1nsy7Nfmb89s/PapGYG0JP8IZ0shKec3eSLUg6i
	 GfqDuvAVqcmTyGvf4V1XNzGWKhBQpGpbR+anbOaw34cRHbolAFtbmp5AsX48hXIWU+AmJ
	 VB7ZBsgDvkWVOrbqtREvLURGY0VRh97vsGtgt0CgQCpJe+M5VlqCLhGS89NrmWaj+yawe
	 6wkquUBAS14h+FM2ZPKbts6qd7gHN4e+cDibQuidCORUm/SURh/NkCrubn7QY0JU8rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ds7Hggy1;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD068606ADF5
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD068606ADF5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ds7Hggy1
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so22297025e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098248; x=1793703048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
        b=ds7Hggy1g7y2Jsxb88pE/u2fCtID/rsa8ZSv+O0xeHxBL3PZc8FpU1cGpfCmWckcJ7
         KrPJEHYcgSiD+U8fEu/GS7OkhjQwIu5dZJUL2JXOf/6pvBGXzbdXiVE8JMdRvHWF4caf
         X3ITPxH+W4bXXb0KThumJCSvMzH35CfokJ1E5m1csTM0+XY6TrddJDbaAWuGkJ/u+KOR
         UBtIHWYoAEFjmmX4LCY1R/2T+nluHCZuW2S0JsRxKURlgrxbG/ea+t8WAQpx7nWjjuK3
         31+4rJfMhsPy8J9Qhy+09uP4YiFqn4dvmQjkD9v6H1tkI+WLSx8Xm5er5j0sYU12Mdsf
         Uu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098248; x=1793703048;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
        b=ss6nVsaTG6xCATWYWL5W8X4y8hb1+yQoS9sjSSsT7JjCRmTM9IT06bPkoBF5hOh8qf
         WvoVh8jgIHQ02n7uNms1/4pFs69m9E3JBcoi8jgEWO1qg3TouZrTTZ7Yu4JZnkVsa3/0
         vpdDADHpu+Py2ja+vTm/Rm0tLOyNIwZKP6DUXU0W6lwFljSi6llR69GPsRCwWqVIFFB8
         zZaWp4/8M/l1nQNAlYvXCqdtuhuBRocRrCpzpHoEILSI/3Q4DcVPkqWNpFINquXRSk67
         iJgvYcD1vPKD7IaksqYG1XgS5OPgSZC0kLcMTnuMGa3cPkZLPTOIQxZ2Pkm6YgUtqDaM
         eeeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNLlqt7xNBgAVTpnyJvPQJD5GeCVQ8oGg0wzw6XxY5bi5u4dDC0c2y0WkVoa6mC94JoerxnCvdG64+@vger.kernel.org
X-Gm-Message-State: AFq9FYII85C8VC8yeWFTT35dLoBkCAZMoi/nxOCGo9A3JQ5lfobyzyHL
	F0Mk6mVeB+UeqYOChSdU17Iv10GrbbGFQlC72cvPe3cXGzS1EnM65ewkJfDDZ2ogqDU=
X-Gm-Gg: AYBFou0CeWEgZvdJDVN7/p9UBY0tU08lQxuhI0L+elGrDQ03Y/XGeO+Aif12T8bFApt
	wFj+uPkKH9w9ozp+XIs8kPKTqhmmjVmlUJaJAg2uBR2bKH1T6tBWKBEGTlmC8MbQSOTbIG9NdzO
	LlZSqn3kaknn3JFAqm+KGsZkpi84scLpHHlsgHbXt2DuFeMmU6kplsUIe2TeRw6Y16GOvn8Hfhj
	IOBzCerbKDR/CVZWcM4N3hJeN1t3zWXZlyD1va/JZq1z0pSWpBBo9+JtvSRnpsJJcYr4XMXu7GV
	SpXdrOAeDtXcAZOhCFY2IM9/9445QRulC0rhVt7Ld29ahiR+o11FO70Md9pLsd2x6CZZ5kHjO31
	Ehr+jGmIMktibV5hwc8bwJvjmMZ5P9ZHfrOpgD3koZdcrLy+ELJ1aCVymtdZdhldA9NC0tdKGj8
	3VvmJFxPbraPPJGqVyi4TMVoo8fdTsmok9YKAa0ULq3GkxkrUlqClLoMuULZYhFX2lvEwSfzTpK
	O6AokQzs14gsQpEk00q4NhuyTDm+8XcdmG7+FY5rBkcT6QGUdTr14be1OQ7FfKc1YxNGV8fNwEP
	4Jes6Hu6xMMILsf8KP1xdIlcmpOZ8him3BZ+Jy29NFoufeTfGscjNDvK4+LAdkLdXQl0hIFQ3Zv
	eD9WJZg/HhE1L60NE
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr177092795e9.22.1793098248233;
        Tue, 27 Oct 2026 03:50:48 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a359fbb725sm257775775e9.0.2026.10.27.03.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	"Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v4 17/23] gpio: virtio: Use a named initializer for virtio_device_id array
Date: Tue, 27 Oct 2026 11:48:54 +0100
Message-ID:  <0ff54324a8cdb1f036bd01f05dfaff75512d8abe.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=HvLKZnIb7RtprxLD/D+7QxSMDdlX02hi9zaVYI1agxw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHL55n0O6CbSHLAYjy/VwqEdsY+cZcVZlvXU /YSi3wb+H6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBywAKCRCPgPtYfRL+ TtSNB/47f7idwujRUL62MyxZqdila+JxQe2sFy21p90zLDAWqeOh9phY6aVPSFuI3cCtJl9FIHm yXmV+NgiGxVGPbGmjtaVlNt7TvwxrKKD4DykEceu4+LgcW1qWY6KJwSVK/4pve14di0ygt8dTzv k8kToE94nDb1GWFWy8HbKhbgWVNYP21R6r7C/q+ZTrWiJtzXIW7qBg2eMpqsuQE5Ak5FAf1zgGg Dv1jyW+oJVVwfR6XK0/Ch4mhQlvqOQoEEccJ5mShNSO3wnh07Z0eu+IvJtIytag85I2oKnNtp/X pln5RT1N5amHzixg5WZB7cLEQJCDiRy392STmwpWppui45f7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled array, only its representation in
source form benefits.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ed6e0e90fa8a..42871db05ec1 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -646,7 +646,7 @@ static void virtio_gpio_remove(struct virtio_device *vdev)
 }
 
 static const struct virtio_device_id id_table[] = {
-	{ VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
+	{ .device = VIRTIO_ID_GPIO, .vendor = VIRTIO_DEV_ANY_ID },
 	{},
 };
 MODULE_DEVICE_TABLE(virtio, id_table);
-- 
2.56.0.rc1

