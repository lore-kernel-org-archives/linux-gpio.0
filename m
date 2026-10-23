Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768469;
	b=lctPj0gz+jU4eJendftKYOuRyTE0WnSrozr+UVSFxzvZvy4fgzisixWdR+eR/buYu9sI
	 S0iTRaHCpQiIY56NqcLFag8fwN4KtMuAemUeCi0HNMtaa+tLcLUCuxmuiuidW5ahM8fyU
	 ji70nedSZnRi+FYiwKN0SeTXAzEgOHT9iNIkJMKhA9rY415BgcBwNah1PJk50Pavki+T6
	 IqUZZW9wUuoJAKdQx0NC9+96W6ayUMc37es89Jlh2HPsb1NZcLY/Km+4qgDakiI2k2/Pr
	 MnlmJd5rX6Vtrv1EgWqnVFIXbZfsHWzfkEMQZI8cRljRcyDs+j9WtejbFkO8VRqKDSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oewgzR4xn13Bd78ecEXJNLxu8ugTTEDhQUiOi/0t/MM=;
	b=CTN4n16O+OPQib6/pZHHBycOAYrVJgOyehuH4w/GlJNRAxZSvMqHmjor7nnv7BVlbP4L
	 0rAF44pNqHwoK8cn6JYRi6CEvoFCaT60M3d3pxezjT8MRtKjYMYAEpdHMV/itvNQW7NsE
	 ZNNq74ZFAB3Rs6HB/CwD/lyhBb7Ht8mPRRY8M6GYFvSPDQ2BkRaH7vgSp9qn77aCurwIy
	 PwpXtzzLSpaTUSS5FaiF17L7B+XCpVme2ZjpUaE6WApPfVffaxtbmijDatL6w2LS8OGL7
	 7AhP5xglTxXvPJD0UcA8eut7c3Zy5rPMTirYVS0JsB3oBKWtC+Y1AD3xMdvNTQYtOIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QcbuID4c;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADC5606A31E
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 15:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CADC5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QcbuID4c
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35f036b17easo1229011eec.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 08:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768468; x=1793373268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oewgzR4xn13Bd78ecEXJNLxu8ugTTEDhQUiOi/0t/MM=;
        b=QcbuID4coe6dhJKc8L6NBxn0mtS/TdsHHpghkZ5y0dMCcOkQSi1YW5d43LN7Xt520q
         /UUeg47vLAxUTeZ1I/wfBHwa/pfFPvqnTaAZm2FblFdOcwBXZWV4dPL4s1nNfK0DTuNS
         tC+0MMB+mDpjFIgXKhgd2uCAnqZRITrWgIyZdgqa4YFR17z39sFlADenU6CqhezK47le
         e0hR74YuqID3R4oAGI+woxpBsczw59gB3Q0Ega96Z5hlvarWjKs7edRmk/VWLFKMjKmh
         9gmhY9JkvvG2aXaisPMFlDHcLBWeKFmJUQn7UcPVmohO/SNqBXmxncOSDOUidholz39A
         oBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768468; x=1793373268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oewgzR4xn13Bd78ecEXJNLxu8ugTTEDhQUiOi/0t/MM=;
        b=KNzqKbnsXYZT3f8OtZpUTe4wkhJkNYbsf7Ic5Cfxaz+70qURsYgR79A2Fw1cxkGtzu
         hWs7L+7SypW2UQmf6I4vPluIR0D/0Pdph5EUOTTB2DkABKNL3U7Y3hCplp0AzHNfM8nG
         31KIMgkgm42qJZluex4/O0pu6/Z83XfUIqQMVSdyryikrURacBw2TQ3Zy3lWWNi8spXQ
         /VBY7qFzTKFdUoEHrvXZJ77NNQYJJaDzNAltS8YJSNufPx/rfOlQycMmGIiCu/vksjBS
         d0THPEIZtW8gHg7qP/dHA3pXUt3vCMMIxyqDcapJ+FNKAOO+b1pq3fmTC5q8IoL9NiAI
         e+7A==
X-Gm-Message-State: AFq9FYIJ1tfpSyWvGvOwaI9QRAzUE/3ITR++3S7P1heeSYYoh0IdKupr
	81Qswl1GTkpa4U3P53PCfxtGYIqwGKToqTk+9jIXiSrkcuWi6XH6ItuuVis9GA==
X-Gm-Gg: AYBFou1sCXgLp8i+D5wOJgd83JKcXCbSLyLH0aXyxw7RVP1NzNnaQqfynmUAwnhD1IF
	fv+cZ9e1FP/5ZlYPOXnzosjRQKHR+zMZbRITbkgZ2ua6LfCsi1iuaIJEgizC7blW2PMxbmnYI1Z
	Us+X6m1vOgaY6boFQF7bAlGPgiIULijimARK9APxWcoaNY0OWnJH0xlFUbGnv3gJN93EBfGzDl2
	fZNk7FqJLJaoQC8QLDke9SPIsAHYvWwxKnmQU8rUjG8SGXQ8J+ag4N+tKqkGLlfEEUzJdLiib7n
	7WZVQoM4JbWmV3YEiGaP+MVgUqHah0mplqKJkT2kvwMSTS0UWXaEJuPsY292686eQehw2EbFzYj
	SoA9KRjAe974KiVhvq7Hapxo48xk1SxlsPUiHOt0NmpM7FBMI909GAr1jxFHE+9haK+g78mqbyW
	4OPdiDWFNCFFvcjQFurxfAdEcuqkJ7krLRSKl1xhqM645TRwVaO/hbq9t93A5D1VDulcJ1m78Ic
	JbVJjzbHV2ScA/OTP9fytUUOrt5gfI4DawB2fqbGbU/K4SjepSoskwGbCv3MLNePc3XulO3o0KZ
	sGckRij5/3Gh0MwILBg=
X-Received: by 2002:a05:701b:4212:20b0:163:a197:722d with SMTP id a92af1059eb24-195bfcb2992mr3658455c88.4.1792768467882;
        Fri, 23 Oct 2026 08:14:27 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-197ec2bd112sm625721c88.16.2026.10.23.08.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:14:27 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Liang Hao <haohlliang@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpiolib: Add irq_set_affinity helper for GPIO line IRQs
Date: Fri, 23 Oct 2026 23:11:04 +0800
Message-ID: <20261023151209.58772-2-haohlliang@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023151209.58772-1-haohlliang@gmail.com>
References: <20261023151209.58772-1-haohlliang@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO line IRQs need irq_chip->irq_set_affinity so user space can steer
affinity to the upstream controller. Hierarchical domains use
parent_data; chained controllers (parent_handler, no parent_data on the
line) store parent virqs in gpio_irq_chip instead.

Add gpiochip_irq_set_affinity() and GPIOCHIP_IRQ_AFFINITY_HELPERS.
Hierarchical lines delegate via irq_chip_set_affinity_parent().
Chained lines resolve the parent virq and call the parent
irq_chip->irq_set_affinity() directly. Return -EINVAL if the parent
virq cannot be resolved.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
 drivers/gpio/gpiolib.c      | 79 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h |  5 +++
 2 files changed, 84 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2987051d9904..0a4626579963 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2104,6 +2104,85 @@ void gpiochip_irq_relres(struct irq_data *d)
 }
 EXPORT_SYMBOL(gpiochip_irq_relres);
 
+static unsigned int gpiochip_chained_parent_virq(struct gpio_chip *gc,
+						 struct irq_data *d)
+{
+	struct gpio_irq_chip *girq = &gc->irq;
+	unsigned int hwirq = irqd_to_hwirq(d);
+	struct irq_desc *desc;
+
+	if (!girq->parent_handler)
+		return 0;
+
+	if (!girq->initialized || !girq->num_parents || !girq->parents)
+		return 0;
+
+	if (girq->num_parents == 1)
+		return girq->parents[0];
+
+	if (girq->map) {
+		if (!gpiochip_irqchip_irq_valid(gc, hwirq))
+			return 0;
+		return girq->map[hwirq];
+	}
+
+	desc = irq_to_desc(d->irq);
+	if (desc && desc->parent_irq)
+		return desc->parent_irq;
+
+	return 0;
+}
+
+/**
+ * gpiochip_irq_set_affinity() - irq_chip set_affinity helper for GPIO lines
+ * @d: Pointer to the GPIO line irq_data
+ * @dest: Affinity mask to set
+ * @force: True to enforce the mask without online CPU checks
+ *
+ * Hierarchical irqdomains with parent_data delegate through
+ * irq_chip_set_affinity_parent(). GPIO irqchips that use a chained parent
+ * handler resolve the parent virq and apply the mask through the parent
+ * irq_chip as described in gpiochip_chained_parent_virq().
+ *
+ * Affinity is programmed on the parent irq, not independently per line. GPIO
+ * lines that share one parent irq also share its affinity; updating one line
+ * replaces the mask for all lines on that parent.
+ *
+ * Return: IRQ_SET_MASK_* on success, or a negative errno on error.
+ */
+int gpiochip_irq_set_affinity(struct irq_data *d,
+			      const struct cpumask *dest, bool force)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct irq_data *pdata;
+	unsigned int parent;
+	int ret;
+
+	if (d->parent_data)
+		return irq_chip_set_affinity_parent(d, dest, force);
+
+	parent = gpiochip_chained_parent_virq(gc, d);
+	if (!parent)
+		return -EINVAL;
+
+	pdata = irq_get_irq_data(parent);
+	if (!pdata || !pdata->chip || !pdata->chip->irq_set_affinity)
+		return -EINVAL;
+
+	ret = pdata->chip->irq_set_affinity(pdata, dest, force);
+	switch (ret) {
+	case IRQ_SET_MASK_OK:
+	case IRQ_SET_MASK_OK_NOCOPY:
+	case IRQ_SET_MASK_OK_DONE:
+		irq_data_update_effective_affinity(d,
+			irq_data_get_effective_affinity_mask(pdata));
+		return IRQ_SET_MASK_OK;
+	default:
+		return ret;
+	}
+}
+EXPORT_SYMBOL_GPL(gpiochip_irq_set_affinity);
+
 static void gpiochip_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4077dc678cae..a772bf1707aa 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -658,12 +658,17 @@ void gpiochip_enable_irq(struct gpio_chip *gc, unsigned int offset);
 /* irq_data versions of the above */
 int gpiochip_irq_reqres(struct irq_data *data);
 void gpiochip_irq_relres(struct irq_data *data);
+int gpiochip_irq_set_affinity(struct irq_data *data,
+			      const struct cpumask *dest, bool force);
 
 /* Paste this in your irq_chip structure  */
 #define	GPIOCHIP_IRQ_RESOURCE_HELPERS					\
 		.irq_request_resources  = gpiochip_irq_reqres,		\
 		.irq_release_resources  = gpiochip_irq_relres
 
+#define GPIOCHIP_IRQ_AFFINITY_HELPERS					\
+		.irq_set_affinity = gpiochip_irq_set_affinity
+
 static inline void gpio_irq_chip_set_chip(struct gpio_irq_chip *girq,
 					  const struct irq_chip *chip)
 {
-- 
2.54.0 (Apple Git-157)

