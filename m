Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66212798F8;
	Sat,  3 Oct 2026 08:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016352; cv=none; b=lVsPxQVpciSJJN3opuUs9aBb/uFk+fPyKQIS2drQjmC6QYV1DJW8Zeitww7VrHvi4x1bTm37bldBYLWSATNc63DaCV4Oi30hLLK617UGdJoPIgJc11UDx6xInYNOlU/FHTulBnsCMQLUGL2nxQZX8J66eX5/SfmkO4+BcztdPAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016352; c=relaxed/simple;
	bh=R5XW0maL54N7BXAB4gQ48NB7+9a55aFyLFMQBe35o1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DZJgWC1/QvSaT3lnzXlD0UH6uvrBoVwMB+qUpZFnxiCVySdJhiWS8O/0U4sD4r/kDgqCviPtQRDL0m39k2NEqOLzdCtpSmZB1UjYNTLFCQx/gcZ2Tl88IMoesO13Vx0v2gTkR7W2OKz9aew0mM9//5e4mO64IfaBe7BglPHW7mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RHykOafi; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RHykOafi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oI
	BAjJv3rl8M8ZGbNQVG3tG7cwyjlet+0J+w7M2quTk=; b=RHykOafiCsdKeABmqc
	9esV2deB3WK8z41dYIuZAxWfeGj8QXXzzoF9uYBU/Pk7HydK5bzECAsp7kH33IQI
	1ri5SokeVWnVFeUEBn91Owr2Z4avA2xr48Rq1HbyFftQhGUtzklJk0E+ITD53G6+
	2H3XqTLQuhvOr0jJVEQyJktLQ=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3dzGDvcBqKMk7CA--.47308S3;
	Sat, 03 Oct 2026 16:32:08 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Linus Walleij <linusw@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 1/4] pinctrl: sprd: free maps on DT map failure
Date: Sat,  3 Oct 2026 16:31:54 +0800
Message-Id: <20261003083200.459705-2-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3dzGDvcBqKMk7CA--.47308S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF13uryDCryfCrWDCF45Wrg_yoWkCrg_CF
	Z5Z34UJ34UGrWS9w1j9r43ZFW0ya1UXr1I9r1qqry3A347Z3W8Jr93ZF15Gw1xGw1fAr9x
	GryIvwnYvry7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMoGQDUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQhclmrAvYj8FQAA35

sprd_dt_node_to_map() reserves map storage before adding mux and
configuration entries.  If a later operation fails, the error path only
frees the temporary configurations and leaves the map allocation reachable
through the output pointer.

Free the partially built map on failure.  The caller ignores the output
parameters when the mapping callback returns an error, so they do not need
to be reset after freeing the map.

Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 16cf9d15f247..a565d4fd4233 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -326,6 +326,9 @@ static int sprd_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 out:
 	kfree(configs);
+	if (ret < 0)
+		pinctrl_utils_free_map(pctldev, *map, *num_maps);
+
 	return ret;
 }
 
-- 
2.34.1

