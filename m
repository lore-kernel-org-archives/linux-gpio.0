Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7A4ACC9A
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685795; cv=none; b=RfssG4oGYgbK10/x+DCAwuGFhe5dH9ciWPQJcaTqsZaMhmtLObG3ukd9K8UqfiOlZ06w4MdM2cnZyt6l2QcZZxlvQvQHW60KbsDhH29ggrJd/iFQ9344iGfub08M7qdbliyB7YRTmD/E7++RWiQBR5uEwwheGqcI5xSw7spb2lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685795; c=relaxed/simple;
	bh=P8dryjMpnqvpodgWk2ySD7v0wpX4IgHdJJ8YJF0hzFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZgX7eAXvLgWPeC/isctr21ByJ7SYzbq7lJJIFmeqdqI8TI51VFqNwbK4gTcg5OGk1Lo/WaNAYOngwN0IQcbaHp5BKNXbzMxpvCs0hWhH4bmfuJo/wFDxiCRK5PCezFL387W8uslBDZHUgxBe0VK/nG3M9u9fF0cLDJrvZmLZbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Svk1/ZM7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bugjM6hW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Svk1/ZM7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bugjM6hW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLG2aU2710821
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8fhB4ShupgmdingQtdsx4ZV7fuE84BA4Ymz0F7Pxoc=; b=Svk1/ZM7ul6UUri1
	ilADI/q42HWeWOXDTlhXtMd+epfVhQKv1y5K06BgXfL0VDFWvcs6dohdInxV3hlX
	p93MhU6T5EOjVT2Ipkp7pkFSz263eCTuX5MJv87sQ1yG3odWx6cxQQR0bkvp2ix5
	M2FZxSOBarq6yRe9jzg6hYzWW0YUNKFBCwwBx5cMLS6TJ/TLjdOU5Nf5rQ+yQBxU
	dQXkWvAwximUBqf4PW92VSogCXVnsfKFUIU5/fzVMvH1ilaXr7g24EhkSmjYvy1O
	0L4mAx7RoueN9q8JrJIFJ45NP0uY5M/N+k5ASAm3QaYZuKftPHIfwHgEZk9D/6t8
	efVSBg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grk97sspr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so2193955ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789685791; x=1790290591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8fhB4ShupgmdingQtdsx4ZV7fuE84BA4Ymz0F7Pxoc=;
        b=bugjM6hWXZ+Adz4BAU+uQSRFluJsG4+6G2mjkmUjVM6FViMLlv7OGgYW042C2IFC/f
         3wFiqdMNreYU6TAJcNsWoDzMtmKlkol+xPN+Eu93SB2xWJFWyT5SXzmSilqPc1nPijAU
         UDZaO4GjstZFr2MnSFMZbYsvw3+V+1CSs5b0oH/kVRT06E+fkmngRhioGFMdrU1mL3W3
         /omgkZ0KHrmljoS5yRKo6ubmvK2vyxyaRyzSljg6/Yz3jvWwcEBw5o3BN1wZ9tLLU8pG
         nPCe6lFE9fVi5r1I8ZuUV5weqxVLV2TYFRZ7F7cIOHJ2s+9Cpr/Ca5B2NAwgAk2orRcA
         /pqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685791; x=1790290591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8fhB4ShupgmdingQtdsx4ZV7fuE84BA4Ymz0F7Pxoc=;
        b=cTFxF2wD6utKfVamK6RXOnxF/qtLQG0Ji4a6MtnZFktyIakxwZsYk3I5rTMgnNn/Bi
         i01EYmrjpkUOwLMn0N+mJF7KWYEodsFGEVrUJmqJZ68MJayhL+ypailJcl5RZ9Q2kq+7
         T1JnUuzwUdHo9tfTQs1mBA2Iopu3xXCQO+qqcdIQL2ioCDyeiFUschU6k9AgUXz4bcuB
         wHWANKODsyaQq45+/QQP/Eyl5nSr0gqPATN9lDHSpGqVjzbzPc6hNf8uwGu3BwSelubq
         x+0jeqCbaL0h9WRSWYapx+9tva1EGAG5aONGwGjnZL577MQYH5bSW+HPG1Uth/HbiIpN
         KuaA==
X-Forwarded-Encrypted: i=1; AKwUvBy/BmBJQZv1q0XA/na/0VRer0tJM3sAHgNblL+WUorhQniIXwxaTb+4c9Q34EOhGcJU6syqgAw2OTHr@vger.kernel.org
X-Gm-Message-State: AFuF++lvJOr58ctjDUVvHzCaB91tcurK5Qx6ozlMdm6nyX+dBOiQ9NKi
	5v6scnvLFzQaKLlOReHHgTdJaoz0is1KVIm+uN3dv0bd4h3S8JHKYE1sq3AIYIMXxMOsLXJCW+p
	u0RwXl1D34XBeoW4IimkIrA44sFAJBaGQmM/jmMrYAv4OBa2+nxLEtq+oyLJg7snQ
X-Gm-Gg: AYBFou2WPgGJFu5Awns9y8mOW1+drSZk/JSLxLIuEhMnCLjd6WxXXjM84riMe8IRICH
	NEfGujvW72K1DIysCbDr3dNxuTO28M9xy+iJ1Xtkd7Rb8Wi68Fas1jslVoYxWm1XNIFzoYAgl2x
	Ecr3LfQezOj8Ixs6s3ack/B9PA9IfKHpyGws/jF2lpTWLsTMjcyfmNoh2XUkhRiNeIxzKSuDf03
	t+mLjoQj/zSJc/fqXMFM9xyIYbN12WonHU233jI01iTYhA5WUwGWbT69ILnGXQmNydxCHFF3KUN
	Fwt4hw8To3sOylwE05DKsq7R9hQVfmQxBf6xLTm6GtaGpl+z77y+4gAFEgshQQLmu40OA/ovxB/
	wES10E3Ab8k5bjWI8589MpRhxFkakauMO6K5KOJ9IrJH4dJGK5A==
X-Received: by 2002:a17:903:2443:b0:2d9:484:861d with SMTP id d9443c01a7336-2ddb1af6da8mr12657605ad.10.1789685791114;
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
X-Received: by 2002:a17:903:2443:b0:2d9:484:861d with SMTP id d9443c01a7336-2ddb1af6da8mr12657315ad.10.1789685790662;
        Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm15812508eec.19.2026.09.17.15.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:55:56 -0700
Subject: [PATCH v2 2/3] pinctrl: scmi: Replace pinctrl ops get group info
 with generics
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-scmi-pinctrl-generics-v2-2-3eeee364257f@oss.qualcomm.com>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789685788; l=3568;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=P8dryjMpnqvpodgWk2ySD7v0wpX4IgHdJJ8YJF0hzFM=;
 b=pMk4JLcfOy5cUTaVghI5ArSIfRa+ErdzPL7JMcBU8CJH4cwE8P9sIpq/IsgA7Z4eRZl8fYtRn
 VM02NxlcSLEAvVhb+ASBBsDGBwxKOIcjs/YVUJ0uyPgFjQkuuKHcfXc
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=LOzz05W9 c=1 sm=1 tr=0 ts=6aac7020 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=p54jq0OH07X71X_IsjoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfXwV3+RBjo/sf/
 1s1sC21H2R04LFEPdoZ9SYVk/YOwN4sxEYyumdZf74LYcaIOT/eSB54GN76XucpQN+1jfKjXQiV
 mQgVtHkb6gJehikotjo/DncgHkdp/+OlbLO0BXGyuFNbeW6rX0hGVVU3pp+UpnLb1w5wNCBirGW
 BN09bOJ94op0TMOKklrxwQ0OH3BvRnT3mM7arjmbl8+ILyI5esGOZWgllQ9ttabG3jEtVuHAVZr
 r5BISUiXzcw3vOra4dpE6jKr3fNuba1OIppccp1ET/NxBd5FDQIexuXz/3Z/IfGgtjxVE3+Tfy7
 HxmaJoH53DdhTW6iBMpRHEuN4f78AyxbR4rv7r7AA87+xuHqH/vAwmgoQKw6CPSGMZ+4obrmitg
 6FeXNdMSqr0kvWoTaEZP5B3GgE2jhUw28ffQeZVorn4oKvrPVWhZ5T1w/9Hx+qLO3JMfvXFejNv
 hRxC86IJW3EAtrS8oFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX3PX0idaW1Urw
 TjmbukhoJKZ/N/h3qBwe1UYyBuTUTalTQ4iwJOHul/DkK3nB/trYeAXLW51nHWAoINe+N8T7OkJ
 GhhAIQzWcaJD96PbReOwibuURg8KIkw=
X-Proofpoint-ORIG-GUID: MrmRilLnNvoll8fqEjNrrwAzfwcIWdRW
X-Proofpoint-GUID: MrmRilLnNvoll8fqEjNrrwAzfwcIWdRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170330

During probe, populate the pinctrl device with group info
so that the generic callbacks can be used to fetch group
count, name, and pins.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 81 +++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1d85a16f300d..c93d61dfa282 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,43 +40,10 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 };
 
-static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	return pinctrl_ops->count_get(pmx->ph, GROUP_TYPE);
-}
-
-static const char *pinctrl_scmi_get_group_name(struct pinctrl_dev *pctldev,
-					       unsigned int selector)
-{
-	int ret;
-	const char *name;
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	ret = pinctrl_ops->name_get(pmx->ph, selector, GROUP_TYPE, &name);
-	if (ret) {
-		dev_err(pmx->dev, "get name failed with err %d", ret);
-		return NULL;
-	}
-
-	return name;
-}
-
-static int pinctrl_scmi_get_group_pins(struct pinctrl_dev *pctldev,
-				       unsigned int selector,
-				       const unsigned int **pins,
-				       unsigned int *num_pins)
-{
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	return pinctrl_ops->group_pins_get(pmx->ph, selector, pins, num_pins);
-}
-
 static const struct pinctrl_ops pinctrl_scmi_pinctrl_ops = {
-	.get_groups_count = pinctrl_scmi_get_groups_count,
-	.get_group_name = pinctrl_scmi_get_group_name,
-	.get_group_pins = pinctrl_scmi_get_group_pins,
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
 #ifdef CONFIG_OF
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
 	.dt_free_map = pinconf_generic_dt_free_map,
@@ -460,6 +427,44 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 	return 0;
 }
 
+static int pinctrl_scmi_get_groups(struct scmi_pinctrl *pmx)
+{
+	unsigned int nr_groups, nr_pins, i;
+	const unsigned int *pins;
+	const char *gname;
+	int ret;
+
+	nr_groups = pinctrl_ops->count_get(pmx->ph, GROUP_TYPE);
+
+	for (i = 0; i < nr_groups; i++) {
+		ret = pinctrl_ops->name_get(pmx->ph, i, GROUP_TYPE, &gname);
+		if (ret)
+			return ret;
+
+		ret = pinctrl_ops->group_pins_get(pmx->ph, i, &pins,
+						  &nr_pins);
+		if (ret)
+			return ret;
+
+		if (!nr_pins)
+			dev_warn(pmx->dev,
+				 "Group %s contains no pins\n", gname);
+
+		ret = pinctrl_generic_add_group(pmx->pctldev, gname, pins,
+						nr_pins, NULL);
+		if (ret < 0)
+			return ret;
+		if (ret != i) {
+			dev_err(pmx->dev,
+				"Duplicate group name: %s index: %u selector: %d\n",
+				gname, i, ret);
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
@@ -544,6 +549,10 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
 
+	ret = pinctrl_scmi_get_groups(pmx);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register groups\n");
+
 	ret = pinctrl_scmi_get_functions(pmx);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register functions\n");

-- 
2.43.0

