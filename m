Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5650046F493
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983550; cv=none; b=lHyMBMD0F0AY21LDBqL8iXEnX1nAyfi5j4QXPJD2lhdUuq1QkXjp2VntfJIvpjqrbEqeb5VhMPsVmIHBHI5M3Jd6bPUqbRjHUDqMS0Z4tjis0IdGtdhKPkGQErDW5zTTly0sOPESSEEO5nuD1tnB3/kHChmuTVTlbH5PIkZ2r7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983550; c=relaxed/simple;
	bh=KApJYgp4+5IAMPSqpZq9c8V4lERgpgS58JN6jbD83ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9kiqAFGHTyvPiXyQpxZNXi8fFlNH2jPwF6C9X64GAXJvCHWFfxjT78CXT+lOTurwkn470JrWRbMrSqqnBvGakPZhfBxNi3Vhc4/xVH8rtnnlnTT+4aFRyDhgswfFMLmfluf1F408O8kNwlCsM4dJtEI6FhW1un4sZNqnyHWpBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjBtfKl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJ60k+Pt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjBtfKl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJ60k+Pt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79sX41624331
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n264CltQyN6aOAXWMZFeAq+AlGsyk+1sXEe2BGRw1JU=; b=HjBtfKl7Hbs7j0Bc
	pmjwYxIT7O26GkpF8lK7h0rSu4vWDhgvfiwUKvDujtAgKAnnXud8DKLNkuvpQFMt
	aF1N1/XKlkCefWBLBhd4tAykOlr73PtOCUPBZkTgCgLgpxOnSZcxN1KS8trUyEnF
	b0wfVOBeLG/kZTyMeHjwf16Os5sxak4W0dn8HA4i1ssNYTiA5yYqwPAai5ANh5kC
	AGiK9bNBDDmiAC3EvpWviQNwJetUNGs31t4Ux85xS1uA+hLcrVlTgaoHZFHUzCNf
	ZEs+ZbSXkb90+sDfe1HRLyu28pj6rI7zJ/q3SZWPuOzC6crqc1H7V/nGorR7pXuY
	ZnIjMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wspss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:39:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939a6937513so434394285a.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 02:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789983547; x=1790588347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n264CltQyN6aOAXWMZFeAq+AlGsyk+1sXEe2BGRw1JU=;
        b=AJ60k+PtsOuE2b0ha32JhyeksHvV6xp4LlfC/tPqiGfmgEiyB5weKd4eUEN7EEtOf+
         jG58WlqXGIOw1NjkQlAW1QUH+43yvGIXV47v+MSaJCbblknIdggAtIotwuB6Pow2C+FL
         l39qWSfRaTx17258ycLqjaeE1ryAzOgDfWYfayXlm1O/xiOJo2KcovqsKPsZYYvpgHF/
         cZj9k7KG7h/f1z+ANvZdXSOJsUKs/rmErvz3BNayqG1AMo/GPH1oZgfYzisLW1MTDk7R
         R/ImQSbfLi99VqCg+V+x8PTkoJjIU0hYA7Lr3NQNn7ZSd4nFod2UlXb2Pl6og+SIWbDp
         jXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789983547; x=1790588347;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n264CltQyN6aOAXWMZFeAq+AlGsyk+1sXEe2BGRw1JU=;
        b=Z2H2O9Q9Dr71vNuXVDJbHH+jHLsPW7h8QVh/ZIXWjU5Q5XvOW2W0FVoNVsBZLZNjc5
         R3WEFrNYs4aIQTi1C2DgivYJzszy8ybM1TRiE7zEHQ48Omu9+WMiNzetYEKMPO1Urihy
         8QFeaDI4VMowjojAO/G9F6M3iiJtkTda5FKqODsdRAZtq9fDFx7+RNkqzCB5lFSzxDUz
         B1uXYBgxxo27ljnjabxmQw/sIXbCObQrHQg+I57ObYJDB2WE0fySDe1HtzctmJZIauWL
         D1/amx70s3lqvhX8pZBmFccrSa7YFWd0u8RQwpLoMzNV3JUWdGjY0OXH3rOUTMtuwy+3
         RuAg==
X-Forwarded-Encrypted: i=1; AKwUvBxFZZXFUIUGyJUBbDIy1EXrMkasq9ma4NzVFVCRHRUSCUuh+JzRlB1x3y9bOmPqG4pgj3WC/ac3WHJk@vger.kernel.org
X-Gm-Message-State: AFuF++nyF1Do1AJ+ro4Ai9UOI5hFmM16PkKdlA9qMEulFQJAFSiY+zMF
	HRtrGpREamzoS6HYoc9yZS4Y1Fca+Tm67EwsGnwM1mpbaQ5RC41xML4Rd6KgpUBKkrbuDQwRpcR
	FPJt8hYNxtEtiE4s+Vu+tYkac2j5IlBuJlO3aMjZ9iFWCLX5pTYp1Vdihep5I7c4L
X-Gm-Gg: AYBFou2q1yGTY4RORpbdmW9OiWPoZcM2UUWgWYWouiv0m9CE6T5nN6izpH69XnYKy0i
	zSkgd8p0J7CP5eTQtReCbzqhFzmzdn6uomiwBpVn9WCcvm7L0oNxhZYl+338zTWbk43Xvy4H97q
	ibf/ETaNSRigzqveNW1/Y2N7glshrvKE2yzMECuMbdhUeQzvSpI7I7XgpIOeIY7B4kBPasCnj7D
	BjYGk51G9OOXRTuQfH6sQrsvSr8arRFo+OMu42GHn9rYoYMesPkWP3zYuBZ4v3LMx8a+qERBEYk
	ZA3rJCHwhglBqspCTmTUPUh5QXyI+xoKrwPHxwoyhbuAiR2eCnBlcmF+2DnPNqrVIQ/X9jS/m4y
	6RcBM2ghvXOb2jnt5GBx81SQFuQ==
X-Received: by 2002:a05:620a:1b93:b0:939:6dbd:de57 with SMTP id af79cd13be357-93bf56190admr876182985a.32.1789983547285;
        Mon, 21 Sep 2026 02:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:6dbd:de57 with SMTP id af79cd13be357-93bf56190admr876181185a.32.1789983546899;
        Mon, 21 Sep 2026 02:39:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07411fsm225949235e9.7.2026.09.21.02.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:39:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kees Cook <kees+treewide@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: tlmm-test: Add const to reg_names allocation type
Date: Mon, 21 Sep 2026 11:39:03 +0200
Message-ID: <178998354066.55625.13342780382170419764.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917211009.i.312-kees@kernel.org>
References: <20260917211009.i.312-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzOSBTYWx0ZWRfX5uYg4D/wcpvI
 uqhiVOqyUTZwzdypfQvYr0jmbG21V7PlKYv0ClVurw1PWt4jdqq9eZeKDmsi7zql8AdxRYpsbfJ
 kgOB09adnyOWdX6KypdDIDirRioeeIcyI/ubiMZEPlsu6YSgnON24R8DyZXu0+VRw8T7f7SF8Od
 RjzRIxWdanUOLilbupmyeJNDg9tSdBnacVnJ6+HVxsx+s43lkPesrs2ciW4NYE8L6nuV/e9kWHc
 GjtqLDtdKfVfhNbVw6h/UZMJliTc+HwGIqI8eNSMrx1fhQ6go973ao7FdMfpeYqj0NC9E6K7oz4
 +PHXckNE6NG7X/v1ewVNkzweAFHwZ2Gnm2LZlrFZsPSc4GVAhKFshNzEJJj8VE2aSPZu3pEyk/H
 P4DBxXqyZhNicsBhfpp5WLoaqvxUEHtraTJipAnVPLSg26TzetocIx6a9Wj9p3ZMmziFC9Mye5Q
 HpBeuNDnmuUOgts8HQw==
X-Proofpoint-ORIG-GUID: SoLyzSnkmHhJBxCoV1VKDOT4w9YOVAJJ
X-Proofpoint-GUID: SoLyzSnkmHhJBxCoV1VKDOT4w9YOVAJJ
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0fb3c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=T_YYQzP2RJLLj2YXv3sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzOSBTYWx0ZWRfX4MIFiQojN3Ix
 nYHpECwnZ46ruoYdFqgmPQiFaZqm2QNnKuohgILT5ihZGJxJSS1pzhiXjLZaOGdN0hFSZnYXIbJ
 VQceMip/+orD0ZO5yR4Q307hN+/BvPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210139


On Thu, 17 Sep 2026 14:10:13 -0700, Kees Cook wrote:
> In preparation for converting the kmalloc family of allocators to the
> type-aware kmalloc_obj family, we need to make sure that the returned
> type from the allocation matches the type of the variable being
> assigned. (The kmalloc family returns "void *", which can be implicitly
> cast to any pointer type.)
> 
> The assigned type is "const char **", but the converted allocation type
> would be "char **", which is the same type without the const qualifier.
> As there is no general way to safely add const qualifiers, take the size
> from the assignment target instead. No change in allocation size
> results.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: tlmm-test: Add const to reg_names allocation type
      https://git.kernel.org/brgl/c/4d7c9430a26aea6a69521af3aa2d78dd5bc8d3ed

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
