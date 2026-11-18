Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981837;
	b=YGI3woURKbGVFs2nPnWctMxwQ2mmgrEWKyd3cNqv7af2NDhGO85vSSS/XWFtS9349xwy
	 DWkG/J56LX4CzXsaXZ3F5tnVNA9be3BK4naxlnBkCjN8dED+FjrBxdKVzdSuvA2IZMOaf
	 c8eiU7j6PQo/DWj0Rek419LvQh3YJM7krhafGJZZPIl9YmRWtwd5u9QhMMpfvYOQ7WAiG
	 lRX8s/UyNMCQCv2eSrbQR3ffvmyH4JmBaF0Gdbc33+FekuzdnNA3xYWUvP+nZczlxZ/24
	 7SJfnPrx67fgCGGVQE7aEqDLULZ2YY+8uf2LzjlLIaO+b547InP2Kbo2t/nhGbyJ5vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
	b=hgfcWtoaWzV38CzJWl6MgBT7jhSxj68oMKIQN+VyS/Q0ENb5Ciz26M4OjdVeA10w1J8I
	 Su2KPDSU8ZYb0MoIfSquGy6WQ+6woZY23VTZdzow9eXwXMXapl18CJwdo2WVP0otr6b56
	 qS08wJdwOBhuYniNQOdNiE04O5NKdXnK/br3/Ezc+QJVqrhSLbrNTNABHk9ySd5MmZpQu
	 01fd0gcgPKk5R5nTSMKihzB486U9VeqImg9hQvo9ZfHrtEpZT7OVV+9VaF0YITBibOkt6
	 BB2kktie+gh9TXl4EhsxOBofhgpufI1z2QKhoTb0rOlAUAMGBaZtnJjGpvOML4Zh2+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJmtjKPM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVYrrSCa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489B2606A330
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489B2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJmtjKPM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVYrrSCa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UrSU2383072
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=; b=WJmtjKPM+Gt06NeY
	NK7I4LsMjwV/jDaDyAhLIdsLORSo/rqYaQiWaSpWB1twDhUQU7Q7LoqUnhuJvt6T
	gTR94IzfM4MkFCmoqopU6DRc4hgRbrPqWEmweAg7Gy1FKuF0zNlmE8GK0nODLdlx
	nuZUvE7A0Efgf7GVTsuSfdDwix92zi6fjBC08pxTpZ818C7ilLL/v6bbIVLPJpE6
	hPbDy3tIHc7p8PycgCpsX7ATS6VHVM42Fj18LPPS3ln1M9zCR22qeySm+TYFCgI8
	whC8OLWaUGz7iN6epytNG4S18wzeCdDzv42umwUspnl+wocUtOXfxEVHy119jNNK
	JE6yfQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasgb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efdc35736bso8905575ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981836; x=1795586636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
        b=QVYrrSCaPKymmKhsag1F7lcVJDX4nu5h6tSbiitjTfL93GhD/9gkWb4dh844lxz4lU
         ZOJ+EktTuJxn6p3rLj5eS5RnitlxVm+V2FdEDvPmUhlbSk1ks6XLRQ7hqAWYkfiyeVGb
         n6CyE9b20SE6643AI9V/k0PffFSFo6YnUDqKoR8DGk+XaBZn8siTEJRzLjTWvKo6tQZ5
         OzGWaGKXqrZT27EoH4NH68lfSoqkUw+BvdC5195FNugQxTiawn5f90t91qWIePCZ48I/
         TKx9E633YnAGTzFHF2nYWRxmQ9lvFPDTX36mpsiat9qZWH2wUaFfVVIY3OKtI+U7hpUf
         9kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981836; x=1795586636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
        b=xtHduJRscfOIekjVjBUinjXVUfQJuR7PC0nc73C0yg5LOVjjH0N40Sn7ihbq6dLzUH
         ecm30y34wRM5Ywa9mw6x2ojR6QahRKEUHe0jsP6TC/4sHO6mOCWIoqdEcpVkOuBh9/0/
         bltGPu1gkDRj/lMsubXrcjg01aqG/LYK5zo0pCRTh7ca3UpU9JBSNjOT0IBdahURt29O
         wMOOj1GoYAEQC7KKShZuYbzNzT2QAo3ijRP0Xbq0AEIdPFRrC3ZkWcSLQXDsQPvaHzwl
         7tBKyaCsDqDm1l99CbKV0EymzyPS/p3zQtqfwpsTaSo2N7oFqE6tyMbOyGQ8Fmm1EG40
         mtbA==
X-Forwarded-Encrypted: i=1; AL+hErFGaDqskxGMR9QJvRdPX7vKHb11Lsz+sWY5pTRfObKskIM6inOZ7jYl05jcyrVhKetErDUWQOrlbpx8@vger.kernel.org
X-Gm-Message-State: APuU4Z+AWDuFLHowC3rgEx+T8DSKJiVXYvERANLG+PZXuVJyfzL4PtCN
	AMQ9BmtEGDqlT1AVkFVK8OmbWEdkGFo7qqTbuT8V0+ZPzsM4lPND6hTfEGuQsg0bDD00H0D7xSQ
	0JdLdD0fVPahG1+LVTl/Ry3LYkjcO46YSwhO1GIrO/duLbee9ZuNqtm4dmD/OS9Hp
X-Gm-Gg: AZFdTZdRREE7BafZQKpFAwK9iOSCyN4HRS8Nita7F0pgHBqc3sjotN8AWWsqVudtcwe
	6fdMuqPgSa+5rzymnnju4KlpSZifjLfQw9FUcNyYLetXTC6M+3RZWRsYl9xaEQTdRuLrC3mGlNh
	MiVh4rhn0Z2xwq/YHdXKgmQYeKaTnQOclbu4xxXguzo5FhnyM4WsUMbR6DxstDqnP0IGsOKxBQf
	jDo5AEr2dooZ27LEPOyVqmjI9zEMhjSOHHfnrRs/PSQo514axhs8djXf1yEVXSB5IDSJNtgX85f
	qS9WfX4bE/VPsl0HF78vLOPwVM9/V+dQvP/cftFkd4TCV38VitwDHFDAjKj9DUvG9KM1QORgCfS
	Qreo6WMUmPZh35Lh/qDKdo97UQPlIjYTrFkwZ6QS3xWKbL9zqDgYszQ+kGPCTnuqfJfELvCj0eg
	==
X-Received: by 2002:a17:902:ce0c:b0:2ef:e9ab:d011 with SMTP id d9443c01a7336-2eff7518b6fmr16345725ad.27.1794981835911;
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
X-Received: by 2002:a17:902:ce0c:b0:2ef:e9ab:d011 with SMTP id d9443c01a7336-2eff7518b6fmr16345315ad.27.1794981835507;
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:43 +0530
Subject: [PATCH 12/18] pinctrl: qcom: kaanapali: Add gp_mn mux function
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-gp_mn_tlmm_support-v1-12-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd3fcc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: WCxH7dn4vX5fxKFzffhWMCUJvQAh1MmA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX4AHE+54VwGm+
 v6r8h52Uut8JTbH6CJJeLE5l4XeBclGt1CInJf4phIzV4pywL1o+pLpHwCgv6y0s3JrA2PxPe40
 79P3nY67yEFrgTJ4dFgRpDLmc9e7/9K7HOhAt+90h02Klt7DvpObdnWl1hWXXvgwflEEw0FkXh6
 6eOfxaRXo1W06YOOhZaW9F90eBBh9Lbs7/aRCWByFWEQJk2tbRBUwvI+gtnDQPTdT9d1iLMhakJ
 BXCqRXCbaLjCwJMcRe0s0p036MITQDAHp1ExU9i1XUkq+YIHbfU+5cL1xUp75mh0OK8S3MFULDV
 Bq2mQS5QKvFtw8h/dYTzB0AQ2WSDFdRMAjApblwh0R/4fE7MgptiAXmSFk893ByE97BqCIHiFtq
 SOmzlXvf1+zEqB2mrE0D1O13rbJX/Noad+l47jNdhlXiwcyjgX8zBA64UDG5Y0XXdrQzdAZVdGp
 wCzrXdUPFNdUHFILyLg==
X-Proofpoint-ORIG-GUID: WCxH7dn4vX5fxKFzffhWMCUJvQAh1MmA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX54eZzmtfRqOD
 K4Gul9cRqJyPLmkZXA2ligyTr1boWvCA07kitmQw7Wk3XTdbQhc1gskpMOY44wdBBSlf3Ecks+r
 6s9JLC7e5+p8OzT4mzrnQ07L250LJyE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio53 of Kaanapali. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index e9351e29d38ed90b093d6a23572805a5a41a950d..2c27eb2255c30777310e6280f6767b426b12fc79 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -588,6 +588,7 @@ enum kaanapali_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gnss_adc0,
 	msm_mux_gnss_adc1,
+	msm_mux_gp_mn,
 	msm_mux_i2chub0_se0,
 	msm_mux_i2chub0_se1,
 	msm_mux_i2chub0_se2,
@@ -890,6 +891,10 @@ static const char *const gnss_adc1_groups[] = {
 	"gpio42", "gpio77",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio53",
+};
+
 static const char *const i2chub0_se0_groups[] = {
 	"gpio66", "gpio67",
 };
@@ -1380,6 +1385,7 @@ static const struct pinfunction kaanapali_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gnss_adc0),
 	MSM_PIN_FUNCTION(gnss_adc1),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(i2chub0_se0),
 	MSM_PIN_FUNCTION(i2chub0_se1),
 	MSM_PIN_FUNCTION(i2chub0_se2),
@@ -1555,7 +1561,7 @@ static const struct msm_pingroup kaanapali_groups[] = {
 	[50] = PINGROUP(50, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
 	[51] = PINGROUP(51, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
 	[52] = PINGROUP(52, qup1_se5, ddr_pxi2, _, _, _, _, _, _, _, _, _),
-	[53] = PINGROUP(53, qup1_se5, _, ddr_pxi3, _, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, gp_mn, ddr_pxi3, _, _, _, _, _, _, _, _),
 	[54] = PINGROUP(54, qup1_se5, uim1_data, ddr_pxi0, _, _, _, _, _, _, _, _),
 	[55] = PINGROUP(55, qup1_se5, uim1_clk, ddr_pxi0, _, _, _, _, _, _, _, _),
 	[56] = PINGROUP(56, qup1_se6, uim1_reset, _, _, _, _, _, _, _, _, _),

-- 
2.34.1

