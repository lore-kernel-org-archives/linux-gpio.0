Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019BD485CCB
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853125; cv=none; b=umb2iwskJuYyj/QagxOrgIWis02UtZZ7zOczurKqBFg8l/BPvctjEt558gYfUMvAYtAOGThXJFKcrev9YK/znOU1ylT1jVPZfZTfs2idWeDJsbNOqc3rR6l1DOUjV8oM2noL9OrA5Iu1A+sQhL4+nhIuppedozeMSIxmtGohY9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853125; c=relaxed/simple;
	bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlCV5FBw2FQmSwzsQUN2RSWU6ja1fET8QZk3AiuMaixmWen7vBnSoGAszfgawPJvjbhR9mz+2m+ID9v1DcIEsFMLVjoRGDQm4JOXZcRAW9RtiNnXM0srFQB596JKNUcY7Uewf9xPP811/kLM838LWkrYMCZXnpxeIpZc7IAqwu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFjphGD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGKkloIQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFjphGD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGKkloIQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXdC8553711
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=; b=dFjphGD1N1rclYjX
	8PSV+w6jwQkIr9YsWFTgstUfoQy0sQTtmwYkZwWGWf9WrrKhCCKDRV9Sy44n8wgX
	9/R6ju+uTmnYRNLj+F+bFhRAFosKeaoHAEdxTGctP4oFWJxbfstvSEJUzPcSqTvQ
	PNhSNznNXpI7RwaYqH/7/klKwEofU5m8o56E4GcbHF2B02b5CeFb4h1MbghFoCUj
	5CVoYfBPrK+W2mzMsTawrpG/17oOGRoBu2cW0Rr+OReb1yrcvZn3KQF8wr4wmVr6
	0MwOr0Bz145oMEBJLNBBgoFa5ucHyykmQjLc6lZbG9nt5zqEaGykFAl2Pl/yEXZh
	n+8o3w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fhmtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:52:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso220847a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853121; x=1788457921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=OGKkloIQZCYNqRsq4nlpVvITEsr7LRElGFP7JZnhPYItECyap+1/eK33XW54trtgh+
         yVG1I/6qoP8QNUhmYp1iuQc+1fjYAkpjV6A0fDSL2uIpIG4MH3i3UqNzVZAl57iHS51V
         r0O4btIzSIuoZ5bVWoXESoGRlbUwaN+kyhmIiZYoW607zoGX8wxaI3ieMkIJRf/AbWSC
         dRNW6VJN9f2XCy32mGNqd+d2M3KXYdrBXmb3VhQEMhGnL/fzrkYfV8BtdK9AM6FSO8m7
         5Yy7ckN03M0RhN2LZ7HK3c7dp70sTrEYll8QJz2RuFrTb2l5RCnnjRqOzBg01UrcBsXs
         ky8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853121; x=1788457921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=q4xuXBTpVsZAvReM/k5xuVADBipmY8ow1Xkz+yea7D6o1fi1Oow06tmxKa0HCPe/o0
         pTVLrSoq6jrSPkDRVMEvjBmdvJ5KNGvzji5+k8fLDS4kaNyVRQJwQhRfGyZGVNau198F
         CDoUncJa1jKwnLbFzFnv5XSCEecNr1X71AJY4yv/MUJ5WjZSrOOoyaFolKotx9UcDza6
         P4PJWSiBtoP5eLGAQjHxwyRHVlAxYuWjaTUsc3bOA5Nwyyigw75YFp5gM0UCo1qUEWn1
         xjNtqQVRh0NImuIgVtueEpZsnbyizmY9nScYJfFVltCdESb5ccIrdh7+yr3c44Ln9ESs
         dM1w==
X-Forwarded-Encrypted: i=1; AHgh+Rq5bUBnhM4NiYiw/O/jzcGSsmiClZYqLNIHyV/zSBVJMJhtOY+zta/6Ht/mwoIAMOgkeNIg3Yw2OL/y@vger.kernel.org
X-Gm-Message-State: AFuF++l47FyuIALs5OaHltRL0O90Ms3AK95/R/OV9egnTjtHZUrrHg4Q
	WmVxTCGr2OsM2I0rZnD8ftmWjKYCOanf2zsCE1qTKwMg8H9rI+dV6DIYAkkrNJ6f+UlX+q5McJ/
	aq1WBLS8UJdCydAkcVP+2dMQKDE6nTKo1GQXoFBlo0UnwHimftBXyK1RVj460pJMpwSyUcpOD
X-Gm-Gg: AR+sD10plIce00Y1Q/J266SACFqFakcACQ0Z1ogZck4wo48QrZleUp5LVJiH5J+cdEM
	vEtXJTLkg1QBBKL2Kfm5XqENvPv2WMtStZsF7+Jd+HUPtShDqawPop01QvNnClsmcbLr8Y6Ym2j
	PjB2nD/fkLkRh+CxW9PjFaOBlDPta/5DsTwmD70e7kgProGKEMqDdxiL81J0iGL0G86T7gUYEzg
	Rmm9BLQm+HrzvfS+FbxarKgmxJXz24z6N7LlEGq5JfpGFAQSnzdfi3hXlDkG127K6hQhNxLg7Ay
	MjZrbjPjndDefK8d5b2Yydx6RhcDoaNmpxpjAQqyI53+eaT5k/PuYKXonFNEbASPDSrhcgFLNxe
	sER47uErAKVm7/LcN2nYfQbC2DnCG+wMhwi1cmeaiEABB6LoxDh+uACeqdHtgDHu+73uwz+DVbL
	5Zrp5bmxKA9bvwDj1N/cL/Row=
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr15356035ad.4.1787853121202;
        Thu, 27 Aug 2026 10:52:01 -0700 (PDT)
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr15355045ad.4.1787853120764;
        Thu, 27 Aug 2026 10:52:00 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:52:00 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:08 +0530
Subject: [PATCH v5 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-5-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=2134;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
 b=DJ/9X+zyxNdrjvjVzxUgzWUEDwu9bnEmv+BH8gG9CMZaVCq54yxqRXbSgGYGyRBaV5davTHKd
 C5aYGAAFLH0AN+pHU9UyxhEQe4FgERHHN0OYSx4KeaK5c2jJs9Qpcx0
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX0qKw80xqPotY
 uFOsfPJ8aFnUxSO7P7FXefVWxsEC+wWz1MAdfpZeB8Ruh/3V9BwFpDOg997HLkgoKd6hNmzUj5W
 R6DSKT71Y9gz2xmPKZRwavesBhcYM20=
X-Proofpoint-GUID: rIvVRiakIdQo9q6K1MyAI9X5fpisikSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXz+bZ05OHWuej
 cNA2PMKePAezOjcKLfuHWzewgkjBzLV0OggHx5s3vQ2ivVPdwCzKZIJk5K00tgSBITW2XzCDxi/
 3zJ/7F6wCAdxIMMF8/kTRSPwKj2Hop057VAdFPOGZW1e/K1/7hEyF5+c8QVjUpMKu10UPFRG/b6
 Ih8GiCCJ8106+Zm1Yi81Wj/99kHO0NOeM8mes3Gx2m7BlisQd4Amr8iHiLZq5/D+ZjRrzsJhT39
 AUwuHTGHczU41OizPm/AOn25cIdDKyx8AzjV5M288qbzSsgosd8PXqAL2/ZRciIukLGzp3LTfcX
 9i8p2c+M4/NCjQkYtrDkU1gCqk7wjpnZYLnx1ydSfIGLhc7/iZV+pkmW0yyYoUiXSGIt7YzfeT7
 91HcOmteGMVjjDgsk7SdQklfK12xbt9QrBEFK2DSJ4xDAGMlGz3Rorx0Dm2XKCzRlsheC2XIVsu
 1Jz/M35Ok4LA9uNy6cA==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a907942 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: rIvVRiakIdQo9q6K1MyAI9X5fpisikSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a224a94ae273..ec8700b6186d 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -937,6 +937,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
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
@@ -1097,6 +1111,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0

