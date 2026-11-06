Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002439;
	b=Kf7n9Zie4XGKF84UxabNLTkjYg35bh6vn49bDNeE1T26uwIx+gA8jtchrqPm31ekmFZS
	 wDql4WdkZ+LGHcKJ/fp7QqZ48sibXjcPMIGUv39oPz/mZ0oLovmBx/uVkWBAc1LJHw/E2
	 6PLkcm5g1geZa3pstlqheZsJYAruhkR2SpLn+9K18NEBaK6yVB4o+sWtki14zOZSj5coG
	 OORgBMQOBkJagJPwBoKcgZaLI9fn9SwQs6MmYBYKQ+OjuqF5PVIolCq8Y4Y4DT5Zsm92E
	 GxoUlrwGFhZnLUoCmdrd9iAbjntFjkd89rzmff1ShlbbCToFWzQIv1jh7K2Mmi+svvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4zRIr24RMockOcBqoMHX9eYkDrHMvoR/ITcYq1Fk2Z8=;
	b=dQDtoem27ZNFQ/+6NcwkRark9xfs8ph/bEpoPuWARxVawBRWh2pLsEdrKT7WbyTMEOh+
	 MHcVcl50U9gAdmcgW7GvLp1SrM8agH2vWfQp6a4uP9PYxLj+a9/tMSMcJ1Bw6aNAzAtUj
	 MvZNL8GKL7KaCSvo0keOujhDXr8AHGwI1mZlptmaCOEhjxyxFxjOVMvyGhBsCCAm0O4Xq
	 yipRhFwFWIoBgYlblWsWXBWve/dskgCelpi5W17VwyFaHUvdHDZXbP2q/uOHAuXgZCyAe
	 WJSh6MhvgZ24sgldqYuPGuVsF+SRZdi9jPUWKOLZxW+ApgQoAHV2Ldb9Ao+bxYxkaWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MMuPfx93;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD8B606A333
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 22:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD8B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MMuPfx93
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53dda625f63so873409b6e.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 14:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794002437; x=1794607237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zRIr24RMockOcBqoMHX9eYkDrHMvoR/ITcYq1Fk2Z8=;
        b=MMuPfx93FwNTDasyWxY2ab2EUWi9tQwbpCCbtJXUsw9QamHkjYEo0FdhjSIAwfRDlf
         Aikkt/+1WewCZ8GMLccIGlRypPRQwTy2n2TP9ZpvVDaxmq3sXTgvVjw9N/yuGmK0aEas
         iqgvROfo+AYtgFYAME0n0V4PlSHR/hOaCZrYVQ8ypxR/icoAULBbmTWBHxXcit3Lo/bD
         W4jgJXXeagQtltxC/KbEwW/kp9QiXda4K6curJDy9+AIS3Zrf3gBgfINTff0JVvjqJmX
         glwj4dXyl5zZYcf0rGNgirfF+H7XkdbeEBK8ZLSQDbDfnGTzolydfmP+2026ZFcGr8RZ
         Pdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002437; x=1794607237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zRIr24RMockOcBqoMHX9eYkDrHMvoR/ITcYq1Fk2Z8=;
        b=muSlrp/ja69+MtlPv8IvkcXyovHDj00V2rEiESM9bLLmT0YSPE1ZU/cGPxls/OZ0MY
         WbkRU8UQAvWO21zAq+eAFP7vZans/I2Oc7i7+7NBkzMReaGnh+lprE2drp6pNrrKdkv5
         nsMa4/fWHmChneH3e4XkyuGyKaC5y97jyQ9mS2IJV3V3hFMoP9kumh0ltpJlxwIImHzn
         0qWDDT8LPmw7lKwBWYxOOG5T3pwt0NRiYRVAecVDvguxbPf3y/6hoHDH0mVTQOps+U/4
         jhKM71vN+a/r9p7slmqBV3ZdIpnlpEL8m/1swC8+gyjb6OQkdhskK1/gpZQ5AcBe29k5
         CnaQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6LjWnwxuUbNHdO23tcDBb5FAchE6rOf8cJPnysXnA4MzW6E8SYWUBHfPj0XgYIT/PYlPO5uQixZxK@vger.kernel.org
X-Gm-Message-State: APuU4Z+aI/eJfeYadBh5f73lsyD/IgJTz1JPucdpk40h0mSR7Cgm8BmU
	UdKh/fuV2GXrEQNNu8jKiDdnd2WOtXhDe83pij/zSzrOjPq1o4c5vKfPWs8mJWx1dOY=
X-Gm-Gg: AYBFou25793V2TgM9SkHAIwMKr5xUX109TYmjTdsyKW8VoxO0/kf0YzgLAU9XHOdScE
	SoVvwKTdK6P8lSbazG/oy6la6CIzZJNcRugLS5bbfx/6M5RUUmNuKeilYO/1GSyqjZ8ovGDk3ru
	HM07qRaCvSLGXZBh3KRTbvpWGNYciO0oO8ShorH+ojEVlDVnSk0PkCYszqJLq189wbYBswWfTz4
	N1Hn0MPCNZnh0UHUebEdPbBNepV20e6tWrPwuUenmIsrqzUqSfbc8XDEvImYzI+1tIMuBjvh6jF
	Wl0fFraJmR+tFZTuBCOd/LQfhDG4psYLpD1LM8T+SRiZMB3nbL4z4ozKhGhemqXfB88ly8GhmIU
	ceHjFALV4oPYMOkV/AiOVfheFDbu3BKv3xS1vGt10pi3XsksoMk6Vjokvrg98rYJUDdyS6XO8fF
	UFdYgZC5kezmWE07+vsSegdRLvWIvlGDD+AS/cXHWW3PyO3PS6SfTXTRUFpaDHULjTIgDOxbEM/
	dCDhyQ8pMQTGgnyH8x49uJg/FPSqcdxCI3yylo2YI8ySOtnffphTfokGWeTnhYU9KfwRrdUSAsa
	2C9WR+uW7RrPaJ/u6yYNVdaagL/V+Pd3OQ==
X-Received: by 2002:a05:6808:1a21:b0:4b9:e65b:8c2c with SMTP id 5614622812f47-567e152dcb1mr2603511b6e.26.1794002437217;
        Fri, 06 Nov 2026 14:00:37 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:ce15:58eb:7458:e922])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7f010e4sm2432116b6e.14.2026.11.06.14.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:00:35 -0800 (PST)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 06 Nov 2026 16:00:06 -0600
Subject: [PATCH v3 1/2] iio: adc: ti-ads112c14: parameterize GPIO register
 field macros
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-iio-adc-ti-ads112c14-gpio-v3-1-7578ae66ee19@baylibre.com>
References: <20261106-iio-adc-ti-ads112c14-gpio-v3-0-7578ae66ee19@baylibre.com>
In-Reply-To: <20261106-iio-adc-ti-ads112c14-gpio-v3-0-7578ae66ee19@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>, 
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>, 
 "David Lechner (TI)" <dlechner@baylibre.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3195; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=bAtnUumcuaTuT0OrX4ijsU3VvDIn8fzI9Lr9fbQwzDc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBq7k3yqxofoIHMI56e0DWccHyiSyXkKlv2HKcGB
 mh6xdiWneGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCau5N8gAKCRDCzCAB/wGP
 wOyOB/0caa18spBg4OxHINaKhalUp26+rrkIfjHSluwbgPUi9QlCrvpRwtp9475qAM/P6gDRamo
 FasNOWZfdvRHsaBtoaOfS55fsqvCYAr/w9SSV7dUsfYnNfHqe5bO6Lsa5hitxbe/cVCSj2kEvyz
 sLaiE11NPr0yvfM04Jynl8FUf5se0bViS8ryPjaUpZja1X6RNIvlgeT4yCKTXxfy2EbYmZkKEa7
 EtYtNzDWKKAkw0AFxXMtuAdS0NqLGWv16uF4YSXnSc0+DZGgnYMs1osX0xNl+DfFoCpub5AKUCP
 950pTZxPlCor3sRig4FQKVpkEJchg/Yj45D1NzjgCH1rLhvd
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Replace the per-pin GPIO register field macros with parameterized ones.
This will be used in a later patch to access the fields by GPIO offset.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/iio/adc/ti-ads112c14.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index c0374bd8d001..498893bd01bc 100644
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
@@ -2514,8 +2505,8 @@ static int ads112c14_probe(struct i2c_client *client)
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
@@ -2550,8 +2541,8 @@ static int ads112c14_probe(struct i2c_client *client)
 
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

