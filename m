Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ECB3B42F2
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635825; cv=none; b=DBLyzMPbt2xmDQf31Sq5WQUSbrvJTRFX2YPkyMAqRPlsWwWt6o8uzcRdyqImWmfp4TFsL09dKTk7edbg7lvt0kpGBQkci8g/vbFBbMeoCR034eqFAcABmEQmQgUwJOOozBSuQJsYDH7dQy73afv+NOybUj/jD3gkMJQgmoXLrNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635825; c=relaxed/simple;
	bh=k2jqd3VB7Ii7gobWh98v2nPkTWWWHJqnFwtRiqht5QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEBVzBSVjSZrDOUfk1Rn11mtt1/vNu38Vt2r/ABA5Sj0l/eYsuPEzjOfREBV+ksLbI8zGtRbSfRc3sCw6o6AEcu3o+KlYC7pPL3CkbiNnNcpRS2aitApyQs0C9qIZ6zjSVWKZCIhu00nCBA//wuE7p8/oDdIe2ga3S3AV9O0trA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M44fFOy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DR8RNiKe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M44fFOy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DR8RNiKe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60F8Z1924326
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbNkKRp6Yy62IBNCKWZAknt0uIOVVk0KQF9lGIp3jJk=; b=M44fFOy7FJFqVmKU
	sxTYyPNTq/3XubtKzX3oRmju5QJjqu6uEgK91d/fBisAreqdqjhKxsTogQuDJgPG
	unWWtAsIe5/I4krfGjSIuJfycuEsMdPPOo/UBa+z0ZBG6RaHFsYABw9XGgHZ/Qgs
	uGjnEmzLROFncKWmduJtVX+EZG1YlR8j2e4heCfURdZ9/9nwmlaaS8RJ54lZY1+T
	5pe/KY4BKO2QinB9WhpUyCcW1WXySVUCs1mFbif5y/mp4rdK4HYNNr+Ju/Pn2rY0
	IRJB2AcKrcQ1Q6pCrfroEFxs9/gpf0BjyqpkcScFbTDN0jLBz9uB3LGawUuk8hCk
	xzAgtA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxw8ujy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:03:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939fc317691so17737885a.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789635822; x=1790240622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbNkKRp6Yy62IBNCKWZAknt0uIOVVk0KQF9lGIp3jJk=;
        b=DR8RNiKemfyB5nY7DwtmS0E4TgjKYwwuni3AoG5MucM/tGKUjxtkcqkqN8IGaTavoZ
         XgLNekRqQkdezUN11YEvNXcc8qBNl9VDsQIK9wE5IDikGquqXGYXL8n/Kie8Yu9uIrNT
         jgboDJuP5e3VWwc1ex+d4RSR2CzvYW7xzNI+fGAhkVxU+ZTOy4y2kzCeAB/aYWtKbPk+
         B5Ot4htGdyGbElibIGwEQwKAjdw9fwsBb/VPZKnNaunmeQ/XIm0gwGFoEvrDN8Z4VPrv
         2VYFCWGhI5TV+J7KdhczOqTHsbjMtmLpBo0H+K4pj62fPwEMG/BJzv0f8Raez9PUD0HP
         4I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635822; x=1790240622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbNkKRp6Yy62IBNCKWZAknt0uIOVVk0KQF9lGIp3jJk=;
        b=Su08XMivNDyw8g8bWHwz0wCrwif5dMoRh7QLZg4vNdrQ0R3C4ySe8lgdRXK21NlN+H
         nLmJfWLrRf/jZa3l+/e15zUmkO5xYWJ6IpBiFnyZsr8Nvmky59TOQaTwf64KtDPqXg0g
         BRuZnAU8cutDi86jlTeDM0E2oypVKPWtKwegFuBON5FLW2RC2iIb250s79zyKrpFLh09
         bZKsMRHwZwSSwAT4q5tdXEio4lMlWYLEKExvBjzg3GTtxR4a30ZocJeMr7Xzq8dW6pUJ
         YcHaP7OR3w7KQ4cTGdjWbM2qNcU7QsiSz1BKweqk+Xw0yrpqFvpaNZJ3/2w4gF+6wCs8
         pk9w==
X-Forwarded-Encrypted: i=1; AKwUvBwKFvHInnZZRESfu5/6MigLxSbSL6UtUDzsWV8vvIKsXvqxz2XeJ7d88u71EQV19jg1Dk4cohssb4RE@vger.kernel.org
X-Gm-Message-State: AFuF++nw5QQhjdQtTlTznp4W0Xbyfc/3L4SSg5QkpLh9Der8F0HOwoe/
	ZPcBj/yO8MEdUZJ0JQkqmMSochQfbok00aY7f785fo2SrHwuTLhCAoZNlJCRWaWp2Oqf9Occy/C
	rhSQzYFWHh/zjv0S/j8Drfqy3PfQKZvWH51dSgPQC3KOLtEZb2fiZi/Pr+Cq1LuuK9z2WKJLs
X-Gm-Gg: AYBFou10tkIPBAOVGDt+8z1woLp9u7tMoS+5qzWMltnGghNDUKGoXXiJ1zyUFwtIaio
	OJcmDVSAuork3pYe7NKCzo60XKkOLigLzJjpcNBia/VCq+EItNENsmJeX/iXh0Bb3SpoW/5vSll
	Q5BxpDQuC6XBYUh1kfyrU0JkJnjqQoobI/CImL5JMHHa1HgcM1SReJNsAqcdeVgxkyWS6hy4PDr
	YTyU/Nj5y+fVVpamSx/OMJhFU395Wb9Kx58Kf131MJm8ARdC3IV/oxR5Pg0IO9nnts2kp0vL7Vp
	UJ4GmyWroRLcRMLaz1trlpNmF4TS3jQmabbn3dA4CpYiB4oFWxce7uQyTyQeIgBpAF8dXb1VZ6V
	++AONN6Buq9E15UQTp8Nds7YIuupxs1jU
X-Received: by 2002:a05:620a:444f:b0:939:d6cd:56e1 with SMTP id af79cd13be357-93bd3863e96mr28969985a.0.1789635822216;
        Thu, 17 Sep 2026 02:03:42 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:939:d6cd:56e1 with SMTP id af79cd13be357-93bd3863e96mr28966185a.0.1789635821769;
        Thu, 17 Sep 2026 02:03:41 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:891:4ceb:5214:a4e4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d240669sm2983343a12.13.2026.09.17.02.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:03:40 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:03:25 +0200
Subject: [PATCH 1/3] pinctrl: qcom: hawi: Fix intr_target_width
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-tlmm_intr_width_fixes-v1-1-3bc1d056aa6b@oss.qualcomm.com>
References: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
In-Reply-To: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jingyi Wang <quic_jingyw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789635815; l=867;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=k2jqd3VB7Ii7gobWh98v2nPkTWWWHJqnFwtRiqht5QU=;
 b=GSrXki2rvImvWFgnICiYooXyvdFLpaoCy3PueoBSTU+IV33/vv3OpPk6lRNFv3RGqVsa4dNbU
 u8IjIUGiIe8Bo9fomEatUuK0JEbbIOfVVNTOmympk9gFaHP7zKVi9pd
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: c-IgTHYY7B7I_WDW5kwkYX58yfiVLWv4
X-Authority-Analysis: v=2.4 cv=bY3+w+PB c=1 sm=1 tr=0 ts=6aabacef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1hUXCM4H_6GI46Wisq0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfX+8LI1TNmA1Pm
 B9XsvYeSSv8EBm0DtG/JCF6lbE0l8yXmCGccHEmwX8XgfD2jJmf9vFYntxPbdrAIz9Io0ndhzTu
 ofPgYpEoFaPObK3EvJk01WslQ6cQWm0=
X-Proofpoint-ORIG-GUID: c-IgTHYY7B7I_WDW5kwkYX58yfiVLWv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfXzRD5JrU6xyFa
 a3pFLYEvPGAlIn90z8vx+UDlRzhCzpP+q9d5WJMMk2aHahw/n9XVs52oTRvsvWjHJbHAvZhbf3h
 o3LeS/H3ZsBQpMltk0Mf3tgEzrFr9CqTq4+bF9KM6t5zKoM7phGfb2fDesjUBnNC/RbEWVonexo
 XXaD7fmJpZHYD28sGfJct5r50aikjAY/eix5TXjKxXRvNkwC4gtz1UyXKoILbOQD5PyMglBViKw
 muOkfoie7dzu3vX1miRUBq4SqjjnjaaBwbOeONzcdqJU0teiuP4Q5Em8zVTkueUZZdde2bDCdJl
 azLyz8lBul5UJiYSXcYRfYrlyteQIYXAkjwRaPuL619raMt1hnRTs05fpyVYtr3gPIQu+Ihjode
 ze7JhTLdordM7TXyBVWuAxXfhvyISYXzUlmxpN1ZEBV+m8LLvrgRfO2xAIeRNKRLf4nQRlTLipX
 m7OQxVesVxa0h5qwLcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170122

The default width of the interrupt target field doesn't match the actual
register layout. Fix it.

Fixes: 90700e10d2ad ("pinctrl: qcom: Add Hawi pinctrl driver")
Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-hawi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-hawi.c b/drivers/pinctrl/qcom/pinctrl-hawi.c
index cdde69e954a76d7913f26ff33df21ea72349f74a..3486a6d63d10e71b0ad78f10b0a88bf6f47db738 100644
--- a/drivers/pinctrl/qcom/pinctrl-hawi.c
+++ b/drivers/pinctrl/qcom/pinctrl-hawi.c
@@ -47,6 +47,7 @@
 		.intr_wakeup_present_bit = 6,	\
 		.intr_wakeup_enable_bit = 7,	\
 		.intr_target_bit = 8,			\
+		.intr_target_width = 4,		\
 		.intr_target_kpss_val = 3,		\
 		.intr_raw_status_bit = 4,		\
 		.intr_polarity_bit = 1,			\

-- 
2.55.0

