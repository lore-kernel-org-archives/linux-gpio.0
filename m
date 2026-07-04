Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E3D25B098;
	Sat,  4 Jul 2026 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783177871; cv=none; b=C0gzJZQbqK6vxAq7MjOLRd4sh8/HU7yUBRdNBuoIy3SqlvMTa89kmJX3cPiWk+UjYFumAxFz+kV6gFB9ifTZ1n/NPdvDogD1q+rlV1PA857VTBsy8xZYm5p1Et2+BVXIbUitxHhZ+LvplQUYcIrDfvmrspiXKN8rJnV9BuDPD1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783177871; c=relaxed/simple;
	bh=CbTXr+lA4+EPkNUM/++a0Ubhfu8sVpy8bIFu2D+yz6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sygye0l3hZtrrxKXcWE13Khxh2YerxfFnXaXAWNbAg+8ZiDHkYlZrtB6FUZYhOSPxz2KQwFiDsznF3ov2XVO0Alp9egen7v2Dmgt165/4iSsPPDKb5yDZ6jWsvrA1nbapjs7/XVjvhB1/ZSOAa0iahfcbhkNTJQUlbrQc6UOQh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wzVBOJOT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SZJMitZ4; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wzVBOJOT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SZJMitZ4"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gsvFv5tyqz9v9T;
	Sat,  4 Jul 2026 17:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783177859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fr/TUoC8EfrwMuHjPOSvC9Rv2R/dV+pzUOtY34nMog4=;
	b=wzVBOJOT+VmzkSsRTirGdi/cwm8et+WdiEMEOoGAC03ekxLM4B5LiK7PTHv9OIq1+orggF
	dL7fTxjoES5QOde39uAZUcAUoC6+Z9X5IXyn8pnjnCXdyyRK3YCDl6pH63QDujkZ/xHV56
	8+pNPrr6M33HB8I9K8PKTi2sz95w8TFvmPQchWj8Md6jldGaGvL0oMA6PhGBAYEzTUhAQJ
	6KUvG783gzu3JrpmAakevkZ9SRhjwXs5ApxUke+ty/W5QP+388e3SR8Hg+dgXC4qcMNw9k
	fBN8bmLj9l1boZEHpThrd53WRtG1MNKdh2nLlZ/x0guk2WeRCPY560WZfj2pxg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=SZJMitZ4;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783177858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fr/TUoC8EfrwMuHjPOSvC9Rv2R/dV+pzUOtY34nMog4=;
	b=SZJMitZ41o1izVh+2jEjK1jI65MtztHTTBGSAJdWq5UsE5XI+O5U8/JM0RF52mo7MjCCxn
	UQ/CEuD+FMRQdZlxa6MmlcbocEUZPedX0kMuFQzTVawlaIHvSQipDs8+kFTw3kI/+SN5+x
	gci/w5BamU8xF+Rfo2P3hC3uuUfmGri9PV8zLvc0gUGCwFjXnoiyIWR4VBo8HFrrB/moYd
	2lcWupwTm1iu/E7ByXBcbmHCnjPxEF2DtsqHWuteSfQkC34J2TNMkfoGJtzaL1EU1n8FAt
	UcZrQxU3wd8p4OlU+g4bJEcbW8kHP9bf8Nu+g8urzAUUtTkErUq8Rbr86+RMVg==
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] gpio: rcar: Drop unused FILONOFF macro
Date: Sat,  4 Jul 2026 17:10:39 +0200
Message-ID: <20260704151055.211082-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 86rwpi8u415zy666a4odkgak59ew146f
X-MBO-RS-ID: e08292fc3d51beaf01c
X-Rspamd-Queue-Id: 4gsvFv5tyqz9v9T

The FILONOFF macro is never used in the driver, drop it.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpio/gpio-rcar.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 86777e097fd87..09bebde5c4260 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -59,7 +59,6 @@ struct gpio_rcar_priv {
 #define MSKCLR		0x1c	/* Interrupt Mask Clear Register */
 #define POSNEG		0x20	/* Positive/Negative Logic Select Register */
 #define EDGLEVEL	0x24	/* Edge/level Select Register */
-#define FILONOFF	0x28	/* Chattering Prevention On/Off Register */
 #define OUTDTSEL	0x40	/* Output Data Select Register */
 #define BOTHEDGE	0x4c	/* One Edge/Both Edge Select Register */
 #define INEN		0x50	/* General Input Enable Register */
-- 
2.53.0

