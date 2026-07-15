Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3479F48C8BB
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134578; cv=none; b=OUdKfFQLzX/cNC7kMk2XTrWWBKeUXZ8QpKIjWPyHG3oy1mS5+ydMQ9dMFhYSiPHzGQNFwJwU4SE208i9ai4HJkVVdd/RftMlhR5wR3c6xXCXio8EN+CUjOaG0L7H3Qv9ZAceKdIj4Luq1cTRdTVKdQJWPveS1YtZBu1ujUWm6f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134578; c=relaxed/simple;
	bh=3YsCAuXILuqab/NMRxwNRaYrtjbo0OZTMuY0wpj0taU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s86xcKms1Sl4kof3OA4YLS3KXFGSPUZ0JUw5T10hvE/9Irz3Ekt6VznCS0kflmgR9KnQChznvGJBgxprFBExwaFy2QeveXhcXRK4SFuUZTpki2TVTFjLE28OAn6Q5jOrRNxw9sXiRwb1qeswoQ+SrPrAdVSlmiQWD/FUvb81/ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IReBaITe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IReBaITe"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso11687925e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134573; x=1784739373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JZwl0mdHQBxdq21kHAY92oJ0Fp9zFmHctp9APu2XABc=;
        b=IReBaITePFbhdC8MKMkHWO6aprEd32f+OhG6Ujm5HoZv23ZNlf8x1yUM/z+PovE5KX
         uDVDvASzCqYInc5peBh9y5i98n80SyMtfWm3z8J9jMLza/yvsuuBPWdLnv/dWk6JqEQ+
         P7tHQxIjb1s0gBet7/l4JE0luzY5QPl6Mt8j1sfqMWkfcfPQ3ccN6HZJPUASc+DiB0IH
         GNQrtVnMs8wFQ6VmXWpyL57+U4e8BKHNKCTwqWYqU9+1PCJjHbINrAuh+QplwtHNOjbC
         n9zmXJ/KJcTx69UQCPfmu5jBPTImPfUnXwxn4zWF0Xo2h6A6tcwO4TJ7al1Ma97q1QT/
         Vwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134573; x=1784739373;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZwl0mdHQBxdq21kHAY92oJ0Fp9zFmHctp9APu2XABc=;
        b=Ujmg48viscFrDuxlPJ9ARpxcYLeS2T20WIWViFkP10iAgU43pUYamjHNtJoUgwe/LW
         ImYGQ6DhJVqucpF2hajK+cKfSWBvdWB6qALzP1X7dpjpz9i9vfqVWEYEiNiSqXb2v0ja
         +4g1bIn0UWA+9SYMva3HSAMqpKZ4yQ8QZMMu61E1/H+XvXZsDvV6n+wU0YDrnBCSPGkm
         oMiZNBc9UrndWuhSkjoAy6JWLKiQu4In6pT3FnTef9gykOQ1ghG2D1ZPiNCCZvkb+wCq
         bUlrCKrKnXJpAFMBhN53prDa9m6dtjHfxnq3ZOv15FAy0l46Dn9wXFTT39vtnwkFiLGw
         ghYA==
X-Forwarded-Encrypted: i=1; AHgh+RphXtuMN9QrurdUCrEk6og8OyoYKI0fgIEuwCJo2FRszIUh3oLsMWUa0BTpUFw6YIe406rlFVk2cQ3r@vger.kernel.org
X-Gm-Message-State: AOJu0YwxvE1cKXqtKYbqlmM8YPbv0Y731BmQMm5kOGbsmNG9kZMB/2Ss
	xIE4kbseHu1FhDtMwlBGPppL39bNTlyGqgEwKQsDXZsHZaLoFGoDdu4NFPCtw0k7AOY=
X-Gm-Gg: AfdE7ckfqkDnEzbBSt6hocppMQt2VREUzcrThx/ayB7vVUE6aT9Knh/CM3uPeXRcBAw
	vdFgm6/YfKcczQ9IhrVe/kEVBM/U3r97DX0sMoyEEtXa4Ig6yLQoPxiXCZyNBB24wPJlYdu74F4
	OOAruCB3L1IHLoTinGQFTDPLEqDT3HjQPtb5OBqlNqM2Y2VLmSHDaWdDHc80wa52gU5hiqxT3Af
	gjKGKQYlZBhmM1fx4eExvFjaW8lyalokeaSHd4Z41g4lyDfmy9S/lj4viEnh4llPo3pS2q9azcr
	EigFUqq3ygrtxNs8CzxeF9E68xe6SSIw9cP4tS8MlXJDJxda6SW+y3hu1FucErxr8mz1lD96RhU
	Mtkd0dZxGzdddK+NkNuuIknB1yOybE8vG0f8fv0TifUZb2j3p/0U+q7DLoYdEbFK39WFZwDYR1C
	wEw8JSwFv6QI/QAFyJRfOb8uE0XlKhugXkV59lrr/gEwtgYtmctyrx0yq/J3DW6VAdtfPaow7Pq
	FY=
X-Received: by 2002:a05:600c:621b:b0:493:faf3:3ead with SMTP id 5b1f17b1804b1-4952cc3c566mr88325745e9.4.1784134573567;
        Wed, 15 Jul 2026 09:56:13 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49508728019sm160256595e9.5.2026.07.15.09.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 08/21] gpio: sodaville: Add missing PCI module annotations
Date: Wed, 15 Jul 2026 18:55:13 +0200
Message-ID:  <b76c72b2071f30208a82998ec65a5bee72dac95c.1784133987.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=877; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=3YsCAuXILuqab/NMRxwNRaYrtjbo0OZTMuY0wpj0taU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7t9pKrOsR4rqoMpOCCuMvAdVRB/xVINHYvJC ZwtKAQLbNKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7fQAKCRCPgPtYfRL+ ThTMCACFLtpjAMm64mZ5r6G2/KtoOOvXALO7Cv0Vai5EM6C+iGnY8ujA4S9FvOoiW04yz6aaP1g I6B8muF0zEPrC0iOq3Am5pUpgZzNUcXqgF/DviNp7X59vG1HbASxfNfjwPJ44ceoUL7A62M8CUa vh90dD7j0D4Vr7y620O+tcOtrxf/B7bl/Y9JFzXYrDAy/RzX00LScgiMZG8giNKh+5EE1oc4paw R8H3PpqG1RMSoENo/aTOxRdCsecG1BTZZPf1iP5kKfe3El6HeYB/Y/ioMJQRz+kY4fLSaUnCfxk ckTyYq6ZAOZtefPmo+ok/JKXgtnH25HiHekg9U/tqFaxhWpo
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using a PCI device id table is
supposed to declare that in the module's metadata. Add this information
to the sodaville driver.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-sodaville.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index 37c133837729..9f4cd23c872f 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -241,6 +241,7 @@ static const struct pci_device_id sdv_gpio_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_SDV_GPIO) },
 	{ 0, },
 };
+MODULE_DEVICE_TABLE(pci, sdv_gpio_pci_ids);
 
 static struct pci_driver sdv_gpio_driver = {
 	.driver = {
-- 
2.55.0.11.g153666a7d9bb

