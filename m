Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48F535203D
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 22:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796558; cv=none; b=lluKzDerG4zw6NCkWsHuIMgqLmpnD+5mhrnVYpgWnWcJVcqsXwMNP6K1ZGWlFqLrduI0iTgEAc5b2/x9Ysa3BlTAdlZvlorJVWti6PDMAQso3VBQ9Dxhtxl7sA2lq4kYJzfpCJAgGyHaAoRHC3icNeVIwPQeSsekUUvWWvAK8AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796558; c=relaxed/simple;
	bh=lAQCXQR7p7SQxfNTpQD6TF7kG6Q5ouKkV08DFoQEqf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdxgLxGAfx5j+A3+S/SuB2mt+Le9vH0oLGpwXFefLkw7LmPLm4BTIjyHEdwy/Og/8DmJZBM2iyK+mK4a/FnQxWYevxbNu5uPQlJFkHCY7XXjrpZvdn+2ufGGwgWhbYoD1H2VDizDc4tqTIp900TTLj6eZ9L3RqO2GdVNR27yObY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7v7OMCE; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7v7OMCE"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso4604019b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 15:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785796556; x=1786401356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDTWVp0Ffpbf2p4etjIulMVE/egA+V8UQyvLt4BG/CE=;
        b=T7v7OMCEEFqMFVfQwvMQ6U0ylWV0J2yVlpUZ2MT4KVgAQ4wOrTtF1W/a9Kr7nWsp5t
         AD8rIRFlsJp+Ri4PgrjxmZU/0DrTg0mNm/Fu3xYJrNSV77zI+Og1GTBZzRbjaqk9qz7+
         SMXtt4Q2779j6tkmgceSuR/dDPJE+mR8yx6i7t0RCugQ8gxbtfEJouWiiuw1/cDJd1aE
         IdIDpksxNy8JCPwD1O/HqXUJUcedWFVR9HiST6rG/z+qua4XDl1dLna586XAcARc8pmX
         sqSTAEt8RxXn/0HIv9hzE+0dnToGkts+I7deq1TUNShO68ZEbc0ToDelfcT9N6GNar1Z
         zkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796556; x=1786401356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dDTWVp0Ffpbf2p4etjIulMVE/egA+V8UQyvLt4BG/CE=;
        b=ED0QOJMYzFIhWq+OoOKHIVY8ZR272ObdnKJhu5Ry9v64zO0fyOkomq/iFtBtHvW8oj
         8FDywW+H3SEgxe7bqLNb0IKngfY1C8ReCkEs7ibM9Yls9kp3wDxBFCL/hQTJ2ixqkajm
         6/BBDXXAnzxpP7UteLOZjmj3WxLSONGppwHxKA9xwUcdFZSzwDs01S/Pg9WtAEY//z/w
         TJ5BXcC5kUj+rAeGbZUfFD9ov+UJdrYSc6uky8yol4D1uPDCpcpNdQjjpj207ZlcjyUn
         ZoogWhy6l5s7EUIri3Qc3LR0XyMcJOn0ieZcTZxrTAhyB8xOlcCCmaQkwdQ8C3KixzSy
         Nezw==
X-Gm-Message-State: AOJu0Ywj/iID51edC6N1ozW+xEcN3ZSyWTtWhRC+kkpnVCE6hMlj1gDS
	fprxmaDNwgN2RR9Gob8p+w1dBnEBxMy02f6ztIWOIu6iJeRNv9+gOTl/5i5bhw==
X-Gm-Gg: AR+sD12B0c/OOiA7iZIFqld2VlmSTrlek1tJx8nF3vvEoH8QLY9uax4/vzoIrWh3GQs
	2vB4eHMjEagkMiVK4/pSzyoywtbBf+GBG2jI9tqz9N1UWgE9fJtrIeWSxQInMsWwGIBjoHT2qBZ
	R+Ei3vwV+hyq6wJLTK5oGIhzk+oZUofWOD939xYdLUVC+ED09xk57gdjDTR9qeidnLhCBtyYnML
	OBYq18YEvnvCkuzPeups5chPmd1KAiTkzLVuvaD0M4DOUmlzi2t11G7OA5ttea5AGwKy+edUiFi
	61aYYD6LAudW3bQG8VKlYurFRI/XwTXbUtsPzZySATTP0aecAdo4d/mgsXnExadPYY98mLah0hq
	/kbT/E6/0PmeeV4XHpP9DvgQJCOez5j8Q22uzRDKxAGGUs1xY8hNxqXoEz/7OgFL1XR979/mQDm
	FAbTfuHPQ3OBDNJeeHDy9juju4XmchKDlJgvPzIqtMO58FsXHy2vMRHirtsGvbvMbdYfyh3RQT/
	AaARb8klBmeVNvANUqT9xORrUUx3osuc5+scJbME71XbmDNpeLZ+BqfGAd3hMqN4gqTj52DcoHo
	ofQkRHNMCZ4In0UXRLSo4dDpTrJ6cafZG2WuBw==
X-Received: by 2002:a05:6a00:2daa:b0:848:2a55:7110 with SMTP id d2e1a72fcca58-84ee4953b38mr10912063b3a.36.1785796556111;
        Mon, 03 Aug 2026 15:35:56 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm4186790b3a.40.2026.08.03.15.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:35:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 8/8] gpio: ppc44x: use dev_name() for chip label
Date: Mon,  3 Aug 2026 15:35:39 -0700
Message-ID: <20260803223539.86303-9-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803223539.86303-1-rosenp@gmail.com>
References: <20260803223539.86303-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace devm_kasprintf() with dev_name() for the chip label. dev_name()
returns a stable pointer to the device name, so the separate allocation
and -ENOMEM check can be dropped.

Using dev_name() seems to be common for GPIO labels.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 9fdc84e922f4..189667e0e1ba 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -147,7 +147,6 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 static int ppc44x_gpio_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
-	struct device_node *np = dev->of_node;
 	struct ppc44x_gpio __iomem *regs;
 	struct ppc44x_gpio_chip *chip;
 	struct gpio_generic_chip_config config;
@@ -179,14 +178,11 @@ static int ppc44x_gpio_probe(struct platform_device *ofdev)
 		return ret;
 
 	gc = &chip->chip.gc;
+	gc->label = dev_name(dev);
 	gc->parent = dev;
 	gc->direction_input = ppc44x_gpio_dir_in;
 	gc->direction_output = ppc44x_gpio_dir_out;
 
-	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
-	if (!gc->label)
-		return -ENOMEM;
-
 	return devm_gpiochip_add_data(dev, gc, chip);
 }
 
-- 
2.55.0

