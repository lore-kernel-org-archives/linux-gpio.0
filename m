Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9697D4A2A7F
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635831; cv=none; b=HXo4Tnjb7p9AYjufBQJvfxL0oXeaNQC1WKtiOodh81KN+WehLgrN4je0TPRijzolng/HKMWl9mNvVkfYb2Pr+Pnwvt+MNgSTsAQrxJ6/gjbH42MVB5atqkRBG2cg9/7G3ZuAtFpsIU/Vdpl+EcmmOa3P+6cAbNWMzn2zCyxEI2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635831; c=relaxed/simple;
	bh=ZJHsuUW3/RLl7KCyTNTHIcBjaqv1ELIkmKGkZ5u84U4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwTjL2UnUKiKLpVRWunRGynG4RQkgS609rdfmEDg4jWgIte3pwMuGscaIG9wdC+qSWq3dgWl4mZZM2FXSFbQiGRMidEZaX/pR1iTfKCx1Oy+rIJvWr/VlZ5GFCR21qtfpkflOBRbvaybDHjunWS1zPeZ8nDM2hjSXQntL+hacyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e68aDCDi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnoQgc+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e68aDCDi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnoQgc+1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H8TV6I597684
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHGQgTBSg6fmF5tBdwK8NTwj8iZke4OL5z3m8HAnfyc=; b=e68aDCDiVZd4++MR
	LMdHyxS+q3S5ozkzGJMrARfJmuIzd9O/tBPl74u9XVC/kSpcper2IRUifP74lrtG
	Rof4h9fGXMUmzyQKyxMHyu7Rlqo4LhfMmZ1G4NSBEK/QzI6SlQzJMunARd3voDgM
	mAkBXc1SnDEi1UcYSjCOauBckGGcWt7c14Vft82G5JEDP8NcliUjvaK6ul1V6yI6
	wYYhFeqhj3p0TMtJfb1pohw0ucP3Q2ehvCqLYPE9xC6U/rKoOYtAeH7aL3Ox29xE
	X+oF2un/YRv57UYHgOgkgSuc27bBwMozDNXiqKLBB8nK076Qzr5oDgDOlYx3s8sX
	nP/xVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra84ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:03:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so24008385a.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789635828; x=1790240628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHGQgTBSg6fmF5tBdwK8NTwj8iZke4OL5z3m8HAnfyc=;
        b=MnoQgc+1JpmUqYQ9rs0toURNp/oCsfrW6j39xed7ZX7t4l5Sio1b+ysZZNgZzH8SjT
         DRo+m8rmMHsLnnhYrwxcgIy8cNeSV8Tis2bt/NMDMcfzYrNPWGCTedWj4Oh/SrZex1Of
         6cxs6Y2XyWJyGgJrN8pJK4/q1Xv0JqIVSupEgyPQd0c+AAuIYLwdk5/UyJOcIpU68ZbH
         7Zj8gzG2VehgimRWu5gnMVGPdwlP/Zc5vLAVptQgMGnyb83akG7rB8bDTWUZwYus8E0F
         zKlKY8knz77Zbox8ihmm0WyBSKum+zOywkD7dFyLMZQv2r5xJ7rw6N7LD6lSafXTRlIG
         qvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635828; x=1790240628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHGQgTBSg6fmF5tBdwK8NTwj8iZke4OL5z3m8HAnfyc=;
        b=QTP4Td32vbt8ARdSxE5DPVRkNk5v6isyRvYgTqgKqjTh8MvCQsvIhXcbtEFPVVlMZv
         QI+BvXJYFn+FDOL7dFjER6YiAJ4fuxwJsxM/4jxiQp9AGs1c7uj1F/4hCHMZUybsU3f1
         yn4vQQx+9X8CJ9gmZuw6k82j7OOCh8QaI5/zuGu07rvyY4xk/r13xLnV8+1vEd1IY3If
         TgSY7N/vQOzJciuktzEeD/qliRPpXwos50pxj2UdJ+zC8f/9e8I2h9M55rVJmsvd3fo2
         u0YlOjg8xiEApPFgVO2qEqXeCLjGFR7N93mQUcTFoX4uACilVmZxYA6PhggcCDEbMSHR
         SZow==
X-Forwarded-Encrypted: i=1; AKwUvBzgdCMjCL/IIA10dNj/uSaPxRd6aSOwCF245EF6wc54fEfTdOCcflUz9eAgRZyf3Ls2OP+iBFtZ+bPJ@vger.kernel.org
X-Gm-Message-State: AFuF++mQ2ksL+VQS5wEDog+kq+JX1kfQ4zqyX82n0m82/s0gIXgGfWvq
	CzaqWBQ6Tdpko77d6TMLjLvZFLjwp0LOLbXDf6s6Z55/T8oJ7oT6QBj27eDTXTJOj6NS1KaqLtP
	Jt55vUysy0I8gk/kJvox8E/6d/ynDYTEJm5HXRGvoIr4Yc0QnRZxbUol23hAybzFt
X-Gm-Gg: AYBFou0qXj+SnMgzZXNYdOeBs9dH7Z7NdDeEDQ1IL6licLz/crmmEzg0PxJ1z0r2u3P
	x/FShHZVW8KHzPyuo6i4OymEEnp+5r8U4ApR7VMa/G7bEHt1rH6+V5lYdA5znDEE4Kwxd1EfGNh
	idEml9vIWlLhn32W5wvFghjEopTGH8BQeJTP/NNBj9UcrjL2g+9WNkmaV8HLVAbFarC5Sak2gbQ
	QYvvqbUuD9wUYuDAlm1Eiq0vbWr5oL4PqrK1xvQFZzwJydrMyv7SCcBw2PVYhx4K120KvMjohcg
	Y9wnTadbSCvfRr7mb7jwDcRDFdIIdd70kJTDJfmxnQXR/LbjGhxWQV7hnL4sbHnpqCV/ug25bVt
	gVoBjSgImXv6vAg0vYvaYQK9B2aE2KHDD
X-Received: by 2002:a05:620a:6289:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93bd3b59823mr26343485a.1.1789635827863;
        Thu, 17 Sep 2026 02:03:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6289:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93bd3b59823mr26338085a.1.1789635827372;
        Thu, 17 Sep 2026 02:03:47 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:891:4ceb:5214:a4e4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d240669sm2983343a12.13.2026.09.17.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:03:45 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:03:27 +0200
Subject: [PATCH 3/3] pinctrl: qcom: qcs8300: Fix intr_target_width
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-tlmm_intr_width_fixes-v1-3-3bc1d056aa6b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789635815; l=883;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=ZJHsuUW3/RLl7KCyTNTHIcBjaqv1ELIkmKGkZ5u84U4=;
 b=tX0oMk+h3NHX+2fn2yj48FDUBSOwHFzryJes9qv7ZSO0/rz4NSTtz1nNtsNr0aSvGRgZvxpMq
 VgIJlZeV+ULCYzYJPxhdz0tppkMIXnp61Y3PMnys7GNkhs8Zd7a4iy7
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfXzBMHbLI4uzfW
 r3mQEqR/esuxqxEXoOg1yfb6lfItj8LglQUFbfZxdteNIJz1YcCj969tiYULc7Gh5pDXi9MXGw/
 h/YjSh4ha9idmi7dsrQ7rNzBtSOLLh0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfX/XN/CzUwDvw2
 U/V7IwgOZLGJSagAqt3rCdWVd8ymSzso7mpBtXIEgSXmYngsV7jqPmolQYFzotDgKIA+MIBuep2
 ILTJNBFpvMtm0lxjesQb3rfn9IEW8qcwssgb7zOxqmRiyCZnnYTVl5wrWLhv860LfQ1ZTztvcbh
 0waB+8pmDvLQP7T2GJI+pQ2NbJmeF20Dl6kT1nO/2JdwUsFeIcCotL2JwC2QAncwJawvoZ+WgiV
 OCG8ZPV6p8O62HYh+g0g4yHj4cg2o/kTsYbyXX+HDCT8IbV8z6j29RMHdPEtEQLdsYWATF/Sj8g
 bHmvGUruFuDPOAbUBciZcyRExQB5JT1NLzrVHww/qfFAX002qp1qKsvQj58usRzWVx+Oxd1VMQR
 0vEeYpHhJMwVlSoEcKgbhMlhJCNafW5ypA2hFZIzsq2K5jBt9tPmYrI44UovjVFRhkSt6Y16OTv
 VRdKcU2aA2hdJsDVHJA==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabacf4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Q82aM-Fga97ApYgJ2eYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: LSVfCmLelmUh0AcN_DCWOdOnbiP30HmL
X-Proofpoint-ORIG-GUID: LSVfCmLelmUh0AcN_DCWOdOnbiP30HmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170122

The default width of the interrupt target field doesn't match the actual
register layout. Fix it.

Fixes: 0c4cd2cc87c8 ("pinctrl: qcom: add the tlmm driver for QCS8300 platforms")
Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index 9a904d809e11daa71b41fcb42b7c145017998673..fec86818c51188a0949e268382fb0c5de3f66f1a 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -45,6 +45,7 @@
 		.intr_enable_bit = 0,		\
 		.intr_status_bit = 0,		\
 		.intr_target_bit = 5,		\
+		.intr_target_width = 4,		\
 		.intr_target_kpss_val = 3,	\
 		.intr_raw_status_bit = 4,	\
 		.intr_polarity_bit = 1,		\

-- 
2.55.0

