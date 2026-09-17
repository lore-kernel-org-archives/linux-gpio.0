Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B4C4ACC86
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685794; cv=none; b=o8eDHDtUL5XeEvEAvGoYvOz0fGISJyrM59TzLWyIB2KcWeHdJgHd/yLCAy+ZpB0HHUSINSnDV0pvITMCBxDwu8ZZAcCu7nOxYUCgWsCBmyBLTOBWGqzTOT6DGRK3gG5BJvR1atyXl4RNPN5ndgzUwHlA+gfS92CfeNVHtgI05yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685794; c=relaxed/simple;
	bh=z5RFOzgzYC5TMMNQ/B5mfSfzp/qgDLgpH4puOuz6SZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Se1ZUxNdijY1rzVbtyOnYNzuosa+tGZ+XlRmwELEowlra/1vqHOKgIzXUA54cnab0d741w9M4Sq97IeGQdUJLRORGpwsBE+qzd+0oHmdr74zRI2S4Ck7jXqgU3wqKXOgo2+ekaHZcZTOSSgSUgi99IBTw4MqAmn6jzWDXPafhp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6zQYDYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dk9LlyL7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6zQYDYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dk9LlyL7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLG7hn3271948
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J7nsXF2Z4lia4oXjOVDfCPan6jxoQ/loYfy7cjdmcqM=; b=i6zQYDYNfjHPrl1g
	5vH+ELw+xnpblF/N4iTi2VBhuhSFq1fOVG9rCcenaTtJ98V7G3n4zIKKQyTAEQ70
	Hn32oYtW91QeaQ5ADGJ1o7UJmRa5sw9ZkGNngWalTud8YJZ5OJxY+axkPp0FRYYP
	9bhCA2GTbKJaR/MZve5wO65mb3/IqAJYRiNYekOWeADp739p2npSogB+Xnx8+RqV
	Ckt/sgXgJiovCTlQq8SnJwLP/4USTtIEou4JB6x8UsThUQojqCeEwveyNCCFmHFq
	/+O1vpjiLbFXYVFOASMMtJadztClV2/v4du8iYkeI5TSibYTPXFc4vwSO3/VqQ+e
	2BohCA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppjxa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso134600a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789685790; x=1790290590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7nsXF2Z4lia4oXjOVDfCPan6jxoQ/loYfy7cjdmcqM=;
        b=Dk9LlyL7odyZSZNDUjusoCJoV4XaQI0kZXW/9kNpfRM3FWDZwvC8s8TgxYcc7xE+SQ
         /cTsIZ137RhHHC5zxJ/djptLQf/2wR586WPrR4mpPerstGcqYEIs19wpLQKS1yT/WPxY
         +G5uyejV+EjPqyCiWfhD7iCnI32RVH3c/d01PP5Ysb1xpoM8FP8iZroVSP2P5ofhsI9n
         bucHg44EgVsYPzG03GLIoMd86g0e1xpcOCu9/REhNFOYbP84YaGyZcCe2pciPpdP0Cu5
         TJOKlK/sH7+DSk7J2shbmr7qp0J3XnBVTZOIuFu/c/CfM/36eefd6lHhwxyUB3eMAxP9
         4bLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685790; x=1790290590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7nsXF2Z4lia4oXjOVDfCPan6jxoQ/loYfy7cjdmcqM=;
        b=mmXkMB9pn0p+t8Uch2QunoL5FJL+Xh17aDoy72hOStclWhDZ1BY7Ju1sthTT0yT9OW
         kZ3bheJlAiuiXQQ/pUAGI5apPsyqUEHMnZtSbZaxYixrkgKqtSO9wnT0RRvHbDIgWyj0
         5xn7l/wwZ2Tux4u67DK6rB57Y30axjrGz73cFBDWz9YC9jRhk75jBkz8oA4ldqikvGQY
         G3DchnUwWeYPawxmBochyw0rFO9uIAq/bICUz4qY+DoRaeKbF8GiBu53UQ6eIgKXatyt
         LDjiqB3V6q9owhrbHBGVSuVppfMB0Ox5IK4OkhIdqkgVb9U8oGU7tLIwuEEXmHPtqlnH
         pZGw==
X-Forwarded-Encrypted: i=1; AKwUvBz788y7YUt3Q4fky/8PDhNHCR7N0s0JwXokfHL/DGLyoQ6JLhEUnPru2sGEf/xK3N38avTXnO1RmFRR@vger.kernel.org
X-Gm-Message-State: AFuF++kruHjyMfLK2ohuHDKlU13TW24M1ZVKtM7KdH/nQXLstOCKQXYq
	3VLJlq324omAiteEQoskwAFQPazhJekOSrSuENUqXi3p7bmhYzoSTLPYiqddVFosHgMvE2tJcyL
	4Ujorv1Mq2W9UQYk5lL6p3yZ4Bsr1Hhs4tIx735/7vmXLe6g4D3GD5XbzSTMn1Is5
X-Gm-Gg: AYBFou2Jqbla0Qmm8dEK4urmeJYmZubl3JEL/+znhIBu+aXJrAp0gf1hMxzm2FkiAbN
	NVqVDomIrp17pWroLBUJ7SSbEz77hXp0rhbRJ9XJx6ew4iQHLCXFzhqXHcLXZ2tBxNIeTSDIpnT
	mye6AXTNEbBQe3dqZwqaNmEr2UfzjwXQAAMc2/V3oXINUG6BJs3AaTonk8U6rV8ul4jpdOZwgtv
	wSqk4LeMmLT0z8+jXc8VzWL57+0Fv/LKqU2ERR2VOuEqqrdJf8HUQh6AhKDKO5EseUU4N630qKP
	8AZARnq28fiJHPrdzf9HVDTgOZiEixbrNYsd4RZAHezqFokTQOG9rEMmDAacdaTAdfI6aqGbqkW
	1whqbq/7kNcPvQWR5Qu8mEOjUQUHv0yK8fmAFRc72Fgy85Ls+LQ==
X-Received: by 2002:a17:90b:4b86:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e54c5a1ecmr1907552a91.3.1789685790448;
        Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4b86:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e54c5a1ecmr1907494a91.3.1789685790018;
        Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm15812508eec.19.2026.09.17.15.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:29 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:55:55 -0700
Subject: [PATCH v2 1/3] pinctrl: scmi: Replace pinmux ops get function info
 with generics
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-scmi-pinctrl-generics-v2-1-3eeee364257f@oss.qualcomm.com>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789685788; l=5982;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=z5RFOzgzYC5TMMNQ/B5mfSfzp/qgDLgpH4puOuz6SZY=;
 b=z6GlfoSGVm6PAPyRMTs3NzhhJxzNWc7Bio6PS3ZgwyQBgw8We6XbHDFa/j3avlkk4mTqD5BNA
 yZYS043YWskBeLrKMskg46fUfRRunglLlsss29Wg6T50KyNvhDMYfDH
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: ycKCKy9XlE1y86s_OjchHBYB5pHaD-ZN
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac701f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7RNIVtV6K-S_ttmQ72cA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ycKCKy9XlE1y86s_OjchHBYB5pHaD-ZN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX98b60+IJ5aVG
 6h4zOPeZjJuYX2tSjBHWUiblhf9QbTZ7C7re8mWl+Bx4R3T0zF9/DkBuV4YpfbXlMazdK0na2Jf
 4zuW1+KtRqTUE6K5pbdQEs7QMuNGl5oG59yHGzI9YqSQ8YA1FF37lIVsx69SKXyfy0MKBGKR8HC
 GBFzcphj8iB4K8uniVZP94U1awKLdCH5+QKUVOHeavALhiejrDwZR3yY3qkbLrPyP9mE8s+aawX
 blXSpQnyFrt/8TCipnwZcTGZss7gd+6K7KiTuKIBcr3Z9zc6LP+3vXRKCoGbNSjK3NqbFoHvfr+
 VOiH6JeHPkOTEgfEY2TeBSW2zoG8Cm39m/7EREFDMEF+loSJe8zFHSwPxi3kLeUfWZz+emiGCrI
 IzqB5h3rLUjOJYguyn0BeLRw9yMplhvM4+457kaWZbcc7ty+MbGtLReZAKBD9wkKVEZKBPR4hj3
 wYezDmrPH9sU4mpnBqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfXzC+B938hjGPX
 gBplCbg92Gy/IBXt79wOqYlDkXarlKr2/PNDKZ18xgGxCtRl6NVp6UGZSvDh0/J1xb8lX5XJXFX
 5t7hVFGVIuPu+1NB/a3Bme1BWtlCmy4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170330

During probe, populate the pinctrl device with function info
so that the generic callbacks can be used to fetch function
count, name, and groups. Remove locally stored functions
since caching them in this driver is no longer needed.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 151 +++++++++++++++++------------------------
 1 file changed, 61 insertions(+), 90 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1bb36ca477b7..1d85a16f300d 100644
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
 
@@ -487,6 +406,60 @@ static const struct pinconf_ops pinctrl_scmi_pinconf_ops = {
 	.pin_config_config_dbg_show = pinconf_generic_dump_config,
 };
 
+static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
+{
+	unsigned int nr_funcs, nr_groups, i, j;
+	const unsigned int *group_ids;
+	const char *fname;
+	const char **gnames;
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
+			dev_warn(pmx->dev,
+				 "Function %s contains no groups\n",
+				 fname);
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
+		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
+				  nr_groups, NULL);
+		if (ret < 0)
+			return ret;
+		if (ret != i) {
+			dev_err(pmx->dev,
+				"Duplicate function name: %s index: %u selector: %d\n",
+				fname, i, ret);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 				 struct pinctrl_desc *desc)
 {
@@ -571,11 +544,9 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
 
-	pmx->nr_functions = pinctrl_scmi_get_functions_count(pmx->pctldev);
-	pmx->functions = devm_kcalloc(dev, pmx->nr_functions,
-				      sizeof(*pmx->functions), GFP_KERNEL);
-	if (!pmx->functions)
-		return -ENOMEM;
+	ret = pinctrl_scmi_get_functions(pmx);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register functions\n");
 
 	return pinctrl_enable(pmx->pctldev);
 }

-- 
2.43.0

