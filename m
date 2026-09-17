Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12E0425899
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638616; cv=none; b=Al+fSoV8YMaVZJKziz+Zf3Pviho7fnhb/PtzfEOFwQYOTXtJV7VwfGIPlYVF520rao9FqNE6/3hgtjbdEBcRxW4766b7fOuyB+mf/aWm3T93pEowYMwQ3RiGfB+bUzIPR+n+hSlgNTmFuWaPdZzyoMxhFHclaOWuRvWF6SDfd1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638616; c=relaxed/simple;
	bh=xOrPUnzbedw6kt6yPbrXP/61YDvqt4FbJjPsYG6H8bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gAj9G/VIHt2z9L9Ai0CTg5EQhWIsU2vX7JESkWcNJctNbTUdSC/WkiraMj0Ie8/PPaBV0Kvz2HHI9fRlpbutRRBCvGUdVxjmnZu/FepgGmDAmWuDxMZXVRXuBsbJV0f5jWAjIqEbw3TCiKAYOCej73YOf5rYX57qHwzPf5brH9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eq3g/gpT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R679CvnO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eq3g/gpT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R679CvnO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZrIr2211011
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebwLc4I+nSXZhdVKp1UmDQhXxipBI4WgJpnSLBihB64=; b=Eq3g/gpTQfYmmfOf
	zavsCp3fvQQ4SohIfjbfjpWw14Rb4cBSJdX5Iw4fK4zOLYykgPdKlc7hb8uLTB1c
	erHp0Ex8yeQbagrtca2VRFa0cVPlLFNkKs5F2IJFrKzkqmEM7BnlRmVijSik0Bul
	rIwoYPUBeirUEox08FzKGZe7UTy47ciSh+vOdhX7KtpwHXxuHeKHC+hF/nxUWZ+O
	YhvJaOpvtDZiLEw40ZBXeg5QsfbWXg3bTDrNFmXehiUKHtuVGT+En2m+vVBaxE3o
	ByrZJ7is1umsG2ooRMKUHusXI5AZnGQcAZus7SjlrIhQjnrgaFBPZgBJfursbMx/
	InvdJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m1mun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:49:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a2d361e1aso141864785a.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638590; x=1790243390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebwLc4I+nSXZhdVKp1UmDQhXxipBI4WgJpnSLBihB64=;
        b=R679CvnOmVp+gPonttmKNt8AQ2Pm+1/FepmeN/9IICOd3ROGYNemukV3gAs+JEN8h1
         dSkc9xmWjKdjlmUKdDNKrMI2FjpZ6qNCtpQYYGU84WQAXWFIzgzNoYcKNu8nts7pH1xp
         N0GG7BFkAv1yrEB9/mzyFLObdEoeTt7+bPy4X9rS7n/JXTAlG3DNZswvPbqKzm/OBs1F
         n2hTugUyRWlgUfZtJ0iblMdJ5g4rFoHttbbfKCdMQSssnURrSEKPq0PhdTkfJY/1H8cr
         GHWmBUp6vAsKocg3v9Hm+dpe7VW6x8BCUVOr69AF8K1UH7XNSdlYOkzAFhnhgikNML7J
         qVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638590; x=1790243390;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebwLc4I+nSXZhdVKp1UmDQhXxipBI4WgJpnSLBihB64=;
        b=JTrtIP5K6rg+NQDCRGShvpUG0qKuHVZZEiuOIRmQbyML8SR5uxfo+UpqKgIzwfy+ad
         /1LOnmNfOWCdj+thItuVUr+zjUm6IHarSXLt707TTGsiWxgEA2dw2Fcvsr2vSkVIPeEo
         QRbaOgRr6KscBMrw8utSJs6jOTeow7MmpqeWycE1Iowkcz+K+ekjuGyQgqqtc2noeRH6
         12GFnmhekOcw+KnbsQp88GPf4ohj45JhkvUJygqFQXrsfL/ScsSlfT5c+4JAJF+7yKa+
         D3LAivTK2E5bXTyj5dzWhEPkXRFWpGSiWJGlWLO/5l5AcNESWOcVFEMEr2/3BENx5VSA
         noiw==
X-Forwarded-Encrypted: i=1; AKwUvByCG8VUFMe01N90uoOumNf8OVlMYsry4k2TMiSKm9Fm590n/Ug3QjelzdkYyJm0hAdkYSVRG6v/hKQF@vger.kernel.org
X-Gm-Message-State: AFuF++mPM6JCwPycAZgqlNyt6vsr1TVJip793i81y9MC+jEkACk8FykX
	ibrPRixXwD4Xng1aDh8FoohlB+98OXR583yhrJj8tZ3hvZuvvvvvoK0STNIrJ1KDy7zSLfV4rqY
	eoEgfA2WhmzPGtTa0MmSdo4hu7UVAAeLZY7g4LcvU/0gqwiLIzs8JuWUKkohsqH3y
X-Gm-Gg: AYBFou29qzW/RCRKMSR1TVFYganA80iRNX07O+bA/xc/pHKgTOmpOexobB9BIhxr7MK
	3I+y0uDyjJqme2CxSWE6tO6+lywklpmv8n+Ltkn+f9b+WBO31r5Q7/UhSFiW1wAxKiBm8RuxPYb
	Iht5NtL8+i72cq/yjHfM6HQbLzB50FiDFjo5trlqoff7wO/GWoGo9PoSYUy0Wqxnx9xqY871h9/
	+TzNpsM2bg+9v+WcnAK1goLT948I3sE2IhT+9osTQvyJonU/CnAEYpYL2ShkM6ET1IFDNzYmZK3
	ixyQJqtpD+gH8tn7fqG4v7EcOKNXTy91qdDRt576tlgtWgyYLIWF73acrAnVzSNMGC9ftIY136k
	8L//dn5VPLfMUHRZV81nNk8xfcBI=
X-Received: by 2002:a05:620a:4722:b0:939:99a0:e6f0 with SMTP id af79cd13be357-93bb785b07amr965473085a.30.1789638589730;
        Thu, 17 Sep 2026 02:49:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4722:b0:939:99a0:e6f0 with SMTP id af79cd13be357-93bb785b07amr965470885a.30.1789638589359;
        Thu, 17 Sep 2026 02:49:49 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm15736333f8f.1.2026.09.17.02.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:49:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Fix intr_target_width for modern SoCs
Date: Thu, 17 Sep 2026 11:49:41 +0200
Message-ID: <178963857689.7532.5477084907068663029.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
References: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabb7c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TOHDll6vaYcQP47MitwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: CkcURzfINu-FunYHQagjq-HEZWpnoY69
X-Proofpoint-ORIG-GUID: CkcURzfINu-FunYHQagjq-HEZWpnoY69
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX/ao0ce6Bbdrp
 05PCFUh1wuHE6lSBNzyQ+HRFfvf4fMZeCxx0MHbPpvUr09mk+yVTHYR+eahnTJLpPreUa5Icbi/
 ltFWL3tFowC9p6l4qinLM6XoJTqLoa2mUcwL0TqNf3YCIbCRRQL9OqBm4pipiA+gMGL/kaO8WX/
 +63kFu156i1lqsySOox7skWX9ZhlYNcIco+oilGxIykyxLCIpBpcrqgR9Wffv2dcGEEn1UDoTkr
 lKIfkkuccNfp4plxs7YPBlEECfPVyW3AOPovae0uRVPGiuThngxMDG6pafhajhkggroaaSOJBDd
 UUBF5QiFitQbNLhu/U++BQCsI6Li3alDp94KJlTpQWhi3UrlTVj5rpL/DtO/lB9GbR1Mpxx0ozL
 aLy/RuHRz4j+EoSTtO7wewKog0fRkZpp6SZXnk7cxvoVDnAqXaY7NFfxGN3QA+7HxwNAGddnfyN
 i8bSyKxU0FnxnLRtZ5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX40kQJXYGIfXH
 1IttkU7atldudP3PKLx/9vd1Zm/NFbLn6r6097ylaDiT5UJOuvOhPKAMPmYK1QXJynTddhsbnUK
 Zi2R4rhxCgw35UaoYtzFFDPX0ndYx90=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170135


On Thu, 17 Sep 2026 11:03:24 +0200, Konrad Dybcio wrote:
> Following the Nord patch, I asked the robot to ensure the value is
> correct on all other SoCs and it found a couple outliers. This series
> fixes that up.
> 
> 

Applied, thanks!

[1/3] pinctrl: qcom: hawi: Fix intr_target_width
      https://git.kernel.org/brgl/c/9d4c3e0c6a53eb390d58b8d7aaf08885e46f93fd
[2/3] pinctrl: qcom: maili: Fix intr_target_width
      https://git.kernel.org/brgl/c/912df33f296e6c4ced8c0a5e7998d570a0b82214
[3/3] pinctrl: qcom: qcs8300: Fix intr_target_width
      https://git.kernel.org/brgl/c/dcb5df182b37587d5ad6bb4388751bf5180957ac

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
