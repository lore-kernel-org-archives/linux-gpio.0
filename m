Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773100;
	b=Uus6xwzYxKSLqEUPE84BwjjOv+lYGySh0SPGRs8pOUZUElqVPotls+D5rI/eGV8aJ7s1
	 IKv6fVHwhyVuMXyEJK9W/Y2mMh55pywt8nKVk98/+bnHs9BAWHJkcGPtGWpzoPFWQPo0P
	 9ETJf0huWsGTdwHsGO8iPadxiyMJfwfZTK2a/LCsO/lMaAHzmJzCX5zQrc9bYm5ztjN99
	 oW6LaeQHsEJCaL9+id2Ly4patKjTyORInvbehN0O24L9h8hTNQfUiPU4fU4QJq/JTBaTG
	 O1qLsFiMO0JmXsTz1ETe2ekefo2PIJZ1fYvbXSlkbplzbik3aHJowj5F2mcEDUxf7Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=;
	b=NJINCWqqTYMtpZtjyZKBUn/hA47us3S0WbgUr9Kforhgu+2G70Esofz2LZ74EDFg9tpV
	 p4q/INal5pZVHKRWM2/bgAheufvFAVfKsTUf2S49zd2zouRNiiBnnBAgGTtmQjTMENJQD
	 miJTH5gROarwJe+EHEvAhe+8u1sVu8HtVPD52FP+cSRQDyG0LUbKbWyxmHWZ2O6dNfnZN
	 K3rcbbQCdHoL0YejYiHlwrqFeCJIWhiB1raI0FUeZt68HWTq/ioqNvFHiS4+G7o2AX6mF
	 DfmESJYp+6Vic3Pg93UpXKX57XCZAMfoK2g3wFUBt6r11Qq3SOL+RlSwDH2AGISqMVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bNpv4vB/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VO9CE1lk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F799606A338
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F799606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNpv4vB/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VO9CE1lk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7H3pO1076530
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=; b=bNpv4vB/dWXMrFoE
	1p+C6gRNM101/w3jtj6GnxIT7u+4Gu5Lt7e1t9hPbU9KUiqe19wNJs/XHGQE48X6
	+3uH8rGLG8GUZO0PPi+jigHlVPEaelJsvjP4eh/ppOjyeGq+U4zkOxxbs3CT4bPL
	E7CfUYjmHMyZKcdvGRIlJ2od2okC0TgHwvtREl9Rt2SIJe2eF7cSy3CthL8ggHyN
	NYlCKUkpVJwUkfrsndcqKKBcQQvAFw1DLQAvRkif3SSnTQeegzxawmtFsz4//q+J
	0Ej7gdsh8LfKGx5Ut0GI9O8lsop+uwCProDaC/iWa+efdnrXiWd7jl2CGBg20lq0
	107TAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55tavs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:51:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-921286add9fso69527026d6.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773098; x=1796377898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=;
        b=VO9CE1lktVg/83d6hfVPWVwgcnL2tHAKe7aXFktueMRr86VOM9GBbFhDRDR6tDeGDB
         pLZr9zVL0AExKpi0MgWogNBln73CKmtl4Dck4jXCr+27Ge9wqqnob7WFaBd3uuqZ5TPA
         SC6Faj0kpfVAKkB+YSXxD2chK8OQufnNj5QhJEZfuWEfpuqlTjhRkpqHKA3CTjA9E5y2
         VYfxkwDuWWtZ0i7UutQEWnQ0WHqJbCxaYSMmS9OCTtv43gcJgZXiOsddNCdVhjfKU9qq
         0bfFDkwsyixKwZU8LZik6+fHJkv0fWT0Ldsa+v8BM4ROf8VDFI0YQcbuL4ddP5baVDuc
         pF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773098; x=1796377898;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=;
        b=YRKwLEVHnrCtpxDi19VnLMVxdJcQ9dp473Hv1H6wjY+4LrFl8vhzFsXc/XbSA1MUgd
         1fLmpJ3mM+yyL346YB18ChWRt8bWCJah5oQKnI7opPwA7eC73mdtdYMa+2SL29gSfrYd
         Y4ChHpggvp0pMsxya5o2B2yHA8xePxZRZBMo6+Upc6VtP5uh623QkUjQr/JfRqmOOtPp
         uKGlkIfULvt09GgpJXg0pgYtnlzRLAdeW3JAVt/P3GR19rxQ1Md970+U80QzSHVJBiDd
         9bqXSFukm7UIrllnuxfOhJGkfQz4fu++I1BZcAvFlRJejxOwzZ6emmLQbJiL11DpMAgL
         gF/g==
X-Forwarded-Encrypted: i=1; AL+hErG1eXCikgooTuyZHbSuFqNwYT6bX7r+sZL6AqSUR6m4AOJZO1j5Q53D00gW11zfTk85sKHBJnzVllze@vger.kernel.org
X-Gm-Message-State: APuU4Z8eL4qbkmVCtYnO8zAZLYZup1k+4B4osgOMgtmtmMv08iUXKLzZ
	+4LNerVum1QHUP6/hF0Y2706IvpPomOtXJolZGmH5kley6tfzMcLWlUlSO87LJGr5YGf5Yo/+Tx
	diJZOlXZAGGkzqZF9BXO7Pv2KOZvYj8COvRgtQ4B7C68LKiaV3OFJ0dmZnNLAk1Ez
X-Gm-Gg: AZFdTZdHplj8TtRnpr9xWj7tz+yqSmqVew8ON47NEscfqVxcr5GD2C1VvnwFBXjCtx2
	ahja/z3fS9y7pJkC96bT9X5FszJ7BkMwQuqe5M7tHKSRKnO/2JL9FCea7LmEyoumlklFBPdQCXw
	H7tLGDT2E5SC0JYHGaFUSMAUdAClVYGlYV/s9qHoW3tMhPPdCLP+htG8nuvP1hwnsetrR3TBVDL
	eCFqB/1gNlYM3m6aJlkyLAbSjHi10pGGbWX2L+2bA4RWwHnFNm4Zt75Pt+ZULfa19Gb5+Rpoqmo
	11CoQsPbCx1pDUUsOA9olV7+J2pISMX0a707Zc68fO5I5HCQyenD0N+o4WiSebiLd3FD374dqDN
	DbIX1igBjknwdtOoRDYMPR2eJLsgS0D8mc/IGPZtjLPYwxZMs1cAhKS13/fw53JfIdyN8IswZhx
	E2QxIE5BgHkOuCSQwxJ7ZZQ6l1rhd4W+Umvk6xXHcgMwdULFa1kcy/bBcT+Qb8nw==
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4402893785a.83.1795773097763;
        Fri, 27 Nov 2026 01:51:37 -0800 (PST)
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4402891285a.83.1795773097314;
        Fri, 27 Nov 2026 01:51:37 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm47017200f8f.13.2026.11.27.01.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:51:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/11] pinctrl: qcom: fix and extend egpio support
Date: Fri, 27 Nov 2026 10:51:34 +0100
Message-ID: <179577307502.23314.4915241215789166549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX8M/EqBZv1RHf
 WH1FyAAq+4WrJOg5D374GZYusrTHYThnTcVg5qzm+/PFWHNu7LHQ4ILqE3gdyPwxSMj6iimunO4
 xR1BHFo1pwfVl3crBFFEai8Uid8weww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX210QZJwDQe4m
 BWaM6zoKvmBMFCwgv65TjTJLqk1WdoqBqj6rYEu1qi9IX0DBZf1Fex5tBB7+Dp8v7lnqPFEHDfz
 iiQSIEU9OFzFxl3j+fIPHMfgSg3bkSzSGOGPlx+Tmk9rW3ztTwVkn1AxDd56tsgfhC5xw7D0GDu
 CNzvG+J4id83MMGXTteuGnem8sP3Fq0ednm4pzfCSKXRuGiGYJPzwog17b97ffiuarZLDbMo/Op
 ftKQUHk1OerxhnTMFseN0M45vHy552BGcUuBRnoigxTk9xF80FcChrsKlmn2zPqdl0aFG+4VLdi
 KDYcRkJuGY9NEpMrc5dxEMAsYbqRdFpHq2QQF/5fVg5DM+sKNDNUFSI98RumYHx1E2T5OZdqyUF
 DDPR7QEmpqvhkWxu005XLKoYvsMNPdHBRwoLEaohJjpu6q18+YJF4NipKH0SN+Y6W1cGUjkR+ia
 3Lfp7IcBqvyepSsKl8A==
X-Proofpoint-ORIG-GUID: ONhfm6tMTB9qvdeC1tOlnwHn5S4rOc_m
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b0952aa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3FmSG_DaQpiI3iZ1DfoA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ONhfm6tMTB9qvdeC1tOlnwHn5S4rOc_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039


On Thu, 26 Nov 2026 11:21:04 +0100, Bartosz Golaszewski wrote:
> Several Qualcomm TLMM drivers still register egpio as a strict function.
> On those SoCs, a pin muxed to egpio can't be requested as a GPIO. This
> series converts them to using MSM_GPIO_PIN_FUNCTION().
> 
> While at it: document egpio in the sm8250 and sm6115 bindings, and add
> the missing egpio function to sm8550 together with its binding.
> 
> [...]

Queueing patches 1-7 for fixes.

[01/11] pinctrl: qcom: sm8250: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/0c77a239ed4f8853901d6627aa479ab52633b760
[02/11] pinctrl: qcom: sm6115: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/2552eac9d68fec18e584858e7b6872721363db93
[03/11] pinctrl: qcom: milos: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/44788a3a359a0948405641dd7051a77457f99ef8
[04/11] pinctrl: qcom: eliza: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/7950d02193d557be6f088a214e6a4a44a7e3a134
[05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/f666ce3884316635cc2f7e371a62ec5167613626
[06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/f0426d6bf6271db4434de160913ca910e2a23f8a
[07/11] pinctrl: qcom: maili: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/38d3f870a1cb4eeb4c51a690d51590519de46de2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
