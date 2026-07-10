Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9418D3B6356
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 07:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666845; cv=none; b=jPTlE2pgYCfyNnNCyJg40Ooq7RMUlaaAnwyaNj4T+niC45WcwxZ+a8HLv6NzkUn4rZUFWpky6T+x2vpTiupwyyxOIPVswLXtE/0PpSUtr/nvMMHSwRT1FJRuADZSapx0KTcdb22k93T0aiXeDrFTe0buohXSU7kERzN8fFGFA5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666845; c=relaxed/simple;
	bh=eic5A7ydFKIlAkE38Hg4r1/zgheUBN8FbgQNtJWtivc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W54rxDM03h3+3+iHB/RcJ9WzW4pwP4lVZBohrXioNIVhYHrRxIbGkiheujxaGLqh6azPVplzj+0DsazgBbeeV+jCRI/Uua8UzjjcNDnsEsFuAjYagkEKLZGVY4fO5Zm7oJpK4P+moFx25L8pLbi5ahQjyHqoq+cwr/HgrH6l8UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGnoLhGg; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGnoLhGg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c7c61b5292so9715125ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 00:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783666825; x=1784271625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=el6DmcPfBIdMU/RgwOGFDOMuIscgTjBUVzgY69r5n8w=;
        b=WGnoLhGg6CYKlWBqoaLec9g8l2qFiHOQe4AenpvR50O89sWtj8zNFK9ozU7qYFpV+v
         3wsf2nK6UUMF6vqWYA1p/G45/a/nM5jhFG5Bt/d7JwpGvNZOSm5c8zrsJVPlWkf/wqrY
         LykRcluLv6F3rO+MKBp4b921Ysx5S4IPBRxzkUM5LC5HleFz9h5LWpY0ij7lalJ5NAGk
         lt4QcgJeTe6aMq02mfwjmUaDuo3a4tVEtYfsnOycWb17tIHc7sgj1Nq7bRtSVigt/RmP
         F7NoxK4TMkoVaFPRqSio6IL4qUwLL06z2OBRAukPbirGyS/YCaStqlg2ZpUvBgG3GxBR
         PUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666825; x=1784271625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el6DmcPfBIdMU/RgwOGFDOMuIscgTjBUVzgY69r5n8w=;
        b=gN5b3zMYkGQa4EXOb+mFe1V5HICo6H30iGzUt9m5KN5DYS3CAI8YFRXq+iK2H1nm6R
         vy/G6gLJMwJSSdxN1KlxWLbgVl36Gi6Ew1zrHwqMwD11I6x1awHKdXvQkFyCf0TPeUxb
         4wUFPIrPUUqohoeLzUkfCcOKUy+wlM5XAVMrj+U+mpOtUGTB9WLJ/9DENoNOESm5JGBU
         ibuGpadHy2eLelibHq8znuAarHIf42dqQZD1XBsLmIRbPIMmochYcUbDq7cMRMDu1V5B
         3PrNFljvQWaVeAbUy37AeqvPCV5yRSzUZShovopERPJJPFvMzG0ry31CisVw09CSI2qy
         d2VQ==
X-Gm-Message-State: AOJu0YyM++GCtkh/IyEqdMJdZfU+Oz3W7dRnPTP3OBbBREuAwSzKgHFT
	eMpuLtJa6FjB0SEJAeRs2GVMkURSYHsGq11xXUFsD2+KBK3wpLJ6PnZFaARFow==
X-Gm-Gg: AfdE7ckqEYSVmNy3tF/QeCOkOa7yT7n8RvprD4q6iTz/w0CJMnFVgLz4IQ8UeN/PzFa
	oDug6atRe+2JjjeI7qUWS/OqL+R3UnE0l4TiF+hHHjItTT2XFFOHFULlKjKgOiIlrk/tHjsGIht
	xmwLlFLIAr5nGrSDWPT4B8VDv4bFQPW0PXIgQ10bS/rjBnwVRAOvPonmjrboi5ZFXTDczhRv10n
	wyOrgm71+SR6BTULPDWp8wfpUws/exjwXILI1LGy6QThIW9kRrHPujL2KVSsnw4s4rAV4rPNq3z
	SDaZ22d8jIDODwyf5fIi03CFyo3TCkk7bJDCklyyPrwaLLIkIjTqKgmBHmjvJKbZaINR7MvzFXK
	GKRmnC965BqFB/mwiy/az6Ygkeyezzr6pf7tk/3kdMJoFgLGpNDppSpT8LAVxZMJ732lUMhPFRc
	ohhZfyeB82YW6x/TeNaJImFVxLD99f3riG2LzgztxF0ZdnIhDqMgF+mQJj5bClzlfGmD2EAH6eM
	MAT5bauZr93xrM3S6Tb9sR+aZzT9yioyrs1wi7n4tvVZVGrHHffGwv1sgSeHGcw/w==
X-Received: by 2002:a17:903:3904:b0:2ca:4cfd:a6ea with SMTP id d9443c01a7336-2ccea2cd773mr106412995ad.16.1783666824653;
        Fri, 10 Jul 2026 00:00:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e29asm55098425ad.52.2026.07.10.00.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:00:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] gpio: mvebu: validate ngpios before use
Date: Fri, 10 Jul 2026 00:00:22 -0700
Message-ID: <20260710070022.19772-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If ngpios is read as 0 from device tree, it is passed via
irq_alloc_domain_generic_chips() as irqs_per_chip, which leads to a
division by zero in DIV_ROUND_UP(d->revmap_size, irqs_per_chip).
Reject ngpios == 0 early.

Also reject higher than 32, which is the limit.

Fixes: fefe7b0923459 ("gpio: introduce gpio-mvebu driver for Marvell SoCs")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use dev_err_probe
 v2: v2: reject higher than 32.
 drivers/gpio/gpio-mvebu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 1e6a6ac9586c..7094ab34020c 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1176,6 +1176,9 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (ngpios == 0 || ngpios > MVEBU_MAX_GPIO_PER_BANK)
+		return dev_err_probe(&pdev->dev, -EINVAL, "ngpios must be between 1 and 32\n");
+
 	id = of_alias_get_id(pdev->dev.of_node, "gpio");
 	if (id < 0) {
 		dev_err(&pdev->dev, "Couldn't get OF id\n");
-- 
2.55.0

