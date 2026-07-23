Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A7F379974
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788224; cv=none; b=sudojbZwH50PAHrXCPlP/w4hv6/bLspoeJBIpdHwXW2tX5FPghfPbaLBUrtF1M7wr92nNHB7M1ELv2mjbakBoQRkHxvhAIuiddtdnd85AN6RYdzbkmrrArryoO5DbY/YWGEqNP3SNIVABxz9OUmZCEuFt6cfmBmtXbQiKzIJigI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788224; c=relaxed/simple;
	bh=AzSKbAAZKfeNQ1HT28MWXZxKnH0qroQebjSFyz/rxH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T63E8XY37T3WBVo3YMOiUMjFG1AUJ58FGMet82yBicWOSjuMhimG2tpMmD8k6cBI+gCUyWc2n5FmXvAksYd92Uw91Mtcu1u2BTNOiFgsLPvBKdk788kv7F7GpJQAhNK5yjqOvkCaxlsnSo0KUlhVY6VH528w1LOsgfXtLYOAEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7q8Zz6F; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7q8Zz6F"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso260629a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 23:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784788223; x=1785393023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XC15jWYbuvDmoIqvdzDT8TSGK//n7vzWKt/n11W5bYk=;
        b=Q7q8Zz6FgWcjoKZS8KooUt6aWeOi+maEx2+KHBKUOxf42damY83ZJJvyUeCb1tE6S1
         vJZp3yMK7wpr/fu75IHW9JoL037LfpYddVnDxHDZ9IhcS44OzOygMKMBoAnmnuxIwka/
         AVRgdpvOzTP2BwRs69N6PzbY3gyPnuGmylIPzo9lFacLRUxMXMZiQLRcdjL6pvr0myB6
         DcwCmwvUjqUqP5ysJoHTU7jzPqQAdZW9dxzp5teOw1uxQeqGJz+zlgWTV+H3N+zlwgyz
         vd4xXZeavFqBNW33NKWvQZMCLvtUJneU1VnY8+VeKk0vYS/RcfKAnQXHT/2enkeFs5Bl
         SUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784788223; x=1785393023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XC15jWYbuvDmoIqvdzDT8TSGK//n7vzWKt/n11W5bYk=;
        b=NacZRwC/C9HX0/BCgaphzSOB6IcXSeV3ImbO3X9Jl+fhfSz4bU6YOvwMVy+ljtV7Rh
         M/ZY0ZHbpvR4Cka1K+jLldU4haDnS4lLp9iJ6OheW9H0oC7udMHoflB3J4LBdzncfTGY
         V9Rg7/9qAqXMXs69/+UXhsm3lzQ4a+yQEZkrY9yV1XJGM7Xr7bS307bHLxXE5ovxRmhG
         QxKXZrbPQBwgrepGs3dNvqrAy/31SxtUdWZDJyR6m2Obnkr1FRx2LgivzELhJ+2nNy7O
         OcbVcgOSpx2vXzNNYgekFlzJKlVCuG5c+iWQo2EUM/GN8yDprdd0v00EiTw2p5Qu2Hi5
         FtJA==
X-Forwarded-Encrypted: i=1; AHgh+RroieQeTRhzgG5EbQcbQMEtXUzx0tRHZ13gR4vulHSr6ZkeCOqiV1nsIczsNxxm050bv29DK5lV2/1r@vger.kernel.org
X-Gm-Message-State: AOJu0YzPBGdmCSk7pa7uu58gFajlQ7s88XvQV3vaLHR9od0jXFSG4f17
	GWMMKiHzhZcTMz5veo2oOH1svKdH7E8OxWiXsRyHTkAp9UCknatVzAs=
X-Gm-Gg: AR+sD11EQu8FDur9OLbCPEQ4eANy4E1YZOXS9VVgpzN5+NyUwPe49zesV303HwPgL+3
	teYhCIn39qotQudfBlpChQTwLvgfVwzioHdmFxYEMaCFHvtEcbofWqs+vREK3I4FtdHiqhvgUKF
	B2GRcSsegsLKWqoDx5zQ71aagMBnPaoCo4wVGWHDkYcB0vWuT1uxDp6D9Vr/xhQJbmEDFck+Vnb
	OW+4ok9RFY0x6aQ/VA4T6Uf3qQN64gGbsX/q0bzaihr+5uJ68/rBCvR8N3ppQzG17YBHSFDadY5
	AkodchkaxxXzfwrSlzgIeOU1Vqbzdm/lin7yt2q+rp0Et7sm0gzPfwkD+QxKIyH6kVpPA/rUoke
	ipzw95vNjlWe8ZQL3lqk4MwZ2h5TwJRjQuBbds7bVW9apicPic+dG0aUQcumQYl1zY6Ztaapqe9
	GXimgTRj2KOnXbtEPr5AzTgoJSBIs=
X-Received: by 2002:a05:6a21:7002:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3c44afb7068mr1953767637.9.1784788222447;
        Wed, 22 Jul 2026 23:30:22 -0700 (PDT)
Received: from t-rex ([2401:4900:adb2:94cc:845c:fa20:f252:6fa2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df09a9dsm15712805eec.19.2026.07.22.23.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:30:21 -0700 (PDT)
From: kr494167@gmail.com
To: linusw@kernel.org
Cc: Frank.Li@nxp.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH] pinctrl: generic-mux: free maps on pinctrl_generic_to_map() failure
Date: Thu, 23 Jul 2026 12:00:11 +0530
Message-ID: <20260723063011.27145-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra Singh Chouhan <kr494167@gmail.com>

mux_pinmux_dt_node_to_map() calls pinctrl_generic_to_map() to parse DT
configuration and allocate pinctrl maps.

If pinctrl_generic_to_map() returns an error, *maps may contain partial
map entries allocated by pinctrl_utils_reserve_map(). Returning the error
directly without calling pinctrl_utils_free_map() leaks the allocated
mapping memory.

Fix this by calling pinctrl_utils_free_map() when pinctrl_generic_to_map()
fails.

Fixes: 34acc5a8adfb ("pinctrl: add generic board-level pinctrl driver using mux framework")
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
 drivers/pinctrl/pinctrl-generic-mux.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
index da5a5ec01583..927c7aa616f5 100644
--- a/drivers/pinctrl/pinctrl-generic-mux.c
+++ b/drivers/pinctrl/pinctrl-generic-mux.c
@@ -58,8 +58,10 @@ mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
 				     num_maps, &num_reserved_maps, group_names,
 				     0, &np_config->name, NULL, 0);
 
-	if (ret)
+	if (ret) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 		return ret;
+	}
 
 	ret = pinmux_generic_add_function(pctldev, np_config->name, group_names,
 					  1, function);
-- 
2.55.0

