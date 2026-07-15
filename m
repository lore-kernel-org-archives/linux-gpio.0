Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EF4496906
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134584; cv=none; b=ha1iYw4kABmC97J7OrbdpeF+5U548nm3isQ7MEc6589FUApiE2eIS1MF6fsk37kAG710ild7lX1hf342lahbZPvqM9nJbJyKPjGnE6dMSCSuBr01MVXNQb0UDIe21LGdLF3TC4tJg9ptGmjNPVfo2uEU5/ydCTs4gRAfg3xzviM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134584; c=relaxed/simple;
	bh=Cw+XLdNgXnftxuPSTDZj+51wyZZdxeif8BUFQO4Z1wM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YbaKg34XU2BMNNMM438/lf6aMuNGvONnXMO4Hj6dLjq4pJPnDv6UNtUm7lILhoaRSiPWWas4cjvebi1mwOBbCM1RfN/eRu9DkkN7SSUci54jMU3dgn6u7ijaBSulSONkcDuDEZzg+a68PifKbxMO8nw4l+a49Wt7uA1B1bAd1vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ri5TuQtf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ri5TuQtf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso40137225e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134581; x=1784739381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AO+MjM/BEQ0toQ97krU14h4AjetrPnZmMJGlqWBpdjs=;
        b=Ri5TuQtf1nBTpESqyUPNu9+eYn2urfPq0eSAr/q5XHrRUYH3jbv9/G2S7XYBNdcGsV
         S0fmt6CGVFAnFg5KoMGy5pZKTHuGn1iIqbwtpVxFs8eSY5Y8VIThYBHPKDC9fHSlMWfB
         2r4KU/IrELlaeXw2WqFJJuT9TfXsm2ZxOGfQiP89zdsmrvPbPbO5clzgsYZqbR+dQeCd
         YsmncCS4jn0UjV7sq3t2e3zGK+fl1lmGrEIueFmufC/H62Y8KnTADnb953wxWuJ00g0b
         cN0ACjljRhoAFOJSHYNaX1+/h57K1jcYqwdN+Mqc6bIOF2wSgmY+nVmDn3SCAgivvdM3
         nKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134581; x=1784739381;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AO+MjM/BEQ0toQ97krU14h4AjetrPnZmMJGlqWBpdjs=;
        b=DOsAPcMTc47FKcmuG+QpNecexI4srOcZslI7atE0rMdltm0ey+PM4F0cA8LtTNSUSB
         tvKzXLcq5sPqwQ9/r0gRMg1ettMOlLXQTDRx4mQ7tJRzD3/MvNglT9EdH3DD+UnSqPRO
         JwDivnDsXRYQBjYt8UbC1OVjknSVOLHA5ojE6ualnCRRPOK7pe5ZdgupB5iYQ8BN6swc
         wSBrxzJI3AxGddsGUceipC/LZADqq2nGLRjNOydAsrWJW4NFZGazxB3oqNuM+vChDa3L
         56v30PXq8Z8EEU/CRiRslg1CuOFfTmcKVRDwr6dNNxvKiKJpr+v+tcpeE92nSriAsg09
         Bs6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoIvHQa0CGYhj3ajrdLBzMUDZ9LJsof9nNdN4W1HlGgT0rWXnAVLsholtglh8683iaQK4M6kXHoqOHJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwXstOpgqApJbXDO2YfNww0KMEV/q2AaJNKRMev7szSvHypzVQP
	bO+3rzxi7XAwmYpazVdNgme4aqFuer2DnNl7/9Fqa9gmABpxpDBPxn9uITSxsmNYYqU=
X-Gm-Gg: AfdE7cl7T7lRLWhXpOiGkZg8Rrv/H3Sl7AjZsjkeuFwuz8A0Xbp4nesGkeCZ5NG0906
	ti2b2q/Gfw8bal8tXwyAalsSdt+RzMrBXtitZ4S4C6Q0nBpJGIl/nXvjPuU+umnBxrRvH6506e7
	457/+bE4oLodTm2bUNgQVOqMrQ4QrdD6PLsuV406cdVFfZ6txwTToPYUswATXOISA/ySlYqikEe
	aMa/p+cYNgHejSFWc5bW0Oeln3ORoQ114aRyZ17pubHE9toZ8GAmBvW8KmoHXaLOumxj3iG61EG
	wWX0ufsZJrrbCd+nm0rKm8HqHbQHIabbZZPlq19yQs4/nT8ChUpLGlir9ViEWSeiQ/Jfde8aS+F
	VpIF8eV8xS//sKMs2hkvmv8+rM5W/xKD/tKnPQjIUS+3GDI+hnYYsTxLc8Zg40A7AmBFIVMxNn6
	H0QtKhM3RwiYMout0mo/x10EO58krcZ8cKXGGoDizmV2AkBUMuFOSJkExP220bpTEsiWIZg9qWQ
	YPMBDOT98tRwQ==
X-Received: by 2002:a05:600c:4f0d:b0:493:e4cd:def1 with SMTP id 5b1f17b1804b1-495158d11f7mr114531535e9.11.1784134581664;
        Wed, 15 Jul 2026 09:56:21 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a2f951asm170203015e9.14.2026.07.15.09.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v2 14/21] gpio: virtio: Use a named initializer for virtio_device_id array
Date: Wed, 15 Jul 2026 18:55:19 +0200
Message-ID:  <5de4e961aa6934a020cd8291946b3652056a04b2.1784133987.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Cw+XLdNgXnftxuPSTDZj+51wyZZdxeif8BUFQO4Z1wM=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGpXu4ug2Bw2yP055b202QWIbcCgQNl47qULDUKFxd260P5L9 IkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJqV7uLAAoJEI+A+1h9Ev5O0foIAKhT Utmm4r51n5Je7u+xT81r/SSwogmC+SvxQ2HmDykCYAeVrAlXPTxatZT+/dE7vB3qFp2fk66rAcs XzStO8hgAI6e+gQODI40dkCvE9iTqS3xv7YbWT84LPFCzZvVe86ia0+ttLXtHJgB1HQENFJ+CLO KZQ7qbDXWBhw7pod/A0efCglGZUL2xTdh6UwpFUzCDeM2qZkjv8c5BuvopnR1yf9f7PBj0RUEFB b4nBZoKnNIfvDgSzvQtfdHM+V1AxEyJR1mtYVwQfGPRSacnBP8KvWxVOWqbpfeHZzK5pJKWXAeJ E/0HnupDtVLuN5tXUAEAEQsjZLDTwt6ycNIwm+I=
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
2.55.0.11.g153666a7d9bb

