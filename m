Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB3E2F747A
	for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2026 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933114; cv=none; b=EfslUp+ic+pRf76HBy+EajgULfDpY7Wg1mMjIWOAMUbhn+vxBs7LvE9FVksl++Vzx3aGlxXpxUs6pN8IkX64y3OuBmRX7hYeDTHqbDvyg6TZAaouMSWIG5sThQ9grqtD7ESL/sOIMXWgimzUKmwRwxQmqMTthL3RVP3lhnU8Pxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933114; c=relaxed/simple;
	bh=OQ55UOWdoM6PzfXEhWaM686uGxVjeNWgo2k1p9209FY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tF0BSB+iRuh1Q2D2txzL5BAZKvO1o5dqbCFX0U3vXKOGg7lCnAGzM8S6JShkUvH9Tu8b8Ddh8u77+wNHsR3emy3Pfn2ecIP+OVVGBS019ku5xBQiKtsmpruka1cEaFx9X+Cr0sUGiihQqJdgwMqsrwY7ZHzma/PgWasKMctO1Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=jBdnNVo7; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="jBdnNVo7"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5782F3F2D7
	for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2026 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1787932702;
	bh=Y8FBiAAnmtT/XSJItgaiVkaALpoPinlvUkQsty9YnTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=jBdnNVo7l5Xdr+jwWpI15QnfMGiibvOtaU2YubnV0x1/M+m4sapjREMicdAcfEUVZ
	 96fNAi+GBibX77arwHbCYS1Zz8I3Mf2JON4KCBmsjQvnV+Ito/ZHT2jvy6uqX1CJAo
	 lUZuKZxumMhX2f0Pq5EtHuhtA46JuhvGpcjRIVjKGILfdMXqFtzuVc/2CvoKtIjXUq
	 pPmJPUcUj+Z8hh700f64Yxg+H40CvdP/tFZqhpV0DD/fITdlb41hKq1gphH7gM+ibQ
	 KOb/ygKX4hHH1aDc8Kvl3eTQ5T4lfV1R7nD3n2ie99nZurB5zS0oqjeA/eU7H+Nhol
	 dy0a64n4adnlEfDXF4fA/J27XC2hKSGA6DxTHQ6UnPcpMvHX1tJ6oK7gtTeeSyq71I
	 e4ISv3CoZagrEYmZSaWp55ZeapnpSjO5lbx62XHvvHc+RpPx9V20Afp5WFDbVsq2ae
	 phUMdx4oixJhIlTKOofIaY6iS8mkag7iKlfy6PXJLnnKBVxywkd02kTESTVWn4Rp3+
	 tLmfUX6Sr0xG9YFzN5NDA42fhAvutIri0lHn2zOmGv1mm5wz2wnuDyNTU84u1JeBl9
	 iUq29EwIxqMZc0r4+vKy9cJTbYyXY/u4Gjcm48jg9nEcW00nKc7Ahxt8XblyAP1ws9
	 FMONtSWBAXHEebfNb2DyHFPY=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495529a93f9so11721435e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2026 08:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932702; x=1788537502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8FBiAAnmtT/XSJItgaiVkaALpoPinlvUkQsty9YnTE=;
        b=WVyVWeBYoH+HdyuoTAg7zPZRp0T3C1m3buWyrV+bDmx7a+Z2jnIjNVNGXi5VkQwzPS
         PHiFRh9MCYGLDPpHT3jJVvAeRdIK5KHlo4EaKyX4yFs0nVuCAtVbYRToe5hB+ap2hY6A
         Vab2KovVYEMR74DcyUFQBIyEAIcKFOBwEm94jIC7Cqp3SxWdC6qWXqtuVbHWJJi7aEka
         1Q3AHygXZtVIF4+JQNQjcUi5FS8aKG0XCpFxiX0/4ROJuoDNPgeXPedWzWNQSjMqQfh0
         2w3lavvgvI/0HdomAB7Hw8p8CEVia8C6cxd0pDlhR4fqQ0IsYE+wVt52DWjfUE+HhRR4
         0aZg==
X-Forwarded-Encrypted: i=1; AHgh+RoZzP3osnt1Njuv8v3YuMv1Txp22YT/EQrhDkkXnhB4b8LOiCcIvu6OumAo+0ivGAQ9hMjfmY5FZzjQ@vger.kernel.org
X-Gm-Message-State: AFuF++n9jyHt/8k+6WDRxKp9NP5aMworp/OeD1u33rYwC28HHdVQR2l+
	bbz/c7AXDujHpZ22TFf4Ka2bHmyGx12WWuR4x5Tc5nUfKSk1KQn18+sWtZjYuNF6YQYAfnn2kYJ
	tvXrSVGNlli53n/bmOIxBWQEPsUzpwAt9ylxZSkhfVgy1qGBocClLNGNwo+0/QBkfqcTXaYpM8G
	1R8J4=
X-Gm-Gg: AR+sD10hNQpgS6wsMHf55wBbyEeqb2oqtPQ8gwNvOAFnN0UdaI3MM7VNt2vUCtdF3IS
	ox8wlhH7Ec/+ct6SKJo1rJJbXiTYZxUVlhgiFWeMEz7wiX2vF5LemUe8WZ+FpotdrJfHYHGyM0S
	fdzzJMSg5qJaaGHflAvBdyUNnY29XivrGL/dStH1JFov2VD0FjI0sXQZ8hVn/7xbeoqfCz7cUsR
	fSp1G9mUtTZi9YICKRYo/U5Em91tcnMcwcZhIe5x9ulhuYKgqifeM+LrwtVKC70UL6qbGWR1nLU
	Vs5y4LWaEqwh+wYfnTS8VbpSLAY51Nu1FGgJ93Km4Pt47LLVZmAICUQkOYpyuR6pR+z6hCw=
X-Received: by 2002:a05:600c:3546:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49b91c19d68mr111597945e9.3.1787932701764;
        Fri, 28 Aug 2026 08:58:21 -0700 (PDT)
X-Received: by 2002:a05:600c:3546:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49b91c19d68mr111597415e9.3.1787932701412;
        Fri, 28 Aug 2026 08:58:21 -0700 (PDT)
Received: from localhost ([2001:67c:1560:8007::aac:cab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cc9497b3esm20792375e9.5.2026.08.28.08.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:58:20 -0700 (PDT)
From: Sarah Emery <sarah.emery@canonical.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@kernel.org>,
	Jia Wang <wangjia@ultrarisc.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: generic: serialise pinctrl_generic_dt_node_to_map()
Date: Fri, 28 Aug 2026 17:58:17 +0200
Message-ID: <20260828155820.4002492-1-sarah.emery@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pinctrl_generic_add_group() documents that the caller must take care of
locking, and pinmux_generic_add_function() needs it too, but
pinctrl_generic_dt_node_to_map() calls them without holding
pctldev->mutex, and the core caller in create_pinctrl() does not take it
either.

The driver core calls pinctrl_bind_pins() before probing a device, so
two devices that reference the same pin controller can run
pinctrl_generic_dt_node_to_map() on one pctldev at the same time.

Both `add` functions take the new selector from pctldev->num_groups or
pctldev->num_functions, and radix_tree_insert() at that index.
Two racing callers can read the same selector before either
has inserted, so the second insert collides and fails:

  k1-pinctrl d401e000.pinctrl: 
  error -EEXIST: error adding function pcie2-0-cfg
  k1-pinctrl d401e000.pinctrl: 
  does not have pin group pcie0-0-cfg.pcie0-0-pins

leaving one consumer without its pin configuration.

This was hit on a SpacemiT K3 board, where PCIe devices probe in parallel
against the single shared pin controller.

Take pctldev->mutex across the whole function, so that the groups and the
function referring are in a single critical section.

Fixes: 43722575e5cd ("pinctrl: add generic functions + pins mapper")
Signed-off-by: Sarah Emery <sarah.emery@canonical.com>
---
 Notes:
   The other two users of this function, ultrarisc/pinctrl-ultrarisc.c and
   microchip/pinctrl-mpfs-mssio.c, are exposed to the same issue if two
   consumers of one controller probe concurrently. I don't have the hardware
   to check if I would hit the same issue.
 
   My reproducer needs SpacemiT K3 PCIe support, which is not
   upstream yet, only in linux-riscv mailing list. Runtime testing was on a
   v7.2-based tree with SpacemiT patches. Build succeeds on mainline.
 
   The two added includes are include-what-you-use, guard() and the
   mutex API already resolve through core.h.

 
 drivers/pinctrl/pinctrl-generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index fd6bdb74028a..4277c8748513 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -3,8 +3,10 @@
 #define pr_fmt(fmt) "generic pinconfig core: " fmt
 
 #include <linux/array_size.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/slab.h>
 
@@ -196,6 +198,8 @@ static int pinctrl_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
 	int ngroups = 0;
 	int ret;
 
+	guard(mutex)(&pctldev->mutex);
+
 	*maps = NULL;
 	*num_maps = 0;
 
-- 
2.53.0

