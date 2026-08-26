Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C350336997A
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756906; cv=none; b=t06/MnJBKmDU1Lklq1dfollomqCpkGDbUYNjtwXuZ6Isah5b+TpEXXvVEnQm4Y4rq0O8hRt1ErKFEqDVPlQAl6/ThrwnDX10Mbun7g1NnCQhaI1QDiZQV5FuqrGX8HLclEDIzz53wrwweSJRDkgWDu8TseI58ScE1etWqSxubqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756906; c=relaxed/simple;
	bh=8U0LlrBB92rHLBvToxCNa5U/P1iQ5iI5O2fWADVmb60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=heT9EcYLL4RKpP/Xk7ufjSIdwzXBL4BEk0XSZOAKoT/yiAyphOrfM63JQ6S7SLZAG7HRPy03jYS2jL5sw2vdxCy2BOTem5J22aQX3quohnc3fjf3WXSTkSxRgcZ4vud6jQtQ0PaOdE2Jvw0HQW0cNvAPb5ockDvHzCNEwB7zXYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ed9oj8E6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLB7iMVl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ed9oj8E6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLB7iMVl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDulLt910261
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 15:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCKm+9+9oZv6uYyfqjJ7ZMSS3G7gpwY6tgFlUutKkZY=; b=ed9oj8E66adJtJKD
	umasm9msml5dRwqxi/J6+LZvkTEJM13lxSgHImAJE6b6frV2H44cX0z+yk/WMfPU
	RsQNVNAHm4IqZIqsMYBc9tHKajrKPRWjmWNHWFaILc7m8cFu1IPtKqmRpimMDhZY
	k/bKH3A2f9t4aNA7S/JJSg4DKGLr6Yyybqcs4fRxeVGEmiu9K8/x2Zee/2sDfbyE
	2f5EK0/rB/jqgomvpIbn+umc3Nn412st0HAzu1YGR8szf9JgQBRGVLVASL0raPJj
	NXGY7l2Drvkv4v6wYCE+JZcyXnEVeyvrkDUP6zNe/eDYbfikKJ1ZukGo4Qy43daf
	ama/5A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a8pvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 15:08:23 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cb8d1b032so135346241.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787756903; x=1788361703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GCKm+9+9oZv6uYyfqjJ7ZMSS3G7gpwY6tgFlUutKkZY=;
        b=BLB7iMVlrF8GeF0Gow/xHXUcN7Ic5a4sD3nsOXUAGiq1Uz/Z6x571W4Av25MYJZAEP
         /emjTzLIMTVF0HOFJtgJornUWTwJfF5SDk8+QfYTg/z3BeEtu4YCkW2guFAYRmcOZ6OU
         RHbRwYi9H3yFCMw2YCJq+WQAx7lJkZXRkvoU0O7Up6E5/HF73CCkP2UIVI7jRKgzvZFE
         TSlCzgwJbnhmpD2HK29ZK9sVCmqfNRJUhkNJx9A7Ng1DyB73j9aDxfW+nkBqrv3BSp4K
         nSQ7l14EstjHVnrGLssGrne7AUWkdya8HxJu1Lk50MjmcLBsgqDdpa0IDKgu9RmNhjIW
         rsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756903; x=1788361703;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCKm+9+9oZv6uYyfqjJ7ZMSS3G7gpwY6tgFlUutKkZY=;
        b=STRDcoWF+PkyL87AkYkaZw6WHZHFf5c9tCUUnHOG0rR+4b7KMQBpPFfTTDJE2C9ZZZ
         u6CpZonaQVQewqW7AHk6QSP/Q00oVGYAONNtYntgz+IF6GHU80/QFf/4uTWjTSYVlDmn
         B9Gj8W3lHEtpTNnUmzfxMJsqSW3vmJPsB4PQgzugRoRtlPkoK+rkTX2DRpiAW9/29n1G
         4/bAFOtYxc3m2/7yww7aC6t3zXJYvlR+thz2DERdHQ6rQA5lf5M1BYfxuFduuLs5OI0x
         pmNC1maKXAQadqM9UNdodM6oF+C0bZVpSJhfvhAZ+u652iENMRsDcPHkYhMqsRhBEUw1
         ExrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmCvi+NT91agK0aq5rb+z4ndEwfLM3zBO0JXdo0tCLq/qxiPIQacws6sfPpoK8mHidovQ5xGZx0oJk@vger.kernel.org
X-Gm-Message-State: AFuF++khnJy1Baci8QYmiars+dr2PLiUintN2e2I3DdGe5+/q+JeRQ//
	wDnvHBa2nXjY6D4EUbSc6vTX8k4K/6tO7Sg/I2u876DUHid3gPafJntcb5Y+v5LoI7voC8I+agC
	o20CUDEys0bsm4z3Y8iLjHWoRX5xgcDmAv90HC5cDVU+AXy/BYfs8U4/Np1EMbr0j
X-Gm-Gg: AR+sD10ptSbIKHUSML54q4loWeB0bRoZX86iyDg4s5aEcyKRp64IofxbvUfODdee9vg
	9ykdUEy75Is2lYwbLlf9Rfzu2ltgmKJBn8KgwF5Q2pAP/bv1TXiQz9ijZa59SUBDPJW845hrsgy
	bcyhngK73pBMd0CGJuM46yW9VTNPswXby/RzWSTaJOQuB5P8TisGj+t8uK8yGGPIde8mqGX8wUd
	Rprjszk79xDDZyWFHhgNsUAy/QdmSpzh8tOeK8Vif0JApeCEziPal5tOfo+S7SRqFMwNXuQEkfP
	JcTX9w8ZrYmQA1uRbGxsW28LIzbdbO0FYrVmdxNJEgun5TOv2H06fJD2vZtlBU8/BD5TGSXI/pf
	fwOHOTYFFxgA1434JDSEe2U7CnKLG
X-Received: by 2002:a05:6102:2d08:b0:77f:fd02:501a with SMTP id ada2fe7eead31-782c03e255fmr2379498137.5.1787756903098;
        Wed, 26 Aug 2026 08:08:23 -0700 (PDT)
X-Received: by 2002:a05:6102:2d08:b0:77f:fd02:501a with SMTP id ada2fe7eead31-782c03e255fmr2379449137.5.1787756902323;
        Wed, 26 Aug 2026 08:08:22 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8a986sm29340315e9.3.2026.08.26.08.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 08:08:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Tai <james.tai@realtek.com>, Tzuyi Chang <tychang@realtek.com>,
        CY Huang <cy.huang@realtek.com>,
        Stanley Chang <stanley_chang@realtek.com>
Subject: Re: [PATCH v3 0/7] gpio: rtd1625: minor cleanups and log improvements
Date: Wed, 26 Aug 2026 17:08:10 +0200
Message-ID: <178775688405.67048.8153038759125205303.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 63vGirDQQZ-rYQjYbq8P3q6K7Tafgndk
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8f0167 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=81INXhKgSao7X_SL7FEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 63vGirDQQZ-rYQjYbq8P3q6K7Tafgndk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNiBTYWx0ZWRfX7wg/gBvSgxiV
 9NedV0w2vhgW2uiI7wxvYGTYzBAYwTUYd7kAP5rMcIiJWtFtodoSGjn8yAOGEoQklceQlXGrPEH
 kK5GBV2L5R56FQITmQqTgzImrBeScyk9DDELlHJp37ypWss0Xudq8Gvj+ai//N2zoX2KzhzGbgx
 V2fdY9dNPbJO8eS1OnIezm9dzFsPuiw4vHpU7OVhxH43L3gHDWxKVWZIw4XZ+PhCZDupG8m7vIb
 lha/rfWu0QqpusTgXtuPen2jSTDdQY3erk5fpKSfsnpB4UvlhSggaoLDmoV0LxQmQ1l6/q7ogg5
 Yg0p4o0sefX0Cp1R5KpnA4JGXpslIoAw0eACYbW/KQjCbvJcsJvPXbSfFaMaMt1IjqBm44m/v+5
 WSteZUQCQ+2syJ8M0baBbH0R0nFogsYg2OGr3Vs6LYoAzjF1ihNwMHIEZZ3wkJ6PRlbu5gX57pz
 6mCK4PMIuZrHV6y5/ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNiBTYWx0ZWRfXxyz9LzTwTvgK
 X5RM3eKD4rX7uEt5P5OFYBxJQ18lFqqz2AAwUvRBwiLH3BEYu2Qdvry0XxcJIE/xG5bmxVNd46U
 6ZEK54c3Hvmx6IGiUH/mbxLGD3SIBw4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260126


On Sun, 16 Aug 2026 23:17:29 +0800, Yu-Chun Lin wrote:
> This series splits the previous cleanup patch into smaller, logical
> pieces and addresses the review comments from Andy Shevchenko.
> 
> Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
> 
> 

Applied, thanks!

[1/7] gpio: rtd1625: Remove unnecessary blank line
      https://git.kernel.org/brgl/c/f60178ca784aeeac3552383253e463d7e9d91620
[2/7] gpio: rtd1625: Drop unneeded initializations
      https://git.kernel.org/brgl/c/097d950bb33edb708f3ea40453ade989cbd8c283
[3/7] gpio: rtd1625: Fix variable type for regmap_read()
      https://git.kernel.org/brgl/c/d54bcfc3402fff60f38028a3ddf4e21cb0700fe2
[4/7] gpio: rtd1625: Narrow 'i' variable scope in loop
      https://git.kernel.org/brgl/c/f5440a157b062e0bc67196614b6a24649533d495
[5/7] gpio: rtd1625: Narrow 'hwirq' variable scope in loop
      https://git.kernel.org/brgl/c/7e9d11c9abf5e856208c0a3f3f32671f2861f4a8
[6/7] gpio: rtd1625: Replace pr_err_ratelimited() with dev_err_ratelimited()
      https://git.kernel.org/brgl/c/a3902d376dd2e384931aa10c077005547b9c2ba8
[7/7] gpio: rtd1625: Use IRQ_TYPE_DEFAULT macro
      https://git.kernel.org/brgl/c/d42c1df90df49b19c063d029c7d67e91751edc96

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
