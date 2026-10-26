Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032210;
	b=n975A8TFLt2nqA5Z/Nvt2qU3Jex5EubHaYwsee+rzHYCtvAB0vJUqeC+TXM//cXPrAxN
	 o/WbSZlTA66FhNB91hCRXgqrfE/jcQn55nvKitGkp+Vn9C2nX1iyz4p3BUxIJvKfcuNPw
	 qs+gxa5D2VWkxXsp4JKJ9zrO5A6oJDxO4+SCWz6Pc6d1mFd/dhefAqIPlf4lRKdXy8i1d
	 JjDrimYMVejEcrX1yCZsnum51GSnub+2KuViqml620pZwLvyojhMtyk83yFqrrAjmdJYB
	 +mJCS/kpsZSzmDf5Rvctr6xOYCY/+Z8MOf8ZgG5P+FbGui5y5Wp7zDsp6ypOQeeOExA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=tsrGFIGUSYgIS9WAku3WtyuWXYZnqWS0fWPP6Qel7w0=;
	b=kRAX21yQvn87bc2ZupjmETvpZaArfH3cfhHJSaiyvn4+n/os9BrSxDicIru7MFgwPueL
	 uXY+5HW4SvfIWYBfKFDvt9YQtLH+yJk5cC+xR+rXWB2Ki/TFbsZSqK8/vzR5Lvvppe9xK
	 bFpyLKFXa9KeL5p4j/hSxIV6M5IQoER0vrz8XJoQcCetZMnDoiSo7bOt5iu05mu/KT2MT
	 z7YDJ5VHx9tWB+AR9toxHtLkUm/LNsxYpfrcDNEBDuUEXCZ9L8b5TVW/2OTugA3wfniqN
	 w4Yeo4+qESaXsRogAN3ispJKfNkWAWtEHtoUFDqvyHjRykIu91MHheJCes8vYTy+8xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E6sJHw1t;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C94606B7E1
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44C94606B7E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E6sJHw1t
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so30777495e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032209; x=1793637009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsrGFIGUSYgIS9WAku3WtyuWXYZnqWS0fWPP6Qel7w0=;
        b=E6sJHw1tBAsvqO2OPAaOZ4zRxGEFNrhfyRV4UccY4DCqYTK/5vp/KF2Rpd6y1TRL32
         bnC0N3vzhCResvG/ZLiSkstkZhscHtSirKCGrCS0ufltDjZ/zPoqjBJWcxkzYwvmFr+Z
         pwjDRm8v8olP5UfOq95yGIp8t4TuUaNHn9RpbKwkJutYyDmRuBXOyC9Neq8rHil/959a
         0vgZQky+REuacnRiAlhf1MZiaJpJTwhKR7Gqx5nT2gtBGtzLvfrU/csmKXgMlQ+cMwu4
         g3Ur75ApltXx8OVZ18lA+PlQzFF2cgfHHtyaFGuYvysKoRL5Bk4/ImIY2A4ZbMHaAgA4
         bdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032209; x=1793637009;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsrGFIGUSYgIS9WAku3WtyuWXYZnqWS0fWPP6Qel7w0=;
        b=WJOzKk0prsH/mA7c+cXguQ0cJaEU8clAZDgvj8wJlWtIQOvRsAjFD9bR0cxEmLe67j
         Tk9dcaIxZQtKK2zdd8gslS/Sg9qv8I2rtbIJQnZQcqouqYKj0XybwjGImxBN5wrajClK
         FiBWNGP4blgOj/55trKVWkHUGsafA3kFsRaWLnDCNbG+lVWwoIlG4SQMvuv+py+hns06
         pL9TXD6hdwe5yGnZYcAphoDF96tXSr8lfa3DCpOVoy7p6pcaprPJg0V3yM4/JZnL2oSP
         z+cE80F37r97Y6ST0vjupla3SFRqDlv/1UKdhWTMRt0QYBDt79nHopgsZb+mcFEAsQd9
         PqEA==
X-Forwarded-Encrypted: i=1; AKwUvBwj+ShT/NNC6XerkP4h+mzM1H6FY2kem2SSlHHMwPx362iUmnMBerw86iJSZaua/LWgJZsUTNLCEbCb@vger.kernel.org
X-Gm-Message-State: AFq9FYIipYH84SZL0RYrgCozHQsMoCklAbViGs7ZdK0tP+XDNbsYEBpN
	p3qTIpcOxurrNfRDex4B48qiJF9RAg0NWR7kcDPtpHAsGfB4xHDjGsJ+QxmLA/npoOg=
X-Gm-Gg: AYBFou1Wi4oommm33kiLv+YaSB53T5LEn0wsA5T8s9UzIT0aOj31ReOlEo4SQjEVFLP
	TWa4Qj9pCtR1VfpcFfExnvswSXYMKJRUKaZDwnC8ZZ9qMvjWQKCMCj+VMAdtlVwGVm2jA1Djz9C
	zuirZLdJmyL/vxp3/WCg0Gep+OYZRlofyZQ5FW7mYfsPxB5dKXi9ZuRcqiLvk7Ao4INFS7RsLv2
	I4LPRaBym80l1ossQBhGOpL2NG7YQiuVztEq5ZPJpOUKwvUyJtc5LTRpam9yaXNi2FEqueFPjsY
	WDs/oxpTBMHKs9IGSLCgby07+oMJQRii+cgRdp6GGGe4Loh213vUuahnm2yzXK7WLU/jK0rlKrD
	v+ft7Gy2uAtn3CA62m20flxFqVaD9reo7LkVSrdKzmAtloIt7/YnXCcs0C0o/bN4M0dUriah/vA
	D85IfXaRVyyDCeJS8f4OzhFuxa8l2dZ4YcBwnwj0lCyZyNQsz3Ip3oSA7/aotSNIocRyYu5KrV/
	h+vez+UDGyD2iFinjvSecieCH68OvdfrW+thDqBlS6XTsJNKqvQerU2TWXGv9rsk0m9q2AJOWZU
	u5yywW8Nk3g9WTIReS54z6zE8pT7UiGtdJ76WtIMXUPC0VnrGMLB8WyvQilFdeqX
X-Received: by 2002:a05:600c:6384:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a35ac3acb7mr134780025e9.3.1793032208691;
        Mon, 26 Oct 2026 09:30:08 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecdfb8esm17396493f8f.54.2026.10.26.09.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:30:08 -0700 (PDT)
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
Subject: [PATCH v3 22/22] gpio: Unify style of various *_device_id arrays
Date: Mon, 26 Oct 2026 17:28:33 +0100
Message-ID:  <7a3aad753cd5bebe6dd3f05d72edff398920d1f6.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3362; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=j/C3qYFYRthO80RC2ruW66dF5Huy3Fq9N8YWUVYu5G4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/c0ojVyzZ+u43M0bI2sq6g/5XGn+69FfExb 6JR29ElxDKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/3AAKCRCPgPtYfRL+ Tu3mCACkeeZltd8ipKxsWv88vZPp7a51zX9A/QuTuoijhYbibnTnLrZgZA76jfu63MGJaQJGlqO RZ784GJXMxzbqjs80BfJAWadFOuUNepVzzvkgn3Y+A278UUH9Vsh3Mlb2YhbI7SHJQ3YleBzjj3 0BmtkMk6cPK3D+LwmR74MSGw0vDvjW0UzNI3hbPpG58wgMHfoHv3nny+SevlCB36OXOJ5BbzS+7 OMdumhFuzEkiijn3dxQybyFAvc5crrWIPu8XZmk9XvSGj3b2iMp0/LZ/YXGbHJqMg1xVEcbZTQ3 2HrFm6e6RZWV9HGnGroKYMqkR1OKXTuNCH+/gY3/+9skqw7X
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
 drivers/gpio/gpio-virtio.c         | 2 +-
 drivers/gpio/gpiolib-acpi-quirks.c | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index ad5dc9a3a119..d9d7394d8b95 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -473,7 +473,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
 	{ "usb_ljca.ljca-gpio" },
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

