Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446D1494835
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328603; cv=none; b=CHSnyxzSx5FxNrslI31roEQYDD1Bvo8iOjeWZsOH5+jAi+ZjA3aHXmWVoOJPNnEKIjI2Cy/cjj4SHpHtJ0jZ7+UGp48HjMZY1D64/XAqCm1mEnOkBmgBp8u06oR9M/tHrYRpqOfFbXeRwg2PEk/Y3PLCNz3nQiXnyz+I6B0DKbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328603; c=relaxed/simple;
	bh=IARJjUuJ8TzYCPtgJnhyF2BzcDD2X/PGevklk7LPqgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SRPtQmgVDs/xC+y+MbpMPLedfLEv+8Wi3fwGSM/My8l64TpukQ9aR42B/TVnB2EJ839T4a9yRDKTWKx6FRw/c7XdqAeiAHX0/v64CNWm2ddIjbwJh6R4LwWb8N9THaJAHluLSIL9sdEpDxD7YWc+QUMiVPFRsFtjrZAus1or/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exBzJcqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fohbY8hm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exBzJcqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fohbY8hm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm38Q2855771
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=; b=exBzJcqaIq9wwJQe
	NJ8C2aFeQTxEGuDq7YswVucBjbLHDdmFjC1AfQxgqsUIGcF6vVFpAIR9kSgyIUFk
	54HOmMzRJ9xHx+4aXiJwriH5AkCH0LQq4Ew8elrF4OMPGBt4WLLYteQ/HsXuJcjT
	VvULgHyzz6f549pvkP8GcgP13Ga3zM4cYSLlR7GNTvx8aiS0+Q7PpORDvGvW/DlS
	idYctx8WvLfQxJXqAGzkiqBb31VazanhqqCYwOBTnVqyBT9oAWjTVq8agDWrPOKW
	QiD02hD1AMdWlCtT+SAqCu1JPnG3te0l3ItQB2jOxt9JHerXKxrNHK3I9V3D21DZ
	c4GRlA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddjdn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:09:59 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-44aeefa1a30so2664447fac.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 09:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328598; x=1787933398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=;
        b=fohbY8hmtSosH9P1j1nS1Y5zmj1sarFNCvftPzr2XRELqnZLFk/tnwKLbH+Q6TvgYo
         EaPK1SoUkjfa3XJ3ZVoHcY0o0oKc3bwedxiv9TEwriNSCtyK08id/6CVio/fE+nimXf+
         qmV0mOxwZaR4lCe0zC+wVtmgwYpDGsApSutAisN70QF+CFT1MKhOoApxe1gdBCVQB/9L
         m0Y5OV6E86z4x6pMC1maElad1CUzWejJ+1exKzomi9iaBIAV+RqUqE4aQhJdms4Psai9
         eJE+WCaVXW0vrZVwACdqKLd9ofLEG9L9+k4tpbrRWtoZgcao3Qv/MdR4w2mj8hiHcJmV
         w4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328598; x=1787933398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=;
        b=VeSi29H3oH9jwXF7nWwpGA4guvt2nKs5OVR6oB1JNDo2UNw9DQUNuKDtaWgzOwPR6A
         gVsd7zeRK18YwMmYNMG15orml5g4hjC7y14nz1OV+To8LZYpgymVTi+Wkbf1I2Hs0uu0
         hDFwNlhVcHOnbWatMe3jVmrV2qRgQGWJAvNvj4wdgIOuaRMWgc6WC5UCjAiCpy929rCx
         6lP31lS27/k85Vqq+xnznmh3wLMRapZYFz76b19eQrZhGY8zd4cMSl+XgBfnrRo1d/kD
         4RvYS9gkvP3c2q5Tc5YmYZFgH6Y2rAIhjmOeI+WwqySE/W/Yti1pqmDJRckK8zwMJhzF
         pI2w==
X-Forwarded-Encrypted: i=1; AHgh+RpNVxAyradxrf49Obky5vYJpcPmSND7sFJ6WAkw9Deob79fzuHh2R7z6YqBV8bTFiPd5LqBhWMFxtRj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoq+hW9+Rv+bVZqENpmmul28OSou/To5KGc7O9Qg0CPQwmgzHU
	dYBxUe/wysztDnh0szRRv70cGxgl3bgm4pKDWTvxFHPWGxIgMZ5LzlGn99G+otg+kzhv856BWay
	MV8vt7A+df3yndlRncG5JPdJ8Hn7sMm3xkZOXAIhCbWcmPG51aPkeXKD2YRWQ/3iE
X-Gm-Gg: AR+sD10N9G47g4+NX/1QNDrwlJ6KxWnd9/93aRm4v4aPs716FRisdhzmrfAtqQVt3qU
	FfbnMIt4xWENTVhnb4sWWQEsopmi2T0+mgv9TYUyvYRc/kzUxS76/HMXIEFEnzE+dPeT6tzZyzw
	F+lFmmfxkZQ9kSEuRn6hIFvMO3tJqYfP7TFZxF/jVd5BkFNpgQ2eICd5/2lrT7WrD/65rRV0VxJ
	N9+0r+/scKUfMssmGzfgbsJmMaNb5EYlyoRsTHQ7dnua/mwsCybWfj5gI3+f4z8zhEwdGAp2lEO
	Sjc6nU1sLJs8aZ8CIz03txn6BtZhjlOWlch3JslAZy36HaUlnLIz3V5orMiIBZk5Deo5DA+1Dr5
	tyhDKdWfnhz9pxuvmOuuvt0lIMaMHOx1Ta0WYyJwJNBDkDk2kocFbp8SAAWzovEeCjlLK3k1ivC
	T/ZEtzmrDQVcw0TeySOYoeYNQ=
X-Received: by 2002:a05:6808:c2d2:b0:486:4892:d553 with SMTP id 5614622812f47-4b2eef57c60mr7714226b6e.0.1787328598411;
        Fri, 21 Aug 2026 09:09:58 -0700 (PDT)
X-Received: by 2002:a05:6808:c2d2:b0:486:4892:d553 with SMTP id 5614622812f47-4b2eef57c60mr7714168b6e.0.1787328597957;
        Fri, 21 Aug 2026 09:09:57 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:57 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:58 +0530
Subject: [PATCH v3 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=2081;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=IARJjUuJ8TzYCPtgJnhyF2BzcDD2X/PGevklk7LPqgQ=;
 b=KmDwPQXORl1Ra/lOX6PTLp4448/qlVRagyslHmyTMRKAmZ2TjRjYeGXCKrSJhH8L1o0oYoqcg
 mL+qVKKxt5UCvGeiVmeELj3lxlLw3pxFMOsKUgQ94CFkDvv8sp0mfH7
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX4vcw/IonY88g
 dnTFeLi9/3tm8sfUwCao7D/1yYcv03Bm8mavbYwJQ+2kc9ZzsuNTCprx3LLakx5aVYrw78Dpsfl
 hoH/2Ic7p+n1nrmdKQp6dhz3fCps0Zw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX2uvlta5NqBNE
 uxMKpWnB0GVnrRkoZEOB85cmtmEgkmwLZCRyDRy4EoPlfWVDY7xn3sZYJqV1y38cD67///C94S0
 jbUz46MTfrsCKvf3qQzDhSrbZgMD9GQgduyBvYvjbFUNUjAPVpv0hAHF2B3jJWOJXOPsv75BBvg
 Nea/5o3ruCz0UI5A8Snex2GomhZSDqm1HSZStj8/wb43MJTowberUgHHN6MhPb1fHIFCuHKDJyj
 rjy6V82MQJaurnIwoyHFQX3KXDC2EV7vepEYn+VHZOjR0JjL7lPd3fxJlu0PGyQFenlFgnx1/N5
 uM8cw1/193J/gwjoVPCtpyXKDKVby+XQVUtWcUaP5zWIA87uX4i7rLtd7YjKiNO0/rgoKQmoxuO
 Le8pe8G+stS3QzgpZEgxy2I86njkScQ7LkeYAXd31t8t0L2wh7vbfmGm/CQQwvdF5fEgNhFF5lq
 NJJNAFJ/GsNaPMeIloA==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a887857 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: V0q4_JhwiSk5DzfI84HdE0KiBkt2krYr
X-Proofpoint-ORIG-GUID: V0q4_JhwiSk5DzfI84HdE0KiBkt2krYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

