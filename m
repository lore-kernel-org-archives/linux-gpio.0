Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298A944BCB4
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787139599; cv=none; b=EFk8BLWmGW9HoVdN1HIq15yqNz+n01/dv1vb3ZaYq9DxyI95kVrjuk5vKtN7v7nCqW6BmFRwqJSLxhmGAbEP5K6xZco3ee2BbZeiD2luZ0bowi+HAKSFCnt1QtTyMppYb5ciZszgeyfSZ3hvBUvLNxUypr/Dl64QvIXCCr7ddxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787139599; c=relaxed/simple;
	bh=CsTuZONaAyeuKxRSACgHhfq5qOIK3Djua4qKrdXnoaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnO3Dh/0yzXQ0JEoOsDg+w9vxUovJpJ5jkz0iVCQbOm9p8Ek7pTod9cT4yYhkc62lTuh7btF/5rEmR6WZnfZOLW4d6gZ+NT8LBr1ZEXS88T34MbHIyjtLyVK0vJLJwis9GwRtuCfIksD0uN2ythVerGaBUOIO7cEJlfclYRcCnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUykGVGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vvr+2RYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUykGVGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vvr+2RYX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7p3C4078069
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 11:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2ThMck0OybkTkoB8TESZ2HY1tuZaWXzrY261QABM5I=; b=FUykGVGbBjegpaaD
	jV71XVZqpEe2ypqweCs+uDUwXTBa1WDcwxjOOC0mqwrPZN0WbfqKOf9mQReSNHbx
	D01Cn5jgH7QzzookIElpXprboeb1zM5zvqQXMxvkx9Tj1v50cMaTKOow3O6kLOUb
	juXRtZvN8PluWOOk7BXTcQPXjPBoeddHI8KTnxio6jxNSwRW4vUahqPKMAHrKwhE
	Lwoi/OlcWTH+MK3e+bInVdtFVZW3LPMdQ30BJFlEJGMY8/Lz43GyqK7QpEOKpyTc
	sRL8kMfbzGl4e6Cd6T7c1ANt2W5H/Rtzg70TUassUTvPSPnvaLMnRolomqANWIGp
	+c9QMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfnay1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 11:39:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso7856885a.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 04:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787139595; x=1787744395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2ThMck0OybkTkoB8TESZ2HY1tuZaWXzrY261QABM5I=;
        b=Vvr+2RYXOnMHX1Eo+CUFfbwLYCCODxfPO1lf3AfOYbG9cbojcYe9su5IwSKaQrj/Fd
         gzs5KaHXvrZIFF4ZhcUI1pRSPIW4WhoTT02lQgXykg+Z0qI45ZBqlGVV24ywUuUZ+FtF
         BAeEHYFZJEWkKRxF81ETcsGNYG0PYjCQ5Y98YkuXY13eGjilvMneMtmyJ+66yKakopwA
         wk0MCc87dhAUHZpIZ8kvlcdNvUyB8pQVg7tPrDIPCcfQy73hgpHZxomdxzqH+o3TJevE
         R0upHCh03IFFbqk9L7Jy1IzdyBj9EDtmK95fkIFReJBVjv9q+0gTZojPjHJk8MDhvccS
         RekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139595; x=1787744395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i2ThMck0OybkTkoB8TESZ2HY1tuZaWXzrY261QABM5I=;
        b=WeVAkGlbpz7NC54okPbiNJ+EAvGUmgHc+2jmssdEEy2lYgEYWcBwzBncDu6GVgByAv
         0Xt4d97iAb2TYREzsOYEVNKx+yw/AQnpe0P6w6GUqDGhGghSZFQfeWPlh+zE0X8mkIAO
         4uXlOarhK92WsFuv5es12YBoAdy8KjOrUjXhqnFQ+VpujNX7SB4q3j9hH9IDrxZUMcgQ
         FzRYDFhhimS6m8lvV2eZG5Y5u4mNa9jzfsMoY/LxfUKN5bBK2dervSqhlrDsKpl0ANC2
         ALhdIR8k2Aia5JZUU4AAacztDrdstcRv66IUlHuXYRu18xDRXenJ+/9JPDMqXrCoOHFc
         JnrA==
X-Forwarded-Encrypted: i=1; AHgh+RpANesXymePs5RDGQi9bD5DTGUDYmLCe/PP9ufi837ro6Un9mjMwdMjLhP8SmqIdQ8tfP2ZM6EJ3bEN@vger.kernel.org
X-Gm-Message-State: AOJu0YzO2LPlVx7S+0ntQalefprqv0r33GQiPiFkPrNtTcbq6J9+E7oM
	cwI9SA9sXjLx7H7MyCLRi2vcYoVVOr//Wg6A32KDkLMuOPnaWI+3fD1Qb2+KdMLV53KIW7+GMp/
	sylGQLmWG8VTpjpl/0N2J98qVaQLW5/dGxsv+nnTmo30EuJWvtjUJzanGP8hnKI+7
X-Gm-Gg: AR+sD13baHCsNq2CYkj7R+O6yfNtfqL0CClFLX0/Fk+z9KaH+lNtCUuuf47a7dpmoo8
	Sr8PIj2mPbBDm+p57rb8TTtrwr8CcQRy/2g/spSe5a4JiH7oOve1V7+ebKlFSb0WgrYXaO0v1mq
	h/JzMi3z4qc3K9E7lxKhoxpb0WJh4VZtazYbygHX7ZHwhxjFjqbVCkmHfoKCDKxMJm/LWU8UMNs
	6yMUYQUormbA+mLV9GuqAmqYw1CaLWtW2NZSN+M2jtJxem0/ZEvDTDXEW4grY3FyJvFU4igS5xg
	NvZFK4HV3JHMh+4UBeenVYzZTVo1KK5Nih3F0nrJ32vBnVuYjZJq2Y3ApZ3OQqJGGkqPvOHJ18Z
	D07lnp9Mq0h7x/zG6y4ceWLsl
X-Received: by 2002:a05:620a:a809:b0:937:2443:3434 with SMTP id af79cd13be357-93724434908mr51192785a.1.1787139595226;
        Wed, 19 Aug 2026 04:39:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a809:b0:937:2443:3434 with SMTP id af79cd13be357-93724434908mr51189885a.1.1787139594816;
        Wed, 19 Aug 2026 04:39:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff177b1esm713807a12.29.2026.08.19.04.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:39:54 -0700 (PDT)
Message-ID: <befb87e4-3b29-4e97-be6d-7dcc5e826dbe@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:39:51 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] pinctrl: qcom: Add SM8475 pinctrl driver
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
 <20260802-sm8475-tlmm-v2-4-a93e1d1cb53b@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802-sm8475-tlmm-v2-4-a93e1d1cb53b@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a85960b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=iyVIhWazpKipxYJLXtoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: VhwgENfVUzzhFhGrJFxBUs30TPhtaxqZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5MCBTYWx0ZWRfX99femYhYypKY
 EiJquBXkUjY2ARsY9qYfpc2q+1H0xmIvsQge7spUlXZ0ZOHKNETyp4Yy9R/ph6ZolX/3mKE/572
 zL1MaqrLm9dwI2dzk78rXpQK/w8j734=
X-Proofpoint-GUID: VhwgENfVUzzhFhGrJFxBUs30TPhtaxqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5MCBTYWx0ZWRfX2iLD1OHU0zk2
 j7cY8zmECMI5XCMJHlafEKN9s8ZKuVeYxKidHCh7g4UlmlIuuF3bp6q4WnETS/Ak+GWCUlG198T
 qYbL5QnbzIUWc51konB/YZKymNXvHr8asJWbUQ1vY7JMN6bYF5QOK3V8993/n0dSaz3NwdOJFmJ
 zrKiDaUhSpoxBw/rIhqKxddoAexwG4UIWbsuzsl4bkeXd7Apj5g7hUKZn1rKd1fNMVE/QoT06Ud
 kZsP0mKCs7m8oVqoduHvvF2KFBiCas5oRFZ+/HcYFJDr6EtJnvXT/MfaQgbCTnG/wy4zBfoiMy2
 TuTUs7ejizhqPyzYOPtzOFKHRejwxs3ftdiCx+TRc+XXfA4ZZTTkkt5ToqzywCHtZmT5BYQu6NP
 Pi8deKZFKNxGYuUY4ilMNjeBgMKNh2MCb+Ej5hLWTLsip0F/pPVYuFSxd7d+sOWf0RfSAgQhqxt
 OwLgCStbnQCxvgScTFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190090

On 8/2/26 9:30 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> When compared to SM8450, PLL clock groups differ on SM8475.
> Add a separate driver for SM8475 based on pinctrl-sm8450.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

This is a whole new driver to accomodate a single change (removing
function3 - pll_clk_aux from pin 98). I would just add a comment
somewhere and not bother, especially since IIUC this is a debug
mux output that doesn't get used in practice

i.e. I believe this patchset is unnecessary

Konrad
