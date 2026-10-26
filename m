Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032209;
	b=qTIWDFsksJV36uip5KOnSKAG6iwiHcvCmwFp2c+ezvKAtwf2z2rRWtFQ8jtLlM6aYQBs
	 qhXWucU+pRdp3HvXAF2KOrNBJ/tLNDvwT5Y82+GqNk9N5x0FsKfzRQ7FZXu0hIpjiQyy/
	 dX1jSyZqKJof7ol87rJD0mt+6+ROqIQ7BuT3914DnupcgsqVQq7JpFnhnDeXRdBm01U0Z
	 2k/0u1xlBRxbj635H11FJNPwIWAiJzuUkzLoHg3PnVsM89XQ4Qb62ukugiJAJdABcGeQH
	 R9tS7WL2mTDTYmZLSD/KiPlr6e1cjLaNpTeBkHW5VEFQ2Ihmpqxv7pJJT4TgjjWvM+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=uFDrQsBe+MUA+O+UTEJS2qQxgKTTnDQEatWGo1wqTVo=;
	b=CVYz6NLZjVIKh6WkYGRuDkgY3sq4iqgPKe5rF/uz43s7J4fKkuHBdpx+C50NUzBD9gyx
	 WGGbFCEdN/lMg6vkt/nVNCTytyFocOQIeJS5KTAGCIGv57dO0vE8rRH/kauKxNXW2C8n3
	 bJWP+9aIhk7lGruyyHzCkyD1MAwgwnr+X1DeZmMUVvYt9Wr3Ljnd2XURdCdD026d/wqOH
	 x8k75ehYdam0y62mfVCM19TlHV04eXVeDn8PV3tcRxBcWMG++1Pu3LPHET+17lXdZFsyV
	 iDo0yKtx4aRyekkU+JyC4azNF0+4RuQXRswg1Et2c25OnO6djA2OS5wXgNfrWLan3xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Nf4dIV9n;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA1160A6F7E
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA1160A6F7E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Nf4dIV9n
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so6986235e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032207; x=1793637007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uFDrQsBe+MUA+O+UTEJS2qQxgKTTnDQEatWGo1wqTVo=;
        b=Nf4dIV9nGKjWMfkWTRLOEF7KESqst9cc70ApROBKerpeKNscqVYuC6ZJ2WjAyNYJsG
         vGB8C0FyMb/Jp37teOa3bkKqT0bpEhMqBbWt0MP9lzzjAuqqP29vPziDfSvEi0AywX3A
         EKYOTTFojLGphu0gn/KlIxZENyrxyEfb9l4sg+Lv+0BqBSSt7I5AI01xEafLSumUlaK8
         t/uNp4cK2RqcqeGbLWFnBajhDMHBQaVBLtu95CaAEtKCVHxnHyrLGqaZvLIPmzz8FsDZ
         oNn0Nou51O+Uhqt38HRDoByfutGXI8aSerTCZqU8PqTc20U5hSbrvWy749H+kp1JjE7L
         v4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032207; x=1793637007;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFDrQsBe+MUA+O+UTEJS2qQxgKTTnDQEatWGo1wqTVo=;
        b=eUCeMxZZnBJ+e0DLE/DUyXrMwMN7Ouyp9zEuCjVtlArlT/hsOyD8uId4qLWFzSCCaG
         4jaM75zgAQXB1i1BOIh1SlkikzLJ47qdTprgTvOBAkwiAlQf/k7PNLC/2hqHYGJlelQR
         OwhGrGZVriPseej3Tx+hqW9LLYJsRFp6dBtoO5tfxoG11pvHldY94QLaUeT/XQk8u3Gm
         bu3gQXM0RpsPsDPt2ya2TlO5+3dwyz1A76djXFy/sk9dplVajAXNlRK4Uv2ML9fJZQUo
         +2E6E0gtl0dMDXdrPYmSaAjPlkWnXq8oCoGRj0ODeC08BXuUjx89l3t0yRDS4JWhzOuJ
         P0Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzywGD2o2MkTS6wTc4Y/MLsBQVeCNNepUVgLREwDUFHvsDp2PSJOVaCuNFry6gMQJd96kVCGsMtRJ+N@vger.kernel.org
X-Gm-Message-State: AFq9FYKZwFjuJJRYMPGxMqllOSn8AJydZnU+Vw3DTH/UVW5jmpsgcmSm
	4e+s1O7VYVFHwalfBqfNdT00x9YIjp1Y7p15WrH4kKMIgG85grJdElwCoiNGbz+0FDg=
X-Gm-Gg: AYBFou3TRvQcy6QV/QxxjM9Sfw193lzTE5qPrT0shiFiSfUdEzSzZlT//iZ5Q/I9Ety
	cIerWhntJG0mVxm/mCWuz59CKSbSt5u5nAzaNQ0GKp9NMHaFM7jIyLca/PemKSWIbMZ2I7jZK2m
	/lkKlsOlkSf1UmaCj3rmwuGxE5W8DfaFLX5N3uJlrjwt8ArS0m1a/TVdKdmDzTqS25Id3dOAnS4
	9GmeXduqrfImo/CEuhiQz5Yq72bfTWsuQHWLu9oVP67SwG/woMMnXVi4FCepi/2eIFnPDrDFOJM
	rNJ80BFZsL0pU5qh7++woN9An2T8qXdru9nO2lRtbgDMHjL7iQAqaU156keGJJmR6Sb/IqDec7h
	neP/TC6npRl8PaJ46q0R4OR06lxrwWsv4SZo7SKJRvPHx7qtGtNtAs0pECInNEM8Ic+6ICrOvoM
	ge+Ql5hJNyAyoZy0OJQ6aFHjxM2j0DxMojilUo0jOHUqs9CEnVKm5BbJ8Js3EkYYCojTJ4Rs9zQ
	JL29lpFyBVyJ/qSAP66d8MqMsKYhJqWDUe8kJiJeewOZLEsEqDlTBCeH8AOo/Or3EpLwNAyO1yI
	mb50BTsUQHttypBnnA6wbeeJamUrybrKpLzh8EO3L/Y=
X-Received: by 2002:a05:600c:6989:b0:4a7:557c:530f with SMTP id 5b1f17b1804b1-4a7557c5341mr31152915e9.1.1793032207023;
        Mon, 26 Oct 2026 09:30:07 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a55e99fsm209023675e9.4.2026.10.26.09.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:30:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Michael Buesch <m@bues.ch>,
	Andy Shevchenko <andy@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Robert Richter <rric@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 21/22] gpio: Unify style of pci_device_id arrays
Date: Mon, 26 Oct 2026 17:28:32 +0100
Message-ID:  <d25a89cdde69bab418158b59366f64270e699add.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4580; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=mUrlPBOf6srrWjxLPoBuv0fEC72tbzfH4AjJHLxXHd8=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqz79TdEg27KPnm58JHh8pzeb0FLLv+/sa4swT6x4N5xd XP2zpyITkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmwv+fg6Ff6Pi6jpJrawoC ZsXsZCvpS9a7wxje2qVw1eJbWBIrh9b7qGod3QKh4+eOXkpcO6eWaYbeB1OlFaefqYWJfbg2m/8 ke7pf6+QvOXwqi2RvxJT5BKfXJKgsceKJEij6cEz/6IV5ict4jj2ffVtsE9Nyj6hp6gZ2gWVbxP +tDe++EcZazzFJukH4i5JF6Imu8tfz2e2fO74ss8iLbc9gfR66meHX6V8W5TvTuNep/2hpWBWV/ 5qtT7tZeqFXr+4y39jvaqnHT6VlpM6aH5PCniet8MGRMYE3py5WfHXHkw+TtnYmbQ4WLjq4+fEB zyBl6yW9isLCc5Mz13Ac/CJ0/tO1Q1VveM+tuxX7/uY3AA==
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

