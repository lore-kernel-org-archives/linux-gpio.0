Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52764A1DF6
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 23:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588384; cv=none; b=sB/8sEeVWGyPj9ilXZwROZZ5Qf3KkLtXuBQ94nQRj3iw34VNI1A6DvAsYq1xqDsBeYNSlcDzSkL44YzUkbXqNnO6/BnoED36zsptNKSB2znEjB60AgH2OmujmcPJyYmivneVjhfTWpokyGNPhQMX6u62soyGvRpOojv+1CT4QJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588384; c=relaxed/simple;
	bh=WFd9jJvOYhnFs69EPN+PhV/5VwtF+EAWlaca/YgDNmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ItoIH3h+9gVWZCOPVrDxZGE1NWvXP0D+Vm1zZ8jAq8Yx+5ZQSembRUxVNThQPObXsO8tn8soZ9T32RJ34GT/7ad9H6CmFsbkTiEHW26KMW3U5E/cynjoKGJ3Q+3fsKNIDJu6HMF8f2idferxWWaWy4xaMMJpf33qSBgS0cbBqOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ayZA84WV; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ayZA84WV"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6dddc514bcdso210147eaf.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 16:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791588380; x=1792193180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHdW9ItKD+OtH84RFcX1jrebyHznhkDcf4WqjLmRFCQ=;
        b=ayZA84WVKECSXL6VBaC1CFcYncyNWUm0/MMvslrFfMD0grtecZVdL1RWjue9ZNN5/d
         rZsT9UjTaxpH83ROVaVqFOp2qZRpZPX9MZg51UVa2gdXdNW5mGTVFSwRbEZ/kUu4MF9J
         ynzx8K02rNtXK8t4thh611Me47YvN4Hi/XnnpjCk6CRYCW9cpIX7szGrMrv/+SQcZ6vV
         3F08katMS5Y940zC4TfVCSN/BU5cMgMAQIX1g4bqrLL8a7r0aEwHdH1vT0rZErFCOPVU
         Dh775gxEkXQrtydSF03lnicYPln3xvzaVN3S/rHY+2ouAgIz03WT3jp4HsbrDNwhY+K2
         S92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588380; x=1792193180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHdW9ItKD+OtH84RFcX1jrebyHznhkDcf4WqjLmRFCQ=;
        b=VTBBygqL5Dh6a08HIZeZb77nRDL+ywIFCWAcY1e7jwlllS2+LxFckUr4UfMp0BLRh6
         DUVFPnG6Azk6OeHru8H6rNdSyMDDHzNdyv8S3fV92arrDjZsLlj1ZM9VvGE14Ke8Nggf
         PwGX8hyl6vq9BZrme4XEMU8X/eh4wbX5izTVNITJOYBaY7lM6vLJDZmVkdFVg5f3sSRG
         NBiztaetn04Gw9XEWOpbWti12ZKSTQmHzVYHINuBzMIz4bJp7vSdaltlfv5dk4V5t2aU
         kjHoubk8PFsF/a5P3p4Qe26k9idDdeGzC3X6trrgWCmW4GZ+K4MamM/jG/o+uv5wAGeZ
         Yc0w==
X-Forwarded-Encrypted: i=1; AKwUvBygdo8p0z59uk9MnGTpFtt+VFGWAWx7oLGVu4QBSFNTGiZTDK0T1QgHvyPc0TxszF5PZV55ZUZcUZD5@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1MKaB5039vSRBvNgLQdd/YYSJ34WqKhmhmpfMCD7uqPGbvgNI
	xZSO4f9DoDTVmdO0weMfgIatrbOseDfSI0UYM79XsxAFdYFFvZBW/kdf2UfNFeGSge4=
X-Gm-Gg: AYBFou2unhtz9eAebe5WEwfusNWP5NS2StW6FFRrx4qHiNx9Kt4b4/BR+OvBgkqKC6m
	l5pJSoemA6Fub2yjPZv9vUoJAP8D/mlJq4LJR2TTdpLNflAQi0hA48RKCYCYjF1uJYhJ+SeSF8f
	VwdaJVTJzPGkL0ikblJbmISYcAIM88K19mo7KxVmo+HSeSYpXKG8ZXuPGAT9cEyPqsPmte5P1zX
	18NXnReBBSZIa0OeGxtna/O+ZElUvkXjq3Uifa2UGDvoFxBgug9K2+DxRKuFIkAN1WS1R3UcrL8
	48NdRDo0OQnu17XetALBgT89RCxiTs+yrm1HOEoBnhdeaWmpOOEcg4V5vAeRZiorx6dNCnxSJqk
	vZ28RCPW/Oi9AedubLnXlHdEF+EAGJejvWDyRwHuEVz3dNxKhF6lv17YFghTUfIumPHtqiHi+YJ
	V8sSSmyI/yiSlTwV/LXKxYoKLld4WpFiNxezprfExsoIhmPfGHw6+lnNhtcU8xsg+yUeKYuAD4n
	6jLQ9PtZX6mJA==
X-Received: by 2002:a05:6820:200b:b0:6d8:2fe:efb4 with SMTP id 006d021491bc7-6ef08e6f2b1mr2699296eaf.8.1791588380247;
        Fri, 09 Oct 2026 16:26:20 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:29bd:56f6:5ae7:35d2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm3293817a34.11.2026.10.09.16.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:26:18 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 09 Oct 2026 18:25:51 -0500
Subject: [PATCH v2 1/2] iio: adc: ti-ads112c14: parameterize GPIO register
 field macros
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-iio-adc-ti-ads112c14-gpio-v2-1-3231a795fa63@baylibre.com>
References: <20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com>
In-Reply-To: <20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>, 
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>, 
 "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3122; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=WFd9jJvOYhnFs69EPN+PhV/5VwtF+EAWlaca/YgDNmA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqyXgKTIIdHCzNysL373TVs57yb3t7itAc+3MjG
 aFo3C2fHHWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasl4CgAKCRDCzCAB/wGP
 wOXlB/9Rsxj38x6qg7d0bN47nYBR+V+pyya3mQNQzyzlfn2eV6F/bxM8HTDooOUP7lHWqzrTyKd
 qh+It9sER3ePFED14FJxiJvtftnZfB13KypzhGmG0aW1IHnfI1Zs08i+RS3qfJmTD0fHUryii71
 B/UQwy8JnycMeI6XMica+CD/Yi1wgPDpMIuuO9++C22VuDGIavgdJHCzgELcKjJSQ70Dby8yrdl
 rK+xRNXv9U1UfUfho6EUdMPacum26ah1ynJk1ADMVIqRfnYE6zoFuP1IBLc+vrIAuFhd/iQTMFj
 TCazM4UKiH+lqqQq5GlmqUeQ2s6MxNolwAATefdYA+o9aC0L
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Replace the per-pin GPIO register field macros with parameterized ones.
This will be used in a later patch to access the fields by GPIO offset.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads112c14.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index 3c877126b0be..cbd82de03127 100644
--- a/drivers/iio/adc/ti-ads112c14.c
+++ b/drivers/iio/adc/ti-ads112c14.c
@@ -63,10 +63,7 @@
 
 #define ADS112C14_REG_STATUS_LSB			0x03
 #define   ADS112C14_STATUS_LSB_CONV_COUNT		GENMASK(7, 4)
-#define   ADS112C14_STATUS_LSB_GPIO3_DAT_IN		BIT(3)
-#define   ADS112C14_STATUS_LSB_GPIO2_DAT_IN		BIT(2)
-#define   ADS112C14_STATUS_LSB_GPIO1_DAT_IN		BIT(1)
-#define   ADS112C14_STATUS_LSB_GPIO0_DAT_IN		BIT(0)
+#define   ADS112C14_STATUS_LSB_GPIO_DAT_IN(n)		BIT(n)
 
 #define ADS112C14_REG_CONVERSION_CTRL			0x04
 #define   ADS112C14_CONVERSION_CTRL_RESET		GENMASK(7, 2)
@@ -133,10 +130,7 @@
 #define   ADS112C14_DIGITAL_CFG_CODING			BIT(1)
 
 #define ADS112C14_REG_GPIO_CFG				0x0B
-#define   ADS112C14_GPIO_CFG_GPIO3_CFG			GENMASK(7, 6)
-#define   ADS112C14_GPIO_CFG_GPIO2_CFG			GENMASK(5, 4)
-#define   ADS112C14_GPIO_CFG_GPIO1_CFG			GENMASK(3, 2)
-#define   ADS112C14_GPIO_CFG_GPIO0_CFG			GENMASK(1, 0)
+#define   ADS112C14_GPIO_CFG_GPIO_CFG(n)		(GENMASK(1, 0) << (2 * (n)))
 #define     ADS112C14_GPIO_CFG_GPIO_CFG_DISABLED	  0
 #define     ADS112C14_GPIO_CFG_GPIO_CFG_INPUT		  1
 #define     ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_PUSH_PULL  2
@@ -147,10 +141,7 @@
 #define     ADS112C14_GPIO_DATA_OUTPUT_GPIO3_SRC_DAT_OUT  0
 #define     ADS112C14_GPIO_DATA_OUTPUT_GPIO3_SRC_DRDY	  1
 #define   ADS112C14_GPIO_DATA_OUTPUT_GPIO2_SRC		BIT(6)
-#define   ADS112C14_GPIO_DATA_OUTPUT_GPIO3_DAT_OUT	BIT(3)
-#define   ADS112C14_GPIO_DATA_OUTPUT_GPIO2_DAT_OUT	BIT(2)
-#define   ADS112C14_GPIO_DATA_OUTPUT_GPIO1_DAT_OUT	BIT(1)
-#define   ADS112C14_GPIO_DATA_OUTPUT_GPIO0_DAT_OUT	BIT(0)
+#define   ADS112C14_GPIO_DATA_OUTPUT_GPIO_DAT_OUT(n)	BIT(n)
 
 #define ADS112C14_REG_IDAC_MAG_CFG			0x0D
 #define   ADS112C14_IDAC_MAG_CFG_I2MAG			GENMASK(7, 4)
@@ -2520,8 +2511,8 @@ static int ads112c14_probe(struct i2c_client *client)
 		 * order to support open drain option here.
 		 */
 		ret = regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_CFG,
-					 ADS112C14_GPIO_CFG_GPIO3_CFG,
-					 FIELD_PREP(ADS112C14_GPIO_CFG_GPIO3_CFG,
+					 ADS112C14_GPIO_CFG_GPIO_CFG(3),
+					 FIELD_PREP(ADS112C14_GPIO_CFG_GPIO_CFG(3),
 						    ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_PUSH_PULL));
 		if (ret)
 			return ret;
@@ -2556,8 +2547,8 @@ static int ads112c14_probe(struct i2c_client *client)
 
 	if (clk) {
 		ret = regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_CFG,
-					 ADS112C14_GPIO_CFG_GPIO3_CFG,
-					 FIELD_PREP(ADS112C14_GPIO_CFG_GPIO3_CFG,
+					 ADS112C14_GPIO_CFG_GPIO_CFG(3),
+					 FIELD_PREP(ADS112C14_GPIO_CFG_GPIO_CFG(3),
 						    ADS112C14_GPIO_CFG_GPIO_CFG_INPUT));
 		if (ret)
 			return ret;

-- 
2.53.0

