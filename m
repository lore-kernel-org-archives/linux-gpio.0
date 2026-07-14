Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15593F0AA0
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013926; cv=none; b=oUj8ifGY96hTKlPYe2hYKRnGczvWWDGWhSOyPGlDm9g2GAKD5y7XHyyDczKn2iHCyRETnvAyeHpqbhEOlnaBI/lSpQNqRktS5GVHT5YYy57f8sNINCQqadz08f6T39TMwMAuUCoerApcsoowRTOYBGuRD+9ZZ3oRv+1ySlsluBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013926; c=relaxed/simple;
	bh=3GSX3GnHmK01SUgMhp5mSJb1XUqdNhgrTqTf6s0Vwjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H5IULoN7udJyP/eO41c+4TaoRYZB8LCVPDrY3eReX9zk/ST59TM+TGt8VcCINm6WXG6H8o943bsYfdpPIAQFfCXfXdhZN6aOjdrbwE/H7nKSR0FdCZpUBIkINvje0FwNTHTsFwWXN8MDOrnfuBchN9CgWtN7Bdo7AVJYHss7X90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pF0a2q5o; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pF0a2q5o"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso1671576f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013923; x=1784618723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PxaYbEFmHu2AR+niKRHTaCaFiPgrKuCC0sk+h7potI4=;
        b=pF0a2q5oBBKurWQZxcV2OtvXFkbb7P9qtJ4GUIBjP2mxU2rS/36ocWbchoRffEeV9d
         6lHPHPVcpi/F6ezRg6c/4WBIZWpaEho++g9JuxMOoWYHqXNKbSkaNthP63JvuwL8lrKJ
         o/6HGeLKfU0+m7k13nsyI3VrOzNYi1DtflvztAWjdmH7s0MBajDrpTTQDTqwGCK3fznP
         XLfx5ZUkbUcwp7RMvKh8tlDlId0cge6spIJaqtV3tFbwNYC5MU5zSm4BljikWASCq6qw
         i+47eyjnCPcQAB1LsCZ/uEw97lvFgXfyZ8CzNYuUyCCxPQoDcmKbVyd7KHgHcMXG1ema
         o7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013923; x=1784618723;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PxaYbEFmHu2AR+niKRHTaCaFiPgrKuCC0sk+h7potI4=;
        b=ox/0lxrprPeKT//+/kTfviQp6smJhAJQh+DKZYYB4y8u0Qo+mEexWr3J7utwAm81qh
         lso+M7FavvRK3AO8D00S4Z5sKfzWVnkT1laoD0WTnPwpSHvCAmqNHNYwPE7h5W9WpEy+
         PQ+dg5GUh94IEau8v232pob8d95VlUGjJymHkcN06JS8gWfp+NiRM49SYdJ5L82Yh6AA
         W6J4ixt+/tr+dQf+Vt6oEzYVsObZhxus8OG+c4I2Y2LGSWl3OZ6jI0Odb5HxsiUynhJF
         vUQ6oOIjp7MKA4DaKmTtBjrtn7KkhRtDQqJhclKWd8eDgje6/vaueYIgDHUtcJ7MI51h
         8Rvw==
X-Forwarded-Encrypted: i=1; AHgh+RoWcz96x55jozifvvHjGoqa3jwf8FIUrFJ+SwZHOsrsE8z9U1bpXhlrmQ9SQrr1MU3tjWRADOrK1sQK@vger.kernel.org
X-Gm-Message-State: AOJu0YxIQTFiYK84ffOUBnvhVwmguBE/xFw117thAbju9Uld94meVmqI
	3SIjktUHzo+O0Bu+xa35M+Wv2BJrRBbpOQfFLUbbJlVlbxXhxwaeROd7cXZTXGaVMiM=
X-Gm-Gg: AfdE7cnPRJMM7US0WdjMF7XKiefHxchW6igeKpSobaEqT3S3qa0awsNbmS2qyieKhKK
	RZ9MKHgWQfarKW2kt1Bwz3NroqK9uFfi+Y4meAgOxZiQTrEGu2b005Rss1VugMvWy/omMyxaRF4
	mp4kM7ni6TzlrRh0wluhGaBO3fceDjDNHBJzh+33mu9OnwHt866YHeqB4uB/klN+6yfNbr+d2fE
	p2AVz2bwCBEfxdybN7Vo8d0GGFJ+U6S1J5wHSeGKl6FBRtGT4ECWxKQsgeiC5ou+s84WDar9FOt
	lQN6PdjsS75o3+ZoTKIA0EBQFV5qVIDLOrpPGcwcdGbnOMIo4EyHKzYcjQn+XZZcA3H8VsbLx0d
	MqcjBxes2gaN1kiN8LtwXhTvYC5KCctFlESpamVDPMpRmlaCcHKMXy8VEHsySU/+Qs1U324uJLP
	ZXzlbaVUEQFsEwOQWufEyIJzdDbtDFNZZBOiGqUf9ij1NXd7XRFqB/zN9d/6oKcGdaiAd3ee6AK
	XgQ
X-Received: by 2002:a05:6000:288d:b0:46e:8226:96b1 with SMTP id ffacd0b85a97d-47f4889c487mr1427341f8f.42.1784013923039;
        Tue, 14 Jul 2026 00:25:23 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4634e036sm6958617f8f.5.2026.07.14.00.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:22 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/20] gpio: sodaville: Add missing pci module annotations
Date: Tue, 14 Jul 2026 09:24:07 +0200
Message-ID:  <40ab40117c9df840de84ccf0365044cf4f87d37d.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=3GSX3GnHmK01SUgMhp5mSJb1XUqdNhgrTqTf6s0Vwjs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqzQJ1p2N/svquq38OlsUFSrvfVa7Pmm1z8VqgTVtxrZT 24+pxLdyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBErDPZ/yfZBWY4WbtrKUxa mdEzJX7eo58Wpr8YxdVmV8hIKnsGlLssTg6SVxOK7gqTuPv/2YVty6uXu79ml7/kPH/9Wz41L72 QMq6C09Frq9j9hHTeWkWd0rhoGcfDE3VSnjFwj+lU+3dzu+8suDW94DWP9HffP4vXcR/stiqydD a/tDJlaeqcKRouRSkJJc0T7J5yt+zZ+tBgx7L3WcmslxRftlUe+dfwM1d9ztIpVouW+an53pbL7 5//97iCTYwN9w69uL4pbstWZF8/o85uJmi/75qzQnqwmUCS9Z90v1UG/22VVwlbSJVavbC2P3ny 9Mp/X1g5Pv4wtr6QaRRgZ3Ds/Lad5xf1rRe5xjD7El8RAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using a pci device id table is
supposed to declare that in the module's metadata. Add this information
to the sodaville driver.

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

