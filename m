Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606446;
	b=NYL9GkBGn1jeSDLNJBU9y38aZoUqdbvIpbgKbdjRRB2LG0paDUPi2RGIrmECF+PO7WgG
	 DIrHvLyyBo6xdJj98Z0LitMJzZ13brztDnykVkV8sTJSKz75Iy/6oHCwd+WwoA7vngir0
	 zPF50s7FwNd9S9Rh3D1aHpMhVPHUkdkLVc6FqGo8MI6yrxMG57PvCKZkPlkx6K3QCdL7y
	 rM6DCfZL/APsAZbWAv7uPB3lhNSIRx9cVDkF0ZMfbhae9rBVdb2a7kiBm3Lt59Cz3j8dc
	 8mPOzcIg6JnoMTjfqcYtCU8/6ZMnbkoYFV49/eUj29ovuTYmYH3iICKN+KHTE0EYvCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606446;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=;
	b=i1JVaLyPjGh1BUiVGigA4bAzbEnz+titmNjG3+xm/cAUoEGbLAkPShL4iLzqNxd+sTck
	 xT3vOe4bKUL4WRBFayelh5q0IOaWtVnHaSm7qKaXa8q57XR3c0K8NbI3Dx6NPDyzk7TJH
	 mikGp6TYiXfYP7F4dBV8S6DhMmVICIPPz+drFYnzltEPQCaKbMSJS77LzKsIWlxMljyHx
	 Xhb36QrforBvsezjbi/KewVyhsz4rnLWw/q2xSL+AEvc1M5ZLgWv022Gump9FK8WCzkj8
	 EpjjG7YQXG0KDncKaiJRhPHSQFQoXHOBXsCnlTnXQCXPevTNtOzRBm1vnPlHXXV0NKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KygF8YWd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WeA7TtPH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A1A606A323
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A1A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KygF8YWd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WeA7TtPH
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mli43611422
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=; b=KygF8YWd1LOeBnFz
	agQeX+s2Ds4MplCN/Tfo4biB7fP373X2rU2171awL1QuhFxQJc2JqMnEVhtDo70K
	1n5fvMXP+WZcUO+8atBTKPQcuYodxzBR1U1vek3ZUFful9v6AkFxH2mmJVZHit7e
	ZXP7pKyOqz/M/vuu+QthDsam4roucwyQb3pGjnSEfNl1alw4J31H69C4LsZXz4o/
	crBdqSPHIXrAuPERPWiz8a4ypwUA1vwgVPSlS9PPE3Oyk8S2pQz2CtqPSo3xb/H3
	PT3GlzcKH7AuXcawIDxIj2gs/vGtTV7pZ+dAlJiQkhTHZD/sLiQricf5OAhPqCQ0
	DG3Ggw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsbd2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:34:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55cbd8c22b1so8587761cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 03:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795606444; x=1796211244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=;
        b=WeA7TtPHRxQ0G+Xy/somJNID59Z6rMEsnyQBVCjnkCTCh2fB+d7dPM+8iRTxRVQZcD
         /LUoqjDFB+WM5ZT4Cji4shWsjSlInzB0KlwRhigLBCtY4hUcU3HX/Cv9NuUcFir87nvx
         MhGfOYcijLSyvHpElOcl7SWiyZe88uccwckEq9Km/FRcxDL3aN9NhzysTgkYKT0mNlFN
         ZbfFolaiJwLuA2rU2mq94wPf09Iqhq68eY+1AtXXcSF7UQXm58OU38xoKB3BRGco0Teu
         MstdaJz2HezJaKDdQp0SGKhr1EHv3We8ZE7Re/3wuykbnDbWeR8c5BaAS3sQaExV9aGy
         DXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606444; x=1796211244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=;
        b=1gv/P1fAQe1T9jhNGzT1Qah0IA9dh8Rjx5xy2mrNQoVaifv/fjHjcpDdnSZ9X1eEjO
         fRtCQE875ns+mj2fIobo/+U7ccSQWojU/xy4IysRUCopJdM5XgEA36neF/o0dgO0Ksa5
         iCAlSleZMDPxl2GUSe/3oY3j7062ergC6sT3jQKVpMJpLeg1KDgBOK7aNuppc7LtiZxI
         NUBFuygcRGKrpewB5BzrpkAKQmFoMdyLj0HUMwA5zfpARui9SqZy64toRqCCI++aBnjk
         +wtDsxlWWxUSW9DmZJ/pz5SDSgXkvyj3TATGc6qbaJ6DUDqJ4aQxi8mkEBf1PCrEOjaz
         wtMQ==
X-Forwarded-Encrypted: i=1; AL+hErEkL/NOJU748o4/H02vAi6m+RFxgrQmiVbhWDxbu/8Z6NU25jdQ7r3J1xW1IuRzoT7SeVKpyOJOWorB@vger.kernel.org
X-Gm-Message-State: APuU4Z8NAXfn8TSNkARy80pmscEq6HHwYnvzIZR8uOksAm/Q1pDV5u5n
	3r8SNIU1o1ZBqr/Sy6Gscm3aiobIGrvUJPdKppq8a9si3otZPhJ9MD8ErUnpnrI43zDMhmwMvZ3
	32a9HOrJNkGoSAv1r2lUMb0xIX9NcvPedUnKhGOsn4h/sO/S5laxamtjHvH3nqXOq
X-Gm-Gg: AZFdTZf1PHh5gtH9EZgpmtshNEuVVEYpZq+osVeOTdCF7UQ7x0G0uP2VJYx4BF7TgKb
	AloYACXbufqxsGZ5GKVjrWpkpqjzscLLMo3h+BeC1wbG0rfEPhUYdwwZVo05lAwoki8r1Ox8Dm9
	r7v/CKvcexfE3jtUb1NebLcDj4VfKuBxtEMb1ptYyshXGGYAZaWrRxn+vAn5vmPozghnorll0Cc
	A6RDkEoTdmk8ZrvQHSU3o/K4EsX3d6mzcUcO1e+NqF8288vTccUXiauTzBNToBwBNFTcbMRwB0d
	jJNcH2ttLVJGyCPhpmlIFBm0L85LvbbJ6sM920ymn5gJWC5a2tUY/nnPrsq9HCq99PFvzCChty/
	ToPHIxaB/EHgOIk5B1IpFDW6pmC6aAHFwe6wowYNcKMreo9hKuJagYiDWwGqkJlTe9QCBTyI=
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr295532401cf.3.1795606443791;
        Wed, 25 Nov 2026 03:34:03 -0800 (PST)
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr295531901cf.3.1795606443307;
        Wed, 25 Nov 2026 03:34:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68788sm621435066b.29.2026.11.25.03.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:34:02 -0800 (PST)
Message-ID: <862d4e46-8999-4b26-8bc8-f7a3a82f66fe@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:34:00 +0100
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
Subject: Re: [PATCH 11/11] pinctrl: qcom: sm8550: add the egpio function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-11-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-11-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bhluHSsm3hoO1hAZ1S-Wkz_0XFVhpq0m
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06c7ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JjaA4w47dj37y3qDwwgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX2rgSAAU2Yfjz
 uDPkR6OnYT9wx7uQPhAvkj4VSZtW6ZWzd/CzeBRxZ6q5Xal2x6pp92K5aBPebkREfjiW1f5L8wY
 BAliX3XWTAR+81bdfCJ780uzwG1pDcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX9gMAWUWtniXS
 ZzzRABQtfdsuf8/pH5o4Nv7lZFd14QkcvMSFR3bZ6XfsOQpsjpkeiNJVb5qJQR4QhH1fAblvhQ9
 fHlag7JCL1ZhuTYLik/owaC4i3i/cFcEzTNdCQaDQEQZaQZwwTRWTMUtvsMrAhm9VT7C8Dvi6kc
 urlY3lylm1a8Azkr/6RzOuirtnHrzoSEftuYAreIKcIMwvNeltmn84XGdx/+zSM0YPlHwLGMdvm
 QICg2eyNo4JNy4yRB2BSK7IXVrXZsaLl0TGBRxPO8RuRI8YJE68Ooq+WPPTAb1j4kJQcbEMpuo9
 /dQSVJ0i99a0TwZ4FSgyC0h5SPFTzA9E965/2YTpa92TyolqTtv0WYiud2+gYzM43GHCiteoiRc
 06eNPO8CUPqmSNFGQSp/ejXOehx4+3G5Yi9ZcDZlvJiq479wMujVhuSRFijXtSYx6zaR/u576WJ
 wqfNo+H5zsYVGd6nD9A==
X-Proofpoint-ORIG-GUID: bhluHSsm3hoO1hAZ1S-Wkz_0XFVhpq0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The sm8550 driver sets .egpio_func but never defines the egpio function.
> Once muxed by the APSS TLMM, an egpio-capable pin can never be handed
> back to the LPASS or SSC island.
> 
> Add the egpio function for GPIO 120 and GPIOs 165-209.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
