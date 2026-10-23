Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768480;
	b=RRG+Qv5iQLJk0ET/8QBirhxfDg0SGlKWXstN0Jb3E732t50I5Roo8XzeXtltokit75fW
	 P+6QyNpRWfRCQXQMlmh7GfGosW1H6YJLtpaF0pZnNERy719kH7instpTJFo3PIOPBW4ya
	 TwrM2t7YbmMC0j5Yy6ObIeMY+BoKhJ3HBW4GhuLq7ozB6elv0DDNucYyy31u9ffFxUs0c
	 To0bz4Bi7c6Iafh8y/RwYkdXjugSSFtsIbHP2QRt7gcjyjRzlpLyRtvYx/HVEauNkSaS0
	 frRMiYnEtfwAfLjoOe9CORdNDx1/rhoM2D+XexUBl0AaY4FUB0I6a1E/nNen0BlNT5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8L5S1yEMn1GLRLY49CtHKitz++JkkbJAD3VmPGekKZM=;
	b=s1GEd88k1e34DdBOWYfG+FWM4tjJut+8GSU8Xg5VsRAaaxrKRegZYsp9Zzu5bGgPsWQW
	 iiwvxP5QDSsct4QF/MXGaoOVyWtSuP5mQ9lj+ARo7eEpyQ0+AHQTuLsYwDZL3VsHIkJcE
	 RbH0HnpAGx6JxJmoe/9NKiqpywbE7Aa2LluJYbZjvWkS/tWE0PY8agUAf8HB1fmdL8m08
	 NYibGY6RzSLHFiyqcCSEgX6bgixuDYH+qdEp6qoINIaYzrnjD6kaS1Ua0NwBrLttFPAoi
	 8q3OKwZGEc8Ks6ExdOAxMXwE7DKVXaTE2NAyxokie9UWKtegbBWxaPZdj14OXUpypHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kwzqg+Vp;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82E4606A31D
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 15:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82E4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kwzqg+Vp
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1327155eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768479; x=1793373279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8L5S1yEMn1GLRLY49CtHKitz++JkkbJAD3VmPGekKZM=;
        b=kwzqg+Vp+SRoKXLl8TwTxTZEG8y7zSr2f8CNZAWuWIcU/ZrPjLE0OP13pP8YwdyzdQ
         cepCKiyCJk/Mgq8BdeDMjp7uOw0Snsh42HAOcoLIH0y465q1/ZDO6PoJB5aNYZE06hqr
         Gb/RZoEbrruMA/LU6G3NaWbN6td2RG4j8hErqIgYskRaL3YCEo0mgP7YvgGWn33RUdxF
         jb2XPnmOoL7WK7a3N8t0jcNHNETSYkTcFeKL0FrU7uPhtCnJBDJJEMmhNv/tV/5n/BEF
         ilMKgiAO2ZfFO1NhbK1GfmV7T1jSBbjt/MQUbF14HgaWS1qf9NMRMc9K4HNvXyFD/5gT
         0EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768479; x=1793373279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8L5S1yEMn1GLRLY49CtHKitz++JkkbJAD3VmPGekKZM=;
        b=CyqcR4oOp9odBNmgoFv9ToSqYbZz9fgQvis6SrkcoK8rWVBrEc9MTz5UDhDD4yS1P8
         0GNotMqONyt4Ol96z0o6cn+tcPfAoVmlqltPR6wtv4WwXLB9Ex6mwizkeWbNyg7BueWH
         aNsdo1fDb4mw5RRC6vy8LypmolHuePILf+w4MiceFVHx8X+uzvmYleeyQx8k+KY8+EoC
         +GGJyvbV2CH3ZYK5k5UGYLcclFr030PkTvq4/vLeVrobcPYJrGpL+jCP7yTgBQQMZQj+
         7NEXPDPcJMnY7Zklnw8DZIYSSrc92X0e65zKQOkTYsJWaqMBtv2YFDyy82MnaoVyadhT
         Bd6w==
X-Gm-Message-State: AFq9FYIhKRvQRGbKMsXOtNJ1Sc0GWpVMZ86f9GJAkOY8i5/y0irEln1Q
	uev4TFVpH5qNnLIIGAXm3JHpo4IcKz5AO1r+zJEXnTiSYcgoL6iyBrAuzxuGfQ==
X-Gm-Gg: AYBFou1JWZUSq2KjCjZw373pQgYPtn9NpMAzZce2eKeVY9vmhHpIjAuD+7WnH3DENBZ
	B+sWYzjAd+c3oJbe+ZXV3LinahDdrU4bPTe76ylIa5ov8Weby/1WhQ4+eDyW9gpMGCbQ9dwMtM3
	k/FUPy3jB4UxKOMye97L/TmssaYjApx16/C93F19F5uh0nDB3w2udAF/XvQMq1eL6CQFBxxcfVK
	RbCzo4n3+Ces3UyFwLEvCs9z1xTJm+NeewkFUIKTnf9rRbRPhTOEa6VbYUVBX9oNzAIEc0TkIJy
	Y31WtDq5kkemu39RjE89hGm0zKvYEumPeoZBxHi04PdadJsEdhfHBeu/oWKvKkYKAsLlu6ea20k
	+6A2tCQrEzNLlCjO2NK1MmpGN2+RYnAqXQ/nRV7nesJQNQpz9npwVM1kQr992Edwd0cQke6YWYx
	RlvEcuGVXBjsHl0f//D8eG+7zQq2ZDzlDutC5c2jcJUYab/rfRZjag3lZIemLQbpmbklu13tdPa
	k2tr7KsQhAiucyL+XuP/CBGHkrK7/Q9W78QOhveJY3Z7h5N9SlD75ca8Ue7eFB9bDdDs9rdX2BP
	ooYQQNOHiTSOmOY4
X-Received: by 2002:a05:7301:77ca:b0:35c:8abb:b4ae with SMTP id 5a478bee46e88-369d97ecd90mr3030080eec.25.1792768478593;
        Fri, 23 Oct 2026 08:14:38 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e6db0d87sm483974eec.4.2026.10.23.08.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:14:38 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Liang Hao <haohlliang@gmail.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: dwapb: Use gpiolib irq_set_affinity helper
Date: Fri, 23 Oct 2026 23:11:05 +0800
Message-ID: <20261023151209.58772-3-haohlliang@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023151209.58772-1-haohlliang@gmail.com>
References: <20261023151209.58772-1-haohlliang@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wire GPIOCHIP_IRQ_AFFINITY_HELPERS into dwapb_irq_chip.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index aa7c08e60707..9e63c3ecb5b4 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -412,6 +412,7 @@ static const struct irq_chip dwapb_irq_chip = {
 	.irq_enable	= dwapb_irq_enable,
 	.irq_disable	= dwapb_irq_disable,
 	.irq_set_wake	= pm_sleep_ptr(dwapb_irq_set_wake),
+	GPIOCHIP_IRQ_AFFINITY_HELPERS,
 	.flags		= IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
-- 
2.54.0 (Apple Git-157)

