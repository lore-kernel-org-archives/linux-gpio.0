Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AEF385D64;
	Wed, 13 May 2026 08:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660250; cv=none; b=hEw4z6OgvNO8PrD/fM+Oo7dcAR5cUnjvct/nGH9OZ3ealmSe4pkM9uFtI05AGbvhiDEdYBJYT9idf0xq1GOgnGunoPfN8gvFYfoKRE4HnS7vJmV8bYe+xeHXFl9sBcidCBu7hAT4dt3qdqMR7R9dLQUub3OZ9oka0IF+rYVKuKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660250; c=relaxed/simple;
	bh=GItI68PveC34KXEaGotOESlp/XqQHAJQV5gB8+kI5QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PN3kNwq7L5ZNnxOJtQUKkfUhTJ10bwEf0j5yH6r0sqmy96uSK18eG/FH7wcu3Prou3yLCQjEsp6AMWrHr9onlEfubbN2sQY9uJkACuhFj74TU97/5gWljhUmynq3pxYtIeJIWqXcb8TezfwzjFg8KTv1ntT/UizVpuHFUH+qxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eG0duiJS; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eG0duiJS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E4043C5DC48;
	Wed, 13 May 2026 08:18:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DD31606CE;
	Wed, 13 May 2026 08:17:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2ADAD11AF8790;
	Wed, 13 May 2026 10:17:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660246; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2wgXoEE23jW8P9I06trxVet/K0Ld7403TpqPZ+ivRA8=;
	b=eG0duiJSz7o8D6LRakUS/GtdCzdVyOS48mwfSzTo8KaS+mU7araV3tCMypBdc9xikIR1VP
	QGIGzVZGvV1dNsreDAIpca1rl9Pz7EWmmVUPY2ANA/FNllS3O8QQ928OPSqfxxqGhoWdh2
	lO5X5Pr6IUT6s9DVuLUpx8MFOyuyIo3Lb9ac/vDa1Wli2RxgGMnq2WAztDbbWSdO7tCzh3
	wXq7kDtsp8ZSLpRJjAjOysgWozpDl6+eV+HEAoOKrkQl7WNwD5/LWFK91ovK5hnjv4iFh3
	dFbom/djneNJLO3L4vGqJ5dGIR6RJx9wkN8ycvHF8xuZPTykNcc8QYvoEbT7Ug==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 04/17] ASoC: simple-amplifier: Add missing headers
Date: Wed, 13 May 2026 10:16:48 +0200
Message-ID: <20260513081702.317117-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513081702.317117-1-herve.codina@bootlin.com>
References: <20260513081702.317117-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The simple-amplifier driver is a platform device driver.

Add missing include files related to this kind of driver.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 41485445727d..5b44bcfef49e 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -5,7 +5,9 @@
  */
 
 #include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 
-- 
2.54.0

