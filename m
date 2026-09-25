Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C774143B3F5;
	Fri, 25 Sep 2026 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341231; cv=none; b=Uc9Zs/gjRzRNSpcgq61JnGiFd87JMzWVM0Ghw9WlIworsOROFlymSaFbYjdoHfe4S2sOOQU8Bo3mNF6GKAfF+UymRlVlzg+GfWHqHL4hzErRSQMVKNuEKbEfOsdIJHBgBdx2E2ZndJ8HXj0L/H4VgzFCei/UzgBhtzmVof5jxgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341231; c=relaxed/simple;
	bh=gN0ashIWDVSBSbqxfYsqOHjt6M1nRjQf6HcAMer7uh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SK0K1U5xB6i37IW3/QqvdGqRssN63zqat+Bynb1o2PByJY8mAz8Lmao8SB30DQBr/PUqZajnELJrTIiCvXJxYdGBa1YmRoG/gJenhtsoI9jJ6JUWXBwr7SPEDQoEzFaUHmtCkURUmZZjQ8I1roozrkRxQjjAEPdTQ/qblgKeFTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1+SZLTT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1+SZLTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C901F000FF;
	Fri, 25 Sep 2026 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341230;
	bh=5nFLL35mDRLIoBcpxCM7z4kgquNZRaEA2pnvh23+BwY=;
	h=From:To:Cc:Subject:Date;
	b=I1+SZLTTPfAMaYRVEHBQ/SThcxg30AL08VU0cJGgGx29bfnWCS2OmOivfnuAViAaw
	 7NbyzDpUPGMLDF27HRG90uXiX+a0aBd7mGIkwkWg2/z7gzIA4Qx72q9zTEXjpexwTN
	 7sE+LMpUHlsa9w7KSdlM9dDQzln3AeKQbq57n4Y3ykqc2jFwCWLLqUwY/YJgviwHA1
	 DUS4ZtiZEranVj4J7upGCpLkfQsMaRf+3QMCyAoTcwQm/7HYkAplusqdoE04PrtWZc
	 VNIPWBPwoxOL/9OYOa2cMS974Bt58orzOPyIcI0wCBDzYfrL/6QygKlVxHDYh3Oy5d
	 sq2v+/yikxrAg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <error27@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: fix CONFIG_PINCTRL=n build failure
Date: Fri, 25 Sep 2026 14:59:58 +0200
Message-ID: <20260925130025.3882279-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

If pinctrl/consumer.h is included before linux/errno.h, the missing
error number macros cause a build failure:

In file included from drivers/gpu/drm/tilcdc/tilcdc_drv.c:9:
include/linux/pinctrl/consumer.h:110:10: error: use of undeclared identifier 'ENOTSUPP'
  110 |         return -ENOTSUPP;
      |                 ^~~~~~~~

Include linux/errno.h indirectly.

Fixes: b44aec87658e ("pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/pinctrl/consumer.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 7be49d447426..81e7866bd2e3 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -12,6 +12,7 @@
 #define __LINUX_PINCTRL_CONSUMER_H
 
 #include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/types.h>
 
 #include <linux/pinctrl/pinctrl-state.h>
-- 
2.53.0

