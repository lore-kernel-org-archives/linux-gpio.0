Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1E3E1714;
	Fri, 22 May 2026 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445397; cv=none; b=o7ce0wGzZ/I9FK9Mc8NFZjHQxP9hZbKbSuowTTYF+EBKWKKnWyX2NJ2koDpDmUucSXJLRtAcVg3lJoirTDDaC5hfJLMi01tTXxIWygHa0V3gcur/ZzrebWU0OsegFILh5cl9xw1OpSw8JZzjNpUbKcv12ceBzd16ox8ew79SJeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445397; c=relaxed/simple;
	bh=r94YYOnneZl5g78y1Es6ziDHoQfYcRQPd4LSXbGifKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAfYPM4b/WQ8mZ63+Iq5kx/viBGX624VkRYv329jTYDZGXSwH3Aip0hr0K8O8wwFIpOo7siMNDL/6l1TLfPYNQf0mtDymLKu/RSVlV9xBeU+W4Vbz8ze32Kju57mAFjRd0gNuh8xucmrpqoOlqGMZseyUcvNUebJAQJNQhLHCgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4AcwFSO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4AcwFSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301461F00ADF;
	Fri, 22 May 2026 10:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445396;
	bh=gbq0415eDXwHx+EGm1lEW07SwsGVGhqSlRkLd2RKaRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D4AcwFSOPwtCgn/zd8cI/X4smXYqc9Kx5X0OeC/WuJzX45TkGOFKppFX0Kdk2Xx+z
	 iUCQz22SQjKKIDsu2jOspmlvDhi4JvwXVUpYQlN3pDoJclvi5XL8rtJazlX9tMC22M
	 lA87RfPINmNG7ZjKYoS0xVLzdeM/cchbr02w6oS5W3I80a2Eu470T1M8J1UDHm04Dp
	 fPM95kN0gByalsYpwuwkbclwpQayiBN/0K8/OqaBTOr+X5z1TAG6sVE5fL9UQH+GTv
	 JDANR2+jGD7h6BW/W9yRsgcpcFrABXLS0zU3EyQe+GdPfin0s/g4rV4mZhCf9ZGH6L
	 MEOQfIC31dFDQ==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	wsa+renesas@sang-engineering.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 4/9] pinctrl: renesas: rzg2l: Use tab instead of spaces
Date: Fri, 22 May 2026 13:22:46 +0300
Message-ID: <20260522102251.1723392-5-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use tab instead of spaces to follow the same coding style.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index b1ffdc133987..517001145bd0 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -407,7 +407,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	oen;
-	u8      other_poc;
+	u8	other_poc;
 	u8	qspi;
 };
 
-- 
2.43.0

