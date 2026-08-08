Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E53BADBD
	for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2026 03:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786161542; cv=none; b=GwH4Z2ViPK9BJ8wGkBGkU3IFbFQQB7b/VTC/BNGJzsloAsKPDnWEql/mec9BxTwy2xldRZRv99AhHEyTRdjdNKD/+lprjE29kkiIBUvlKgJtV4j+T71Lg495jxwR3sotzOD9zTjwhTihK9kShyR9AwpTabiOrvQAhZ64E1iMbB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786161542; c=relaxed/simple;
	bh=VvzU2b+Z5pKj30/fjUw7xXFFO/Jtm5Yb6ds+h+Vgx40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKF16dsyRCGoIgQfNyMi+g/NF3aEzWAuKE0/WB9y6Yp96/lqVEDsA2+ZoUSztQPV3RX8ECpoF7nVweWjnH7r8Z5KJtqiDYZn8+WF8H1HW2nwpPZ7S7q3E+AhI8OsGhzOAjypuACPDRfdmQLyMKft7FJLl3aD61AF+dfX+5douEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3Slnrdn; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3Slnrdn"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so105479e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 20:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786161540; x=1786766340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/2Cl37wCOBLY6P0gy/ZiqOf7MT5GkHf8SZj+ieZ6Us=;
        b=X3SlnrdnZ8gYCfwN007Ys6+U1kgy3Fq101Xf2uBiWiOKwnSMK5gPmi43xRKRN6xGNi
         JgunXeM+SgDa8/GgJAFU1D7e2KQJHFPe5DCIFW+bN5eulJM5hY/U0dviYJj31tHge6S2
         eqMysfWzg6TRa6PmEIbgjH//wVjTDq+Ipuckl8J3ekCKyx3l7pQA7W1+eu/GaWoNBrFm
         EVZsWydFIfTnwftg9JAFUfjHl8Og84ml6hFX+q0NSeT86g0xB3oo97fWF1wU/UCdZ+bR
         MjuI78Iz+Xi9qTZVdoMa5P1LRRzAW2ZtOGkTxksG1wMJQyYv5Jxh3gK5+9mnMq6NIUUy
         YW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786161540; x=1786766340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/2Cl37wCOBLY6P0gy/ZiqOf7MT5GkHf8SZj+ieZ6Us=;
        b=NQ1hTo/AmD8shaB50AO1ovLHjgxxJGmN61hKA3iQCq0J8PnoR3TsX6uGw607zXh1AW
         xN0BcxAlIktf1sahDexqIOssBW0uDFusKis8uRAOvpjyxutTuPamdIzI2DLgzr/izfEK
         uEdaHMApTv7i9tFXj7XCctXURMiYOLcXrCfgxOdCurrBTqgja+IuHTRH8wXs3/cst5Jz
         vMkjieHWRdiiW60S/mDWjQsgqUfHBpGPbgEDE+ZdcbJaQZPKoQLJfFFH1SLk1Z6y9Uat
         GHFnVcP0RGdulFTRHFGchBULlk1T75ADrjte/qExh02Q5xtKUKrS/ZPxlSBHnCq4VY6b
         TFXg==
X-Forwarded-Encrypted: i=1; AHgh+RrI8VaDwQAMyYW3Si+NVYvkeS9GL/i+UFFO2nBzrF4QwLDgDvoOkjFkyTDF+tqd4LYX8XXmCavfSJXT@vger.kernel.org
X-Gm-Message-State: AOJu0YzzMd/niJrM6kgpCCN9gCK3AozaxfHMP0UtTQ7pWkEO43y3G0Hp
	x8fEJfXIVb1Jy/ScG04jXBAr2eSsV6eMdIEtVFDNM4I4Uhi+BYgb5dmp
X-Gm-Gg: AR+sD119YJW3otrVLYwxSjHkcsspqc5TgtM/l6Q+pVMfDcTXdKVV8M3ZOZ7PR3ILlfN
	1AJdmb6gfdjQ+g8nqPmW8X3vLhqwvsqO+4HxzuXLwuc9yUDlrXsZvNxoOJCXsnC97KXmNA+EMGx
	4TQUm27ngZq0RM2bV0kmIozwbjgOuu3Cf6o5kfUgarjdgQ3WAUS3rDZx/d8jPeg1ihMeyljfMDF
	z3A172B18iBy8KgfIhTt6HAqTT/efjleeMwX12Tr3ot5xkTgdPIb/FWBJ4pL4isw8OOkB7DWz8L
	C3OmrzVbzPKDPCAZU8UEj8FZdQ4AbVSYfMoArP64dY5oq0DxXHkGviGtl9CwtMcDr8sGW8HnuHo
	21mX4jbg7OqPi9bOQwqsdMWgQhXM34eOITMfWQn5UqKQW1QDQWZBIVRxX8ACQAbnt8Ps9xDhE++
	8UQ3P5ym9laa7wXV4DPnA9NEUBBmI2zozKeIpexb7r7eWHSlx9bPNSFk85YEQ=
X-Received: by 2002:a05:6122:d0b:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5c4092da348mr906491e0c.3.1786161539719;
        Fri, 07 Aug 2026 20:58:59 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b212fa6sm1432936e0c.16.2026.08.07.20.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 20:58:59 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 07 Aug 2026 22:58:27 -0500
Subject: [PATCH v3 5/9] iio: adc: ti-ads1262: support input chopping
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-ads126x-v3-5-f89925d72792@gmail.com>
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
In-Reply-To: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3294; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=VvzU2b+Z5pKj30/fjUw7xXFFO/Jtm5Yb6ds+h+Vgx40=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFllKysyqn8/NFS6ZbqsfsaL4rdHZLQWxn/pfn/dvP8Au
 0tbTJVbRykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAEzER5/hn+2l2hqFlkZ3vb+T
 tUr1I9kb1u5pu6fIz8rVuzf0r5oiD8P/UlXBhHt8e5asWiD8+/Q+1y3bY5n7f098uehJppiE+YN
 gbgA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Enable per-channel input chopping via the "input-chopping" property.
As the device withholds the first conversion in chop mode, single reads
are taken in CONTINUOUS run mode with a brief start/stop pulse, as
recommended by the datasheet (Section 9.4.1.2).

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 360ce01a5871..e2659941e1af 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -210,6 +210,7 @@ struct ads1262_channel {
 	u8 ref_n;
 	bool ref_reversal;
 	bool is_resistance;
+	bool input_chop;
 	int offset;
 	int scales[6][2];
 	size_t num_scales;
@@ -374,7 +375,7 @@ static int ads1262_dev_stop(struct ads1262 *st)
 	return ret;
 }
 
-static int ads1262_dev_start_one(struct ads1262 *st)
+static int ads1262_dev_start_one(struct ads1262 *st, u8 runmode)
 {
 	int ret;
 
@@ -382,7 +383,7 @@ static int ads1262_dev_start_one(struct ads1262 *st)
 	if (ret)
 		return ret;
 
-	if (st->start_gpiod) {
+	if (runmode == ADS1262_RUNMODE_CONTINUOUS || st->start_gpiod) {
 		/*
 		 * The START pulse timing requirement is 4 clock cycles, at the
 		 * minimum clock rate this is 4 microseconds.
@@ -431,8 +432,10 @@ static int ads1262_channel_enable(struct ads1262 *st,
 	guard(mutex)(&st->xfer_lock);
 	guard(mutex)(&st->chan_lock);
 
-	val = FIELD_PREP(ADS1262_MODE0_REFREV_MASK, chan->ref_reversal);
+	val = FIELD_PREP(ADS1262_MODE0_INPUT_CHOP_MASK, chan->input_chop) |
+	      FIELD_PREP(ADS1262_MODE0_REFREV_MASK, chan->ref_reversal);
 	ret = regmap_update_bits(st->regmap, ADS1262_MODE0_REG,
+				 ADS1262_MODE0_INPUT_CHOP_MASK |
 				 ADS1262_MODE0_REFREV_MASK, val);
 	if (ret)
 		return ret;
@@ -473,13 +476,26 @@ static int ads1262_channel_read(struct iio_dev *indio_dev,
 				const struct iio_chan_spec *spec, __be32 *val)
 {
 	struct ads1262 *st = iio_priv(indio_dev);
+	struct ads1262_channel *chan = &st->channels[spec->scan_index];
+	u8 runmode;
 	int ret;
 
 	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
 	if (IIO_DEV_ACQUIRE_FAILED(claim))
 		return -EBUSY;
 
-	ret = ads1262_set_runmode(st, ADS1262_RUNMODE_PULSE);
+	/*
+	 * When a channel has chop mode or IDAC rotation mode, the first
+	 * conversion is always withheld so the datasheet suggests using the
+	 * CONTINUOUS mode and briefly starting and stopping conversions to
+	 * achieve the same effect (Section 9.4.1.2).
+	 */
+	if (chan->input_chop)
+		runmode = ADS1262_RUNMODE_CONTINUOUS;
+	else
+		runmode = ADS1262_RUNMODE_PULSE;
+
+	ret = ads1262_set_runmode(st, runmode);
 	if (ret)
 		return ret;
 
@@ -489,7 +505,7 @@ static int ads1262_channel_read(struct iio_dev *indio_dev,
 
 	reinit_completion(&st->drdy);
 
-	ret = ads1262_dev_start_one(st);
+	ret = ads1262_dev_start_one(st, runmode);
 	if (ret)
 		return ret;
 
@@ -1134,6 +1150,7 @@ static int ads1262_parse_channel_node(struct ads1262 *st,
 		}
 	}
 
+	chan->input_chop = fwnode_property_read_bool(node, "input-chopping");
 	chan->ref_reversal = fwnode_property_read_bool(node, "ti,reference-reversal");
 
 	return 0;

-- 
2.55.0

