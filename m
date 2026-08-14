Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F4F188596
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 04:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786681852; cv=none; b=sdBkgaRQAz7MRUePffLiEPg698yS87Fwc+xFq8j4+8CFnfB8RcSveg9Ik67g4D1I4/ZZD/+3xPd7eVNhw+7aMcuMY76cobzeDrb5oe/Zeoadlh1rfNWHL+6OFI0AwhIjKoliR9DXjm3A6vbo5a/CZZA4MAPPayDwdkbj/Trh7s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786681852; c=relaxed/simple;
	bh=4KCnqVQDlWdyKaqx/KhQW2psT0i14vWDF6EVdsu+UyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qibbwpEkXUMyfcY9uGWg2m/tEIxiTWc5erf6wMIDxUwO57BTuvvfyZ26KvXJcTqll78ftiTDOmiORrAWw/ZcIS7mL517BnNgt5dl0LfYIPQUk98t8Ie5NzH+G3IoBFAxasnXNJP1e1cmRfjWKtloyD250ZhEM0DhzXfA2R6I6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+aH+Un6; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+aH+Un6"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so328458a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 21:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786681849; x=1787286649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvANg5zc7J/43jqLr7o14P5MGpb13Q3fQH2jlPVDkV0=;
        b=i+aH+Un68a5BeXHy9F4JxbkODvxEJuC2LZ1fuRcTD4Nf0xFFh6qp5rRBGlCXN7HN6v
         nTr62X9grl4ptvAgFB0S5HXiYPpT7qHRbdjKh2YNlx549MLw5gmLQiaz5mNJaimrxUdI
         /Da9UuIr9Fy7/SzaH6m36vzCN3+2k2Ss1AOWv4MXIZb3i2gLEI555nvwvW35DgFyaafa
         LyZX51tnWIxJ6gbdH3Di0nHi6Bh6Hddrvrqn7S5wBfmMUb6/B0ZFVXdzEc9zqJ9i+190
         kNvc9Qu8Q5Xzris4dRB4fusqC/4yCiLW2al7jWwWUjCh6Q/1+/s3lij231u7Xyo+oJyy
         9Zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786681849; x=1787286649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvANg5zc7J/43jqLr7o14P5MGpb13Q3fQH2jlPVDkV0=;
        b=nG4sYYFxx6s9W/O3h/AKSKYvFm4VxyXqgjGPMMmtte6NCRqUtqu5393DruZxmQQUCr
         /Q9ToVIzfBLFgbOKEDSGmSpa/xwVMVwE7ztm3euWCtB0CC20np+z0gOHuAJ6ggbwhwzB
         XelB2k8uKjAgQEbWK/EMqRnYZ/CQdjRV5SyomZ2etb4x/HYkPeVwG1SNYlPBVEJUEDUW
         lKnmBJGKVc4JRWnqUa/7iMk6OBp3AFo1cumauhOPBCQ+oEbU6kgfUBrBsj75or3wZdYQ
         k4iwSotK4FerYQVE/HmoLOhEjOtFddI3I0NfWV+/t8rnY5B7cZL8nqMq7BTHBbUv1dxm
         VoMA==
X-Forwarded-Encrypted: i=1; AHgh+RpWX4VTmvG9xChlggZa1eI36uRUafOmoFDb9x3QpM5i4ud9oEKiPehzqzTED13BDqtsqvhWSBJesEnV@vger.kernel.org
X-Gm-Message-State: AOJu0YxTsoElpu3Q0Ot/RsUSMIt/651U2glztEfwi+N67VRrcnX2ktoG
	pT+3qO4pVJFwFBsaEtZ0BCXCOc3Fkd00wONHPBqDNCYewI4QpxZYdDQQ
X-Gm-Gg: AR+sD13boqr2UowN9FWJwViC7kUrCrNGtPZIeNVi6Z0BawjiNKxBaH6FKPMT/eSg9Cn
	x3qO1jWl3ont+2TBfqyC6f/wonmKYjy0LcRitizQD7RmNJ2QcpzAxIbHdGpurxlrjxDU4lCRA2t
	azx8CZe0tOrFVI+CToJBcY+MDoPthsl57atET1899n94pZV9d8aNVnwsf5ug+9QJDXL7Lgjqung
	7/DaOdigq+qwMeQ1ZzkeEtLTBAgPo9iPqNHRxx+evLLFqTse9k9w5bPeAGBVK6ycQc8rZDvwO1y
	svdTNKHKBWlMEY4HiYDn9Fan3p9G+qxkwFmvPjUEgIuYY+Xp6LVffwUYNekiJCXNM/2U++hstJn
	Et8VItOzLxzbO0I23UGpJ9Mkwi5YMNSoE5iKxvfowWK6JMgERmt3qpYxO7XOA37NYnT2tcw1Lxu
	A5zzV9Kcy1iI5jDShmMMdH9GsCQ9s4G1c5PjgAthCf1Fmrb54h1WnlDUnrfc9qsudvkeaZY/SWh
	yLLzr2I/0jKexpIfomj7prAgrgmX73xd2evqTr34jRoDjHrZlc4UV0PgS+SEg9QYZ0jMhLI0S7Z
	8q0GfiFjuiZ6QVs=
X-Received: by 2002:a05:6a20:d705:b0:3c3:a1ed:3c23 with SMTP id adf61e73a8af0-3cc71ccc517mr3434194637.23.1786681849141;
        Thu, 13 Aug 2026 21:30:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef6a5aaf4sm1823555a12.13.2026.08.13.21.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 21:30:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Adrian Ng <adrianhoyin.ng@altera.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] gpio: realtek-otto: Handle errors from optional IRQ lookup
Date: Fri, 14 Aug 2026 11:30:25 +0700
Message-ID: <20260814043028.12548-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

Propagate negative errors other than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/gpio/gpio-realtek-otto.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 4a606bad5848..5d7d28a26544 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -423,6 +423,8 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 	ctrl->chip.gc.owner = THIS_MODULE;
 
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
 	if (!(dev_flags & GPIO_INTERRUPTS_DISABLED) && irq > 0) {
 		girq = &ctrl->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &realtek_gpio_irq_chip);
-- 
2.43.0

