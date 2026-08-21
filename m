Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6723F58E1
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 05:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288923; cv=none; b=qViGTS6MZSbbEWbpJfVVt2/nQqUYkoF/mmt0EWYKf38zfDdp2xdDe7cUEH/31vbxbclTZJ0c4L6MOI0uyBpALYHib29Px78SvCETVXP8tGhRgQyNnZeNra1UBI4n6CgnUVUAaIQDksJsTt9OJ36cg+Iy+ZVKWZc/gkorWg4C8hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288923; c=relaxed/simple;
	bh=Je2PC2ClOZ6ieh1+XV2YNDlQhlBw/r0Vx2k7n3eR9mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljb7BdsDQo7eiNQGN7USwYne4Kez3aiji48VP9Xnm4q1JzXfCk3WLm2cQNbUH8xSfwYDoNVc89BWYCIe/MNDusQpxEK16BDZAIjJK7Iz1ruODKrcauQ0yy6KM2QzWAuBKEMfxubDOsGQ1Tp2Dfosk9seMh7KAoXi0elYyuD3POU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXFv4M5g; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXFv4M5g"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d58efc7356so7557875ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 22:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288921; x=1787893721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=li+qf0ogeiJJV/dt6j1H68lCeDSe/pGSxo0/wCxLe7o=;
        b=VXFv4M5g6pDusRuVrM6YA4uiQ/p3KUesx5eYROguD59bJZ21bGrv2aDzZshgGo/1Nm
         i47XUFgCaZyGyRx5fi4wH36z/N0a2DN7snJ+DzQ5lfQpiy7//93St+fNAC8gYMXZlNLZ
         P8J/wkSZQQ+hpQKgxShm31m8AW4f1JTR0YSjqAV5ScJzNlYbQtNRJK2I0H32FTPLnF/w
         r6mZy/DCxpn5mD2dCDchannWRZ3JGQ9Dhtb8NQfk8+xPc20/s3XGQMkEI+SJuRBiQBCH
         dD2BRRCq0GBmc/+0r1hBaR8v//MwbxVSXuwd0EVUtlb9HYSnDWVZLz7xN5qxwjhGIaQV
         RZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288921; x=1787893721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=li+qf0ogeiJJV/dt6j1H68lCeDSe/pGSxo0/wCxLe7o=;
        b=JDHrG+ngm+63TeQO/XVlVGhb9oVrJR9dG6oQ/XEzTjpRlCQ+7xQj1bgDOH48jF6Now
         boB8BgVFVpXSSX1/kF66gHk3QQC24I/u0lFwyehQvJNyyefN5CG0ij+xsSw5lpXPa6t5
         Iv8jLkC/p1J0BHcgJCgcLHTf52WzyKJhJXI//lj0fwwGxFQOcv9Y5ixuVxJLdbHq5qOq
         p7od3KBt+DcRBDzOIalqqWxWB3QbN6U2gyUCNNXXYiOuq6uL1czXbfXa/BABc27o1ueW
         GfMN2XPopA7tw6L/I50GyecfVky/o0Px7Shglzy5SMcVr8/jP2snxTfD72AugP+1V4KB
         cosQ==
X-Forwarded-Encrypted: i=1; AHgh+RomFz0N+RoZ8BTWNYFOGxy/M4vOqMx0SFtfu3S7unOlxAMJW72br7GGtK/N0dWVjtHL7x5fAHGe1ZZc@vger.kernel.org
X-Gm-Message-State: AOJu0YzyCektC0N7vf9FKqPFtqMUNvaVdPoKsHRU6+wxxMTABOEFIMYc
	RVSu+BUgGPqRHq3trhPNv/d8UsgpCwD27aMz1PE0uD4+4N3YADxZrpCG
X-Gm-Gg: AR+sD124KBgzToLpbLTvMAFeIVrJM6dkVm27PAQ69H7WubXcOkcIY/IfwQuAgX7SVph
	GnkkkmniWP+zBPp3dN3Z+sIw8Pw2fBChmR9CqarLQTOjkffRqGbxo4q4inPbpe1G1sLzllEpx/B
	k+MtTGHRlBXSCKy0l3E8lms0kCj9Ya0B/vu+KCzR7U8XdmpCVdzrUF8mFLRNmYP0GO1MmdYUkOn
	u3lda4sFt3PKbMWFa0gYpBu8P1WjmVp7mn6wUogax++RcKsUGSqO45j5cu8L8dgQLR4L8dwbeE0
	tQEbJ3WdbNOsF+XbA6O7T35Ld52cMZAbI36/R9qtkxL3Kn9nZQb7t67lY7foeBZRzKVr7hgAUqS
	WuvgMwdfSFuGKHN1kwpkAivplSEfd5fJgs4onEhIqhIaHAhxD/PqWlWj6/vCI1mkmI+JRnWWNPi
	ePh2Q4e+CDS4SmlF+AI+voufU57HKD7yPW50kpl0yQzZ774dbO/CT2DGN55rn4phPrkn1rzDPDC
	qZx/7y/A0SN9zmpkOS3Kanvt8BFEZvIiPaP5FTPkoVqQ3o=
X-Received: by 2002:a17:902:d4cc:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2d64b0c6a16mr64910855ad.14.1787288921196;
        Thu, 20 Aug 2026 22:08:41 -0700 (PDT)
Received: from DESKTOP-8BCFI4I ([202.12.123.126])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3993dsm20673822eec.5.2026.08.20.22.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:08:40 -0700 (PDT)
From: Md Rabbani <rabbanyhmm@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Md Rabbani <rabbanyhmm@gmail.com>
Subject: [PATCH] pinctrl: freescale: imx1: Fix device node leaks in imx1_pinctrl_dt_is_flat_functions()
Date: Fri, 21 Aug 2026 11:08:13 +0600
Message-ID: <20260821050813.739-1-rabbanyhmm@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx1_pinctrl_dt_is_flat_functions() uses for_each_child_of_node() to
iterate over child and grandchild nodes. When the function returns
early upon finding an "fsl,pins" property, it does not release the
acquired device_node references, leaking their reference counts.

Switch to for_each_child_of_node_scoped() to automatically drop the
node references on early return and loop exit, matching the pattern used
in pinctrl-imx.c and elsewhere in this driver.

Signed-off-by: Md Rabbani <rabbanyhmm@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0..4a6bdaefa4 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -547,14 +547,11 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
  */
 static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
+	for_each_child_of_node_scoped(np, function_np) {
 		if (of_property_present(function_np, "fsl,pins"))
 			return true;
 
-		for_each_child_of_node(function_np, pinctrl_np) {
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
 			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}
-- 
2.55.0.windows.3

