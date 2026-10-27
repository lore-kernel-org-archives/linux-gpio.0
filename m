Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098224;
	b=IqBTVpildD+ajTX85WjhmRSetWlEOPEMZEY9Ubfo2XYeWlfaFim3Ay2Ef3nkT7q0MO47
	 8wY5TbqtuNXwJVBF2tCDPYZ3ooKJIhQalDzE8MEDgkwBKgATtGmrt2JLYr4m3hZAr9jRc
	 gR6zjdBfxmEGugH+QlNoIPftsK6sYj9YQYNhq0Ju+4AB7U8KF+knF9kZs1+P52MkkeeSO
	 q0j07s6qBNyqhsqXBBGE1u+OujIs1jhheamiUTAXTnvCXbCyVWYk6nOOYG52phnhpLdvj
	 +5y4xQspO6EfgkqLocsqwb2kqZxiknCg/uY5Our8GxAxvN87aidRb/cVPB15zKiQpTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
	b=DyCCZrQI2GtM9tuPhMMRB1X7JbOmfapMD9TrZ9RxsuKT+0ANUNX7/BdDZZcruIhKFfQF
	 tvrQSp14Am3ayeBj0p4XXP7WgtM69YvAzU0yM+s5PloHnM0sY6dmCaXO25TSwPA1e4xGG
	 WWoYCD4y5f7fwW31KYh84TiNKJ6LpCwMLklQLTbX1wSOBSf8H+VoovBmvMIwEjE+VlKdn
	 7XGa4yUoFYBAXPDhp7P4ivjy+Z748nEgt6RBeaY9hj0PosXv48cfAdJTky4LfpEfgLSI+
	 vrYkST6YE6zfuwnvi+4R3emWvh5cCE0BESRRQeNuc6uxvZcih2bo3QlXkzia2FkRTiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=L1sL4jrQ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C2660A3806
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C2660A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=L1sL4jrQ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so34510915e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098222; x=1793703022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
        b=L1sL4jrQCSvpDrIgzYRuWokv1fuGio+LEhtJHcgALSBEE9Qkl7eMJDC2oWhrsXA5Al
         7C5YO2zDQXSsM8QOw00HSkWvge2EN6PWUzFb4gh9dOtoSkCvs2QJ0I1JT9TAy7EcWaR0
         YtjSR1228QD2MoBRyUtUh7IZWK6+0jx5dMgfSKd35xmGYb3vt56BnMwHKPp+KyNXrFgT
         N5B8uvv57qjwkjHAF3tpmM2sn5Y6hl8ZPUIvdnz3jaiVCQTU+GwjduwS1jDzp6IjRoiE
         HC78VP4l0MD4bQrHHqmkpqsYYDFQ/zUlTf9fBkclPhUKfj/jazZlRq0lV4hLXsnd+L57
         RWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098222; x=1793703022;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
        b=eMItymUCX523NbzwUiE5kBgvab7AUKYgKpgI1U6a54F35Ci8NV7HcmmdNq6Hda79uI
         Bp77SI3i/z3aOMufOwm5zkPzONuhoE9/rqN6v9OLhuZSD+l5DvdHKjzfXeUfJSQTMZv4
         Q/Q13cPCnT4lVJ+i/1NnsF7VxlWtkTXjAOTF+rLfMO9A1KkkoAZ/847TC9+f6IY++W+6
         Ed6ff1rPNbJ1HhuKCEDq8db1gOwOGDaEy6AkosVEKfkHW4fa+6oX4dJWrAgZyPi76tl4
         kjAwSTdJZYbjAuHB+6SBzkUVD1ERBVyPiLH4appgWi7osEQexBqNgAZxzXgTLYMUXh9g
         c3cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlSPCTTxUk4lAB9AxdgR+bt4fAH8eLsMByS99y/UTNpKaC8P3Xu1XXABUKT3iCWVDlE4+d5UDhwmnk@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3IfxZLAc69KEydklLH0Eac2brNewNjYN+M7NoL7ty2heU98cp
	rRp7OcG1J3s06cuZfHSPu1Ch2y/pEthVcvxHjaK/ZpP2t+314168+alvNvQRzmdoz8k=
X-Gm-Gg: AYBFou03pFSgDo49fD3A4i/+BAsb1X2jyt/C4N0AnpW05EU1eWbkLVHCyb5S/7wrC4a
	ywbTK0iTPAyg64G/iy+rgQxRdwb4w9V7Gzu8SDjGs2cGZRat9KsOBb/gcOKWjj65i9tEvr8ErOT
	6SOT1naOs7RUkHKW26YBflI54Phq+tjowNu5wMrzwf2feYfWKmPL2R4XBPc3Kfp/QwK6EUGnUiG
	xhrGODTBwj+CtN465CObn8C9bva/hSsBxTgF6IZspuIUwHBKTupOTVFYmXJ6MeTSapIGE3qxEHO
	i1puEo24NnBfupq1VQpYuYsNqC9vVHJ33nAAqkWhWRoiRX+oOVB3U0zQ+cstqHCkau4Mzfk/ri+
	oXwb0DVN8yyUSDR+4L0VS8ZwfRqeEzzqoYnGSx9iut+JM6GcqMjMkpwBHthptVxI6gHg/hB5LtP
	PDkM6BhkkqUo1WI7nj5Yv07xLcw9ngJDllZgd+UW9q1xoFnS1oYJl7QRB0wQ6BmxY6DCL2f46dH
	WvTnDEwLvLGM68m2gcKriPL7D7pAeAl3cMz+dwJ58/Mnrdd/GdewEjuKs3u6YvA+GP3RiP/YKrH
	DkVWJVUjOaWPiCK5pClYKBbWtn2F5VMxzLUrl6oRiUQ=
X-Received: by 2002:a05:600c:6289:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a35ac9f52cmr174081285e9.22.1793098222491;
        Tue, 27 Oct 2026 03:50:22 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm321119085e9.4.2026.10.27.03.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/23] gpio: max7301: Drop unused assignment of spi_device_id driver data
Date: Tue, 27 Oct 2026 11:48:41 +0100
Message-ID:  <ec89e9fe1050042ffa47d0807288e243b1ec9d56.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=N1ag9qLsPodh6SZJ2X6l/iSN9O9FLF3gpdlS+1pEOA4=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGZcAhbz2c+bxZV02dIADUwaB3SNP3DTSSoh FRb3RFu1R6JATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBmQAKCRCPgPtYfRL+ ThYlB/jSo1I+wisQXf8gHX3XhGf1CXFOphDem6EfgogWfaOH2dCg3RwRQmhII8Dl2enQDfRQOT/ S/6bQMz/4B7IkppUTJhVaswt5OVHFRreXAHBh9b++TQehTNxh3gOUFKmmM0yLwFCdwsoqcDqlW4 /j13nGl3lYJmjwEDDZ7fprvHXOhq045l/+VxXHZ1/HfQBCzwwBk4KuO9rcEs5mC8t7TTAtsVc9V vRa7oeta7hjW9L3kkkUOT3ob1d318OEm8cL2BuShH91e+aYtNNWfefrBCRAym7VpL/b/wij6ZCo oJ2opwBVuYqNKoB3DFkJiPFEYC5623IWkTUhspewslcxJs0=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
spi_device_id to zero without relying on that value. Drop this unused
assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max7301.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index 11813f41d460..c8bf6a9c3de0 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -70,7 +70,7 @@ static void max7301_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id max7301_id[] = {
-	{ "max7301", 0 },
+	{ "max7301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max7301_id);
-- 
2.56.0.rc1

