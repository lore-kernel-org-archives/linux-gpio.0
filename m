Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2320B418348
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635828; cv=none; b=JDPvr57gEBLBCQS6z9FhDQNAfsWOVCC/BFKp8Gmpzmkf9pScDKnv0N4OTy90HPqxa3tuXCZlLeVQnF9RYCpC3m62OtfA6iicqSRWNvzkZtU9pONzmqlxBiXE/UO6OSMKRDUx07Mwb3SsG4t3LI+vnm/TWa8YjULbGpFp2TxVU8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635828; c=relaxed/simple;
	bh=IcDAGCApwlzW9VP3KTcIuDnHW3JGo0WtRYlUEepAblE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXc6pu2aG5BOoz4JmpCwFocbounpWWU6w7uoGfVZR85p8oZY7uTmKp1f6UOjdgyOlk5Y92njv8G5niOUYTmGx06jUlCXWSMHvY4GLIPZvk9QZ226Big8vZDAynrYVtzs38/a6cSWKRwDQWzD24QbYk5tQSe6hjZPqzuYkU+VTrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fob9RdVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOWuQHMc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fob9RdVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOWuQHMc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60MYC3702421
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ng/cbe08FmLIDygEMEc9kZI6ygAXI1hwXKHZjj6nkvI=; b=fob9RdVpfQcY6wce
	5dm7MTWdliW8SueKTrocPUg4DLuxl5ATitzYIMzuISbzYbqhR5fGc+OuW1NsdSAM
	lNdR4isLUdGzpOVBNSYvwN99DscKuSNQTXJQvTRGelVzUwdwKJnXVpgeINKRoqHw
	L9BT4wy/2wCFsv0AtQt85eGW41JAkCOrCQlcL8/n3+guGIdzwS2rbDWlIlbQV5c3
	mI+wgSZ5OPRB8l2L7UV8VlLfkdkvDra4yW/jATgkNO1+9YsU/kMlUzy+MiihhvXu
	GTHqKFJHZ2Lg9GJz/90Wy4u05vKt/S8toHXPemvbMmdQZbuY7GJfeRzYOWcxk+v8
	wabT2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc9b7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:03:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530a0a18108so1575511cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789635825; x=1790240625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ng/cbe08FmLIDygEMEc9kZI6ygAXI1hwXKHZjj6nkvI=;
        b=eOWuQHMcPGAaS6u0jvyvkgdX1vFCZZR9SE2dffPMNLqgBt4m+qbLrqScPTYpmhDV+s
         HoNBedspGAoXsB0EgU/R1+eO8SPsi6dey/gz/0Ddqb4ZcQFqQpdsb+BVCGDt0SA/HFkk
         4u3vD21gHcXGt+SSbCduRrNMngKEmkGe91P+b+5v1hfMo4cODXXNDCW0QomNViY+EKRL
         Qa3xejk5NvwOOQGXY55GcXGfo7tsPJValn++YR5zWHuBONqqbmARGR3Ca9e3NwIQG+dY
         Z6F0K0OT70sQPWoQTCzhwu+ci8GFpYW7/cTKZB+nyky5vB7ZrYzV3jPax0/i02Q+wSUS
         rfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635825; x=1790240625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ng/cbe08FmLIDygEMEc9kZI6ygAXI1hwXKHZjj6nkvI=;
        b=L6YqhilPLY6crc1e+I8Y8Eq7GuIdaWwUJ+6ZyYPu9wxVQ293F0TJ5YYlMpOIq5Na/p
         +sSjioDy4yeL7jzCF9HxYXXsGYcqG4qqUXawEXNPRxRfgS8sRk48N+UvjyMdwAJ8uefR
         X1KVsHB8ObJeCsK1+Cwu8AajYmjEJFYW4cF5YBjzxhEkBvvgZ9yT8cKrTxroKtmL+TCD
         byLTOjBdIsxWlFRdAcd/krcvQjdUrh4fsLmwGyC0l/1VbRM4ZNgcq7n8BFWhGkJow4ci
         C8RfiAbm6vqpfWcw4rEVNi9Bxcoq0xA++pKizKwsHFSW3aJ5EYthalVzdgXzhv3s98Eg
         WK0g==
X-Forwarded-Encrypted: i=1; AKwUvBzzPy4JApHXTTFLXDXZaijqc0NTysO4Kz/j6oEK+ZGOqBQ3hQG9p7eGIp9bQc4L7ZTZl4hiFOi2E4Z7@vger.kernel.org
X-Gm-Message-State: AFuF++lJU+1524e8QGm5alHQCLy4uEyok72Ne55EHQLMHrVQ53UCkW5T
	kyvSrt23zlHFh0McTBnzA1xHTytHAc65/b4QGH3Vz8x0WYIOSDvnnGP8uTAd8O2d/kqPEqu7Ti6
	Q5yOali/k3DdzcVtVkIzgEiOvHeqsLjQqzNahrBfeVjghFTZSKymWcmEnBeKxCGVq
X-Gm-Gg: AYBFou2bKoSKoLxSur3pef6gjYuv3VXOB2J4GKEmqzVzpKeBnJLWzURAZQLGThbRGeo
	ZGI9m1FbO/8sHlH3tuD4/1Ri0POX7iK9AEHPCRkxALyvRtPoJqcHUfkf5fb7Ji61zWJSJ/971ct
	SfAXfwkXKWeRGPX+DKWQ8CmElb3LQXsLdNbzFRu7Vr3V5hgzsASFozviaVX558YggPov5Rwxnmr
	XLULVMNmOzcAU9HUsQCQWk45a4CJfuFBLCDulgo0La8G3MvPfhsXDz4M+MKw8HB61IYJpmlZRBH
	9gB8eJgYHjCXkFuukt4otRIrOHSmrUWtulEr/diju1Rc58kM+zQwMiwXW2KCMul42iZ2wjWJmNS
	8CNWkNWtGpKCwSnPOdh/TEeJPl6wUlSNP
X-Received: by 2002:a05:6214:e84:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9123d7482f6mr86577986d6.2.1789635824734;
        Thu, 17 Sep 2026 02:03:44 -0700 (PDT)
X-Received: by 2002:a05:6214:e84:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9123d7482f6mr86577596d6.2.1789635824317;
        Thu, 17 Sep 2026 02:03:44 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:891:4ceb:5214:a4e4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d240669sm2983343a12.13.2026.09.17.02.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:03:43 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:03:26 +0200
Subject: [PATCH 2/3] pinctrl: qcom: maili: Fix intr_target_width
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-tlmm_intr_width_fixes-v1-2-3bc1d056aa6b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789635815; l=890;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=IcDAGCApwlzW9VP3KTcIuDnHW3JGo0WtRYlUEepAblE=;
 b=vynmX4M4G6kWuEpybMLIXWJ7ku7jZ8I4WeQeuY2hS7NBdNK69WLe6aiaX/pxg8oeEwVB2Goyu
 zpzWBzGaQiwBhnLCOqCuWJsLH6Q74bD1qyYub0eUciW/UdbEfMsKEBB
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfX/5EFQuS8PNro
 61cuSf4wBYIhQhzkPszBdFRW1SV4+ROyJAyOeYqHTGcRBRjzYuQHbmw3zmPAhBEIyYrmLxFlBNY
 Vlbf6JtdhiUbkjkrrhrUeQFKrTDqwr05ggaNc+o5ozwpeCMoQ7tXi7U3r8EebQ+S+NvT+seCZNl
 EHTO2dcIFmt+O/zGHT8/oK6Y7m1hwE+cr9KuzalGa6eDDzUoV+YnjoFqKH0WdWhMDbxhGjkcdyK
 bd465cYGgeKZynYq5oxdJILOVylUAgV3PTA9gOcrRoD/obouEANkbiDMR4GONIPWzCQ8mc6QS3G
 gwZ+Cy5BfhaOITf5KVYciuF8iJehkGPrNPH/MjomwxP3819qnNKWySQKKb862a0bdGPwpBMvvJc
 8I+OVFC718zhhWCkCzL+xquIV1eRX9zCVMt3vJnCKFLt3cu1MiWldK+nvsmm72j5gY1CjkkgbES
 G1w9xvOqs7QkbsWos8w==
X-Proofpoint-GUID: CWIjXGMwIbmCOYVxxa5UvAueUGAC0Z8L
X-Proofpoint-ORIG-GUID: CWIjXGMwIbmCOYVxxa5UvAueUGAC0Z8L
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabacf1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7UxzQlbkgN4DJRjwbjkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfX+j4BhW7c+AQ/
 OhfdjaLNMu8CHA5kAnWS2fA+JOFapI1gJ29WT4TcfmW3dX5NFfUemJE1OACyIjlt/AhgCW2K0CZ
 vIVqHPf9RbgZudAQ/3h37OJbdityVDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170122

The default width of the interrupt target field doesn't match the actual
register layout. Fix it.

Fixes: 251b53103a2e ("pinctrl: qcom: Add the tlmm driver for Maili platform")
Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-maili.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-maili.c b/drivers/pinctrl/qcom/pinctrl-maili.c
index ffa084cfad6487ab6789000687ddbcc43b71bed5..b9ff0f4479410656cc73567ed494a1cfe25bb56b 100644
--- a/drivers/pinctrl/qcom/pinctrl-maili.c
+++ b/drivers/pinctrl/qcom/pinctrl-maili.c
@@ -47,6 +47,7 @@
 		.intr_wakeup_present_bit = 6,		\
 		.intr_wakeup_enable_bit = 7,		\
 		.intr_target_bit = 8,			\
+		.intr_target_width = 4,			\
 		.intr_target_kpss_val = 3,		\
 		.intr_raw_status_bit = 4,		\
 		.intr_polarity_bit = 1,			\

-- 
2.55.0

