Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18A3AD503
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260539; cv=none; b=c9VeWJBTonnO+hPKkUpAS27z8hSKEAWxQ/VwDOaDmYKEJ2DDo36zvp8pkSmGCitrQ7XThp1QV7Q9/1+OBYtkuFFSgF+nzb6rkEHcWq+PgluSNEXncm4HhPjTx4Y6q/+wYTxpSgsg80gom++wU1QqLVAs1lWXgA92xVnms+m165k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260539; c=relaxed/simple;
	bh=ShbJdNxhiNfmZPnf6dsWYJ3gqd5GdF+vBe7gD57oqk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+R3KkFtn5XUoerJ3Uwa5nSoMtm5e8NOFe3DLHQLeBKgdgqAEzYcggTePrTROMx+b4cASzjQLw/E2KcnLUynEdKJkpiOM3fFR8xU6KoCofF386DxWvNMX9Zi+FQNhfGh3jtSbAmeMuMngZWxMixprG5jiVXd7emzbrZ5olNNvq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jk3VwGr3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRO/I3iG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jk3VwGr3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRO/I3iG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795gLXu1909711
	for <linux-gpio@vger.kernel.org>; Sun, 9 Aug 2026 07:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrHlfrJLtBq+FFJ7bu/RFJZvxXsDP/iyySW2sKS0mxE=; b=Jk3VwGr3nGTH08+/
	U1p8fKfQVXapKn0laMwC5+8/iWD2luACkl81mMyi9Z5C/DRULYQlLyOZJcKfkT0d
	ncKDesKx0PmXrd40jXTEW4PoZAKMLTNO7aYD0fltsG1CEw6zGj6EpUmaVZo6n8d6
	JUNfk4HCVi1uVEo9Jeo+4z4deBhvbaGrTAX/8gRJ/JynEr1ASTCFqVfdo3ZNRoQf
	rju7eVi8TBjPRPnXM4n5eaO0DdbJksBqsoD8RT0oiiS1vlQseUR/f5iW3udVHuM6
	w+HayEuuUygjpO6IopeOG/9TAdK+7zvQDsVJtN3SMLH/1OS8RnmLBLdil52dCbkd
	Yl7TQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhvafpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 07:28:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so23317925ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 00:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260535; x=1786865335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrHlfrJLtBq+FFJ7bu/RFJZvxXsDP/iyySW2sKS0mxE=;
        b=dRO/I3iGgfMgQb54n9xIIQpgPdWBcXGfX2J9di2WA5r6qYzgUsPsCXvjSRD2HQV3NV
         LCIptUsoasq6+ki4pptWc3UPU33tTFTdXuvX3mMR1gpemIW/K6U1iigutpZDSDQFnsJi
         JYhUDCjTNZrn6Cht0DNgLmpEjWUp19fhkFw3Cg4jhTCfLg796BdOIFERcdqnquuB3vWW
         AoCGOENMKTLfrOGnlB8ydN2cg1H64Vphau+UAABjXYH7pCOTCiF1Q8f31BQaVE0Gt0PV
         M7RW5ZAHrF77R9GG9KhoZMbQhQK4vA7UmOcCdU2NhVHIqB6W9FJyy60bxmeFnTIiB6Ei
         nZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260535; x=1786865335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrHlfrJLtBq+FFJ7bu/RFJZvxXsDP/iyySW2sKS0mxE=;
        b=N8/CNiAobcwk+gFOQ+ELGi/si3wL5BtI1FrfgLJVyHN61Dh4P9SIsPFb3DI/JnAiUc
         /JsFDoqZy022jjxooXF0t2b8ea8ssqJyINVBniUNGyvir+FkdQefjF4X2W+e0Bi5NJEH
         QN9gP87H/srOkX/3UUtpB4hlfEnnZyg2RWoWWgo3fYB3vI4arkeS9JCamUIrcvldS6Fy
         V2WrSdkDxlL94jAwGaqv35FDXN2c0x+1z8hRQk8G5fsYhYWg+2zDIOcJ+Gd1yNnZpf0v
         daJrT0OVxV9PX6eg8YcD2zQd1kKOSNwF57dUMGSN/QFErxPBtrzZpzvadeplBjm7eV7B
         PEVQ==
X-Forwarded-Encrypted: i=1; AHgh+RozmEk+pQySxB1NGc1eIanlyxuAq9lV8SOzSpcQo38JxI8J4lf/+K15q2e28xKCaf83aX2gW3EtQOa7@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYBsl40AcX8DtJD/IWdo3VjgL0lHesYPJFgUiYcEzYlVNrlkG
	ZIkjDs9bMQw06Fm7U/4n13UtB8Cu7KzTT7BxE6t99MeN6D1AE/18nqeZL57maD51enlokmdedjc
	xEjaurRLbXBV/N8sE0md/K1aul65862CO0tEAYehwch0dgL6uZLB4S1+L+ABjqDuB
X-Gm-Gg: AR+sD13JKssDxPyaiHplxypZiTkVzU8Zrhrix6xSObLxJiqrXh+xB+S/PkCt6GUtjlK
	QxPPluxDGaSQmbiw3KFrtJshGdyeSA8KK3uD89JgXoRD6YFX2HtG7aMtiyTuJMtkHxA47zO3PrX
	bO+2QIFL65uDU+VOh62O1Gupv4VvvK7DtwM4XXTeMmnnrbWxRPV3VlyEnJ40YqFe759SRhO4n8l
	UOJU08aS4YTHaSBpuM4/Kldf4O7LzlCJfNX+iuhiPL2FSn2PfbY30Qx6BK++km5u51LZv2sHVQP
	jZEiM0ZW1g71hXJIStAHyZQnWK8mbrFOYuP8wFuD8nr+V78RIalScBMdrMvW+tqIMiSV75wQ1Rf
	k4WXBPlEtb9jHh7d6Ap3YBmFIshymS6wmRlF523ZxMgaPAkDP+RyJWF3+K6bbvkv3WdZEf5eLPx
	24JkuMzHEAtyXkI2e6WdD6n20=
X-Received: by 2002:a05:6a21:6e0c:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3cb85f4e199mr42895272637.32.1786260535399;
        Sun, 09 Aug 2026 00:28:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e0c:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3cb85f4e199mr42895245637.32.1786260534996;
        Sun, 09 Aug 2026 00:28:54 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:28:54 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:11 +0530
Subject: [PATCH 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-12-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=852;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ShbJdNxhiNfmZPnf6dsWYJ3gqd5GdF+vBe7gD57oqk8=;
 b=NoKi1AYhyMh+IWtxrB6CA2rbeCilVTa7VjKp5WtbRISlpAzsbKIvFCfssQH8P7Uk7V1LquaaU
 sewzTOI1lhhDmzpGbxJYXNhj9Ps5z4O6OQQthjxUD7FpsW+8LUJfmMO
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a782c38 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=E7BvvrGlrPUR2SlizuIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: OOhMliTK23pWuqcJAbuo4_pFVwYmv1AO
X-Proofpoint-GUID: OOhMliTK23pWuqcJAbuo4_pFVwYmv1AO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXxbVdaqo/FQhr
 74Bi4qwOyvPUoHCzEQOR12E8QsPMlzWPpt/O3qoKYRQarEsCSQVIHO9W3yqfOuwLO5nbfebWG2n
 feR768j7hrv4NSoQmht2H9HvA9lkFYwgkbLy56pya66B42t2hMYxPzQ1NRgUtw/bPxLsN2n7Dpv
 covgYh2AlbTXgmoxu67XWrfdn5JPKAKenuLnp0vAw0Pg+z/TgBBgreJa0+D2dGALjE586gpwZ4M
 hwvriK7eP0FWygm79DMoizE+VK0XEDMgecF6K/QIudsgt3PCDQcC+7jrfjvPhc0j+UJxAN/YhB+
 8W6be8vGeNI1kLQAXDKbMFkrt4hgsX9VdmkKRlMgpwZ/iXtyesYdCML3Hs64+VOrHlhVijDELJ5
 Zv+7zMK+OmspGbk868CAIwuEtgV50VKaWD6cAYP14lJSm+nNkR8/VWo0NoS1/D24BPgriq1Q1xv
 OCk/QdbUJ86Si2ydbjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX8JooJsmdLFeR
 n558ukmxQYhx19GcPAXyp/KPWv/NzBwq7noC2kAz6Ms2OYpnuI6ukqLL7hrGBD57nc2tL1UOB88
 CbfUvTiiolz3go5eLq8PkHuvADwmskw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0

