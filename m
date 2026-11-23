Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446938;
	b=iaJ3hcr1YpM6C4URLSXjXo7yVWtEYruuVlT492QWMcUDs7FtGZu89xwjXa00vV1kLJO9
	 lta5RJ8a1jVWOyaXCaK3ExeK8ltb9hP9yacsqeGeeQKrc5Cv8tl8/NQF8VbpbrWUjMTbo
	 u1aiLhcrsAr+PPq/j3EfghQ0nhBy+4xmDiMAssTAOx3aAUoUPPEhbRTmGkN3urhIGaIif
	 hjHrpphYntId+7TiFZIj5IuvopUnxBQ0mosGCC0UNyGcGAA26Dlzbw1tPqx59qXNZgjc0
	 0D9PGXmKOLpLdTCFapwxNQsM3fSatr1pLTL/MNMRSLIrWoosgAi2dOViHTjukIztJQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z/sHlCTmXYtnxoeAipWhDKUsLvrW6CekBF+Kn2H0iXE=;
	b=Wu0nfznjTCR05O7jFCgbALnHw0E+unceaiE9jzXOYdsGNVUV/3IQR+hOtcEFMaU7gLRC
	 +tYs5Jd43OpUh0qVMuv//H6y81VAFHxDW3nMTrO5K3UQTH/qSeEqj8Q2u3F0eGFMiEm9P
	 sMee4diX9EkZdCNoH2fYD+uq3SFT0STPgGR1DDFor9bkb9HAOvYHU4xdvAErYm32WluTE
	 1K2G4PzxpkUZ4+pNLR0hcQIZ3GaZU0bmwn886mK7CUNFXqbwj3lVgtWiSZeb6BQtdhV9u
	 19UdKBy3qJx4rskstH7PtT3PMKKjMZ12OCoJgdCqq+k6R9towVNX0iSNCxHZ1Vw2pAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RbGcKizV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6BCFjrg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4EB606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RbGcKizV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6BCFjrg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKsZK2369173
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/sHlCTmXYtnxoeAipWhDKUsLvrW6CekBF+Kn2H0iXE=; b=RbGcKizVqDubxZ2s
	XdElEI5qb6xou9QJx8TK+SjGuoxgquvtP++YpXwPUYmDQXm55egul1rB4PiG/toI
	SNnrp9y4hSrPrhqzKwAiD/36mhFD1IcKy7MCaamk34KOqhWxPDXq1CKPcx2sIilf
	JFsh5e8fhPiFX9a7VagdYkkCLtg8dedtPLk5CBs/vdaHslnxzy6cOfAeT2nNfOuf
	eMU590ZKPuiK4MxyloRRRzC5WuaRjixhscNM6inKdgN7fgjb1eT4Q1aOVbpPSSYH
	8/CRJZQj6u3jHyKvHC3TyZkkKYwR8GWGxFPN1fKFAU38qjavmHpB20EtLGwQAKEz
	2F6bnw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9ysb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:37 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so105331e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446936; x=1796051736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/sHlCTmXYtnxoeAipWhDKUsLvrW6CekBF+Kn2H0iXE=;
        b=d6BCFjrg13FzqfaLffeZQrCWrbVMzBhJXN+BjIu4I6axXp3bUmR9UPT2xGU3ICHHK+
         +MiiDerTxRzzxCI3S5qhF584L8V7dSHbxURfr281aZJugqcfDHR8noT50dRSLWwlv8jh
         OpZJzKQxNM4syWRLmcYxW1u8HUOypIphTuY3YLO2QitIXQ64j+9mmHablzH1A9WdSJIJ
         dC7gkqq5UJDogxoa7KIeaQ3XppFTzsIFLLL/eo1BXswv1YUnGvKqObcA9kq2FgUwF5je
         kE73HNf1DISeIPt+JxAHH6n29b/BA9lUMzNCY3PeUNnR5qH8K8LvvOvvxG3Ves1yuqhX
         KPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446936; x=1796051736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/sHlCTmXYtnxoeAipWhDKUsLvrW6CekBF+Kn2H0iXE=;
        b=Bsll6ij6JY2nLvHCBH3UHpM2eZf6tXPBqnqkUinHw0xJCgUGP5OaqpHJM75dBX8tcv
         fiJScjV4JS6+/dm1FPnwVSClNleLPLUD8eQbKHrbqC3WnpP6LyjGEcOzNutWdrIC9MGD
         nr4rYhHt1RG7QgqCD+1UBqW+NO89+BGh1UzF4ASrOU23deg/z0vFo7Qkkzy8IivtPXyY
         APMCGxdc8eJFX/XQzwj8W0rBPSQrV+gJy0/ZIKXjlF99WU5yv3TIfuXIarOvjMMpHr9c
         LxdWoLiOO+vltpRmT4aGNkvtTOZA/UYNim04yhHll5wtRz4OArscug3/n3vZ/ZQm+JCW
         y8FQ==
X-Forwarded-Encrypted: i=1; AL+hErFpjrxfv6wp+HcF7q5LebzPhpCV2wFC8AliNkHq+2XtUvKEkJ7fOO4s0/ywTtmqAsYpc9LmWZSfIcT8@vger.kernel.org
X-Gm-Message-State: APuU4Z/cdiBBiVtc+NzewOyNMkAMYYQWsknen50/9q0luEP9MgbQ0BMT
	BhuvSL79uKCcxnOXRu1kHPL/r0e5mT4U2knwP3cC1/mHENqql72yvJFAVrfuWwPeOvJkP2klAKo
	AzrndrxkytJDj9yNsFLDCoffvnKu2mLO0BYcbI8HENFozwterGZhOI0kUV0erT/YBIudCa78x
X-Gm-Gg: AZFdTZdSQhj+DQBU9+IWTJAHCRnkLvvS7FRz2kmxxcSyDZmyfbgd7kqWjqtZD5aKlWn
	Zl+v4u21wrY6VsbeHQBCAWG8OV2G/cLBW94yqS2mbB9vyuD4kMvSseSBcJgFD3WaQO10DiJH4y6
	cDHJbMEQVgdRGqS+haeyruejaGeAkiaRBLRv971pIROir4G1PdJxqXgnoLptGENd8ugBJ9OgpWD
	4k+Z7UXlDUMaJOl40AhlvQiywJRsTI1yoLrfNlv6Bxniv6b11YBsZn0XY8UOwtuAJKp8zCGh3SO
	WRs4eAaCSze4F0jfbHkUEGWjZQjxMFch92ArLwYycF/qPa29gnulhqm8MEmdrfvyiNRKc8rfLbo
	7My2tNmgX84qZm8QVPgftRpHvo/h+Ex5cCKQCDw7rYKkR4YWZJyIJwCI/
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr7856096e0c.1.1795446936321;
        Mon, 23 Nov 2026 07:15:36 -0800 (PST)
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr7855989e0c.1.1795446935797;
        Mon, 23 Nov 2026 07:15:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36d730d1sm5498485a12.0.2026.11.23.07.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:15:35 -0800 (PST)
Message-ID: <7e2f2ee9-0464-46e5-875a-bf91d64dbb7e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:15:32 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] pinctrl: qcom: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
 <20261122-b4-qcom-kconfig-unify-pinctrl-v1-4-f0068f161636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-4-f0068f161636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX3rEHQCecfGaD
 BndWBwInPHPa3qzGfALqpVReofLoOMfd3GJRraBIi1OS3nJLZ+bIf6NeOMrPXkAbn1bWDNNKqLK
 YjjNLsZpOZSKfDk3rI7IG9iyBcsAZHplaYhwGAuI4t2RCqGadHlVnqPMhGJ6qQO57jyE1h8ZOHT
 tQGhQ5e7DjtF4pKzUcM6M0QEzo9I4ywbtuyUhFYat0Dq6iWQ9VZRYc/yo8FaiwlvPGBMmjcaxtX
 9EkJe0yktzeVhdE6hOeevhw/m6I44lAw8w2rgBRNVD3g7ZJJXn7bo7pkjskjJbNW2u6aFrnvXUS
 Fy/BqhulEUsM4yr5egna2P6jht++E0KmX1O77xDAXG9ufnFiL7hxlq0PG/hQ42JcSC6+FZqOapV
 1bVN3UDXMwe5XysfCGdGnQ6/tJF0h/0wTVtKFBLqzuNcat2xbQBwdWRB4CfXHP/w1HpzoRi1yDC
 rc7Qr2ZoMJFMSGnBtYQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b045899 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kuyjF62R-fLzJYMBhd0A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: zRKm6qF1nIisz9lrtCKHdNKTAqqPzMN0
X-Proofpoint-ORIG-GUID: zRKm6qF1nIisz9lrtCKHdNKTAqqPzMN0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfXw17N7ngOTG4/
 4OjGy81FnYC3USqtayvHNWM3LK60jmGFfi1M8kFmuHs3U7dVeczkR9zIy2cXrnI8/oJHJ1Vn50N
 py4aPQHBSu9Dz6qmhovEN+TiSBpnv/M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230060

On 11/22/26 2:34 PM, Krzysztof Kozlowski wrote:
> Correct Kconfig indentation style to expected tab, instead of spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
