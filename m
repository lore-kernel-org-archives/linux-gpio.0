Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447337;
	b=2v5HzqPGWxqyanBxfT/H0sElD1SUhUCUTUM8vJ95QApJTqtFyZMkE8gXzlX0QRMZUvux
	 9+wqGI7J7AWMnC1u+UGdpkstYnuRHU0jEfrSnKEDmtt2R31LazWJoFuZE0qB0MgatCJ8F
	 15M0VB4T3Lr4SaLmNK0cTuWqcq7bUsbJN5Mal2gqEVej10svd2vfS/yiNg1btyiV/rxjQ
	 fA3Y1LwYdIj8Ip1Z01oUWhQVCZBNIz78vDr76GssC8t/JmaEwkb3Jxt0Jls9iJBuwhyLw
	 Rfq57MX4ynvh37VJVh8o1ULLkysdr5dFPf5BrPgkaYRQkHTG/+TnysP0CEkISt9/s4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uxwB/tfpj1G6soQPn8hZLuqg1wnIQcFZUfB2L3eD/3k=;
	b=jMAK8WrT9N0eKzz+1Ad3wGE2uFVHRxiVYSgNdleZyMkYS8suhyXJkD5omHlWCCFqWjDu
	 3mLNBFrzL60ooIOK9Vw6sSd0ez1TJTuTC0GNowF11cA/Y56cF5z92+HsvQCYjyMHN8wHa
	 jS5Ma9dxZpgBY1eqik0LxLwxW+v/LwExWDG9Y8bel4WxtbWIZF0K8toRDLtAX3hSs3C0l
	 FAu/PFfWrFkwD+HWZct8+lzWvzlCBytVnGn2IRGgfNJ+/ezGwFcfH48iB8L7HtxK+IXye
	 R9sLRS2Inmor8g2sdnQ1NGUAozHfxinJPXKYQy0Hp8NNt2Xi6Cus9hR3hvIbCMvlNhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQcPbihy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAfyIZEZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16876606A32E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16876606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQcPbihy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAfyIZEZ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLGTP1461376
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxwB/tfpj1G6soQPn8hZLuqg1wnIQcFZUfB2L3eD/3k=; b=OQcPbihyhg5ti0eo
	tMbbkVCNwxbiCeOGFtAvdo6oRuFCP3dZbm9kxrjXtOFQXQ29ERg052jHurB35L/3
	M2XgnuZNnh7jxWVJLZLJ6oolY9pJ4XaZ0VqUa9kg2UC38eiSlrjHtwbpqKaz9wRA
	piQjN8MaSbQIFGGDUevMWHr5FEDU915b/GLcexMuZHFRO1kSxljSClwa3wkU1FkJ
	UGoUvyBcoh+ticaPW8ZitaXpsTBw9XS3oBnErvJWitQqEsFWL3eLIa82A6xcGnsU
	SloY+1C38Xw8AuDWPxj8NNTTkTYPdvpE3jStV0bIeaUOBhh5e7wo/tgErmvXMiiE
	GiKVcQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a1yw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a4540f2so19908085a.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447334; x=1796052134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxwB/tfpj1G6soQPn8hZLuqg1wnIQcFZUfB2L3eD/3k=;
        b=cAfyIZEZozoYmJ6gmGAOXJMb4213eiW4ODzcjV1iprre1+Y0AVIjNSMwWAOMkll2Bq
         9VbSbAFJ4p4pIZQOAPkEhxUuC7YFPBdH62fiDVffArcvhZ0VUWt+ywMmna1la3SD3gDz
         +6dNUsKEeJLvT0l+g0h1t3FB5epji2Ng2XhqLghEeStD93ga9mDcJ2hTXPHKzQKfUKSJ
         lkxNpNC9kouW9rog8qHvsUHZvUK4+eyEyw8I7vTyW5d6pcpotjj0Atstrux+nQdfH8Bj
         nlLDQfJwfpzZ7kmbQ6BX9DURZ6+TV2MslnXLW0fvq/rWSXrUILCdvTwBSsQl/Otw0peX
         tjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447334; x=1796052134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxwB/tfpj1G6soQPn8hZLuqg1wnIQcFZUfB2L3eD/3k=;
        b=0iGvaXUT2xgl2lhPLV7qSQIEVju036c6QlDzd235RJp/NZU1zsZlosenMFvYdlSzdi
         IX2yu8y8D522J6torXSwM9zxYNbjo25SBzFNXQFSuRoG4VaMWiB4kL3zApcEOLFl3Hvj
         4TZIusvL6HUAID8VSU8JHo04sjF5b96aogLw3Qltj5cMj901V19ljqjWpvff5RMyEwV6
         EYBQ31bwMjiGxhP0nGtEWYvG7P4WIm1TGh6lm/uYPWRLdORZY4QHKsVv54iQEYtXapIT
         yJcqBqqJFJuSGSDev2B2y8+fCPK2yU16YnT47dnN+FiBOxRDPGJkVA7cflNXe6UREbwB
         4kaA==
X-Forwarded-Encrypted: i=1; AL+hErFfRecwz4sjO1Mjb8rHKtfI8SXdRQ5YG4e1cmOBYxuqk06b1qKyjZ0ue7fuvmvLaTsLduV7DwFC3BcT@vger.kernel.org
X-Gm-Message-State: APuU4Z9/bnRc5nOIR9opXqR6ROkG7/OvZM+EgMUbgCf/+dRPEwL5bDUN
	ewp53FKrk/rsbNwE17LyroDJ0eyPHUSLzeabIOMvq3ELtBQaf5lGYGdownCE6e9oe/VjZUZ2+bP
	TAnr+1aJOlITHbzqTjFKO9Pu06O6SXWW6juhnKy5Fk7WN8an7Aq86IPqGuCwvoYDv
X-Gm-Gg: AZFdTZfa/ixsIBT+S/5fyLQn/xiXXXGBSSU0akLtvQjmDNr6lNIJfU+rMWMGUqK9kGk
	HcmqnMLPmQRSKRpryWRJE7rsxFLWMhhFQOTX1Q3n2v8L0a1qgNVuZkYWjlow4ZOoK5YXBicZYCi
	ucs9m27bTzcWu8hKYDfvZK7xk4Mr75JbQnStvwZau2mE7qmCD1gEGLY5Qlfya9ugKXVRG0k9idf
	AtG9lUezI+erNbTUWvFwK2alfabFuO4Imbv+VR/tem+xbiGiy+kgtzIylL9SjiFBT5TyGIly2kv
	aeM4OsgOUAExfURs15j/QrkmNaQkrntJLOUYM1hcckkGhf8lhxNtHR9NXcNPkTK8+rT0Cdjt+2n
	PPtyfPNyhnZZB/JAFuah/GK8XxGEhRd4yYmaeV5+Lo0A0NziHj/rgP43d6Q3/GSJ5MH7yuzs=
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr1635133485a.3.1795447334307;
        Mon, 23 Nov 2026 07:22:14 -0800 (PST)
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr1635129385a.3.1795447333706;
        Mon, 23 Nov 2026 07:22:13 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm411446666b.13.2026.11.23.07.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:13 -0800 (PST)
Message-ID: <09f5e7fb-4fbc-41df-be25-d81616c58402@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:11 +0100
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
Subject: Re: [PATCH v2 1/4] pinctrl: qcom: Consistently restrict MSM8917 to
 ARM64
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
 <20261123-b4-qcom-kconfig-unify-pinctrl-v2-1-958e205b1f60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-1-958e205b1f60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX8QN+/NPbwxWl
 jHg2SEgO2hk7rlyjzkgO1x1g85MX5VGXN/HJO1hNTUXR5oDWLZ1WhJTvzfatHvTGjP1EuOW2ZwT
 ryGFMdY397cyqScobffn4xvMS9jxyn4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX4AnJDlQ86WAK
 svJSmksamhlr6jmPdYpnm4HejkrhJNgNOn8232NfOlLtMiJBSY7OI7ZbvPgCHIPsOS/+LxwDpeL
 4IP53jEw87pQOx+umyowFmhHvB+KPDbB0TzEqrzcBvNNhvmsbYjGu/GM9it6nSBIS31XsAdPWOc
 Ma9NxRGNrvygXjhQTvGeD983yfRlH779VdXoHZxMLrZ4VMbHB7/bkVd8bT4ShN7OVvBNH95f2wE
 tAzjloNWvKzt4NemtCTcytEEHpUqSadXeUBT0RN1VQjZRKknLr90mwOEstnthWsGhWpMAVS8PV5
 ZhxEB2hwPvCSe0dlp0CTA3ZZsGJC1S/jomSr50GsNv+/uCw0bLhUZXHYCg6MsgPMLsWStOsC0uw
 xlKNEZhhyUxOvGtc5WXMJIrcyUEZNjBELKJ9+MVM+HbXdykvk3cDVzY/5iOZGUvhMTXv5Tqh+0e
 CUHOX55C6YllOUEzQ4w==
X-Proofpoint-ORIG-GUID: U9ShrsZJtTBZXRpNvXShRgVozvwEp2C3
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b045a28 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ilm-UVfHMgz0hM6ccM0A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: U9ShrsZJtTBZXRpNvXShRgVozvwEp2C3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/23/26 8:44 AM, Krzysztof Kozlowski wrote:
> Clock drivers for MSM8917 are restricted to ARM64 and there is only
> ARM64 DTS, thus consistently handle also its pin controller driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
