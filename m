Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C4B4BC005
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134593; cv=none; b=D/js8X3HyZwzBLpe7EnHw5Ryz4cAa89Seyp/GufegkthkSXS5AGlZi821gx33sEiEnD+FX+encqLqL2agJqpYrYi0myH3HCVseW4uGBFd6RLpeho8hpFSzJ6GQUlcuhpJAsOf7La67nsAIaOeox1tFK5VxSc3r/o70pqxMLWZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134593; c=relaxed/simple;
	bh=xop2FbBj5tuNPwvd//uvsdP3YavOUZbUCVxoOGfcP5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JRn5AaIj+SjA4s8pEMEF/Hry4KOx2kNFZn6s/7hk89P97jZHRvG9zk6fG43k9yE90//fWcC3JeKf0wYqt4GwI8ULLpIqPm6cvsldjGk4eMgWWFrbK8FtRufpj10fzwRyaCDafd3K/po9BRZhi4PJNa892lLQ0mvsLc9vkvVviO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QCOX3W3s; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QCOX3W3s"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so1854059f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134589; x=1784739389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pAFIavaPW7p+32R+45SYEoxpX/bETeA1cTox7VP4+MM=;
        b=QCOX3W3sYE/sjv2h4TEcN8n3+mcDf6qSXQTDZgtZf2JAirkWSsSAVEXebnjmLVWSEU
         fP+nYsxpBgcuin70tJ92rcmP3Qz1bVeLiKx/Zc9gSUkCufpXyKEdXQYHpSBNoQ9arSyK
         evEhjFYO3LI4VA4DcGU3oPa05fTY8TdP4fki69jWjvcgfxzVQ+eR8+ZKqtHazvFd0Ysk
         nUjV1hFgM8BMpk6YJJI0oaAO/DJAOqyFnLcjxMaVsRJPp2AocAD4jBHXKv2Eu4DYlZTL
         q/C8CprFmLK6TJxDIZEABmZpHr+bOQD26GnrDnzQpWObwvBI0zSAAbigtZkiNSaT0Ssw
         pAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134589; x=1784739389;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAFIavaPW7p+32R+45SYEoxpX/bETeA1cTox7VP4+MM=;
        b=aO744pt75JJzBJhpxZjn8/WMNi9Ojs2JwKEhuOjIeX4GdrjKMWG9YqyFGi36j/LPXI
         tNW8i97nBu+KSJTrpjhm82+4UtfUefgFmUOAyKWqnVhfG9Fo6QxjlWqNFwXjOLQ5SG8U
         qZEkypUNMamYSyOk6OXqo0CauEshsaytun+salVyq8b0/IyNqiOfZvenabYhhVPvVFcj
         XuGg8ZNAHLBSiGUSg5cIWh9bk7Ydz439jAQ9k7CzlnTyhmfI7RXokDa6SvW+L6FVrvUJ
         bq09OOOSOORthdeqLKPpPIG9xyVFB3U0tyTUJz+7gLrp2lRRJbZRG+YZ2nABbW/yuS2t
         H/3w==
X-Forwarded-Encrypted: i=1; AHgh+RpM/OU2tb/7i0szCWWvrnJpuy+tpF5Ye3jD5PdDj697z9lEIfWSrQHfWOEdfR599mAspAiQj6gF9yCP@vger.kernel.org
X-Gm-Message-State: AOJu0YxKU7MtiTUlTdCKnA4v/uKI7DEJlt+4CRLJ5K/umznwJOy+hDzN
	QnK6bs3F/TSmwR9ljjlBWa3lTdxO3+z001WUbUWcG7SZAw8gEFRTIswEOekak8a3jWc=
X-Gm-Gg: AfdE7ckDls79TltfCbNJ3b962I7ElUt0te9JRDRqrWXNDu7ikyXM3pJCJCWVES31BNG
	kmIOR1fXorrZ91Y0ROC25y0WfzeXy6WSVJxMwhJT2n2icGmZNg7sjsaqdMIQ3rJVBye0WcYlFV+
	YuvR8n1rXjGE6pgQ4im0p4sMXCCaiKXAg3UVinGX6aeKS3CbwTf+Mku8WHn6IetNESYRjINgi/p
	mVv2oTjYLLcMa7pUKtFnwM3DJFEf7CSOyBr2TCv5y0trDuXH3Ul7k+7MlxtU39Vh2iofFCCb9GZ
	bBa/jxdUgbs0L3q/S8GZzo4oUWEOIThPd9+Y/+zCCdTdscNpYvXqja83i3H9r3JrRfJZ3AHVp7z
	dXuUktXPc5Fe9rSJQuMRdKEd2XnECC/leGWafbxlJTnNQReV1l5lsEJQuC13ta939we/0Z7NzMx
	ofyErZGdFIc0Binv45fT1KzBKG51v8+NZsvspZrGPfmmh/eCF2etERjhUwGsJ3p+hyS1+52rZWW
	Gc=
X-Received: by 2002:a05:600c:4f8a:b0:493:e947:b24a with SMTP id 5b1f17b1804b1-493f87e72a8mr189426985e9.14.1784134589586;
        Wed, 15 Jul 2026 09:56:29 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4953c70f99dsm51162975e9.2.2026.07.15.09.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:29 -0700 (PDT)
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
Subject: [PATCH v2 20/21] gpio: Unify style of pci_device_id arrays
Date: Wed, 15 Jul 2026 18:55:25 +0200
Message-ID:  <a5c6484f2ff045068b667e3c08e8f98fd31cbbc6.1784133987.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4653; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xop2FbBj5tuNPwvd//uvsdP3YavOUZbUCVxoOGfcP5c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7uZ05xxLN83oiLEZddzG96QXCZOBkro/Ph9s mDUlRNb6TmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7mQAKCRCPgPtYfRL+ TpPRCACxkhWRGX9dtEMeKnqIaekeFpTdLTKEO3opwqQle/dkW2EG1qWJZSohmCWOJj4yI3j6bbS euuLd4Q2+AuSOqT+w6xe2ym+gfK33DR0RFjigoPCbMPraXXoE9HgKd2MUXTVdV21lsQg7gTW+Mr zFF5kJzOZ8Nj/tkXa8Du63LMMxvsm77cBPha/YjrYtvW9a2JTq073OJnE/w7+YkCcDHxyoHSgPV EMJRzgWMlPSOT/Woke3jCTD7UH5G7raBIQk7R5FcoVuIqhx74A26xCSkya2oyK2DeOcY3Xj54ct cdEVCnswS0n9K+2SO5W/kHD0VCSgx2msXHnTVlJeBvla0sm9
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
index 324eeb77dbd5..07bb3557a42a 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -264,7 +264,7 @@ static const struct pci_device_id bt8xxgpio_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT849) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT878) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT879) },
-	{ 0, },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, bt8xxgpio_pci_tbl);
 
diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 6576e5dcb0ee..75e75a53219e 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -509,7 +509,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(ioh_gpio_pm_ops, ioh_gpio_suspend, ioh_gpio_resu
 
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
index 80c0ba0afa67..1caec692f68d 100644
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
index 9f4cd23c872f..5544fcc27228 100644
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
2.55.0.11.g153666a7d9bb

