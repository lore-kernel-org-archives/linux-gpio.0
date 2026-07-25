Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6603603E0
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784946122; cv=none; b=S1QLLlnnTGlKeg5sew5Unc4moaF4GkFMfJZt8OCwr6P/2c5QE87jggKeQEJpSg8Rv/0vLXutyph73+m+36ifQOtJHIdQoEdPJl0s4zH+didqhJTTBN5nkHqau7qjZktc6KYdondZRlXcHL7tL/rXHaDZc6Y+/XXIb9XHEHbJBnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784946122; c=relaxed/simple;
	bh=5UEYcYyjjY3SOWoaiJ4SAjYJjXuFSRh/DHUfYF6etEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKLvzi/Uqz1lWrHU0Yy3nbZyeDZR5kpfZ1pSqTtj1doNg2kI+uyJnVSlvQPRrgDPLcdvhlHOVQLC5bBVHSJkObaQ9SDUa2INhOmhljOGFihkgsvmNUsn7GCEVyzCIEnVL/sl3NDPLyPpRnC08WfYuDLrxc3hL182YwMKSPAFxwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ptYb5i4S; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptYb5i4S"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso11986025ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 19:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784946119; x=1785550919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMDGd9nHDZFwlC3wb/2FA/AZe4zicRNBJy5t3j3kPU0=;
        b=ptYb5i4SP8TOtmKCta/F1QHuZuuVMqomr0UDxZTxbON03heu39Gy5lld8MU1zdLOhf
         wDtOhyIRjgtnXPf0sNzHQNl6d0jt2nGYKKKFejW20nHPVBnfty+Zf8DIXaRT3imjDhFa
         eGxs+IR2I3vSPNUzv3LJiCe8SZsivCo7qbjCug1WMG8cG8HsqbrQlRRamz5xth2i4i3u
         1+7DL6+l0sB+zkTG9ZTTJWiEYAZjnK77MuFmZ3LUZ9lMKwqBtJlSYqNGg59hj6OfXxqW
         GsB2YKpT2F2yD10OGlsfJehBdwOxvHy0wGSQSeK9Q0PEYs1gkWPfuoRtT8wmmNHVvXx4
         FSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784946119; x=1785550919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMDGd9nHDZFwlC3wb/2FA/AZe4zicRNBJy5t3j3kPU0=;
        b=MnnqbUgaL/b/jgLu41RCJZ7D/8C6Ue3I94mrrCh1A//CstX09BsGfutnJgGMlI810c
         dUSUj4VhX65xfJlgb+kmjDAacHzKqSYlArpnGnHU+J2l5OqdcXPXHS1hAj9iQoTbrgv4
         KJdBUe0ed843rYyDv5bkQ25CGdZpL1q0Jd17zuU2Iv12MJmotsa82lPO3L8RadSTCccE
         0M7Cwm+VcMGHICzaR59KOwonlGx3xFqczcBch3sa3yu17ol2lgCIoozEICylAve8yD4K
         s3FfKS99CV51wLZANsGyTNmX64UYz14rZQrmh1V3rV5rFoGrf1KtN+M+9Yf+Z6rrBNtz
         pkKg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1SC+G8RTqlhwZAKaH5KJhGkFwlxCHxg1GdNnqTTEMxT1BeAipHm61uy9xXUV5bXp6zWUnfuR+QdVG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcafmu/uA6kY6eRbkDbYE/yYxlaIFNvecTWB5H5YdgHnMro+J8
	+SBousWaCPqjg29SZhUP98IwZXXE60BFrR6TXkp2gcneEcJoAHINX2MWgRaVyo4=
X-Gm-Gg: AR+sD11lMSYH27OCcqYduj72kyYuzVBYXohNREI4vYb23pRCDfJ07vUQjDNLKkEqUUP
	PvZl6zsOhQQjz6XviVLtQ0gV1IWy59BjPYwQ2YLGmbP1QCxC8OVouVbo+BxiszxKDi+w+aaWcD2
	+kLmqHTEiZvhtTyZEXsI42E4ub0/RVIiXMZh8m7Sy2rjiBuRJ4YaS9zRvV6UvNwaYnuST2T6WPV
	oskaapRX7UG+ZR3hBNfFoB4157AGER1f67u9qVU94KuJ/HLURt8kr/lOlD8I6R2Agt7BxjmHYmx
	3UpZdBczwcgBMpPHhCP5UWLLM2k577ak1KWn6Fplf/Gih8+Id63EqcKRGuf1zs7rKArJWsD84h3
	c7Z9KmrqSmAIeeHiyu6b2cyWnBG2A69px1y4MJMUpyUDtjzKAflJxVyaBuuNcFOf1y9uK2dPV87
	9mgMdxaK1a8AqfAOIQOHdnds+0Dm4=
X-Received: by 2002:a05:6a21:6e84:b0:3c4:3ada:384d with SMTP id adf61e73a8af0-3c67ddb636cmr729296637.30.1784946118841;
        Fri, 24 Jul 2026 19:21:58 -0700 (PDT)
Received: from t-rex ([2401:4900:51da:a518:29e0:5b58:1f42:c54d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e261fsm4806094eec.6.2026.07.24.19.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 19:21:58 -0700 (PDT)
From: kr494167@gmail.com
To: linusw@kernel.org
Cc: Frank.Li@nxp.com,
	conor.dooley@microchip.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v2] pinctrl: generic: free maps on pinctrl_generic_to_map() failure
Date: Sat, 25 Jul 2026 07:51:50 +0530
Message-ID: <20260725022150.9214-1-kr494167@gmail.com>
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
v2:
 - Move map cleanup inside pinctrl_generic_to_map() helper in pinctrl-generic.c
   so all callers are protected from memory leaks, as suggested by Frank Li.

 drivers/pinctrl/pinctrl-generic-mux.c |  4 +---
 drivers/pinctrl/pinctrl-generic.c     | 27 +++++++++++++++++++--------
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
index 927c7aa616f5..da5a5ec01583 100644
--- a/drivers/pinctrl/pinctrl-generic-mux.c
+++ b/drivers/pinctrl/pinctrl-generic-mux.c
@@ -58,10 +58,8 @@ mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
 				     num_maps, &num_reserved_maps, group_names,
 				     0, &np_config->name, NULL, 0);
 
-	if (ret) {
-		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+	if (ret)
 		return ret;
-	}
 
 	ret = pinmux_generic_add_function(pctldev, np_config->name, group_names,
 					  1, function);
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index 9759b0186bcc..d5f07f4a8b88 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -42,34 +42,45 @@ int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *pare
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
-};
+
+err_free_map:
+	pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+	*maps = NULL;
+	*num_maps = 0;
+	*num_reserved_maps = 0;
+	return ret;
+}
 EXPORT_SYMBOL_GPL(pinctrl_generic_to_map);
 
 static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctldev,
-- 
2.55.0

