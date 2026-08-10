Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E912B277CAD
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 05:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339942; cv=none; b=m6W3AvckVaVg6EO1SEw3uiwzdXq9G80NnFGmuUewRA/0sox1Ms1/K6UOoGLiesGmoCjlPbAq3NOXcbKlVj/i5vsd8FOdJuNL8gs+h3u6JLDI5X7XRZU3OpmSR9Z4crqEJMGKOpRqWlD6eXgXAemzhMi5+GpgoflRXzfq0hPZptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339942; c=relaxed/simple;
	bh=TZzNknFHH7BAGkc2XtagQlGwqztMWM1CC/x+6ogyXf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzEYMLzrMBO9kOwigOmxMmTywDM8YeIqhVc0W5TNGYEMtfub8YjzsnnxYKCqaFMu8HT3k1hPGkLyp2+1IUELdX8/Ao/MUyJ7eMfnkhShb5e0VlHN24S4ezI23cuLAjj7BvwonFdM/GkDgRQuYJSERmzetTLjs+x2SR/0XbENTIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgZKlwDo; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgZKlwDo"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485b358552so76427b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 22:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339940; x=1786944740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqCy83cYqtfb3bIbmbQFkKP649F3cDpniFvDlQX5M8w=;
        b=qgZKlwDos1NPicwJSc00MDos1rE4KYxIBmwa3l4sjiyRqDo2X8cJfob9ohBdK4WGal
         UBO7HkD2m11g5xZwK4KDFk8SqUMstHQ/OIgMPEh1Qq0imsnxZXB0E3v9cw2EIKmRh8Wl
         VXzr3dVXrZ2tsQFfbM9WATXQiqlz++3uvfAE970rW2/RgLJOViak+EVo/muf3Gks7jSr
         OO8Gzlw7KM5UTKftdi64lTIRYdg988Z7B+nmiU5hI2hgUQ2WHpd3/Cn7quBhwSwAb4sK
         +ZqW5pfZkML0d8gakE2pCyLdpVZ4zOdC6w1UADW2IlvuGAMTRY5DAZVoxpVU33nTKfI2
         NF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339940; x=1786944740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqCy83cYqtfb3bIbmbQFkKP649F3cDpniFvDlQX5M8w=;
        b=tQr6H8zS0sOPwyQFEBJVkN/m4i5c5oeRTodhamsvdb9ZdMr/y8HcHHjRmCGkcn8RKg
         3k8pQ8CH4gA51kk4MqrQCQvxvYy1XASK3dSskTmCEA/a2mTFyY8VnzIy7iXmZlsAhWyk
         rl6cQ0f4yM3WlhOUBUkMM0GLR2vaT0YC4Y+0ohxU/7sTWQh3BqJFJqem5hsE+Z+uYyJD
         SQKpzjE5POQCVZWuzOH3ZXQwrC1r7AdicHZu9PPAviByudo1xGsvOiPrU7hTFcoUSSzs
         +RnEq4TRGl/yiRDSvlyjPnEFFNyb0aTew0WrJ75iUnS3+TqqrR7uz2puBmn/JzWsHUF8
         Kj3A==
X-Forwarded-Encrypted: i=1; AHgh+Rr7knzfMVIqducjXpqqwH4ivWeSxEUM8PzdY6aUaWDRC4yEXIZ88i4yffI2g/aAH6HZOaG/vQTR/rjF@vger.kernel.org
X-Gm-Message-State: AOJu0YxZQtCwGgwNopb1Z5kon1qgqQEmXhDI1YCK7fKM7jGxCorv3Ki2
	6AkPBFzlJYYkNSvb6QnSFtJ2p4XxHiF0jpCUt2qVZY/QhX0Y0ZuHO8L6
X-Gm-Gg: AR+sD137fQ/CtTa3UScyAJSAkLFCeKUVVPm9ZimVpXThlU3747k7CpMo/HcBWidl3qx
	Hm3X2NzWYBxve4D1kqI6m10JCc4XXjWxk2gqBjMNNFl3rRGdsnvSxvBD2O5TALvq7CELGyxU6Xp
	jaCZ0iWwVFk87dA+UdUUahWqJu9iKVtXh7uvbktj6Be9iCHuI2lfNrja3GephOev/eqQaoV74xX
	Ol5EOQ+zivCEf+LGHFZT7rkvnv5/BEdEhyGpwWm1PUZC05BQirsejo4LJO3WUxGTehEKZ3M96zp
	Eg7zfc6JQpUJOIfUCzWDc6sT0s1FrkLCzJqkDMKTBW/FPgXpgRgxTHkne7+kaIgHQY/mGLu95WG
	t7ZkBaLHTjq3Y7UPpH31w7PcsT0kKpVgAjEjoqUThT9rSfHTrHBVQ8faQAf93xinbXsJKTa/5bo
	ZngiVI/E+Sv7SmjqGDPzcbfyHUvBXZpaONXRBS9MfbbiCJwA+GeUpcmztU2qWjrS1yPZsVxjgfS
	uEvE5n5OLSlqg6vT9xb/i+nDLgnp/9JARul2GLiM29mfWVwwNeSj9bP6GcbQbQ3OPqQehR9wNOR
	EFsJ
X-Received: by 2002:a05:6a00:a116:b0:846:bc60:5bf7 with SMTP id d2e1a72fcca58-84f2dfcf7f5mr44878306b3a.6.1786339940416;
        Sun, 09 Aug 2026 22:32:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm3243298b3a.22.2026.08.09.22.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:32:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Linus Walleij <linusw@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	robh@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/5] pinctrl: bcm: iproc-gpio: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:31:42 +0700
Message-ID: <20260810053142.27938-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810053142.27938-1-phucduc.bui@gmail.com>
References: <20260810053142.27938-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index e20f7dc79d43..025476e251c2 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -873,6 +873,8 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 
 	/* optional GPIO interrupt support */
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
-- 
2.43.0

