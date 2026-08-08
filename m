Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9903C3438
	for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2026 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786161550; cv=none; b=jisthOFOk9SVS1MmRdRkuCDhBPGuhWe4JLxyftL7kAM7xA+OlymXV/2suZ8nXA6ep8jTK5mEbnASgpAarEsDEnwIOYjUtCWu3Cc1jQFtQl5j9UqSDGyRCrTm+Kg6JISa8aBqf/n4WS4SCpL0TKrB5c388SZShC5lw35dEW029rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786161550; c=relaxed/simple;
	bh=ALPm4wN0XxL4MAFfiFBimkAb2s7JRwqMzky26VfX7JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIdvrKVUSIv2fUWfIApSafa3EE/sjS2j3sm8+9W0CdIduawMd02GEafiP/aNi8oLcXuUfZOLDilISnCUpjEz8qd/z48pLrt2MpWYc11aNndkGluqP/u0Dj/XODCDQZDa4SIQ1IO3Hm5lvkzArlhq1i+OkC5e1hceb4NjgbGP+XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVhbSvW3; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVhbSvW3"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c276bfce7eso192520e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 20:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786161547; x=1786766347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Z33c2/VIdQJHXYt//EgpTsqkZyaHvNkSYBF+LRNUwo=;
        b=VVhbSvW33O2Q7jd0o1t2l73Y/OFOskS8IYccyEO6ANNqlqmNv6RxnR93kXC8Rrv+n5
         k9XgSQqlo/NAh1Z/2Qt1pr5px1c+Wwa5fSBsad93nyXw5g3pkBlVxQ+IJDAf0X1IBnC8
         x+jOsk/JfO/sE2Awzo7vfPUT96QvWy1f9jjVZ1tqVV30Z19jshHRwPtK+29jSx2wQ1i9
         aC3wMW0IVLss6icIJ77cFANq/w4S4MTvE4t/JHlZk7I5AAHd5Df3ix16mD/Uqwo3DMMp
         cZLQRdSGwYLDmupGnoQPmWF/dQrKlaIEYBj9aZVhmGKDbttjWwx9lycV4UXmU2eI1BnU
         pgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786161547; x=1786766347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Z33c2/VIdQJHXYt//EgpTsqkZyaHvNkSYBF+LRNUwo=;
        b=Fi3LJq+xffePKFR/dXMBgTc10qqVwZvpWIKhtjHzdgTeniBDhGQX5OGipJh7lOJzso
         M25IckwzupFkw8N0FGjbAvuG+28P8dE2WjAu9BoAH9WF0g6Odt2CNRVrM0QmoRCbYXdB
         /XUpSgZeL6Le6z14v/RdDtZL/SF6YtIAG8bQHCJOaxMgh2Sb0uv6/RxrmnqMVxDL2qh8
         kh5PhRs/GgpiDKlxAxabHds2gs/OFSXs+9Ju47Io3PddbO7hl/HhepDxZBYqCgVR9/3R
         aSjbfQeKEMS4MDT7jZX3jYluQrxcJU+fDw4EifmHnYbYAda0h650+zvjHwWOUkqcUNjO
         laPA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0yC2TpsFpsUca6yGrqH/UqMiC1IMlPMnUzh5ivUcwN3FsHZ4e9zrqMR3AOaTetiP3QUV10Sywtpkk@vger.kernel.org
X-Gm-Message-State: AOJu0YzrUWU0sqpz5zYtwh7J/N2V7uKogTonFe22Y4w5f4B3V5rLDCGV
	K0PD/zHKo0BIwDqyx3cPEAzvDdaZdQiM83qKpRc48uBpWW1wnYwlp9iK
X-Gm-Gg: AR+sD11QrbYc5bjx/Q36yIeHxzrblUFzbn+e4+HL9gCKtEPCytKNTfLibwYqU8vcgM4
	tvM7SukMYtEmIF8ELcNUvMNom+luz/MDTbVn1Wjq0wA2gAVfqMs7Bt2eYUMgxVAZU5zwhT6Rmi2
	/2t5TBytvxsSqDcr9UG5z3Z8dWXP8uWb7VaLoRdafEejjt0cU3uU60O1+pRo4lTD/PUbb2wrWt5
	OyswwV0xUfOvE5cy9ZiTfeN3YDeV0PP7zCbHKNcQ5lnloAQeXAk/a/C9OLguAe1iYG5H1YEd/HC
	ruKzqF/I0dGRAGOqTakDWdszr/+bG4t1l57H9QYsa3sedWiIL2HlR5KN648ZHY/aHLysoiqs9Rz
	2H23NovnQj5iOWMy3g+kXsTabcAEphNdOUbba7rFjKjB+2ri5U+hi6105sbGRjUZslsikwKaaSk
	GBC3g/2x92YIfVpfHdJK7yizo3VRBG5Qm3yV66x5sq+sddvy2I5AaPn56+EOKS
X-Received: by 2002:a05:6122:e142:b0:5bf:bb2c:1328 with SMTP id 71dfb90a1353d-5c3d9068a9emr4114304e0c.3.1786161547188;
        Fri, 07 Aug 2026 20:59:07 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b212fa6sm1432936e0c.16.2026.08.07.20.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 20:59:06 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 07 Aug 2026 22:58:31 -0500
Subject: [PATCH v3 9/9] iio: adc: ti-ads1262: support common mode supplies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-ads126x-v3-9-f89925d72792@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=ALPm4wN0XxL4MAFfiFBimkAb2s7JRwqMzky26VfX7JM=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFllKyv+Bi7cp7Z2Ws4kW07VnctsRJW3+IbVM4j9nBazW
 Ei6USeqo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACbivJuRYeWM5Y9b32dbyz5U
 835veax3o2ybb8nmVZWsf16svJQk9JeRYbXY1eC4ZllZh1OuHVLKgq8MKmM/688WLC+r3/Yjsia
 RHQA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Enable common mode regulators. The usual configuration is to have our
own 'vbias' regulator connected internally as common mode voltage on the
AINCOM pin.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 533574169b04..238d803abc50 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -962,6 +962,27 @@ static irqreturn_t ads1262_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int ads1262_common_mode_setup(struct ads1262 *st)
+{
+	struct device *dev = &st->spi->dev;
+	char name[sizeof("aincom")];
+	int ret;
+
+	for (unsigned int i = 0; i <= ADS1262_INPMUX_AINCOM; i++) {
+		if (i < ADS1262_INPMUX_AINCOM)
+			scnprintf(name, sizeof(name), "ain%u", i);
+		else
+			scnprintf(name, sizeof(name), "aincom");
+
+		ret = devm_regulator_get_enable_optional(dev, name);
+		if (ret < 0 && ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to get common mode supply: %s\n", name);
+	}
+
+	return 0;
+}
+
 static int ads1262_regulator_enable(struct regulator_dev *rdev)
 {
 	struct ads1262 *st = rdev_get_drvdata(rdev);
@@ -1797,6 +1818,10 @@ static int ads1262_spi_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	ret = ads1262_common_mode_setup(st);
+	if (ret)
+		return ret;
+
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
 					      iio_pollfunc_store_time,
 					      ads1262_trigger_handler,

-- 
2.55.0

