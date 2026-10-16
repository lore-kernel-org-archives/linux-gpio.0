Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E462434EF05
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162174; cv=none; b=cRAFTUZ/69CxLaV/JB/XPqQ9AXcY4k7jEKdR/WZYAB4rNtVCs9YoY3XZRp+VI0sF1H4GO6FMJoWPdMIyKeJmdXaIR7CTcR36xvSPeCAUx19QSEcv44qlNtHbl8rbKTnN396TFXZR3tSz3RU2cYQjgEOdHrdnhgTx1sS5m9ggWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162174; c=relaxed/simple;
	bh=mt6FGyeK6jNbyz8QINMUDKHFZqEo2IFd7o4zHGRB+MU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rXhFcBglpGAcypuU7h+S1iSsKE4KkEma4fCOWac0DyeDcLRZjJ0LFvvV1oIE4yYeK+aSM/5HnB+1qR0AtS7IHSGBug/HliiFg4rZtNcgz3x+NSFwsGu6aBru9p2ARr0hGTOC0sn+6QpcNfuMOyJEU0B9FQyPx9lK/BwHCJDMy8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBnPaGm+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iU9Auhb7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBnPaGm+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iU9Auhb7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5jk81910993
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FunvRqBJexNhP4K0lBIttu/jyrOh3lBtwcx
	40Tj+jmU=; b=kBnPaGm+OpskkpHZN+gV/cEt1lamF0/R+H2DsKtc07jsMW8qBGa
	PKsRglq0VX2xT/2RlnBDcy3vRglHzoWCIF/xTXYpDR6gGm18t/RjVjaU/OG0+E/V
	fp1ftOpyEl6SgT5f98QMd/cLe04lkla30rG6mZs7Tizhwo4kmvZ9085Ac6odFhQ+
	HqmRGwIWnEXo8ukS9GcUyn7PRV0Zovi7D8+isLCHdkJbu/XZMagPEZ4S5sBQuOxh
	e3WO6OvJGEF68PU5UEsPjFurkBh+u7Bn3AyZmeY4mSmbfa5AIeYB3v8HsuD3yi6K
	GXxsDk+wgV2AQ9WrMqjz2N341AnWyQTur3Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8u56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:49:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso9510013eec.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792162171; x=1792766971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FunvRqBJexNhP4K0lBIttu/jyrOh3lBtwcx40Tj+jmU=;
        b=iU9Auhb7rcZtKYqPwuKZLLhjjJJV9CMWdHBrDe+HTdIgc9W4Z/9hU1vpt/uku0djVL
         njwvDNNpDJpjUVmwoRGDXQqWttShBh4kgpKrOZQJPbtaxXpHjlEPKAbfJbz3yEzmTpTh
         HCWPs7rUZmtWi1xSDsqISkAxneOUodj0EGsd9UzDbWerX/4pYm8PARceOZ0d6jDiNtPL
         NuJz46LcmOfje1ggvNddYWSU/4xydO1THvCweC42SL5huS+InIwEm1/6Jyyj3dNGIIub
         T+pHnc9SJqTAY1UAA4bKVU6inYP79c4zvLVskzyucPcR669N8lbU//wJ307FJyQSmUqS
         7m+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162171; x=1792766971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FunvRqBJexNhP4K0lBIttu/jyrOh3lBtwcx40Tj+jmU=;
        b=UbY4KHimL/j03iF1heqe/fZQg4s9aDlgKERdVNL8XqlfzCcbSOW3cfiDoHCqtinoyt
         viW6AAhqS3EZnjFNcjRfDGVz91KBY6tkzr6dfneun233YkoKGDBQqY9UMOFFGg0QwzIP
         XyinI7olaaslxf1ZB9ebE7ty0L4ay8uP8HhC4yMFVRYsxIuWzdhNol+xw0kZJGWe4Ty2
         u9AhGGZD+cPcWFonOiVQiWsS3q+6qpzcbIAwbRKiuHReuFDTRBngTErDL5fd7PQ8EbyK
         8zzWTtOf9yejFM+Ih/ysogz4LWN7wG1N32DhBZTqdWGhNZFHUnWGQAFhP9y9Dp5e4Jvk
         bo4g==
X-Gm-Message-State: AFq9FYKc3FxJ5SCrngiXQdDEXKBkHKa+g/ZtE2H871OEvc60n9FoeIwb
	ccR4s4ugHddsrJdoRRW8p8YzedDxDxpEZLG+uSqCmZ8z0f9UKUo/YLprm8glMn9L/tZVdPcKwif
	oj87ZA9YUbBidPmO361eGJQCjxsCbukbwEuQJVMrpaGT6W4rpKGbZFkzTm+N9E5FkYboaZAkUYO
	w=
X-Gm-Gg: AYBFou3dJxLeE96rTP6er5ea3e6I27ejL1Gwu7dLzJGLMvmJR3cMJU4PB5TrBs0/AlQ
	vYatDX6SrNP/gnp5t9d50JnkTd9geLU+rQEw6KOr421KDa39f2q3OdjaZXwsU9W9ubocfw7ebiP
	Dqty5V4cchkGbCcuGOms0DEdWCUGaNzvv99YMdk5fQSqMBJIwgeyyquwmdf/EnnuoE9KvSkk0ei
	PeDZLE3EZKfc1u6a9fYz7c9Vt6Ku58FwrU8wAPGvzaOx8uLaaWWxjJj+EKaoIKwwFFVN9UggCTE
	41dpcVyZ6nHSjDTgZD4bwyBtCqnN4T9LrVte1swESjWpNIZ/53jxkgPcd0XCpF02E0CfZkaJxDM
	HM+/zpwwi/lXyOv13tWVnmaCaQ+7279qE94COpCUNvZw0N9TabblDieuZg3s=
X-Received: by 2002:a05:7022:ea8b:b0:16c:6459:35b1 with SMTP id a92af1059eb24-1851310977dmr162353c88.28.1792162171299;
        Fri, 16 Oct 2026 07:49:31 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8b:b0:16c:6459:35b1 with SMTP id a92af1059eb24-1851310977dmr162327c88.28.1792162170523;
        Fri, 16 Oct 2026 07:49:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm7765337c88.0.2026.10.16.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:49:30 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] gpio: shared-proxy: Fix line accounting
Date: Fri, 16 Oct 2026 22:49:17 +0800
Message-ID: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Lvho06JOI7dCFAdaDLfarmlA2TXykrwg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX5xLC9YZ7klMQ
 tldmcsWIPUVe7bGBxRQeQShPPkfk7zquUwo9F21jzxFFtTnDFLxZ1S1pfiAqfiHlcAlyCLkTrpl
 cIkrkHWifZNhsayNBi42MBExSG1pEak=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad2397c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7bmC88ccGREFj9ZXeh8A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Lvho06JOI7dCFAdaDLfarmlA2TXykrwg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX+7yEBsKyhbIB
 8KKBWkV2iGW/pozeuDQI5jjhuubJG3FbjuU8aAXKufZnp/uSjBycNs+iXf78q+BJPYKb3wFtT1D
 TSwMY4tpygqsCks12U8x56utyQo15PRLtv8PwxBodYt9nBUa00yj390WBHnyISkDp7CAEvAby/b
 sFgcdonAq5GpXJAKqXVoVUaNrZW/XCWTMelhARWj16MolaTylkPlqmLD3JkELhsMCfBHvIddWwT
 EN0DBD7tUMD6QkbEcvujW6BvOPhm4IFkbuaHMVauqI4wQag8GzD3ejY1HSBf/mi3nHgMM/niWAq
 bxNwzxqU/0yLu0nFCZ7NYeoJWmiH3EJ+n9rfgGiBfp+gMhRMTfXTtujJVgIEQSW6iVS3DTnMqNG
 eTadvUIezyNbolRwoyFfYoRq/On9c/jcAclumHAB/7muaKkmE2bcuH6ncBIKhS9jO3WYW2dyY5O
 JVv/y2SylL0b95Efp2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160058

Two fixes for the shared GPIO proxy's accounting of users and votes.

Patch 1 fixes a race between consumers that request a shared line
concurrently. Each of them sees usecnt > 1, assumes another user has
already configured the line, and fails with -EPERM. On Nord RRD this
intermittently leaves both DAC supply regulators without their enable
GPIO.

Patch 2 fixes a stale vote left behind when a proxy releases the line
and restoring the default value fails. The line stays at the
non-default value for the remaining users, and votecnt can underflow
when the line is requested again.

Changes in v2:
- Patch 1: Also use gpio_shared_proxy_may_init() instead of
  usecnt > 1 in set_config, so concurrent first users no longer skip
  the hardware config or log a spurious conflict (Sashiko)
- Patch 2: New. Fix the votecnt underflow on a failed write in free.
  It predates patch 1 (Sashiko)
- Link to v1: https://lore.kernel.org/all/20261015122740.971792-1-shengchao.guo@oss.qualcomm.com

Shawn Guo (2):
  gpio: shared-proxy: Fix race between concurrent first users
  gpio: shared-proxy: Drop the vote of a released proxy on write failure

 drivers/gpio/gpio-shared-proxy.c | 80 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 71 insertions(+), 10 deletions(-)

-- 
2.43.0

