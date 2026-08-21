Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC884C77A2
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328582; cv=none; b=dYUfWs9a/nOxAgLq14YEEMpx8oPle2fGqgjg9jjAVJsJet+wD/HjDDtxC51E0CXdVOrS82hpiyR+E7zbrIQKsY7vyGIex5Uyea0iZLqLu5axOtQCxFJ1TjxGWA038uIIV72NWnKGIo97csr7zlI/qXapxcznwTeYU7r37EFCJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328582; c=relaxed/simple;
	bh=tzDqNTEhoFVwtAYNfXTfFhwNi1y+wzNPDmbGPl082TY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pyXyZjYb8ix4/vCQqZDrn2tPsP4pq9B53WKn4wBUTRRNLg3v2S0QSP3ysVOIOYiyp4IlmKoG0lZj5b2NwfisRd0jvhrGHBHK/LODQnEYbdI+DQmNsFKEDwKDsJqKTyN1boticx6kIk+fLJl2FUCzSzXpEqEZm+c3OyXIUDvVm5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sc6ERies; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDJqomlL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sc6ERies";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDJqomlL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmULw1875160
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yksA1f4CIEDmfZUrVzhMhyAFPy3A2If+RJxkkjk66Z0=; b=Sc6ERiescPJxMtCO
	q20LPtHZHJlYliJPC77R2myg7VPX1FBpmh4j2CABvdp866c6hagoFGYJ4agPu2BL
	vhuH2Qt/fQNe0U845R/0llDR9orG8AhBhR2/xqVZhhig74LdNwj93FIduXHCM7HG
	8cEjrAGJZkHTd3e7Zcc+gNk4sBPCJPg1npfC0byjo2aMc2L1NrkeSLrNu5PWXixF
	SxZJjlTbhBaZhUfTYhzlKA5NBbCS7O+AhY/xXHi0M3sKTzo+aZ4noBrb2HaorCbI
	AZbB6X2JYUhK4UaCQ8etsqNRBLvGhvx7YYsOEgZlGIz1JdKD5xsrToEKl6xTObMo
	hiVlSA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdeacgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:09:40 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4af9bf0f53bso1904339b6e.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 09:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328579; x=1787933379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yksA1f4CIEDmfZUrVzhMhyAFPy3A2If+RJxkkjk66Z0=;
        b=aDJqomlLqKvRianifF4ErXJ4addT3KkyNjBeHh2DzIkJmtEIvW/OoA159q6md35MI1
         4EaA1dD9eMATE0IYX2BhxMvrw8eCZpN76c8Zia1rIsp7A1BDqkWFtTn/d5K7XqrYwsov
         3jKUsVvU1wSvWu8KdtHKZLP1s/9dwECNsF1iQuvAVkwbEqRh5lFLlSAquzoUtN+5WGTM
         zMVt6hq2MSUcvkvFIV7nvHaQWooCt6ewYQFBzxNlfJcM1VASAlVPV47uRUZOp3/PnExI
         73kySQMXxuIfYIDObCZ64Iy38O8kQ1jhU7p9zX4DzvbS84WPEytVYqgu2thlBdEm1Xqh
         I9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328579; x=1787933379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yksA1f4CIEDmfZUrVzhMhyAFPy3A2If+RJxkkjk66Z0=;
        b=hNdY/0769aMcJairzrVLWi/FFBB7x7e5RsdikMz7ybe0YaONc28G5IdcV69OWYZ8G0
         Vn0/Ap1U/uxdnqUIwvIlsDfmYvVJDfqh+b0Il+Db9b9L0Ozwd/rlkVJeseK/oEnGkQtS
         EJWwTNM6nDLK9ggR8ykuc0+9dWKe/bLyHv4mHlmv+KqcLbHFWtpFBPLNkzynVT6Z+cBl
         RKtYmCneP35O1IcpXSWRPFT6l6WTYsC3AAi3nwHlgU8pfBTWzCu6ww9kKz3BYl/H50i2
         iwhG6nlULchCJjJoS2spAy7QKPE1QV1NEmyI5T0wrAe/Tmyv9DHuOixODRdwQesh+a99
         +2Mg==
X-Forwarded-Encrypted: i=1; AHgh+RpVccPEVL/ApFm1XrQ+nSY/QVrsi05qvqmtsuqY8RwEBTdu+2JEg5p1GoILgEAaRQFbd6rw+Rrwr6C4@vger.kernel.org
X-Gm-Message-State: AOJu0YwytnYQ+NiilY6BsQqq+J6T2SVSIs8tvgUFDryArvxuq539Y+IR
	LNPEdyf2SRPO3BgAN302G91AiiDHT9b+/14dxnAfEo5v20TcRX/yHzlgztJ1Ax8L3kLGWYvNHt2
	AHKZwhHqAK3XgeJmndxrCPWH4vkv9cZg1qeN4LNkxIchqq+RVi33xzZ+KLrxBtRq+
X-Gm-Gg: AR+sD117obzpT4xbE9Ot+NZe4O/EMK7cbi/QAagjRrspONGK1sPI9rTk7hK9SZFGnSD
	XlHKnqsRRO0pD9FW6s+RcWsnhSCZ5QnF8cQs0ZLT2AQJJ3XBPD3magzriOc/EdGKwHcdc/Ft2hM
	LPOc+lkSS+5gI1uH0++7RM4SIf21GuDQHqLblP9b7WlmpqMgOuZ1hnCSFUfnSyijrhS7H1ZL6Tv
	tUGNo7qdZcSX684QB7LkQTMNs8hBxL50VRyPdis5dYT0lydCwmHEtiYgi0gWpgIRtRJenNmo9b4
	BrkSrh8UjTDteZqBkMAo515BpfT44YytZUoTLP8DSn4QfNPMSgFpo5YmB0HgACMz/N6kNjGSgHy
	K45sJZXXgAeB6xn6ArGqT/XMpopsWmzuLz7WfYNr1v/bByvgPFdrzFgyvGXj+1zStDh7RA9HJYp
	AznInVZVb5LwudXq6dEcTQFpc=
X-Received: by 2002:a05:6808:f94:b0:4b1:ba28:5df5 with SMTP id 5614622812f47-4b2ef327908mr7079750b6e.18.1787328579340;
        Fri, 21 Aug 2026 09:09:39 -0700 (PDT)
X-Received: by 2002:a05:6808:f94:b0:4b1:ba28:5df5 with SMTP id 5614622812f47-4b2ef327908mr7079658b6e.18.1787328578881;
        Fri, 21 Aug 2026 09:09:38 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:38 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:56 +0530
Subject: [PATCH v3 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-3-196e2b306368@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=1748;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=tzDqNTEhoFVwtAYNfXTfFhwNi1y+wzNPDmbGPl082TY=;
 b=CxsWXOKtJP6Cvh3tIteifLhUXNDAbb56aoAXVsLa6v3Cfb3Hb+XK4dUrRN7H+p4kVAxUL64uA
 XGzbF+q4je/BNf+gDCsy3Rm4JwOd+U8TlxfPvt0d5PYj3u/qV6owX4L
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=BcroFLt2 c=1 sm=1 tr=0 ts=6a887844 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: YO-JIooFLZxEb-2UiNnjuMGERIsvJZej
X-Proofpoint-ORIG-GUID: YO-JIooFLZxEb-2UiNnjuMGERIsvJZej
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX3lPb3gKEwI9H
 YscjhDJ/KrDAODT1f0Ex2YdSXAJB7WpfS0gqUUVhwsJpiVgUtw38oheBAsVT/6QXUgEK9ZTk90r
 riwj7qjTgJLZVTX5p1IvYbfMlN7NJsc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX2qYnYidD7p4D
 E8J9Qpm1UagMmvo64A5jUU5oZrxPUV9soYlBTNl09AQDTcespsAdQGMCO7OJ0yuWlHCerqi1jlk
 O9K7rGyaAdNK7PztFX0RiA7VFb8W1b4DRhD/9E+CPKn+l8ZGu6ozksFv2ryYIt6+lPHrj0aSqCA
 pgbDvBVnzSBq4/hALwb1SW9UFZXF+SIMcTojzxkCbb9Ovo5Qgf7WqYeL3H8EH7eDx/HKgQyDM1F
 IKZAzbiq4orUJ00U0vj4vLa5wrlmI8zkXHGeK5nuJq9hnqbBC8ll8XcxFvbg0jc3NbWPWcXtRfu
 eC71ISAvGCcsmuVb3h5gc4bnbUVp6Tlk6YTM6DN66SRN/Rn5W7zeGIHtXsVRVtaDJaKvN56Hkwh
 NBKENsueWsZbU6nEg6oV2rDkU5i4Py3IIw8D6y0jqkW73kTDYfmCOj2iKpz2WsXfFj65MraCrN5
 xRZtfSu5pZF8+SaGuLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5a14..3c7755735dc9 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -685,6 +685,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Kuno RPMH power domains */
+static struct rpmhpd *kuno_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+};
+
+static const struct rpmhpd_desc kuno_desc = {
+	.rpmhpds = kuno_rpmhpds,
+	.num_pds = ARRAY_SIZE(kuno_rpmhpds),
+};
+
 /* Hawi RPMH powerdomains */
 static struct rpmhpd *hawi_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -889,6 +904,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0

