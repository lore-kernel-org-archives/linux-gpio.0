Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C319431A3C
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759797; cv=none; b=K+3CVF0sO/EwJed2me9DqlQArd0klCvs0ovzVpCcOhPhWFrq1MqY6nGLvF0XWoMvQqDrvebXo6sy730QL8OCRYtIkOLyiPvV0vN+fYDlq4YXDJn8Qe+yV/ozLY3NC+rMZR9Ne/Ji3Np6XxDuZtFlFYhNjc+CfNCL8Uz72BfEMJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759797; c=relaxed/simple;
	bh=B6XodYWz8fEAvc274IEhAnnnxtaRfUwyWjspk6qZ12I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAhYmQrnf6tVOp+9EKCFwez0ebiCHWeROMxEukORxPj9MWZePgcTu0ce4P0agdWO0JIt9G/ChcxxNJEWlzMRM0Lsw5jiyYg24aJCSG3RBCpngtbiJc/VvoP4UvqaMc1fOC3PkwR5cp0i29vn47ysoGRw7sDllUqnuDT0RfMGnw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRgSnXon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWRQlR28; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRgSnXon";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWRQlR28"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDuZa21702914
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 15:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HxJE+vMK9i1+7f3aRGW+jNMT6PhtJGecNLjyoy7o+BA=; b=DRgSnXonBUrajXca
	GUYILwlWwq3VxhOrhS0Pb2IJ/zr3Z6SXGrR07h8vaFedlEvLkwUBP/rFNHRDACqr
	hza3yOAcApDdCiZDGCSag9hhoooZiOaNAMS7rZ9fXwFaCpZZqjfd+aBiEgGsujfc
	BxIovEgX4Q7t1wCxlt67IxxpzOgKn9LmQKYD7vHbgieYuFbpEXtj9Fd8bO/NUNcS
	7g9uS4kuXVlL37Qn4Fs5DnmzmLlMwwyuzzTHjn+JUARRDcbnlAhBu3DG/4aBZpWu
	rm40V6UmqYLlr/SNZ8lCS7b/cOZFBfCqj6E9Lhgbpfsv3STpVY8TzvmJXXsygszp
	dlb/mQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbrkvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 15:56:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52cd0374265so19791971cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 08:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787759794; x=1788364594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxJE+vMK9i1+7f3aRGW+jNMT6PhtJGecNLjyoy7o+BA=;
        b=VWRQlR28sFNnMXW+hDIs3IzPjvZmh3rfUABTvfAVU9ahDvhA1L+MZ/vL6j+bz7TmWR
         OOKH41YvC6vxzZS5gE8owMqSEkz9uoYHAdSiymYlX7B9l3hxgp3DkMAc/qcERv8jwXig
         g265P/LnTMCTW1V0YTXkWQpm9mwHKbE/xmdUsQQaBgkWHBGDpFy8RyNTOkO5RviqvNqA
         5Nr4h7fO33Sas+MtbUL6bYgAYLk5/bQRrTSE5PV7UGMviY7WrM1hXeTv/MR85QvKJwCx
         YWKcSEiuFRivRChgLT3LvsRA+DUBBUiiC0nricbcncA6A7EbPRZLLatzKM3SS74Bt5p9
         Tjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787759794; x=1788364594;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxJE+vMK9i1+7f3aRGW+jNMT6PhtJGecNLjyoy7o+BA=;
        b=dJk99ofK9QvFpwrx3aBKsI3+cfSnG+B2lJ3d0XKiligMu44dV4LhZwXqMeUZwxE81u
         gSn2ZV+wbRVGSIAwpiRolY35oXjXSgMFkO75DwdJJU3leDfNAi1ywd2KZVbiVjZc8LT/
         8sEBUGhzXECTz7IxsSaY0zpQWd93CS+quP9PcWOLNFcIJfSYrdTIKRx3HVSqsLdb1lwy
         vEdXjlAlDDW/Tg27cqIb3luvxKWlwsO9ylfwjG6wiN79KPH4/vp2J39N+QRAbfpErKrn
         wDuGQ5eqnC6GpFw+OIfPSTMt8hWFe15BXwCbtb+1Ak2myIYvxUNN1b7k6f6NJQA23pPt
         clIQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4NYIjr9BByW+YmmV1W8/hx3id9A2dkmuDhqLT9x0gbJkWJIbATnPF+edfV7A3w6tAuo7BCKR96kef@vger.kernel.org
X-Gm-Message-State: AFuF++l5hPt5NpU6nJlLjXoE8e+gEyumCXW3B93rt2qepKrfLoGnLn+0
	Sg7eI4KtL9s0x0inCXa9+Y5EkAuF93EeLIFJhphVVMr0G7j3JgY3tYbigw9LjVtnBCYAGY/Xz4j
	H6/8UmhRG+DCJ5qzEtN2RLeK4dZ0vRr21jUAUN9kpt2/dLfVoEuDd4TuHBoyg8reO
X-Gm-Gg: AR+sD10W0ChjinRktY7lcEYQ0LUmKegfVll0rO1bTv9VfTHCyPXmMzaP1ecPDTo4aNk
	az65ZlCZa+CMQ3hnOqIaYGCJSz1zHLXCIT8GLH0LGuree+jt+cv23tsyGDkf/72ydA8OAM7I9Dt
	W42x35f9ZDVnQt9Xn2c44mhSLWp/7XsUFkquNQ8pzphUaESsBKWSTfNMxtDaN8JBnHk7ppnx58Y
	zvxy4NtBHd3Ju0xssKqlVNMSe2O3+/C6aOru91jXcViW8b7IH1By4RyNHLJ5bg4hSumj6IrBe4D
	YnlnamkblHFAUU3KYCUqsTwrUBdadX5GLkszCtLMsZxVt7y08YMC3fXpL/JbGU/3KaieR7gXLMk
	gxSwftL+iWC6gOQQGlJ6n3kgb4Ext
X-Received: by 2002:a05:622a:3d4:b0:52d:7b2a:93f with SMTP id d75a77b69052e-52e422d73camr78700351cf.3.1787759794105;
        Wed, 26 Aug 2026 08:56:34 -0700 (PDT)
X-Received: by 2002:a05:622a:3d4:b0:52d:7b2a:93f with SMTP id d75a77b69052e-52e422d73camr78699561cf.3.1787759793518;
        Wed, 26 Aug 2026 08:56:33 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28e8499sm3185244f8f.26.2026.08.26.08.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 08:56:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        brgl@kernel.org, linusw@kernel.org, khilman@kernel.org,
        ssantosh@kernel.org, grygorii.strashko@ti.com,
        upstream+linux@sigma-star.at, Julian.FRIEDRICH@frequentis.com
Subject: Re: [PATCH] gpio: omap: Use device name as chip label
Date: Wed, 26 Aug 2026 17:56:28 +0200
Message-ID: <178775978448.70451.17535371379743266168.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811130310.3867697-1-richard@nod.at>
References: <20260811130310.3867697-1-richard@nod.at>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IP1prkHx7rBGY_f1li17T0VRlb31dmRp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEzMiBTYWx0ZWRfXziBfLY7K153g
 rRx8pVaU9OT6YsACDhgzDKvxp62i4t+h0r9qD0CzBtlNyb+ORVVJ32nWbwgPrPcigDNAcXkFPUr
 Jq/9DlE1Wu6Vh7h9KdKs8jqM2rpPL/k=
X-Proofpoint-GUID: IP1prkHx7rBGY_f1li17T0VRlb31dmRp
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8f0cb3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_XJ9jvHb9UqBSp08VTwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEzMiBTYWx0ZWRfX+QjCKIrrwoc/
 FWTsJLmRGzN8kLnKZYsIeLrfYsqMMAiGL6PRMZ5ZhIf0ISo46Et+Voo2yYVsH2MZT5mP82ihYa3
 kbKGitpjC5Jg6pdrUbgI5NzeozrQFSDUse+2lxpdeZWjgzZ0LeTzRSH5WBI1BAhgWTAOfbD2OLT
 KWsMQTpU3/we5XqZl+T4t5VoRNj6uLCbrAxIgJcd7UmLA8juNS2LwDklm3Y27kuO2B5G4nha+Zp
 SuluU/KWpYeV0UFN5xT1g9y1h63YmJCnIwqvhAOsWTrAvWg6eE5tLCjisCUeJM3WtDRkO3N8caC
 tLgWN503kbd+sOLYIQFGwTTXy/BIVJFPvn8+p3p2AvNfgus/HZt2Q4aAsSgGZ1JqkrEUVAa7W4P
 Ed/pE3u/ICXUKBh0YuXwq2odSyMiOzNwUn+DRS7C/ETczhmauLOUmbxH2B2WkOmRnmw0MSyLGNB
 iKNvoldmR/IQoqD5jJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260132


On Tue, 11 Aug 2026 15:03:10 +0200, Richard Weinberger wrote:
> Since commit 92bf78b33b0b4 ("gpio: omap: use dynamic allocation of base"),
> the driver no longer statically allocates the gpio base.
> Having chip labels with the old static allocation makes no sense anymore.
> 
> Use the device name to have a unique name such that gpiod users can cleary
> distinguish between gpio chips.
> 
> [...]

Applied, thanks!

[1/1] gpio: omap: Use device name as chip label
      https://git.kernel.org/brgl/c/3d12d02dda0917f50fcc4cdf4b54bb417f609d78

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
