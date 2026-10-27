Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098258;
	b=DMNmd7aCJ5ue6ZfKFYVnFLUr0B7W0adRV3c9SxX+yzzEym/NGvA6g7tWUrf6JHrhXZrY
	 QVusWmCfSg5VpxuyMUIRF+fn2myfKCp7/SsuE1FtjxjfxvkG/OMUV1j8i/DBu8j4ax+bj
	 A8xqpuNKghKDrVhI3TGgPx8MhwVrTi8YHbmBom4dzBfV9T00zy+0dSqQxSavpPGydg06g
	 WmzOJ0w0oWhwsq3jixvvQEQ5f6CZ/zBTOvywHvvG5CDZXdBd9HTfVHmOtvly9V6uNCwfv
	 qrZLhjdAAcX/caQKkUI5rNL+Hmkrtdv+NF6aIyjWSBaojbe0VdWgGAUhV5XNHvCMJvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=INcGWnRRhoqTTTMkGs+NaSl2Mw/HHIWD5x7cD7yG5wc=;
	b=OD1/Wrkj7G6MnNI6NTUlVSWzAF49rPgEVpJzsexmGDlZskLcWDhAENGiCg+ZUl7BmchY
	 vd+zJXV4hGuUM+vigQtqBnCYTpPkBpTSXsXCsxTYuOgwMViJE14qAUkBrL6qaBwN4v1X9
	 k2cvJk8VTTOIrVm5RP/WgrpFqLuLRJx4bxuEj11o61hmmmv+gl50YXZdx8ZSextzrCxef
	 RTM8UrDlKDCNFYGRE+JCYB3zcVogDjgvpsnkalrvyZ6xW6aeJX3x90KYCM6qRNtauTTWy
	 dccq5KIe3XvW2cdgXHZ2oJc3dCVGAm5s5cFLrUGlP54nULUbT+feZmGzT0MDKOInNKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QhGWZJUi;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B766B606C24E
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B766B606C24E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QhGWZJUi
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so25901535e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098256; x=1793703056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=INcGWnRRhoqTTTMkGs+NaSl2Mw/HHIWD5x7cD7yG5wc=;
        b=QhGWZJUiOTInFGaWDDe/cw6qBTEktv1aWzIknPfPTKPflWDlHWZ4OYAiX8RDOSxemi
         OhNYjHau1DnvGu7rHtSYIxnNrSb0+Hr9eIWWQK0daEqsCKV/nT0DfrJmAjn3FIII8p9s
         8zJz4ifEe6k8GXUp9Tm6JQ5VOhklzX/SDHKwFnt/c3Xpt2ocRUt1oc+BGY3LlJRC2QSl
         L/O6V4um0FSVSUNkVgrTqSVpnbcKOtthAQiEhMl2WBK9Ug4H6NLYkoWOd2c+Ef7pRMRr
         p1euP6DABp7XYtvKhc64vrkssXnsWKwcbnOobTmL09WljAm9+xsxlWJYIyS38ad3DdNU
         arUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098256; x=1793703056;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INcGWnRRhoqTTTMkGs+NaSl2Mw/HHIWD5x7cD7yG5wc=;
        b=wwE4f8iknu5JHnsiFA4Qf7oZ6Oy3MNaovJS9cC76kpbFjjdFIKePm5OocL5XMMiE5n
         TlNjOMcmZPKuqOS1ytkxox+dpP9T4ONvF32nU4MvoXaaAk9RblgAHBHf/fU9CKhtMlUI
         OfjyB1coN78PGwrth/hBHvhUj9MDwL2PsROvjrjiZONGrybZYYKDJhe8L6DSSoQQyu9o
         VX0viGLmw7CCmdfERMSXG2Beo5ikydVYF6Mnmy9rUBeK9mg7HQITmIuFTJP9NHULbn4f
         AwyEq5TvZNL0PS0MnMrVi+fLGoSiQ0yGvoU9o/tqGd8PhohlwHK1d0ig3akfKf2XFrDV
         Dkhg==
X-Forwarded-Encrypted: i=1; AKwUvBxS2ODYAuLEbGA2lWl1gVkiJss780dKcrEz2RRPU2NpeIasqiYUYlSkdFCRiOct22dntVSrkA66R+LB@vger.kernel.org
X-Gm-Message-State: AFq9FYLzzmWy2eeBTGOqMmX2ElV07uyO1Y9jG8WRIX+r2nT3wsHg4bIC
	VJ6L1/q9DAknYJ57VTijwOA7du+y7swM5X064FpPMyW6VCXSjelQfYDmiXx7UlTuJ9U=
X-Gm-Gg: AYBFou06EhRhxy8d3sn845oKq4SWqPsSuPuafoiTOKStYr7vuG3Byb30UXQZ6udZ5gu
	WMEmjWuj0Qd+gfaCjDWFyZVSWQec5WO96IX8hhPrYFIyDnF4Aejy6/4Nlkqz+KrdP2Cj2bT69b4
	JWwy4WXiKxRbfhzj3jVQGWU7t1HSpvtq9p94b5CazdrVMUth8pl8CbPQAPT5a76zUQ7m+Euc4ck
	TmRL4/jW6TumBwAxFd0S8Pn9NzX3Yt+GrKn2NH3yvw26GfK5sZ2mN9UZB2K/XdttFXBMRw+5yFY
	hdxrQRUfW5AfZcEC93cX49waBNPiEWNuMi7gIy6jRq5hGiDU6Jt1XvzOJNAybnDxgki/Ux+nC32
	ptqQCefiyYCkrs6ZUfHYbdCGlO+dJoKHlei+MHR2vAR4FuGgeKA10VCTXKYBNS8/OFmdQeXoQrH
	FhiqyItmy8/ejNFIDSO7aQeS/ENfJp+Si5phb4OCehWF8e5nvR142dpCl2nt9OcbN5ccBp0TDQu
	RbSgiFg1Lu3db0VFFbVPh6FQv/BQRaArlgKCaz1HwWTIoz964t8vOrcvCrcaC4SQsIk0wYX8Tz9
	h+ytcUfN/4DwiHZ3zZRNp4kRAXnTOwQQT4QMwdlw4Gw=
X-Received: by 2002:a05:600c:3f0f:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4a35acafb3fmr159109975e9.25.1793098256150;
        Tue, 27 Oct 2026 03:50:56 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a04ad39sm672357445e9.1.2026.10.27.03.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:55 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Michael Buesch <m@bues.ch>,
	Andy Shevchenko <andy@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Robert Richter <rric@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 22/23] gpio: Unify style of pci_device_id arrays
Date: Tue, 27 Oct 2026 11:48:59 +0100
Message-ID:  <4cfcd6189bf6f281487a2eeed4fa1b1fe5521550.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4640; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6gWNIGJcUloKBAdjaWOYMsqCGx3lqiKCuf5GHsvsiCs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqwHjfe6V+yPmRCyfyk3Q+2BE9Ift/Ecljt+/OhL9uD3S 2dbzjz1v5PRmIWBkYtBVkyRxb5xTaZVlVxk59p/l2EGsTKBTGHg4hSAidjqczAsOy6vtcPg//sM judrjVh+rsjmP6gwqVjye2W+7bkv7xgOKL40+LDnkeW7TUx/SxNtbsgznF/0X7re8Nmv6PpL8n1 l83+YKa9LWdfskP8kwtFIS/bNFQfxHNFY3VgFBcG9P5cmMr4p0+OWCDq391XHK3c9q1Bew6qyCi utSV3HDvlXfe4MDWr6lCnx4fBfndUr+y/+EpZIvh04fYND9hq/OisPvccLV/lk895VFPteX15z5 WdSkKlRs3uZQPXZ5y+apuW8Mn+zzsXTbU/VmeoHZhWHA6O+CEd8OmzR3lPCvJ/9adihCv/emT7H Hz20UJjmvjGOY284Q4N4woL9FeK+nGFOtupKBTyhHolNAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various of_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;
 - at most one entry per line;

Adapt the few offenders accordingly.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-amd8111.c      | 2 +-
 drivers/gpio/gpio-bt8xx.c        | 2 +-
 drivers/gpio/gpio-ml-ioh.c       | 2 +-
 drivers/gpio/gpio-pci-idio-16.c  | 3 ++-
 drivers/gpio/gpio-pcie-idio-24.c | 8 +++++---
 drivers/gpio/gpio-sodaville.c    | 2 +-
 drivers/gpio/gpio-thunderx.c     | 3 +--
 7 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 8078b5d7b80c..25ad6d82f708 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -60,7 +60,7 @@
  */
 static const struct pci_device_id pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_8111_SMBUS) },
-	{ },	/* terminate list */
+	{ }	/* terminate list */
 };
 MODULE_DEVICE_TABLE(pci, pci_tbl);
 
diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index f3a2321bc388..3f568a0d61d7 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -255,7 +255,7 @@ static const struct pci_device_id bt8xxgpio_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT849) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT878) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT879) },
-	{ 0, },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, bt8xxgpio_pci_tbl);
 
diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 391188c0f2c2..ba1b540db28f 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -514,7 +514,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(ioh_gpio_pm_ops, ioh_gpio_suspend, ioh_gpio_resu
 
 static const struct pci_device_id ioh_gpio_pcidev_id[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x802E) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, ioh_gpio_pcidev_id);
 
diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 9d28ca8e1d6f..ddb644be92ac 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -98,7 +98,8 @@ static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 }
 
 static const struct pci_device_id idio_16_pci_dev_id[] = {
-	{ PCI_DEVICE(0x494F, 0x0DC8) }, { 0 }
+	{ PCI_DEVICE(0x494F, 0x0DC8) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, idio_16_pci_dev_id);
 
diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index b99f4863443d..685e8bea7f2e 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -382,9 +382,11 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 }
 
 static const struct pci_device_id idio_24_pci_dev_id[] = {
-	{ PCI_DEVICE(0x494F, 0x0FD0) }, { PCI_DEVICE(0x494F, 0x0BD0) },
-	{ PCI_DEVICE(0x494F, 0x07D0) }, { PCI_DEVICE(0x494F, 0x0FC0) },
-	{ 0 }
+	{ PCI_DEVICE(0x494F, 0x0FD0) },
+	{ PCI_DEVICE(0x494F, 0x0BD0) },
+	{ PCI_DEVICE(0x494F, 0x07D0) },
+	{ PCI_DEVICE(0x494F, 0x0FC0) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, idio_24_pci_dev_id);
 
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index 950aa12815eb..49e9d2863542 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -239,7 +239,7 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 
 static const struct pci_device_id sdv_gpio_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_SDV_GPIO) },
-	{ 0, },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, sdv_gpio_pci_ids);
 
diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index be96853063ba..d7d60d6044e0 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -589,9 +589,8 @@ static void thunderx_gpio_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id thunderx_gpio_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, 0xA00A) },
-	{ 0, }	/* end of table */
+	{ }	/* end of table */
 };
-
 MODULE_DEVICE_TABLE(pci, thunderx_gpio_id_table);
 
 static struct pci_driver thunderx_gpio_driver = {
-- 
2.56.0.rc1

