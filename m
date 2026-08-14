Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1541D211
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692776; cv=none; b=sa0wLTT6RnuDGcwiyr1UDss5aKbh+8fohUZhya6Qscc3m4EU2HfrBZRVEFfvfMbCsD9VNzcokKXpN1P33uh2iXyvqRHj7g1v+aXjnGqi4UFWQGr2/K8L2axkky6jDpAJozcNtGM/D8mRMq/mPf8bKJ8oZBZAr954mtL4XfCy6tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692776; c=relaxed/simple;
	bh=8hC59DyE4kj4f5wzO4D/36omhn2O6YGXfOLRxNZloa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EgbRc5sh/UaA4FbCRFB1sb49p6/LjarSFXSxahxdVOI+NYmzVXZm4Lvtrma9sJqycrXAVAgnhVe/kIPpc3kZbEJcfy5iP0yz3DLrV3cca9DhYHOce96yuzmDs7+UhfXcdMQE3tdrRnKNHCifGZPlkWKezRUjuxN7sxP7GumNNM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGJngbYj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYux/mul; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGJngbYj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYux/mul"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4Qbh6509846
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zp+kA094X+7twp5uja4H1YDm8f2Rm0D13sUBNmXg8Cw=; b=HGJngbYjRMOrarCE
	KFhpMptW1UjYqafDEYe2rL6wkNAV2KygZXURHGALi/gJZgrCPl8nQDHokEoT72Xo
	z9gRZfqQs5Z2MDrkN/GE6mJM/ABiOirplTtrJIzco3aEKCExCLOiB2Evl5v6/SnJ
	JR6gs2M1Qr1IpRyAyfl6WOczN5M1CnUU+4/waHhzwZwIbA1zkohAaTZlqgZeRwyQ
	YKahf3EMVSV7CcrSojbtdgfzSCI6oGLfTzsWdVW/KPiRLowSmVCPUug2Uk4yeJFV
	1vfkhGVS28IK6p4gzP/ApnuAZET5/qtLEvzZ0+O+NpW/qh0+x5raz3n2aXKjeVeA
	Eo6spA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3usds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a67b16217so857007b3a.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692764; x=1787297564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zp+kA094X+7twp5uja4H1YDm8f2Rm0D13sUBNmXg8Cw=;
        b=SYux/mul5SFBA5q7OJL/BTAY0Bhxe6k9r6B7QIzj+3H0CUInrDdvqy0PTu8y2mTR0A
         j/bP8YjPm1qp1JgE15KNsQRYQ1NLzvXqU8Y1Q6O2z7OpWEu1Ejo9hPvaygJZqEt9q1MC
         n9OaIyKrdyb8L9wtHc4U5IR7Jzkf8vXJ0qUnD//23g0tlIFtleyoBuCzh58115Nqhieq
         taBjAaN5qGAmDncqrzJFYdZVlu56hYvuGHXqhrQCHAiDM/PEuEeUt3ONaEa/8auaZQQG
         3PMnwwWzyPkuC+6ug86dyB5ltJBRK07CvsrUx7yDAoSCDiaAXV/V/UHbPIxJeIeDHhHy
         +b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692764; x=1787297564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zp+kA094X+7twp5uja4H1YDm8f2Rm0D13sUBNmXg8Cw=;
        b=bXVmymbe1075RAnq7G1xiAhCXVdBbf2ANpv2XxaKKrpXC7yatGzRzRvawJuT7VJmA7
         sTGfa0ay1cSpy2hyFND+8aGQCu5nVXnX0Usg7Xqg0ROooIIxOhFw4YryCn4LVbaTjYLK
         4Eh5LbNGjJJK2SMQ2BvidY4v4mPe+Y6og93nHUUqeinGFH9UxpkthkcB40QTUJUOeClO
         Nb9OXOpr57RKW8eafgJrVfEtTYehXcfEhGlmSC3ofj3L8MLwhrV+Gubrppf34AIrNQVe
         xVn/Li0J+KCpWkjm3UbF8FSmdzuzHiBbkOkZgDL4jSd99eaPNQHIgJjQO1Tly5iYir7Z
         H+Ag==
X-Forwarded-Encrypted: i=1; AHgh+RqN6bGgOMMFX+VohZUsOcslglAHgldQX/KaKaFhloCuC49WTm7BlcVBqYRnIWG5Zfokzsg5P1LQLWuF@vger.kernel.org
X-Gm-Message-State: AOJu0YzeV2p5D2mnG8K1j4CvgldsUK+iNymg2001da1DA7RXcm5C7tqx
	4qOeLx4KW+WiJwRu4mPG6P4uOXdqDHwJk8Um4U23U39wNHmDqkI9dUIpLq+4G7NcMp4jz0UrKDD
	f5U6osbIpKgSnXcRUCVT9DymwtwyhYM/5HPeITusA1dkv6GYjbScMVGCLP018yPla
X-Gm-Gg: AR+sD121TXmLT8Wggp3/l06N9XGgwCphM2u1rdlPI/sTsuFn5PfSIpH4hLAUcWyKkaP
	Pxtea0RFTqrHqZK5JkV5rieFTLZ9BG3cyDR0z+3vhgGOOOQP1O2Zgypwb9/KWwwArpjN0NKKl7Q
	ek6t2JJB1GuIuIIZ2+hTsQG5KirNLBxEjm7Z+42iln7jpE/GVc+N8e8KkstSNqIkUNyhnKdzAZi
	7Z03nTaKj4OVHpYSQFpmEUaOqAgd+TVJeR5o4+2k7eexdP+8dUKbSM+7CcloUHzv69RG/f7Jk/x
	s9gGAUI52SQxxuPVRmFrk2oTN2b6dBkGPwA9NA7tJqKuQhflT6nEskSOHevPzkIP3OGogwX1U1J
	nMX/ypiSyYButieN0kDnAb2EsgeZ7VjXjbIVcQIrDbWxTZC3T6G5x/BY/FC8fpQgzED28lR5H5+
	RAZIt5zM+iDRQPH6NqRIg+Z6M=
X-Received: by 2002:a05:6a21:3398:b0:3bc:5284:5445 with SMTP id adf61e73a8af0-3cc71d53eacmr4045606637.21.1786692764421;
        Fri, 14 Aug 2026 00:32:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:3398:b0:3bc:5284:5445 with SMTP id adf61e73a8af0-3cc71d53eacmr4045548637.21.1786692764036;
        Fri, 14 Aug 2026 00:32:44 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:43 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:36 +0530
Subject: [PATCH v2 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=2020;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=8hC59DyE4kj4f5wzO4D/36omhn2O6YGXfOLRxNZloa4=;
 b=Bp3nz6QUprcZk2VGvZmq2p8bTdzjWGyyjR/4qIxFefb+IZyXceD21k0toykb2OeXrboXpRTIL
 rAH62D/G2N5DfIQtvymarQsd9LnsiUadpWv7+b/csPnmAztLysObdNR
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7ec49d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=81ep5gnlwPa1PUBqnVYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX1RWJPZ/TNZe2
 T4HzE4+qdoqQlG4UI9AVDf2MVxSoFlo71fFa9nj3ssf4/xqxOQDbUQ70aXTWlqSdLvEzwj1wGit
 UUBiw5nQ2KvFIaPhsuSN6MgSD2/LOEujPBqqWpDqYOdBsvuCEHES66zKkbtcSUDSBYEbzOG4yiL
 gUlXYJOibQuFYX6RuGgWBUAkHdvJy4ukaSjVcujoc6kTZMbryKxzf6MFMbbLkXs8N6iFjO2k9CR
 C9eLWLx4HWLTJm8BcTNSLLVe8TehmXjfUsVbExZwAeA/7+e05vtxaJIoDUwTRNUr1cfxJbuuI1a
 XrfmC6MGVZCO/crICrKbDKm7hguDFrTTmq9gQ0dpPn4DvXabHErjBvT0D+Z885PitKBWD+L16ai
 3BvWu4nnEdDEABcTBdcbANPXVN8xVd+yrYoQwR8KyRca0xL7hYVMNPvgTw2wae0ywlDSAoSUylu
 ZXBj/HuwQQMs8dDnQuA==
X-Proofpoint-ORIG-GUID: eqQpu3QHFC3e7mzml10Y0Jb6YoXmCcnb
X-Proofpoint-GUID: eqQpu3QHFC3e7mzml10Y0Jb6YoXmCcnb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXzdHsG4CXHI52
 R6sYN5aLzQLy+/ZBAfcKLKVBs4vIL7tpl9vXBBAT2kSR3HuC6mMhV2GCij8QHRriSeEctqR5bra
 jc4IbkJMK7NOxvWOw0zgiGIy5bhWGoU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140058

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6367b2a5a4e0..d8c3a6b12d4a 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -943,6 +943,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *kuno_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kuno = {
+	.clks = kuno_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kuno_rpmh_clocks),
+};
+
 static struct clk_hw *eliza_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1103,6 +1117,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0

