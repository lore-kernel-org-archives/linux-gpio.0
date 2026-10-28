Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179854;
	b=iMxChYH0YtR7zVETlOjNsCI4gCcaJ6i9/WYGWKTR/FhzpSPpvDT8ko/TkIcp+Chm5Fou
	 cYqbL06z67e5UDA6MUB2Zhk3uWwKbJolcMsm2xY+SVmnfnk14Nfpee+j+arZB6bzurf4U
	 mrqWVKLNf/duwNNanL671sdbQCTux/qpF/EcwqFXxc+uL79foMQW0s8MRtRdLPPXR0PjR
	 rar7z9G791SBHyVsHslwyzCmq/Y4zyIbTs5ocxcvu086Q7Be5t262io+m1pYZJuiUNWhl
	 SC00GkUSgfeFaiMX5Pxz+c5XjjGbHc+NFxNHpTfvOib4pkEfcZVlMgEW7w/oGwAzCvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=;
	b=aJ2DVKVZe0QXAZzfwDcVFTEWUJIH4nZ6YJEWR/bVgk44uOvhztMo4LmviCcmn61ag0Ji
	 WIE839Zbchxbdejk+kljEMIv4CqzgLuFqKOCDEuSFImDPxR9+5BSKP6nawIpfvGGSxZvC
	 TCsDTVED051rtnHnEZpT0sPLbqHW80WnbyUNxTEG4krYCe1IdQgixZGD+uHkuwO8pWbLA
	 kFgswrMoqh/cQ2+QtllSx0FruP69emyMmWXsX/+pRXPTxAALHg5DuWsECXqlAiNUlSNuU
	 w8oYzaGKhBwu/TfDN1rVe9Nj4TsyO3vG/wGD9EXl2a/xGBKdl6wK7Tiztwpcg6nc0cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VJjoPXSN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H6heotuH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E560A261B
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF6E560A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VJjoPXSN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H6heotuH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KKIH3264790
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=; b=VJjoPXSN9HaORW0B
	rdlqrIiuJJPmf+hFREacFInMjBSuffov0c+nPWdcB6GxYX9lzR0vMreJY31GbWm3
	TjgcDz9pCJKT9Wwcog9BhQL+9XV1fPyULxOYARs+hAbH01l7Nbb7yetYf186N3e6
	oSCWXrmjD5x0gl4Fhj286Rqpzu1t76Pl/Zsq+YGu83gpr0GqnYMxhY66OVJ5/wAL
	mQvb5c78yoyjhJA4B++5G8iP+wePlRuXFyGvh4MpGPNa2xE/ikt2YKIK1z/kfUlI
	YSVd3DFtOGN1BeQlbo1Ojz0cHEm9L8/JqqRxdxlIB5G88QeAGoAvJATC42dTyXJr
	4SvpbA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy713gjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:30:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363fa3d3e4so16742631cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793179852; x=1793784652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=;
        b=H6heotuHGmwDbcJzpMgWwPXA9IW4DrSCQQb51DfZM2nM9fP4xs00c5D25Rh9Cp0uyd
         6vET29ZkXhZEG3zt1GdDjNcKX75t9YuS/fw1YW509ir8N95qVZF2sEiXUGTEK6eYY/KN
         iasadasbBnjSHc+Yg86gQeu9RQqczVcBDFROr5JuTiBgj3sGSZl8U9VGeka/Dmxi4pUZ
         eH53U7aA64eMUp7wLe2pOZ6wS1gytu1kMdA/cPUQZ3oYGar5f5VDAiDpIUkg/1uiXFRI
         249zLJsX3AWDBws+IpCwQ7jDHZVQRxFK8sZLgsbKtDLQ1FUxHzpWS9UYtD8AqGRaH63H
         Fh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793179852; x=1793784652;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=;
        b=HNDqM5ZxfrUsGwrKSW1dP/sjI6cSRuYiEDMnBq9SI9eP4LKGiqywMcQfmA5cB2ZbGQ
         u1eg3MepqJKMeWMdr0FZD92+IdJpDSu+6gU9pRx0kgSHSgitaqGjFvvGbPOE7ibJVkLp
         bEAIzSToPSyY+e+hrL6YLESWbnukO6nyMeux6eLybYA5SiHUBHlDBwcJpRNf8HzzKq0y
         BCMhU+dSk6h6emwzorCSAg1LxWSXz4R6pih/zoL8jFv7AO5qLnenMNRKAdGNbjs6UGJ1
         cx6U+G3+nrAr6TOV78Qu/2oerax7cpD+gShoOHiMFJYwTDhbTbL8OZik2fJFWZb+zGTz
         /nfw==
X-Forwarded-Encrypted: i=1; AKwUvBwjMyI+OHP19smy3gekCZ9SRiV4rW7yai2IYGck4anqqLVOhUamwzjwm8YXIG9qO7/DXwjau5JPQ7uE@vger.kernel.org
X-Gm-Message-State: AFq9FYKUXefYHP/1gvKB1j92X6pIj+2vSv/UrFvxahqNi+blMuydrner
	w698DD7ZMc+81a9XvOvE1EmwQwLg8sOrYvpqT0TQ7Ilben99iNQY5S6eNBNHQRVrmngAuL04H3c
	uKJ4SPLlQv5wrYEzrVNaJQGboCCLlbPgI/7gRJE5VNjPij81rhFMGd5V4ghwoTyPM
X-Gm-Gg: AYBFou36KXQS1x80bW0DQfSj83sWvFCw6tHnj1wdc2XLwpJW5ohqXIl0vN8HAny/nOq
	6YRsEKOnFnhFzK8eVyTG6OlLU+rdr+rdoHAj1LLdwoaxt0MTnPmxHR/dLOrxCQjFTciw6WZLqQ4
	4uA06bWjtlLIm+0O6ye21D2B8SAuUXYDhdc6bK9/a+y/Zhea6cEPNNR+Kxaxc0G3hsyB7iGhAO3
	v0cd3KvpWMT6zH7MFQDlp6mk/1d0mn0kOhbu2d3NYljFQfMP9BhBcRZ/HlKBeBo3ecV+ioW+zVA
	jVdyi1DtwTc79K+CZlTkE2Xe5OCx1DmghbggdcTW6dJKfIDqrGB+XadN+1w5zpJfy9IfU8/MGq5
	wV6iWU6zO/fUUJnAbU2hZWFMGleGJ02SPkaY+2rLg1s78V6FnHKVVCtVCvHChPWzCu+y/p/1M9J
	0k
X-Received: by 2002:a05:620a:1d03:b0:943:faab:aabe with SMTP id af79cd13be357-94408d43a71mr195777985a.62.1793179851950;
        Wed, 28 Oct 2026 02:30:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1d03:b0:943:faab:aabe with SMTP id af79cd13be357-94408d43a71mr195774285a.62.1793179851499;
        Wed, 28 Oct 2026 02:30:51 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94e4be4b2sm21772175e9.2.2026.10.28.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:30:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Jianqun Xu <jay.xu@rock-chips.com>,
        Cunhao Lu <1579567540@qq.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: rockchip: Fix debounce arithmetic for GPIO v2
Date: Wed, 28 Oct 2026 10:30:47 +0100
Message-ID: <179317955938.10111.11780019305484547923.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023-fix-rockchip-gpio-v2-debounce-v1-1-f1141bd5b58f@qq.com>
References: <20261023-fix-rockchip-gpio-v2-debounce-v1-1-f1141bd5b58f@qq.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfX5boofh7GJNr+
 cJ4kf/WNbWv5FcSM7IJj9rSDJ/swqLykN4SNqmP7gNkD9qt8XDceeDMREnyYE8Lx7dgqp+E4Y9T
 LBaBOufPcTFe+j98IuvxOCmgPsOOXZYxRDzuiVgf7UoKfLROcf2BSKW6+GqFvN8ApYPzSTma63c
 709BB+VHwg0srsWi7SJVO3oLPkie46SN6A3i6vspVqmrkpyJl8GbfMNlzMWoxrGMliG1p0K4yBj
 yHMOkK4IVI0XGOl/zigmEBpOtqBBnyrOZpmSZ54I689DS71fAqwoC1GHaWw66Cykmq07QTg5wSy
 rO4U9Blwc5DMpblvIfJRdVLIeU/VYqcUJInTkgQ2kU5ECmeoXzb7m1OojUcAX/Bxaz2+5V+K+8D
 xCx9/d6UKa0Y1qTFqGdlvpfSEI1jKGP1aPJAi0L3oPlDFPAu7HBRzGfvz8HLc/+G26J6OJIf83U
 RySVuOW7pt6fyVssK2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfX2LAIbExrdOTv
 LQdQItiEWKFHq5vqRdAteVqknSY4Cdv0ZBqaMny5644mfi/xASbPwOb5uxJukeGKTd+26P/Z3/x
 vit0MakHPzgDYLxxxQQmPNAqQuFAVes=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1c0cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=G63kk6RMYl0S_NIbZfoA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: E_p3PnhIh0zxVdJMQELor2ecLofn4bsh
X-Proofpoint-ORIG-GUID: E_p3PnhIh0zxVdJMQELor2ecLofn4bsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280037


On Fri, 23 Oct 2026 16:21:05 +0800, Cunhao Lu wrote:
> The debounce interval calculations use unsigned long operands. On 32-bit
> systems, the numerator used to calculate the maximum interval overflows
> before division, while multiplying the requested interval by the clock
> rate overflows before it is assigned to a u64. A zero debounce clock rate
> also causes division by zero.
> 
> Use 64-bit arithmetic for both calculations and reject a zero clock rate
> before division.
> 
> [...]

Applied, thanks!

[1/1] gpio: rockchip: Fix debounce arithmetic for GPIO v2
      https://git.kernel.org/brgl/c/13467fd6998f5da4f5b4f172f1af3d9c48d5de8f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
