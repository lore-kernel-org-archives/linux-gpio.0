Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D264F647C;
	Thu, 17 Sep 2026 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648593; cv=none; b=oJdlxw6MQJwRYJ0bWTHsbP4Y/UD0CTQ5PUCm0kHdn5lF/049W9iJGDbv8VD1dYXGnXkQyfi3m/1gLKuZm2JfT4+642I1MWzEvdT3cUFedsJBMTSslxky7XpSFn86+YcAFHdsCha52FnVNFna11zTrFWxX7FFZ933MBNS+q2lPkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648593; c=relaxed/simple;
	bh=vDFNqr6wrO5a5WZ86wEzQNtQWw7SNvsqbvr6B1fcDcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pjTgibw+O9q5V/ILdWqZU65dcGQc+4N5pv/91tonKsqu1WctpJMrhoeywvsZA1rppJHX+X8ggKnS4RjrlYRzjcI7XPfms0Uug/+Z+ORPYIXlZOi01SYAqO7RVy/0MMtq0R68RpQxEcQ/J71NuzqzZ0im/czzal7OLCLDMu78IwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=UN5CSL9u; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="UN5CSL9u"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 93F65101037;
	Thu, 17 Sep 2026 12:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789648109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P65DvSEjF/5oOd6NhkSx9EnAFvz8DzcFYjVCih46KL8=;
	b=UN5CSL9uGT6IFiFSyNo9bivUJyMMhrkAIrMIyNdsQ523FQAskZe80dAX/fZlBQADNyKmJx
	YTtqUC6Ye2gkpY09VxAzfCEI6JgRZ3c5wZxp1j8/f73rPNuMrmB/EdWWiSwZoklIGnc02D
	EXPeJ6zQ4tPH3d8Yt+RvChkKNoSVobE=
Received: from frank-G5-5590 (fttx-pool-217.61.148.160.bambit.de [217.61.148.160])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 72F131200CB;
	Thu, 17 Sep 2026 12:28:29 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: use of_node_name if line-name is missing
Date: Thu, 17 Sep 2026 14:28:13 +0200
Message-ID: <20260917122815.88601-1-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

Until v7.0, GPIO hogs inherited the DT node name when no line-name
property was specified. This was implemented as a fallback in
of_parse_own_gpio().

Commit d1d564ec4992 ("gpio: move hogs into GPIO core") moved hog parsing
into the GPIO core and removed this fallback.

Consequently, GPIO hogs without a line-name property are now displayed
with a ? in /sys/kernel/debug/gpio. Restore the old fallback.

Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ef8ccaf17c9c..acf41cfbcf10 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1013,6 +1013,9 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 
 	fwnode_property_read_string(fwnode, "line-name", &name);
 
+	if (!name && is_of_node(fwnode))
+		name = to_of_node(fwnode)->name;
+
 	for (unsigned int i = 0; i < num_hogs; i++) {
 		if (is_of_node(fwnode)) {
 			/*
-- 
2.53.0

