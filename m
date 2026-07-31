Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A358446047
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 17:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520193; cv=none; b=dTe3dTZaYjutWDeA1ZDm82Ahov4v6Us2h67Wi5GLdP5Yn6jL1yTuCtlvpvW5yIM+k1CdQQq0FC7wpdpqXvyWY/JyqDFs9GPT4zuM7uz/foRu/HpUb2IabbpIX7Tra6OF3oYqyKONjpsULQeds7ldX7BovypAXajZyB1OuVjz8dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520193; c=relaxed/simple;
	bh=hFOq1CDEAsqbExwdsyEP1OMcEWRCkKK59IVp1eM9m4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNCjxNruxFDR63/xvFGmlmpSKWoK6skKfunl1ZagzaQz+kkY7TsdND83oMAuFes0md9y9hMQMLmYDZdOiYZ/F9fjG7m9o86gcIiBtS3WqGV0HERPiqfKbhhMODZni4ITB+KK3+0zIh5SRbNDkvQw+XZ6KKh7dOX2I9jL2DxSHkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCCgDtbP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M10RjqRM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCCgDtbP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M10RjqRM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOOcH215387
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 17:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSAAlowZ86yqSXeWEh90qTyf5MHp+UJ1MM9Zn1kuXew=; b=SCCgDtbPn/0pvI7X
	7oZHuDNnHEWedh/1xdjLZRXBQ3QKjoMVoRw/z367aP4DyrZIT9AddK/FiIY5bQs0
	4nVYy47dIOxXY20zPuy6+0twgl8SAdgZ9d7JuOJonPHfaicAmo3crG6L1tdQNF66
	QminziSJfvT3jfIDuBOcREEx+9Hbt0UT8ZBuO5SPVpCQ+iQmfAAePeNZ57B1S3h7
	rB4QyfggSNILQvfDvAIuEbjd4zpMV7/Ao1eINvXzdrk51OynIo3rn8mKBZteeh/w
	xNkgV043OqrAAs5Piay7CwuQjRpcd8XxLT2CWANxyedrbF+ya3vdkKrgDj1/XjDd
	QNVbag==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frujusjjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 17:49:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab041eced3so1843532a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 10:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785520184; x=1786124984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSAAlowZ86yqSXeWEh90qTyf5MHp+UJ1MM9Zn1kuXew=;
        b=M10RjqRMVh2NQAM+LK2ZcbTigAibbr+cZuZYguPizzrkIt342v4D/sNprFxblTQSXw
         pv5Y+lthDpSHgPM5u1XmuVKnDOKcftANtDaXm/20SV0Oh3TERwprFiftsnak86Cpdlij
         VxRFCUdm4llrwbeaC6tWi0DzGUuelcith1a0BgNCB0IjCrdO3p/l7lEE+Q3TwRqHo/SA
         iYH1JSja1uYIVMk/IHDO9GVoKvi7Tmh3XwCLzaJRlAmefMC5VacxRZmwLQmX8vd5KvNU
         pVXM4N5tDlO1kxHnlzwBqc7lPPFtLEooizSnAQhrCkFdd4WIgMs3B6vfywI9LDIibNvP
         a9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520184; x=1786124984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSAAlowZ86yqSXeWEh90qTyf5MHp+UJ1MM9Zn1kuXew=;
        b=dfM/uS1rrj0A3OIFMzPsaEFz4vmHg5J3OzwWxdJHFV44Hrr9R/NhE3BTZDnU5C69Ki
         qXW1juULoLP299arWSXdY4C75Pq2armITaR5m/SfwVJ2giwg50cQVNBk1oTLEcCLJH8W
         cpx3syxsNNr/0UlvN07NHDclIRSmjgqQT3J4iKIHWvuXrQt1Yhy44p5GXz02g0PMeIgw
         8DHYB0A60EKoubqWCpUNtb7rwYSSI3nL+tFHg/dTsS6ApDIBShWQdbFp7BnsnLBWyB2I
         jMbwW9pfoqAD2ulPFwSFfWkalxkRO8hfLKovvhNP7BSnG/pdtOzq+zcUN3R4w4ikXGtO
         2tFw==
X-Forwarded-Encrypted: i=1; AHgh+RrCOH08jxRBDjKesiPkS73Ffnvk1cYbszI9vpXHZqYFMzXPjupwuWohirGWhoSqrlIOpcdRKN6wEbQF@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwwSR4NtPxO5d6hZoW1V405P1VlAmraZpf+hgJh3nsKeAb2fy
	E2pxYQBT6EfFXLtdO//4t3dQX3rcD2Gl51/6XdNsKssqSPHgINEa4kbXkgeCp77Xc6aEiQMdI2o
	jEeLU3J8ar3Ca9Z/We1jlFnH7mktRSl3k4UUgR6we7Ad9/h/Pruawie5VElgfpu2U
X-Gm-Gg: AR+sD112Q63zv/MX27jfYbkwlxDq3XLXivcKOw6KYqH4G9hP8s8XTGTI+W7x2FAh+OE
	3v0q+CC7PKD0/mbJLfs6DX4z2QG2kshAhuob4KMzxlPNyn42spT4DTetttuoRdtAMrZDLY6pfS5
	lcVklmvYcSQpnG9/bngiY0/h5H5iI/oJAH0P50nlvgLQgXixd4uuYIhnHAar+A9u2XVR8fl7otw
	2KKr/BmmsrLdbR8v2ygWtY/PYVteTD92Z85RkhpAQk4LoN92iuo5B62kkcokgkOXB5oNsZk0nhQ
	uchMoHIfHiXdpv8dsqI2ZLJ6dpt3AnyG/I9ZhquRLtj3rgJfyuSw/9LWOQULA/Ia1Lk+YQlEO7h
	qyIYx7QSrx4zKrUdDi8tWTV28ztiVwMnEhaFTXRS3xk290JcO2Q==
X-Received: by 2002:a05:6a21:6cc4:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c92a4c4549mr644108637.2.1785520183924;
        Fri, 31 Jul 2026 10:49:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:6cc4:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c92a4c4549mr644078637.2.1785520183476;
        Fri, 31 Jul 2026 10:49:43 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm15115660eec.28.2026.07.31.10.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:49:41 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:49:32 -0700
Subject: [PATCH 1/2] pinctrl: scmi: Replace pinmux ops get function info
 with generics
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-scmi-pinctrl-generics-v1-1-8affd2b79a6b@oss.qualcomm.com>
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
In-Reply-To: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785520175; l=5835;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=hFOq1CDEAsqbExwdsyEP1OMcEWRCkKK59IVp1eM9m4k=;
 b=YW37xt59ApjrJzArsi3FRwyV8uJOJ34f2F/W7M1mwo+f7JB3cR6tY4+EAAT7aVkxiMGX8/K46
 i/iJj0IRqkwCgg/hNmdfXQ5R7yI2p2yqGVmgkDiegCwgeUsuB4bL6DE
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=U6Giy+ru c=1 sm=1 tr=0 ts=6a6ce03d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7RNIVtV6K-S_ttmQ72cA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 6-phnlpr94piGFBzbPbdFeR9gsYDZDfr
X-Proofpoint-GUID: 6-phnlpr94piGFBzbPbdFeR9gsYDZDfr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfXz/jXVYeWEOmc
 YP8iFYUnIFR8U51eradFSR0U85vZq5/lv41YJGJEOBfo1TS3H599ENuA8BRlkA9dpw8cpgvRx72
 bcPY8hs1S8bsbfiuiP3lZOMGwBn3t6svxOIEx9BXWo+/G+VcmZEO0Nm05RsQZD//c8g1JhH0WVW
 JcW9jkOx/aAafSSHWYxhs4gRMnQ7HxFBpSB4F3IGBnGGt+J9yP/bmicMnuoktKojtIWyMe9nLI1
 Clv0Mj6ca0JHRtdLW1VhaYyIHSVxedqeHn3I/01G7lpY0pQQf99roeAzPPc2S2T6ZX0COL/FjmI
 RCb8eW5GoPBIxQzXETE9f8lHwJFIhvgFVD7L/HketyzgYgULXaI8qym5buPsID88hXb8v2MOU9B
 msvyJl6xhQGXTmlfmTcWaM91titGXxKMuPt9IJj45iKfcwGS60A/iEPKaIumB1UPaUOvmzKX1L0
 CQkqZfKSxEllKF+H0gQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfX4Po+und324xN
 jC6X6BI3PP6M5MuaNPumDvFTE8u5ZFgM2zz+nGUhNYNmsplJWJzf0R+g203VQ7mWdRJxVbHskv0
 62FfyFts2OGmBIUIzRhpMnyKz1E6INw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310136

During probe, populate the pinctrl device with function info
so that the generic callbacks can be used to fetch function
count, name, and groups. Remove locally stored functions
since caching them in this driver is no longer needed.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 145 ++++++++++++++++-------------------------
 1 file changed, 55 insertions(+), 90 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1bb36ca477b7..3461c5712613 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -24,6 +24,7 @@
 #include "pinctrl-utils.h"
 #include "core.h"
 #include "pinconf.h"
+#include "pinmux.h"
 
 #define DRV_NAME "scmi-pinctrl"
 
@@ -37,8 +38,6 @@ struct scmi_pinctrl {
 	struct scmi_protocol_handle *ph;
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_desc pctl_desc;
-	struct pinfunction *functions;
-	unsigned int nr_functions;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
@@ -84,86 +83,6 @@ static const struct pinctrl_ops pinctrl_scmi_pinctrl_ops = {
 #endif
 };
 
-static int pinctrl_scmi_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	return pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
-}
-
-static const char *pinctrl_scmi_get_function_name(struct pinctrl_dev *pctldev,
-						  unsigned int selector)
-{
-	int ret;
-	const char *name;
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	ret = pinctrl_ops->name_get(pmx->ph, selector, FUNCTION_TYPE, &name);
-	if (ret) {
-		dev_err(pmx->dev, "get name failed with err %d", ret);
-		return NULL;
-	}
-
-	return name;
-}
-
-static int pinctrl_scmi_get_function_groups(struct pinctrl_dev *pctldev,
-					    unsigned int selector,
-					    const char * const **p_groups,
-					    unsigned int * const p_num_groups)
-{
-	struct pinfunction *func;
-	const unsigned int *group_ids;
-	unsigned int num_groups;
-	const char **groups;
-	int ret, i;
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	if (!p_groups || !p_num_groups)
-		return -EINVAL;
-
-	if (selector >= pmx->nr_functions)
-		return -EINVAL;
-
-	func = &pmx->functions[selector];
-	if (func->ngroups)
-		goto done;
-
-	ret = pinctrl_ops->function_groups_get(pmx->ph, selector, &num_groups,
-					       &group_ids);
-	if (ret) {
-		dev_err(pmx->dev, "Unable to get function groups, err %d", ret);
-		return ret;
-	}
-	if (!num_groups)
-		return -EINVAL;
-
-	groups = kcalloc(num_groups, sizeof(*groups), GFP_KERNEL);
-	if (!groups)
-		return -ENOMEM;
-
-	for (i = 0; i < num_groups; i++) {
-		groups[i] = pinctrl_scmi_get_group_name(pctldev, group_ids[i]);
-		if (!groups[i]) {
-			ret = -EINVAL;
-			goto err_free;
-		}
-	}
-
-	func->ngroups = num_groups;
-	func->groups = groups;
-done:
-	*p_groups = func->groups;
-	*p_num_groups = func->ngroups;
-
-	return 0;
-
-err_free:
-	kfree(groups);
-
-	return ret;
-}
-
 static int pinctrl_scmi_func_set_mux(struct pinctrl_dev *pctldev,
 				     unsigned int selector, unsigned int group)
 {
@@ -190,9 +109,9 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
 static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.request = pinctrl_scmi_request,
 	.free = pinctrl_scmi_free,
-	.get_functions_count = pinctrl_scmi_get_functions_count,
-	.get_function_name = pinctrl_scmi_get_function_name,
-	.get_function_groups = pinctrl_scmi_get_function_groups,
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 
@@ -487,6 +406,54 @@ static const struct pinconf_ops pinctrl_scmi_pinconf_ops = {
 	.pin_config_config_dbg_show = pinconf_generic_dump_config,
 };
 
+static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx,
+				      struct pinctrl_dev *pctldev)
+{
+	const unsigned int *group_ids;
+	unsigned int nr_funcs, nr_groups;
+	const char **gnames;
+	const char *fname;
+	unsigned int i, j;
+	int ret;
+
+	nr_funcs = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
+
+	for (i = 0; i < nr_funcs; i++) {
+		ret = pinctrl_ops->name_get(pmx->ph, i, FUNCTION_TYPE,
+					    &fname);
+		if (ret)
+			return ret;
+
+		ret = pinctrl_ops->function_groups_get(pmx->ph, i,
+						       &nr_groups,
+						       &group_ids);
+		if (ret)
+			return ret;
+
+		if (!nr_groups)
+			return -EINVAL;
+
+		gnames = devm_kmalloc_array(pmx->dev, nr_groups,
+					    sizeof(*gnames), GFP_KERNEL);
+		if (!gnames)
+			return -ENOMEM;
+
+		for (j = 0; j < nr_groups; j++) {
+			ret = pinctrl_ops->name_get(pmx->ph, group_ids[j],
+						    GROUP_TYPE, &gnames[j]);
+			if (ret)
+				return ret;
+		}
+
+		ret = pinmux_generic_add_function(pctldev, fname, gnames,
+						  nr_groups, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 				 struct pinctrl_desc *desc)
 {
@@ -571,11 +538,9 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
 
-	pmx->nr_functions = pinctrl_scmi_get_functions_count(pmx->pctldev);
-	pmx->functions = devm_kcalloc(dev, pmx->nr_functions,
-				      sizeof(*pmx->functions), GFP_KERNEL);
-	if (!pmx->functions)
-		return -ENOMEM;
+	ret = pinctrl_scmi_get_functions(pmx, pmx->pctldev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register functions\n");
 
 	return pinctrl_enable(pmx->pctldev);
 }

-- 
2.43.0

