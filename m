Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49AA23BD1D
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 02:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771468178; cv=none; b=PFA4ZWC2/2bjKqhBuke4W/dAvXmz6yM0OtFjknPqfjN5jGeGGc4/OgIAI0BDNNqzDxEEJyKe8AY0wBwjkGdBRWc567jaFrzlWkK2cHxpJFQbpaHfmyXkka2Nwb4qF69NVErk2/GpGyC/NGy1Cvewv5hICMjZ3RattO+1GwTGCxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771468178; c=relaxed/simple;
	bh=U85fY+I300/oFLus60isN6QH9G2vXciZReaIa9B6Y1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJBBENq79tFmUrwzm61DW7Jzfz3Gia/vh3WE658LmSA1UbvwKKUTiXVJWpHcDc8Ef4HtTqMGqVIGtIkP1fi0/BzQ1VuuNCsedtdMkqWCfmSUCrajrBszWymq4DGuwhe7E0YvSVCSCFs/2oQttq0VDJTpge6WrfBvxvhWOoJ9dVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkuWoMtM; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkuWoMtM"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-126ea4b77adso546934c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 18:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771468177; x=1772072977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DP7f7+vHuIRyxHFGE/u5+51f2GQdsjDkgx7ouhpfqiw=;
        b=SkuWoMtMkKT50I6DZMWwuI/wpFLK5pzabM7nDwjG5Ku4xxplFaEeMM3Mv/d4hXR+19
         pqlfyvpj/h08XgByAVtMcwTXnHIIxrc5Qn2wpp5YKyNbk6l8+OYnC1pd+i2vSI40Iubk
         zynCla9cmjgWM0uU5lCAzZoLjmuyt6b0eCC3clnYyDHDUzlZMj9UzXICpxpdHjkNjN2G
         tKB14PDldLCd0w/O6iiJ98tTU9PXXMtQIBsaQ/IXs2ABZECETwvlHyOHBiBqjNzuobvO
         EoUfqn33gO2JVsMmQckcEOp6Vtj9GCVNAsnr5v4fi1t6JD8CDuttpEb8ptXu9wILqI09
         4SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771468177; x=1772072977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DP7f7+vHuIRyxHFGE/u5+51f2GQdsjDkgx7ouhpfqiw=;
        b=unfm1lvOD4LKBTuPwRhNnAtxrQ+t5uF6HjEuYobKC+USyZsKR8HcFb9JErSfO4DF9y
         uTOG9cRHFA7RT5QsiqenmYhwvIqxsKJpSxmggQjDNSVVBhILcy+ogAEw9nvMvZO7tbCf
         kvINZU7spUKthay50BP6ERAbH9sW3O+EvbNFtPOYR5b8FxmT9Mw6y/h0nWubpDe2n3GV
         XN3fTfqzT2PRSOuDvuGyfnuAYmxOl2Sp+kwe5KYju2g5B8vRV/5zCAAvMLyQTFuvsEGS
         qW8izdN7tc5IqVYedv6IOjAj9xMheTiYEDDLRV5u6tOsDPhAVQrSBfbh/Fo3kA7BdkG0
         bYAw==
X-Forwarded-Encrypted: i=1; AJvYcCVRWMxlvCs2DFbtJADbPxAoyLtxC22/pl596FQDIGHpItOx1rajAeh7DvSWIFsQnHaYF+2JXzLJ6z7C@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4xu3ZslgDxPRMdyDjmjnLXeeqi1mdlmXsfSTBwB2bEwnAyYVu
	FiKpT/24LidLvdiTqi5uWU7TZcz5BOLPb11yVGjZPRU9DiQnk1PQ/VUB
X-Gm-Gg: AZuq6aLgHZh6kmxLmti/YgoU4Wu2hSadaDC3JWsavOqO9txxctdtLCiMMnHD6Q8ggLe
	A2f6St2b8UaXUnIo0cQcN2oA8yisDDWCfd7OFBlcuiEzk7Zasz66CuSvBWqOYcrM1QXphyWGt0z
	q6kGqzAHmCiyxScVfZ1BxxKuFUNFnmYDzOBhK3etSw97Q850r+NWJw0N1fhrmCFIneMXBQL+LHn
	GpCAr7XkYYY3RLcpiCCqXV14hHftnILIWTUVJZblaVyUf2l07ukRHAn9QPifL1VxMK0F+ZkmnyJ
	xtV8L9Burd+Ub5/e6p0ebIk7EpyETqROWqKwTRGG3MxICfi/85EealneJm0h96HQgj5tYwhl0SP
	7KJHriXZo3j397iZOKIZC8/rfF/dsKJo21Hi1b4mJQb/bJrRuu3/IWRMNv4zoBcIVmYtAeGRg3w
	st5jfpZVvOuu6hcfU6ZO+3EE+iBhfWMVc3+1sON/lv08Hu6qcqic2RMqt62XJtdP6o72EruHxRi
	Q0CIo+BxoskR6Y=
X-Received: by 2002:a05:7022:6b8e:b0:119:e56c:18be with SMTP id a92af1059eb24-1273982a33bmr6911896c88.38.1771468176909;
        Wed, 18 Feb 2026 18:29:36 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm19609433eec.12.2026.02.18.18.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 18:29:36 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/4] iio: adc: ti-ads7950: normalize return value of gpio_get
Date: Wed, 18 Feb 2026 18:29:25 -0800
Message-ID: <20260219022929.3558081-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
In-Reply-To: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by ti_ads7950_get() for output
pins is normalized to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index bbe1ce577789..b8cc39fc39fb 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -433,7 +433,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 
 	/* If set as output, return the output */
 	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
-		ret = st->cmd_settings_bitmask & BIT(offset);
+		ret = (st->cmd_settings_bitmask & BIT(offset)) ? 1 : 0;
 		goto out;
 	}
 
-- 
2.53.0.335.g19a08e0c02-goog

