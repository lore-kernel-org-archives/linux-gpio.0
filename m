Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098259;
	b=K9JITe+0/qH/LavWWyOD7sBKsr2h8IjltjNSBIfoSmoYYiecMOl9n11E2R7KWZjnBqJi
	 JEL/PCgEiboqKrpoZNfg9yEUcAldxiPrWx/DjjBAnbvdUqkpj9+hVv1Xcf41WCRphBEZV
	 rBBgPrKx0jstvRNJWMcf+xTBgX5Tw5s+e+fiWsj1GXPqLAzQAHKzVwo5co+T7T98MLO/b
	 b2ssWSiS7GjeJCdnIZazlTi1VcmiqI4afZwZOmtEIghV8qYseR2OkjqUfX+E48oPqpuxq
	 FmHyetNkcLbeX7vJURiFOu8k310YZls+GCbJHMe/4DM9rAVZMnzZEfmUENtHz7e4/DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=3VOGRaFrn8fAvV/f+zy2bWNoivBt7mrtA6BqeXwgJuA=;
	b=yqEYJ7d8JPAFiXZL/yrWEigGSahj/C1i2yhVLIE/i00zWmChaW/lpL3fLErLDs0ikl9Y
	 ePiJo19MLkMAcp3IgKV0TnBf9vvqazOM5COmlddsljne9WcI5wZwjl/oBsVKlrdkQRxXT
	 ygWFs1VVuGqsIKw3nBMBKaB+/YM9EdJhoRNyAIcvR+zH1G/JEYBMKOxK2lpbaf28Dig9W
	 kparqRMVD14TU7hYL5TUs+9chE6H9YxSIWzaybJzn9xiq/hqJ59qS8Cm4tvdjBtDafkQi
	 O95hcEyhyJWXwOlbXOBXcqIYO9QO5P76vlviUceMJo3TF+3l9nFSkB9sJJw6BKoT45A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TjfZ9lHn;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E159606C261
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E159606C261
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TjfZ9lHn
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so32568995e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098258; x=1793703058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3VOGRaFrn8fAvV/f+zy2bWNoivBt7mrtA6BqeXwgJuA=;
        b=TjfZ9lHnloyGqHLYTmVTNaXFB0h5au/uSJ70eQPUBfHM6uizRwdnUqiTmMXVlJL3b5
         PhOfBtDeTrVASMCCW6PL7ZAibngede7Y33Fzx0gHerkFP6iV0VzKIYZ0JJ6OkpBJZv7A
         VDlGxfj+i9sbW+XPtLmiFXTFMS2s+QLt3w8yY9SsyfHFYzEcHcvWLg6szpcYLoZBqig4
         8Hd3IOCp+Z1LCNg6yZMyf7yXxjN8qKyQE8UZTj8HLBvgrsDL0ORJGLB9sZfcc147RYur
         TGAzWFrC+if+E1jUTgOSAN3fMFZQAMrFDVVSLvTzixMVS+RhZSz5w9wGAKrrF15hfPCt
         UEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098258; x=1793703058;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VOGRaFrn8fAvV/f+zy2bWNoivBt7mrtA6BqeXwgJuA=;
        b=h4q/XUnP6iONKtOYm4f30aqN1iTSfkqSEtaqlPHQvUjz1tkoHQ/v0AkFowUhRUqOjP
         jEF5qJ9RgeuAhiN60PXXaxqRh2J/jgk3CfCdiop8bswagTK56yyD5km4PQSpfpd5lb4U
         /s+wz9WuTcN92+N/irO6ErGkTxylfZ/3x+uRwUDZCv5CMrJ3R3vEAPIL0v82tadAF7gT
         fIMygNtsTmSjhCrdAgGmoQXcYjzBDfgfiegSZGo0iObQmF1nCJZt88+2Uwz2rwPvq94t
         ZdPgVTF6vY8W5XYEM6ZUxXx7yFM2FHCZoCd4zogLnN570aATlKPReoF7WJtoaooK+mR1
         sf/w==
X-Forwarded-Encrypted: i=1; AKwUvBxGIlpnwtc6a62NUYe3nwr91rIiV3fZLgXukGQz6GvA23ETLMIs8ptvcgI0aETYAPZhfDUaoVXpP7XC@vger.kernel.org
X-Gm-Message-State: AFq9FYI4gYPx93lldh/iws3kD2msstk7IDTCAfNPLV8yzyxxBWYG89II
	HOow/CyK4KJmbnLADsPSzHFBFU9J9XKJbnlUQX9NSsUl2BjGoNf974rJ8+s+OBLr05s=
X-Gm-Gg: AYBFou3Q+F+byEfR7SCzoKGnpzZZ/rTBKdbgs5W41LWXiuV48J//pIeaxJo/Lr6QCFQ
	dhgcLUJjZY+ovmN8bgCBrM4AkY93CSQMgg8In/3X2WgNr226ON+iyRKqvoxPva3zO6lgKIHnoFm
	RLa0hmgahyxg+J8vYHycwVMgGAh0STPeioVXYkluz9pCMaDbwCWwSDWyOSah4KHZalcpAeOkJiF
	BsnH2mi3rFyCn/AFxNfljd+/QOAsgL8tkY1MBq5FvMFdsNzX38SxJopbsnjjYwYH4d5cOp5bA/A
	4o7QFY45p58TUlBHUSfyudVjAlNARZ4ws4NuuRc0SC4nFe0X2JGUClEuqek5ZhIxLZa1RhK6XRC
	82poLY7OFiLtFL/0Gy+NmBNUK2+LUThqcuJ10udCAtgW4/jnDcWJZvjbmJvIfyVD0eR8rOY2qWJ
	XIunVTLjhFv/CXGWQJocfZty1/DmBnCkL4m6M6ZAKFjPiSws+V8WHhMgpiq9IILAcZsyqj1ylKz
	QuGuNwZkBAWF5z6YZKDrxeHZARdddYLkBeclvB2dq5JeiQAGmUvS1+z40I14qzt+zLnZ+zVvpre
	QYlffnfYKsCuJ/ge2X+zAiRIByijyLo+IHHnzutbvyj/pAj2vfevqcO3akUUeppf
X-Received: by 2002:a05:600c:3acb:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a35aca4fe1mr176894865e9.16.1793098257669;
        Tue, 27 Oct 2026 03:50:57 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a5698f1sm256311995e9.8.2026.10.27.03.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:57 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v4 23/23] gpio: Unify style of various *_device_id arrays
Date: Tue, 27 Oct 2026 11:49:00 +0100
Message-ID:  <c4102fd9781c4a79071b8a149577fa8c451e61d5.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3905; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Y+ol7RAU4xTksWVGYwhEZhB8H6C2vUrzXYy4PRBuamI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHhbaIqZR95/W9vS954qwXPTq+1LQgcynNtV agF6gmclOmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCB4QAKCRCPgPtYfRL+ TsQgB/9goajtO9UWZ46LFps8e2QfdurwGbjC8FPaELmHRAg+dxHD07Q8vEbR0RLHFrhkVx/hBkN jcaqOuwBWywOU9OjEnKnyITOL8Q+aB4MCGiTIV2CzOIrZF2WTw6ZG7u/1GY7+HvdXB0CA1lruYz WsNYYB2YuLA/2ly1jpz+SwLovuDT2iNYDFZn3VUbMkhqkeUZctLmRpO6E0SSqi4G05C5RN0fMlB p1zoxrhjseM2UJlQTGOkXIvYVpOP7nIy6Yv/TC3wVhImfTmgCq8LvIJGKVT7nBzB0CcsIb8WOSH jjewIC61gXUgzJVhzpUqexw+OK5QuFIyZs7m16NlGQdJicjd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various *_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-ljca.c           | 2 +-
 drivers/gpio/gpio-mpsse.c          | 3 +--
 drivers/gpio/gpio-pca953x.c        | 2 +-
 drivers/gpio/gpio-shared-proxy.c   | 2 +-
 drivers/gpio/gpio-virtio.c         | 2 +-
 drivers/gpio/gpiolib-acpi-quirks.c | 2 +-
 6 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f967feedb5d2..29b4e06497d9 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -473,7 +473,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
 	{ .name = "usb_ljca.ljca-gpio" },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
 
diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 61c5ca96314b..a540f6e94f11 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -80,10 +80,9 @@ static struct mpsse_quirk bryx_brik_quirk = {
 static const struct usb_device_id gpio_mpsse_table[] = {
 	{ USB_DEVICE(0x0c52, 0xa064) },   /* SeaLevel Systems, Inc. */
 	{ USB_DEVICE(0x0403, 0x6988),     /* FTDI, assigned to Bryx */
-	  .driver_info = (kernel_ulong_t)&bryx_brik_quirk},
+	  .driver_info = (kernel_ulong_t)&bryx_brik_quirk },
 	{ }                               /* Terminating entry */
 };
-
 MODULE_DEVICE_TABLE(usb, gpio_mpsse_table);
 
 static DEFINE_IDA(gpio_mpsse_ida);
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 77b447c0fea5..06f7ad0299f3 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -175,7 +175,7 @@ static const struct dmi_system_id pca953x_dmi_acpi_irq_info[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GalileoGen2"),
 		},
 	},
-	{}
+	{ }
 };
 #endif
 
diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index bc69b8729d19..b64e32a1c0a5 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -303,7 +303,7 @@ static int gpio_shared_proxy_probe(struct auxiliary_device *adev,
 
 static const struct auxiliary_device_id gpio_shared_proxy_id_table[] = {
 	{ .name = "gpiolib_shared.proxy" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, gpio_shared_proxy_id_table);
 
diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 42871db05ec1..062c70fe4671 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -647,7 +647,7 @@ static void virtio_gpio_remove(struct virtio_device *vdev)
 
 static const struct virtio_device_id id_table[] = {
 	{ .device = VIRTIO_ID_GPIO, .vendor = VIRTIO_DEV_ANY_ID },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(virtio, id_table);
 
diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index 3ab02c5f95df..77b9e34cd618 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -465,7 +465,7 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "GTCH7503:00@10",
 		},
 	},
-	{} /* Terminating entry */
+	{ } /* Terminating entry */
 };
 
 static int __init acpi_gpio_setup_params(void)
-- 
2.56.0.rc1

