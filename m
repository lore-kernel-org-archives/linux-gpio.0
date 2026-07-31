Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1448823394B
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 07:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482335; cv=none; b=jr2UGg8nSLiDesyB46tLD0RjLrkFErWsH+ZNfeRXYeFpZljYrBEtn3VkF3YiP7JxdO5S+8+2pOMShTf1dVR2404dkNAwGojwEDqLHnbCUb22WMkui2ZqoDGpeWP8M5ti7iBc2FG56YeYxjGmnymXa6g/3Qp3PU+w5Z/+zRVj2As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482335; c=relaxed/simple;
	bh=guwGlKQZRan/YyZB1J2VYTScAw+n8wI1Q0rBRjKOpL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEFGldu1sqqQambMtVK64FdBmscN5drXBZ/HdQtb7GQw0tKrCYD2LONlR0QBaqc/QRRoClBYsf2mrcNS/L9DPaMIx85jupIxcYzvuYKbq/ew4V/1T0nTKLcJ7+ZKwG/+LfzS2MPz5ZMm2n59wCoF5kC6CKHOO/ygnSbFXl6NIjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4AAiQEV; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4AAiQEV"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so825221a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 00:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785482333; x=1786087133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTsixFmiX+U7K1f0FCPIm1bVwKLa5wCgfjl2CXTFLHk=;
        b=d4AAiQEVLGDP1jmR6JPwp1s2Hb473v87pHE7boYgzycSkDFpgSBQe3wjqnT3Pt45lC
         X6LPyLqL7Y52bf5u+7iT9LExE523uTjoQm8G6ZJxCwcQh4oCHbUEcc9Z0RB3bKTQu84W
         p67HqKgZVC0VzfwbZ76/jKo73stGjFihKKs4fXE5fKQq0WzsvOoF9FJ6E9OqLu25b4Lr
         lGE+s2msDn7Z+cXRQc5KUXfNvKa/BCs+WkbTmkFlAGXePy1RFj0j0Jr3I1TmFAyalQfH
         QD44KcBzJGGqPTOI+WRf9CZgBomLb+dtx0MHNK102V8YcWNGRGSOmq7IBDg2Mmt2iZNv
         bvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785482333; x=1786087133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTsixFmiX+U7K1f0FCPIm1bVwKLa5wCgfjl2CXTFLHk=;
        b=WbeAArxSsTNDp3dL/y96W5g9L2ks0hZqdYBxbNGuM//e/9m1G22DJoPdoyFPgF0Y1g
         cmt7tQINNJb+/nctyCv2mbFAZNwQNK/nHd+G1GttgnIXyiMf0q7/rm0rlOhE+LWlPBk8
         WgKI63p2Ivrqrp7yN0NYnwypNW2zv0PkF5XcpBe8K2/N33eyoTXxmxtfC3mn+fHK3d/j
         43YxOlvFlcsMg0cDDeenU4njlFCjAu0n31sEdr19f/Lq9mFR9hiuW1CahqPz+nZuoMDW
         xe2NKEYeAGTawpy+fIagz4qtcNHan8BF8sN8krexCuyqCc15v1ezAVmG8SvC1M4FAVdG
         H9Hw==
X-Gm-Message-State: AOJu0YzzqfnLFVAcvirbulLdYCvg3tgJV9eb0yjUhORQ+FOuiYprnvaC
	NDR6v6WIOIUSfAHizqX9ibwyk9bdc+YTUcVmXJ72ca1cwJI8KRZq4v3Z
X-Gm-Gg: AR+sD10CuzzkWTBB8DruLDejd3K/7gF2OyRAJKIXZsBTLPgCkq1nbYQCx6B748aUFat
	P4oopqiFxxirT0dfIfZ3XWDzkIFHuyzwkStDpoXVSpCP82sEYRVgHOPM9/Dox6aQ/S5VGVy5D/g
	WOIgdlkRD8+VzzjR2i15NdUT5gyo945iY6CKa9Q/YuUxt+vRJAEZ2AMToOpMKpHVC/EVRfnD2r/
	MjnRdLR2wsMbGx+GrSz0j0j92nBVgusiEUo1FUWgw2PGSgHYivI0F7xANA3ezyG9zDeUjBGVXa3
	hcTyCcH/zDP1GRyZbtRnp+/0HqBCJjNvsF9jkH12vvxY82/AOicpKu6CHK1Q3XqCVPaPcha8nX7
	cacO8/kzWaBFGw+XBMeUKa+m47HJycU0pBaDqxq2AwBVTRa4tWQmaYNkVaQg5aZFbbWZjImYyB9
	45xNcfkljPGjctISpFxn1DAEE7MQuFUXaBn1Ls5KPEaO7W7xMzuDhMbJLB171KX3KQTIo0BbVDi
	V3FMzZKWyJATxzqi2MkneWhlUtVOw==
X-Received: by 2002:a17:90b:17ce:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38fb1190ff3mr954783a91.18.1785482333290;
        Fri, 31 Jul 2026 00:18:53 -0700 (PDT)
Received: from fedora-1.JacquesHQ.com.au (115-70-157-242.ip4.superloop.au. [115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm3655434eec.3.2026.07.31.00.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:18:52 -0700 (PDT)
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
X-Google-Original-From: Tsz Shan Chan <tchan@jacques.com.au>
To: linusw@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tsz Shan Chan <tchan@jacques.com.au>
Subject: [PATCH] pinctrl: sx150x: allow build when I2C is a module
Date: Fri, 31 Jul 2026 17:18:45 +1000
Message-ID: <20260731071845.175120-1-tchan@jacques.com.au>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PINCTRL_SX150X currently depends on I2C=y. This prevents the driver
from being built when I2C is configured as module.

Change the Kconfig dependency to just I2C so sx150x can be built as a
module when I2C is also a module.

Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index eda54aa5fde6..ab09cb41500b 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -575,7 +575,7 @@ config PINCTRL_STMFX
 
 config PINCTRL_SX150X
 	tristate "Semtech SX150x I2C GPIO expander pinctrl driver"
-	depends on I2C=y
+	depends on I2C
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
-- 
2.55.0

