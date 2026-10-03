Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE80377EA1;
	Sat,  3 Oct 2026 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016358; cv=none; b=EnxyYQct1zfzxO61f/nc1seQp6YqwPY4ERyA5fihWTtuC3Nfhc6jv0AS5Y6jKNv1hnyKnVtVrQrQoL/tYLGeZzH+VEfX8nqElWuEc4ILiP2FG+mK1E+oLYfAfRnXpWyBYSbGL/suUR0g36gE//acvBCczmXFWy1OrwcByZdNn88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016358; c=relaxed/simple;
	bh=Hxb5epFuXqTg9dBWHKuafB2Oc3MBSA/CMmAwOQXr1sc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CojDK43rx1rluOBCdjslNMnFhDLmSFrsF90f0oA/5/hkKyrYPpqRuMzw+MlZJsgEUYqA9RRXFRmR9fxxK5FLbcWhU6glJQ+BNeWlOJQzKmXtMWa4Sj9fS71dKy6IQuGCa287zifeoAXl96spbM9TCtH4BXeVUYjjr2cCrLsyGcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MdVXgcdF; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MdVXgcdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=I4
	IgVJEGt2OAuMgU1whO6TJN4Dt+z7L4yrdnwx/WPAc=; b=MdVXgcdF4ZZKw7C9pN
	Nn7BFgQtP0Sy+wSXZjX7huqQh2YwQiW0cUcDMggtUktDcDi24CIismYr5Sf0uRUv
	XN335Zf8go/ER/Sij2P5YoB5izllYG4htRrWPS+IBl6QeVQFEFMkH3PqxUzDa9Po
	MOfbgVvp7/+2/245U9+zn/vfc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3dzGDvcBqKMk7CA--.47308S4;
	Sat, 03 Oct 2026 16:32:09 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
Date: Sat,  3 Oct 2026 16:31:55 +0800
Message-Id: <20261003083200.459705-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003083200.459705-1-yaojiale02@163.com>
References: <20261003083200.459705-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3dzGDvcBqKMk7CA--.47308S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4DJw45KFyUXF1rAFWkJFb_yoW8Gr43pF
	s3GFy5Ar45GwsagFWftw48XF98Can7Jry5W3yUK34fZFsxArn2yF1Y9FWYqrs5CFWfAr1a
	9r45Aa4ru3s8AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEG-niUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8AlclmrAvYmQ1AAA3p

rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
node fails after map storage has been reserved, the top-level callback
returns without releasing mappings built for the current and previous
nodes.

Free the accumulated map on every error path.  The caller ignores the
output parameters when the mapping callback returns an error, so they do
not need to be reset after freeing the map.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index fb874867dbfb..64a89e307191 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -411,15 +411,19 @@ static int rzn1_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	ret = rzn1_dt_node_to_map_one(pctldev, np, map, num_maps);
 	if (ret < 0)
-		return ret;
+		goto err_free_map;
 
 	for_each_child_of_node_scoped(np, child) {
 		ret = rzn1_dt_node_to_map_one(pctldev, child, map, num_maps);
 		if (ret < 0)
-			return ret;
+			goto err_free_map;
 	}
 
 	return 0;
+
+err_free_map:
+	pinctrl_utils_free_map(pctldev, *map, *num_maps);
+	return ret;
 }
 
 static const struct pinctrl_ops rzn1_pctrl_ops = {
-- 
2.34.1

