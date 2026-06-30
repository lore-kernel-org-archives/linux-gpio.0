Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B034043C07E
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831114; cv=none; b=hHwJWgv2TVNgvUH3SkRcAlrtro8THDgAClfhtmHqnx8mWaDTjA+nTCxZXta2ta4LbpMpks/Qm2Tg2rpENgQHMU/9pFpuft4130PxuZ+NmFCE3BSe3AdZuDRsAuUUAKhL7SOuf0Yud3zkWdRlnilUkx1kkDQRawfetVe5QPdCM3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831114; c=relaxed/simple;
	bh=FdovKUpFthtZZd1VKz32OjC4jJoe0pHkBeBAKLTHx8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HrID8/m7ps42jkvTUl36pULRwhjlw5dDVz7yyNU0miH2HNQ6Lrf60KFTV8nsSyDTL7cpvsmTLJqtcI4yEIhwGv+w8mA2EUvEnFzeMNzPgYscV/AEZ4o4pZlFSPLiXeHCdw0VEHyOmtEtnDR4R2yVFkBojUwhzn+UfBZAYafU+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8Ko4K8v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8Ko4K8v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05561F000E9;
	Tue, 30 Jun 2026 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782831112;
	bh=f1WivIUCU+WuFrvhVAT0FbfccEAElJNp/y6Npyecngg=;
	h=From:To:Cc:Subject:Date;
	b=U8Ko4K8vq1/ZuomZOuoGdBogeNPBPEfgYMUGh47o4FmPhG9BmIpFhhJ2G4UQEZRFJ
	 QNatX8O1sPQHiCLa4P84tUbL0K086ymgCAiw9Wm/y8QlgGg+mCiV2v+CK3y1m8r3hX
	 RnGrQscWiTUCSNfUuPRgFo0YK7zo8EkFyfMuRh+pSppGsixHB3dlgXpfHEy0TDRBuL
	 UQDbKgFRUCRnMswmta4Sczl9ZujJL2lkzSRkIs6YKYidKgiGp4985o6pJp7XPLlH+2
	 y4CW3eMZv3C20knB9pjhvNFQG6ZXKIcz/pA1QoW6MECP210/LHDkLkM+bNAnEpF4Vh
	 FciTpXINKFnNg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?q?Richard=20R=C3=B6jfors?= <richard.rojfors@mocean-labs.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: timberdale: Return -ENOMEM on dynamic memory allocation in probe
Date: Tue, 30 Jun 2026 17:51:48 +0300
Message-ID: <20260630145148.4081967-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Out of memory situation on driver's probe is expected to be reported to
the driver's framework with a proper -ENOMEM error code.

Fixes: 35570ac6039e ("gpio: add GPIO driver for the Timberdale FPGA")
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/gpio/gpio-timberdale.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index 78fe133f5d32..ec378a4220a7 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -228,7 +228,7 @@ static int timbgpio_probe(struct platform_device *pdev)
 
 	tgpio = devm_kzalloc(dev, sizeof(*tgpio), GFP_KERNEL);
 	if (!tgpio)
-		return -EINVAL;
+		return -ENOMEM;
 
 	gc = &tgpio->gpio;
 
-- 
2.51.0

