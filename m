Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C6848BD35
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848720; cv=none; b=WUdEn+L1NeMTNCKPY7Fp4yxT8fu8tG/AuebwpnKle8XpxjD3OOhEpeOlSyIAIs+Xw6BmnmaB6So0sQVK4xcSFAJuDv5F7UbGmA9ugC34XE4HJ/PtBq/Ua2rXpjajb3xLMETBwQRlzILdMXilYUdMOR5SqMf9cHtp76r0hl4ZZOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848720; c=relaxed/simple;
	bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxM0sdYYig0E+wUWFslQrL5R4Ohyjyw5bpiteY3gZZFuGrxuJRwQjFPSzLdQESbrs3ZU91t52xLAAzR0NJnc5NBcsDWy/ksaPsJw7nZynfZgYIbgXyvSIqni0bH51mt2eOREB0+CcuOdioiAc8BRCck4mU8i2WixQtbg0/q3CIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaMxRdth; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaR6zClE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaMxRdth";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaR6zClE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFboTu3921237
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=SaMxRdthBszwPxye
	ahAPAjCu8wN15TieayAgyNv1rpccx0g2otWevM0wh1Vxiou7v5lCf6Eji6kot0Hq
	cJfWmknf3m0iXl2a4/J4e6NkYhw76YbfNr6mkgG/psRCZcJ2v94g3pQdDNuxaTmp
	z+AaWYdFQ5aUgbtfdZUSYIQJnD+PFTNogq6Oc3lrm3pazT8fCFSodLWRN0LvQLH/
	RkhbLete0IpvHZGYV58U5iaRYVJBYMf0Cd14esQA1pio3Hr5sTjbSmFu0LhCowOG
	p9cji3oDM2wF681yaqVAhsq9GjG3rhn1XCjpbvhOhDQ8Q+/0nA45A4Eyd3enyIBZ
	xbyLmg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw0nka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:38:37 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d9952a5so242090b6e.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848717; x=1788453517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=VaR6zClEaHCksA+uzy6NQNsRFUf6nPjN5Y8iGTo19saELLW6wOQqM1BpMgfNnCZTTg
         q47qjpSIg2YzbBIzSHIr6Fn5H/hPJPRfztUnny0EUDYaW3w3GWf+m3v1svl2d6L9TSTa
         Ihit/p/ey6TSvl3OZi5bE7ZrbgazSfESfAVN2RofDY63BZKyKtabIIsUkZr2PGT8SNcQ
         /V+UpDEtXWScAhcecM64Lk7MrWgXaAzF7AjM8oGm5u7Gu+GkxvlxEEtw30BcN+3oOxvV
         piFuVFjo7WBzJgkdZB7TbNWipzQpz49gL+qcjSfkbK8Ww8TKGq156MrHl2yqWJWMUvm2
         zKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848717; x=1788453517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=A/LR9xSZFywJF3DCk2lIVVbkQ7UGzbGwB9+3ccfiIr1zOkFfbdD2cP2KDhqhCm0ITt
         S9vwpToV2wdC7CPCIgo8B768DHGfm6+BlzyUWC60fxRpOG5jYkUUnpRlGVmGAPfatw3F
         PVrmrrq8vJfGJjp9REGrJ+gFj9DbmyDXu6xL/lQ+s4tCvp7I2lDjZG1Z61O4SKITBDdv
         +5+khNCl501p9re61TF84zPnwmPETi160/Wzs9yId8nAPiB2nWrT7TB0I3cok9jm+35V
         1O5ej0JZ3hkKJlvF2QOsCrLlaVOJhI6WVqYcqhd3HpIGxJbo3JNMF3MrG0mmLus2iLNZ
         JFVg==
X-Forwarded-Encrypted: i=1; AHgh+RqfBhQg8aB/q4Gz4D+5zieoP0H6mRIoNtOAGDMmjkz4Nw3ZoMKvO68rN+Xzlge/uTq8qE3PZw/iIuc/@vger.kernel.org
X-Gm-Message-State: AFuF++lALcnwAd3uJl4NBmj9Fx5bn7F4yQBif+8VLJyGcoNZ7PpjIU8R
	e3sFjDdmd52PvS4P1SceHVPfq8X+PHFmuKYyY9kTGl5ObE9jXYNw8T74sjtxSKnILS/cM5B8sVd
	jvDffpKwdhDysH7vUCdkVmELOQcrM6nQAWaxTq003e7CTyckIlw9oJR22GnQpMJkh
X-Gm-Gg: AR+sD11T5r5NUB1Sw/dNAh272f3gabL4OylEcUBqb1bak+DQLGyuqqnPnrwLdzbcX6L
	qHdVFqDltmHLt+QdqwnYAsz6xYlA653xDIBv1tkZkfbXLhN4yxUBPOsFgti27B6LzlNyJTLvbd9
	9Pn79XyprFCsR0I1ujwgpq5jqUftYWVdrr83yG4ANNWeKn8XJXE0Tw/aQa2o8q88VIVX3bb1c/e
	uagM0SD5u0EG4IrPHOqSSggDB7dRCnMa3Q9AunJJSII0H27ODOmrO+po+wT0ChBCzQJo9/OD1c/
	iOHCCJu7fgfF6rU29xh5D9mAHQo4H/S9h+xoE8OVB8A5wZLogYEBknabpSRjymcGT7YTKnXCEAz
	uSwNWrINGBAcUp7tR/OmSLTFK+uhrsfcNRgpBl43ek4SSfrZBXDcJ7JCBv3NTqMra6Y5f+KG7sg
	ogAd0z7T3bZuzcZilEBbxvT90=
X-Received: by 2002:a05:6820:83c2:10b0:6b1:4061:4193 with SMTP id 006d021491bc7-6b1a01f68a6mr13170125eaf.0.1787848717227;
        Thu, 27 Aug 2026 09:38:37 -0700 (PDT)
X-Received: by 2002:a05:6820:83c2:10b0:6b1:4061:4193 with SMTP id 006d021491bc7-6b1a01f68a6mr13170053eaf.0.1787848716826;
        Thu, 27 Aug 2026 09:38:36 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:36 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:03 +0530
Subject: [PATCH v4 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-2-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
 b=RdWF85ZMBnw5+LTfMUb/XNYcxEP72DT9HKX+qTDzgA+lEhyPfHN012Y7yPzPmglz+6fhKR4F0
 g2mkfFKmFy9Dy+hrx7vcKwg2/5OCovy3VzCQSV8WPXTRk3eBrdKwbof
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: wiP5i7pRDpgmvFHxiakth-ZpYhDfTBAI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX6JGukUnAVZK0
 shh5DIf0DnmsEz0TS92SVF+XadEnFRHEF4OC33/AZEl0bJR7XPkRKzIK33SY+x4jFqfPQHL69Ho
 IzStAd6InhWsc/UkgYN2BCU83I2VP4w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX77dj0beYScG6
 4bClSNmGTXjeHhTyHZ+XoQoDVHMQ7FOiuXRHQsvslg8YWLoMchnm6WHtPgdPf9NhhCNi8ikdjX9
 m8g2E3OCenRph3HA0rQjTpsQSQ1sCVkOVYp5Medyv4wfHKs8HYe8MUWzlUArFkZ39YA9mrsR682
 vPm+89Nzh18Q/3jMu7hajUKYBt/tErk2jmqlEccnVR0UKhrEADR1/Cx2BKCyalhNvXQay6slfGz
 l3lmJrMgipOMZakm5zed00Z1AEI7hm7G7u4a6HrFG1lPtIyRxVpIXDWlQQvtQda42cB04Wj/3Sm
 vvVztoU988VfYmt7koZv9SXC37dpfVA7BJlJXbTA1/X9Sp2IzvKBTBcuUauZPiic5fCCcyeBZMm
 LsYLlAiyrZx4Adrmfgix2amhE50mqUJtnBhd9wAA1eXUpmov8TnwVQm+80sDcuHvksXhgmyaA9+
 JFcu5L/AUK0E+7pH10Q==
X-Proofpoint-ORIG-GUID: wiP5i7pRDpgmvFHxiakth-ZpYhDfTBAI
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a90680d cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the RPMh power domains for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55062..7fc3927efa27 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,glymur-rpmhpd
           - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
+          - qcom,kuno-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.43.0

