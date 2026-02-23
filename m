Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1E2221726
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 19:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771875891; cv=none; b=lnIgybh93IOpf84t/AUjxNNZ7eD75jGKlfPVQ9/YE0UKWFsw1AbRaJOfws5stqsMct9McVfz5te2ghlktKsPHjfNCURtCazL7tNVJFC24N08qoYGoUdeVBB5MVsjOzfgFs9nqmxMTGT8isMNbQNjqrkACdVOaLsv0IBqojQmh1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771875891; c=relaxed/simple;
	bh=DXzzTWhhtfFh17g/ywoBfZlOJQW3+enMt+4ZMYExaDQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R58+I/y3GzyOffrY/o+uN3GdsHi7uClN82DbHjCfjVpKUchIsWGGmmVNL4ehYoiIJxNyegJWB+LReW0JfR1mVR+eHR9aFsW9Bx7C/5YMnJBU2ExC82xdGrYPC46VHIR2Hno71EeonbaIckgpwCXx7Jr8HWprwU0sInb/G4Osqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.162.218) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 23 Feb
 2026 22:44:38 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	<linux-gpio@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] pinctrl: rockchip: use *enum* properly in rockchip_pinconf_pull_valid()
Date: Mon, 23 Feb 2026 22:44:23 +0300
Message-ID: <20260223194424.19251-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

In rockchip_pinconf_pull_valid(), the pull parameter has *enum* type that
is not isomorphic with boolean type but it's used as a boolean expression
in the ?: operator.  Compare pull with PIN_CONFIG_BIAS_BUS_HOLD instead,
dropping the unnecessary ?: operator as well...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
 drivers/pinctrl/pinctrl-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 816823403e97..6d0ba2a258d1 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3577,7 +3577,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 		return (pull == PIN_CONFIG_BIAS_PULL_PIN_DEFAULT ||
 					pull == PIN_CONFIG_BIAS_DISABLE);
 	case RK3066B:
-		return pull ? false : true;
+		return pull == PIN_CONFIG_BIAS_BUS_HOLD;
 	case PX30:
 	case RV1108:
 	case RV1126:
-- 
2.53.0

