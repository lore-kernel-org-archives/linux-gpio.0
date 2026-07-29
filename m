Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1833F888A
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311689; cv=none; b=Ka9xtPTvd/pDwXsTLhG+qAWIzd3S6R3BIyMW5+KBzcin+WA6b5CcM7wtYA10sMqhZs2SVPxw+CS7v0PFJ5nnB3gVchKlCi226pn15MqJFE8SKhsVlyPrR5chZRApg6yKS4VbKm47g7QmVCWalkB/AXIjChKlN0VxdemCHN3Zg+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311689; c=relaxed/simple;
	bh=YEuZ6gKQryE2J3Njd3WN8bxitPP6KVRTPPI06OtEYQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WG2U9Mug5Zjuqn0XinEaF670vQPuCEWzeschEcjwrLXeQ68v5Kh/P4LYQIUjqLjE8F17eYQb+8I4lGujHz4Q9GlCFC0cuT4px1FuTbzA5WyeVD+1spEUSMGUcUh0YdEm1lH6grcZ+lMrzmTGs66S3ZQoT6+cfs6D7jSaZJS/hZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz12KzP9; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz12KzP9"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38deea72eebso692866a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 00:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785311687; x=1785916487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKG+MabNpbMKXaipIherA7tQ00HJriwc14bih6ExGzc=;
        b=gz12KzP9KtiHibrxqy+2FVILHoL60CCvE64JrdUF3Pb8djoVYyvF74K45kbVMyM6uH
         uffNIq5lXLs8rvK5uw/2aS773m2YbfiP34OSeW0JxeL6/5Zw9PctAwSDcIbMReEuhLrz
         ODHAq0OSKpC54Sia3DXrw2a5UOHc1+Yxdt+0ohdRawcCTvO0QdLh1RFm5V81EqzSaLIa
         f1b/qy8x3mf+r3VRryPCOgiCd4JhFRv+7dZBo0ytRRBgCQG2KrFrn3x5NBrJ7QZQ4rAG
         hfQmBeMFmW99MjykKOjDUuu19fBR8qTSjQi5vk/HUWw+41KWPDsDtu2Q/bZQlpEThrQ0
         kHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785311687; x=1785916487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKG+MabNpbMKXaipIherA7tQ00HJriwc14bih6ExGzc=;
        b=LPVoR8/+fgDHsx+3PBJFJKiKgHKIZ98T8J/Lh2BgI96hRga/BBzQ00B9XjO6skJqhw
         JtIUyCzc9wDFnjhlcuZ9r8iOkVM0AA1nLfbeZmxFteOeN9ohhPLDrfFtgiXhBzGStaRP
         FMk3E9JaK893w44PafKMj7jBNTvOL++60OewP4QBPdfM4+fXV6b6Xa6lQVccEkrLt6N+
         QJ8mZbR0yVzo/jSao3uIZIo+7IDk5dXNXflPG11FNs8KbHYQRI0+7jkElZF48xcovIxB
         fN8/tq/JKdp/k7/pzIIWGzeONsSiDQRjcETcUT0cMjp/b2/Zf2di5CsNp4awwO6wfSJP
         1t5w==
X-Forwarded-Encrypted: i=1; AHgh+RoelZPrQYT9fGt90I7LKqH0C3XWxiisbU61fsnsCKb0YqYAqFsfpJhjF7D85bB1kkQ8OjMPApCiOTQ5@vger.kernel.org
X-Gm-Message-State: AOJu0YzBrwxgvaYiuHnRXmcp2MGjsZ/MtVO/LPSUb9C0jszESRHSYGuQ
	tSCmIM/db8zgBD0cZD1u7chcMBWXRgA4JXnboX47fpMq3IX0Xv72MVc=
X-Gm-Gg: AR+sD10w7up8/B8yHT7gBxKgfhbL8FgsvMM0uv0v2smhALvqwzdYzaHzyfqW0hkKxQZ
	/NOQb/VaESo1/AchDGoPN3OsuwBzAYNibpxcjJzUr8QYX+HEewYAQRHgrgO/ZQ4LItGpASIks8Q
	petQYeWH72svNikpeCmc+H5mnn07KEZfw9X88UXH0MBNaXQdJbjHN/8KXSEuM5R03/jIirOXn2I
	0zvVMUIRNvZQlp/eBtCvdKVPBy5zzZwtWiYJMEUk1tpZkiFUXWMrLa/w2K90uYtfcOfjepwECrC
	ID00CNbqpP+/X4T2ZcDeMpLZNIkAXVFVnfN5JguyIGGojZtQnN27qdwT7KJAwXDMqnf0uGbbMC1
	G8M0CM3G3aTRputdupauUXnDNLxrsfB7/U+1zOHCAS+EWBXKZe93BPQ+QpkeQBBfOJL8L6sH/BM
	X8uCQqpcnWD1/Ra4YASxwiNx9rgvOxmoze7Ig5jl8tkvtsDOMwk+nxlrv2iYFjo2olv/I+jAYM0
	06clqIHQTZi5Pl722wOxNBh
X-Received: by 2002:a05:6a21:3417:b0:3c3:7cb2:8aee with SMTP id adf61e73a8af0-3c8ba5f7795mr6718001637.57.1785311686811;
        Wed, 29 Jul 2026 00:54:46 -0700 (PDT)
Received: from t-rex ([2401:4900:adbd:a4c0:7d16:77af:3a35:c411])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7271f010sm8030055c88.9.2026.07.29.00.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:54:46 -0700 (PDT)
From: kr494167@gmail.com
To: linusw@kernel.org
Cc: Frank.Li@nxp.com,
	conor.dooley@microchip.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v3] pinctrl: generic: free maps on pinctrl_generic_to_map() failure
Date: Wed, 29 Jul 2026 13:24:37 +0530
Message-ID: <20260729075437.101025-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra Singh Chouhan <kr494167@gmail.com>

pinctrl_generic_to_map() parses DT configuration and allocates pinctrl
maps via pinctrl_utils_reserve_map().

If subsequent steps (such as pinctrl_utils_add_map_mux(),
pinctrl_generic_add_group(), pinconf_generic_parse_dt_config(), or
pinctrl_utils_add_map_configs()) return an error, *maps may contain
partially allocated map entries. Returning the error directly without
freeing *maps leaks the allocated mapping memory across all drivers
that rely on pinctrl_generic_to_map().

Fix this by calling pinctrl_utils_free_map() and resetting *maps,
*num_maps, and *num_reserved_maps in the error path of
pinctrl_generic_to_map().

Fixes: aaaf31be0426 ("pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins_function_dt_node_to_map()")
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
v3:
 - Clean up pinctrl-generic.c changes cleanly to apply cleanly on linusw/pinctrl.git devel branch.
v2:
 - Move map cleanup inside pinctrl_generic_to_map() helper in pinctrl-generic.c
   so all callers are protected from memory leaks, as suggested by Frank Li.

 drivers/pinctrl/pinctrl-generic.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index 9759b0186bcc..fd6bdb74028a 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -42,33 +42,44 @@ int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *pare
 	ret = pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps, num_maps, group_name,
 					parent->name);
 	if (ret < 0)
-		return ret;
+		goto err_free_map;
 
 	ret = pinctrl_generic_add_group(pctldev, group_name, pins, npins, data);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "failed to add group %s: %d\n",
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to add group %s: %d\n",
 				     group_name, ret);
+		goto err_free_map;
+	}
 
 	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &num_configs);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to parse pin config of group %s\n",
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to parse pin config of group %s\n",
 			group_name);
+		goto err_free_map;
+	}
 
 	if (num_configs == 0)
 		return 0;
 
 	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
 	if (ret)
-		return ret;
+		goto err_free_map;
 
 	ret = pinctrl_utils_add_map_configs(pctldev, maps, num_reserved_maps, num_maps, group_name,
 					    configs,
 			num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
 	kfree(configs);
 	if (ret)
-		return ret;
+		goto err_free_map;
 
 	return 0;
+
+err_free_map:
+	pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+	*maps = NULL;
+	*num_maps = 0;
+	*num_reserved_maps = 0;
+	return ret;
 };
 EXPORT_SYMBOL_GPL(pinctrl_generic_to_map);
 
-- 
2.55.0

