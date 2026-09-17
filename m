Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA18B358D27;
	Thu, 17 Sep 2026 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659466; cv=none; b=tjVjejus4FVvkC/bCMQN42QFKQzhIQjPRkDtbJWurlu5e121egffAAN9HLZjnUL2WRGSJhUfNRrSxnBcy1FzhlFnfLheaKZxDeIbY1ZxYBR9+Q/M8Xkt28V5FG6j/tkAm6OCrb1HoNuMCnIYqVwRxJDYmwHvMjybbkzLlSulhB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659466; c=relaxed/simple;
	bh=VUAW9NKlxqOK7RBxed3VuAlb3pspvJ59kI354N187dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ASaLFojCU+xM2iTuiPd+w1ClpT+p1W8yulQS7oMSlwfLuUg4upCPEJm1K94Wh3iTnz+M+v8h1UG9nfqDHFeDCjIYMIqH/6K11JrGYJ4HS7QfdLbRsyK011f4duG6aCCEdWi1fdIE5vBN7HDqoI2PQPT4aQuVSC9G9zJ6KFkWtkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=kklYlwvY; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="kklYlwvY"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id F0ACD60F04;
	Thu, 17 Sep 2026 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789659448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EWj9VioosLpk74B6lLbbnxdtdzOYxaz/vgqW8+QGFb4=;
	b=kklYlwvYL8g1oev0DSOJQEztAdXsmgJv3jQklz8IGD9p8DqqQ13WlUgt/xuvoq3XbbTRxz
	mgy5FaqVWJ/7TR5pKqoERZ32OeYvnGnlOs7MWmMZWD/JE4KaXOfnkZwBU+0Qe+f6wffbqw
	ktP+ey2jn3ZJGf/DQx53ipzD3cR4RzM=
Received: from frank-G5-5590 (fttx-pool-217.61.148.160.bambit.de [217.61.148.160])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id CFEC01200CB;
	Thu, 17 Sep 2026 15:37:27 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	frank.wunderlich@linux.dev
Subject: [PATCH v2] gpiolib: use of_node_name if line-name is missing
Date: Thu, 17 Sep 2026 17:37:11 +0200
Message-ID: <20260917153712.134367-1-linux@fw-web.de>
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
v2:
- move code into loop as suggested by Andy and add comment about the reason
---
 drivers/gpio/gpiolib.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ef8ccaf17c9c..28f7265c5d56 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1029,6 +1029,13 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 			ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
 			if (ret)
 				return ret;
+
+			/*
+			 * If no line-name property is present, fall back to the OF
+			 * node name as in the previous implementation.
+			 */
+			if (!name)
+				name = to_of_node(fwnode)->name;
 		} else {
 			/*
 			 * GPIO_ACTIVE_LOW is currently the only lookup flag
-- 
2.53.0

