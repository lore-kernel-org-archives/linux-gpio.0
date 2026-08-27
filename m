Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA0D483BFA
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848730; cv=none; b=HIl9Z35MM9hvt1y2QQs5OFsQn45p4Zb5cE5rNTgSePOk+dUlIFlQpxpix8Md/Xh1oWtjM/8yJ1yEmGqVNdqAang+S4UGqVDBC2VVNWyqfQ9MGqH38fNmDQqrx82i9pmzW5OGA1M+eiHc+bpHG/k8JSDdlyLNxrXkvjzkOfDg604=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848730; c=relaxed/simple;
	bh=k/DT6AgKWqS6ku+QAjOs6ZqZtSg8uMTVP2+zB+uhR9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0QENOnp1pfs9feMbjfT9jsDYCUBSVFW1BWRNEqcSvPbZoArFeXW6t2sX9Md4hTvFdiGOSTwgnLL9xYA0w6XwxkEEee9IEtMaOfvfcvz43kew3pe+GfQXEU571iomnPRxGgs9qdXf+QRTsseZUpHpESrvFlYwmW41c9KVNW3/ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRQcJWgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0iI5C3A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRQcJWgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0iI5C3A"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFcbqD3360592
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=; b=eRQcJWgyQYtV2xZI
	yHR4BID99i5hoQ8obVhpLKRNZ9dqwYwyFIT+sYdFhKvut/L/mrFeU6BAuAs6w6TG
	ujzo6Al9eBiewii2QWAEu13fAvoQPikO+7B34R4ZuBySNRVbeDbV5Os7/Ok9wzg+
	orzpoizxIJ0XohxllZZdWQ5gUENp5knYfKE8hyi41PsBLUtjdVsPG+U6EIl/vgAw
	11JylrytQlKR9AiuHbYESXdKW4E16yShf/8IRoRLtA4bDFsKT1PZ6kO1Z05qMf66
	yBqRkMCgKVJuNs9xDZMfbv4XbFOgbDuvSOLglCwPScmOsYgK7zwnNF7E3E7m8eC2
	/nKwFA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t3dnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:38:47 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9ee20bde0so142858a34.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 09:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848726; x=1788453526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=V0iI5C3AP0Tpw/TfnvzXBDTxuFzNo6ecHRs1w3j9IzDIAJLbQ+JR9CxhYnaKQlw2q8
         xgIiNsG2H4U3fJ6ePi1VLbO18KFK4f1FUxCP31HI/c2XOQADpPA/gId2hyLalH8NHyVj
         Dw+ytybIzFTQeYTnzPLkEKGgKgJ+MkmYDcfim69pYDR2Hq7C5EKS4b1TTiqzOMozPLEq
         KAxJRAEA+3yErX0mh9eJaG7SaBbe+4yvOVaNBJrlKqG8azy7mxezx1R3Ni5gIO6X3wgS
         UhCwErGI+fHDw/mZm3n8TvIY0q3Nu0kRU9yfMBtBaTXTs0MlwECgxjxcU+e6UbRFki4i
         aSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848726; x=1788453526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=T2mtTHmJbbqCxOWbVW3+KiC8AUY9gPT/kHldKrxYr6szeJulYesTY+FZQxLguYpRRM
         zo13qpS7cEmBJ3FaVw/OBPJFyGGi6NRdlfgkwZ2rCEgaPknuxgRfwqpBm2OK++lSqUF1
         UlpKqz2M2Sc220kKTcbYZ7w0xI/BvyHr1rP088zD46rjWrzQDE67TgAnk/3ECmjzcsA0
         oi/vDDLp1oMdKxOy2V+1k9a8mcMCvdy11xjW6RUElXAyeVvdVEjZLVnVy2JuV/oos+kL
         iHSFJ5Sa40fZv57SEJ8Di8puS/FsJfF+dR7mXSsGQVdgI5yaF7spi4KHmO9BBODhIzNh
         8PfA==
X-Forwarded-Encrypted: i=1; AHgh+RrZS48jv92KmTzWntJJOtRrgALUHoTsnAJqFqhg0fWYs6u11A7B7EsgynVRLgo8BKtZ2WMKrGwR9ufT@vger.kernel.org
X-Gm-Message-State: AFuF++mHhQs7MZT2TBTvqFkMI4qCrNrpmAibevyuM8ZYMDIIdgkmPl07
	aXNoTd+6wwRzcxHn1g1wzgrnSEB/L08izcwRaDLZOU2lm7z8Mhxkwcd5imyFtEj+GpY2RkUpcq8
	rYZ0ftoLzhuGpoHNfev0kkNRjFe+QTFRN/DdXWHZcCUyYWVDv9d0oO2XkfAl6tPwn
X-Gm-Gg: AR+sD11muVGKHSib8geIuCMpPmhTOx6iidWvMOh2/hy/MHzExNzIaPWeF7ghZLbM6F2
	zL06qVb29gfS1jPlG1wFTvrBjf3ckYPa3fWheXt0CJ19jzG0+jhBlpNzrsu0Ef5d7UZCW4l5ShV
	cOgEfN3GEw+MK9Oyr0dtvKUzTFgrrf5V7Sgho7u+4fFX3Se4s0QNBNK5qkjBjoXP+B25qYXuwMr
	h8yyUrctsSScRqPAFdlhe0SNju4htwvoiUILzTwo1QH09PmWj2AOMlcpe9TSH50V6eknP17HYZa
	1rcx6LKUiF33vvLEddcWkXPyywYVcB7mrvvRHKJa/+Gm01WvgHrMWcxCW6z4rIu9OOy1TG+3kiE
	46aaihK7VvL7nHP6WLbhFAFLbFNg6+6qKG92s4st9ILvBSo/9B6fDfe/v5j/UOM1gOPU+wVEJrz
	eFY6QuEntEG+db1AdORPTt2vU=
X-Received: by 2002:a05:6820:2917:b0:6b1:afca:5c7a with SMTP id 006d021491bc7-6b1afca5cf0mr9495074eaf.28.1787848726576;
        Thu, 27 Aug 2026 09:38:46 -0700 (PDT)
X-Received: by 2002:a05:6820:2917:b0:6b1:afca:5c7a with SMTP id 006d021491bc7-6b1afca5cf0mr9495017eaf.28.1787848726154;
        Thu, 27 Aug 2026 09:38:46 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:45 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:04 +0530
Subject: [PATCH v4 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-3-dd34f235fc1a@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=1801;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=k/DT6AgKWqS6ku+QAjOs6ZqZtSg8uMTVP2+zB+uhR9k=;
 b=WcRc3XN0592xfhq/gEJAYqLJiKdvU41z4BnWHFvcpibh3Ovwl88G3nYrLj5UB4VBR25kKg0K4
 /fCTuWsK1QFDOsWOQSOb4Z8mLT5MmzKqrkUZC8OayHdKlLMwXecetSc
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a906817 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: wsUEdU0FV7tm5lSqeY9dWXlxT5q3U1np
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXyRmg1m40W6d9
 Lrm88/6N02pG9CmD1oUOs8pJ/ONdo2uimYYYmMFLXkfm5+Gh2DEX48vnAQfqz/OiM8wl9qcs732
 kSt1XjnM4tLbzDUEn8gjSIUZSVbWrRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX+44Mvrz9UlU7
 Cs65Zt0zMgl9nuqSSWONhSTUiK/d5O9UrxynKxwkuBb5X/hvS7zDmcyfmqQ6yNBg5eEk+VjSy3z
 QOkXgkA1HCI0+vz/li8Pke7RhE9QaekJR6TLn9SZBGaD3T+ahvVUCuayWt0O5HgEJX1km47NH6v
 eEQnHYtPDyNS/Uhy1x5HoZmz9nWtOZQ9ye2SVPk76ozFfTEgD8hQthO0KpBah9DkQ9bkDScwAGj
 jyHU16ZXF1mubzJTKC6nMWrKQOCDTwhoz9NaNvz3Pi9ie0KrOYhD75muICdS9lRXU9lUARXMzEK
 nQqzrg1rcx9MAqx3uInZ3lJ1faPG96YKeF3aeu1L89cV2pcpltVMg06UJ1hbsNnOSwYP2lhSr/e
 CRJDrGOa7Di7ieHNylm6LU/UuBubaBsSsbAB3WKnL18AHJddCKnH9r5VArAGxi71Wi7BtF06oWy
 64UpCjqp25cDM9zB8CA==
X-Proofpoint-GUID: wsUEdU0FV7tm5lSqeY9dWXlxT5q3U1np
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 90743275942d..725ce802f683 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -681,6 +681,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
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
@@ -885,6 +900,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0

