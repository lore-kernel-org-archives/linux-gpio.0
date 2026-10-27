Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098229;
	b=MyMeSb3ra+i18HjQUDw3M6AA8v+PGUpe4i0T+Pcc0fe7q1oENTMvtluOi5n4XbDuahNj
	 BwbO01SklU1ND5jNFqJNYNraRjF5a79AUpPSSnk11MwDO+cPXxjk/T3aa6hTdBhfL5xuh
	 NMdx3571vYb0BfB813x1nU956hksxhjUKE3bpWRZNjrLXVKriRI7UUpbu2iON0PNKPh5H
	 meavO8uXaRFFw68eG5mVaheIPKtovhoK21mbfcX4+DAcAESPleyvRy2FozJ++xsipZKFM
	 Vn443yeAIxvRlbczDA+neFRIGQKZ7MrjWwYkjBhaqzBEyi7yyZ93axzHRGu+NyKWELg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
	b=lRyFHNMqrV2XQELPhWDAEBifg1fqudbg5iCLb7nkCXcU9GH86Sus9CEqeTd0ORdmItUQ
	 sSo+aqlJhvY2xsjhWkatebgHuzFXByMy9AGXjH684wHZfdP9cO9+tg4SHcJxFI0bLX2mf
	 eYWh5rgyK8+enMz7cTi1ZBPvtbnYIj5ay+xojF2m01yu85xC2nAhkSaOPdzVXDcOR3Atj
	 w0n7u5vUXenlXGdtPfYpjcVbeMFIkUXSD4vH1ndTz8d8v0nVKaLhSeDqNWZB6z3BLCyFm
	 f1FbTkiRjqRFXWDrnoD4Goj3QY8dVMBeZigvcns6sLvt3YhrnRKKpuZW+AXrmdnp6Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YyN3BPwL;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1485960A383D
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1485960A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YyN3BPwL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so25081855e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098227; x=1793703027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
        b=YyN3BPwLPIDnpZwOgz5kdD5Eo4m9O35b1LiEWq+XZefcPkgQXE6OQzsw2bzaQC3uVO
         kzpKHky/pBFIaxDuzkCN1kJtMI/VnP7uRC+60YEwgfSrbS4XweVxWAPyWn/s7RYHmDhU
         8xAi2G3F5HAi8XoA78NkAX62jSxnfz/q2SNZT/QLWjT6YBKJ/ORpstYiF1Aj8CuweatT
         zphAcBWGSVPAZIaZO34uqG+D10tixWXJD2u4oOMzlG+v8qViI8DzzdN0YI1lPCltWdSf
         j5IBJ+Qp1lGiJwtymUeWbeMsKoeGlhnhzjmPRZYu9+YEfCH+mRqPitvYf9z2y4kQ1jzS
         BuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098227; x=1793703027;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
        b=syXpVfjAijvM2OLMpS0JJOolsAI434aZe8SFUVemSXCSo9nW+erKgE17vH/3UMr6Vk
         0tkaL7eoT7QhaiSXkgEVt5T+Akcd9PaAPaoSdzR5m/bmvwMdvsSDpK4Mv92l7lyM9M8P
         h6gyLUoOd0cXzvo/d6G6f7mhMFnIwYI6ZlhXbI9CYp7IBp4OvK0zpBQzglKDOaoX0agH
         T503a0Wmv14ftUfcVlbynA0DVquURfHhymFdDkMREQ3ntHFk2rD6aFkBC+mx4Pk5BHWz
         m6N4tz1pDVUnnfwUzQWUyGmsp05Kz9T75CIF7lx2ByaSCusdYkrpWE6Iqss4eUIHSVZG
         fnIg==
X-Forwarded-Encrypted: i=1; AKwUvBzATnozCCB95BcKwdFyWSFps+TGWbHxZ++TyNA1cOVjZfqKeojdkkrDLfcVo2MqkqoG68x2uVFbLXOh@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ8nB1ZzAM/6puI6t49SudZFlEHf4eNhMsAmHlL4NqCPpvlfF9
	6HfersrGUyEkSYwvxJgOEsUlbn2I34t/qtI3kE3LM1vhaG+eIX1BWnz8AdMzpQV8JKk=
X-Gm-Gg: AYBFou2PHvGY7KxFSS6mLYffN7+3p4mh5JwvbaM7IXeFJDjTd5Yv5A48aAruUFU9CYI
	5N3PLU62g222dDsajoMU7UoB70xAT4LMLqa5gVT1tlwvIi3TJjRKoZsSQg9yW32+o2sm7SYtnG5
	G7AqaM0PZfhJjDZ3Mb+beIphkC/SBRMujegC+CZOClITQy09wOlwvvgMUaHUALQCP4y/YPUywO9
	Ib9RBBtx5TpmUv2Jeajj84XbBZ2B0GSEAV+Cz7GwpTXqHy+ypJ8b3k8jU0WOsuh8L+ilEMUIGfv
	XQ1+Ov4IdMfNkARZ/9QjqmuRnIJLMSauBjutDmQMNqjA0E7JDh3FuVu7g2ivVFeKvaKstMGeUoL
	ltjeDQKhRQtQu4ZgFSZUMpb6Mwx6RhCSqjX7mRfioP1s8ov+9g/KnS+OyjfWV5UJXp8ThcWJox1
	JeHIKeAE7jgD7AmV8riB0d7/ajGW513duhM9SSKVF3AFCKCe0oYth1iLnZE+o9AjOYgQOQdxZoT
	TkKWIOa8c7dx/EB6C1Cxg+WRIAqjS4QKBORPlF1c+W40TRx6bZ54fBzLyIQ7U31gN+LNTIC8tfE
	Vg6pVrVODV1RB3IUv5pRoTFC5o8oXdHX601egwr4Ym0=
X-Received: by 2002:a05:600c:4f55:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a35ac9a6d5mr198035115e9.8.1793098227517;
        Tue, 27 Oct 2026 03:50:27 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a046fefsm330869705e9.5.2026.10.27.03.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/23] gpio: ljca: Drop unused assignment of auxiliary_device_id driver data
Date: Tue, 27 Oct 2026 11:48:43 +0100
Message-ID:  <7cf7d80ba1211d8e0ea2c4e096eeb5c27c43a96c.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=LtmNoSs0VsyI/755R4pZVK8cbuvtZIuCZ1dOLhKQlds=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGhbmth3+Bi8+Q0mz6mgNrTNnOdttUlOVi9i WVA8IeztsmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBoQAKCRCPgPtYfRL+ TuNLCACq/sPiomnwgRSfutf+IDdCiwxR1DCnVuaORN1MZ2hAdLzfFSKwrp+GfJ8ONTtfd/nWnAs HWV0VjHOqzTZmDoH3Sx582FT+84uDk6wXh1D2mQpdQgsdk5rqruyQvDSVUHyt8VZ47YA/+P7T6o Enc5XyHbibXdxzKQJrJ1hHtF1/POuQ/Qa5YE6onIwA/DpfQmMRYaWR35sMUM86wte8F42xB7UB0 KZ4+04S2vYKexexcMJWaoTne/M5rL+U0azdwarNqd+FZcOQZK3k6tpvFTws0lIOs4nRNuVt+3ce y16QqVMfOgNMMKPydLTGVNhhsKxRTh2qSD9ZKUgbjB9eER6/
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
auxiliary_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f32d1d237795..ad5dc9a3a119 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -472,7 +472,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 }
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
-	{ "usb_ljca.ljca-gpio", 0 },
+	{ "usb_ljca.ljca-gpio" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
-- 
2.56.0.rc1

