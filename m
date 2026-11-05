Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868911;
	b=NG9G8TLKG+41/kFzl9CDBHIG3aft3anDrWP7onOF4ThR0/fDWoY764n9MMrLatuG7dS4
	 sBL3JB8Bj87fNyzupm2WYONoXg8qY3Fc4z7hW1K/2maM3Qv1v8SiaH0ZDipMVsgv+OjpM
	 leasbkQDzK6ZI8NW7DUq4aYp5JeXkveOGsznO+zCQSImUCKteLlQdiCzQSvIgNbC/Niw0
	 9vfxEWyU7QOo0n69BhDeKfTozT4igT35oXXpVkw6Xhc4Tf/HFhsdsF4ZYF7Z+8pK7L2Rs
	 JlH+RDgVpVm98NfUbid5ALEV2bA0wXgldup5R6zUEr8eY7OJci38Ms1+n+DmMhbHfUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9MhwkwUuh1J4nIkDJ4OGuZ0UUch4I3yF9JIiznCJquc=;
	b=HgqNFHee1aWfEydHaI5+XBOYUj2adsSfANHKvl39EfWDkdHOI7G/vTdIpRrIw+h72DHG
	 jye/45wOhN22ExJRGBj6ta++TQNXjhMlnVJp3rzg3FzewGvF/51gQK+Sy32KtOxBydpqo
	 tkIAbrtOStiN43EpEsVcbn9nq4Cwdr85p98I9KCgV6oBxxFRzp0yYtc3NfmummisMpsGK
	 gbdmzdFLQ+B+5Y9IUAScHBte/kz9GZh5WutKpjb2e5yd93tX674UjlwRCnxkpy122ucfr
	 oPUwJ1jAV/syrnfAqojJeViTG1SuvECAg/qiU/oEHp6zXe3iYS/TNO4ZXB7d6J43NGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d8c+3/2r";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=in8MIq+G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23676606A32F
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23676606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d8c+3/2r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=in8MIq+G
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UDtZ942080
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 08:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MhwkwUuh1J4nIkDJ4OGuZ0UUch4I3yF9JIiznCJquc=; b=d8c+3/2ruthX1ChK
	iaqihZDvlaa9iN2ZYV3y5CFjQhXPM+Ce26chKsrFLMTKpZn0DdVpsCG1vS5Oq6hx
	g69QRF7WWi+IrBKlSFhPqdMz3zOofnDJvaeRvRB6r/pG5F5z+JFJbiuF3337fGDU
	wahrozqj62nDI2f9Sh/Z2Mq4OGRMGh9tUwB6LA6cwxUUwdK6261fcVqUxaw9Rrv7
	gdmcv4Ep2gCxpTpcHJvw+0rmiu+orTFs+AFqURE7UZae6xKmfPe62f8b2wds876Y
	mIP79j0nBC3Stv1lRnqwkWhZGyV5XONgGXmIsae4wZKLBByK9DPlgvNp4BerF/tp
	8Yk6hA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj43v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 08:55:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980b637ed69so427136241.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868909; x=1794473709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9MhwkwUuh1J4nIkDJ4OGuZ0UUch4I3yF9JIiznCJquc=;
        b=in8MIq+GQKlf9ahVKfwpI17Km7G/VogtiwOsTH9ckJpxzKfJRCJxEf26LGgrb/vzUd
         nCHepkMLxxg8ep1BFCPNq1ISqTbxIonEuNoqL3aH/dPBMgQdwXTNpQyH4etf6Lt0Cm+H
         qCtLwo9BaHjuf0ybxZ2xfbrd1TXjclypxXOuYqytdMv7QVBCe17AjdOHO7P2+K2owNTD
         Ts5b9e/aXURVcSQwk5FTEFs7nyHdqVaR038a5RZswIXbQfGiupqfCt/aR3AH2EFMH40B
         oisbZSuWSiTs4NOgiQjiBwWz9bKwIvR/jBKV0uNc5AL+mIZTRhSWFlpLQHyepNR+Utx9
         7DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868909; x=1794473709;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MhwkwUuh1J4nIkDJ4OGuZ0UUch4I3yF9JIiznCJquc=;
        b=YPYw/toUy/Xt9C/oqOGdkk6CPtdK9IzHii4IdBx/MwfJw91XhdxD+C5G/yCVsbXHR4
         DJFX9y6iUxhbsQnMSb8BqIeMGoctnKgk3nY+gIz7QhNP60o8PGk2SV2eX2cvrsx9O8xQ
         CNq7RDQ+3pWtACpkV5LfOo/P/a3CjVcF2L9UGB4E2iB5Y+kFSt9LEPAAD5SviolqfuFz
         MRTVYEt5VUUnCXXwxuoVkF0MvK29DstqAvT7aTnQ7OXxexus/6EMCqNnEYnKM5o8N6qS
         BdwkEUrWvthBiXqiA770BxfoWDOhNvBiOGRuq97SHq6/DSs9INUYRYa/4SGi3dioHGrm
         9t3Q==
X-Forwarded-Encrypted: i=1; AKwUvByD69cs1Zynd69U6fxCuPMM//+z4l4VZSKi6cPX38umSd77znfgHRRP8beI5miAGK6hrbNlhn4E73Gy@vger.kernel.org
X-Gm-Message-State: APuU4Z+4+maMpyV5WUQh63LvI4yql6+2fAmtF/CdYibOVTybWeLxR5oX
	1vF8qHpAaDmRLkutTftG6ge9+3r9LLj0vj2OpfOGbzezSNhqsJIMjxGHXaYzO1uMdO0Ow1d+3+C
	wThd4FxL9Lu2Ri+S0+APGA5rcTqGUTO2TZGxPiUY8TcdeaYjKZFA+xQ6d7+mG8H/j
X-Gm-Gg: AYBFou1PW61vHUL+VIvgpDJfrlavJHF+skcTYEqi+9usMDYaT1yGiQgKMUaKO577yO7
	MAG0g2rq/hu8lWUZBn0WoDrN6yB/2SjZuppbcNKBfYT0EJMZ8TsQ6BLHJyyd2HO8f3vwPBt1zSL
	PYxlajvRDZxHCgaQaKbPM8KiILv1EtrcELkFseYSP5RGshTb0nmsVpNtk6ItaX7RckAKOwYxEYg
	AV8yMdbaF8G6uoEd8FVogw7beo66Vip4JILk69vDe8xG3X4DZThmcy9Ge3G4Dkt+rHaKghfJ4ZA
	fx16BgzyF8TZ+V+wY/gVKSBYHVLDN82sW2FHWVG3C2T+IQMimAqjB98n6vkqA+/JMAkIiRd1yoZ
	teqEpBrw7DjE/Cjcy/QMdclQvOoEdgFymQn64vEDDShkKUX2PFCVaSr5OUplRJKRbxzviVOV3jd
	8n
X-Received: by 2002:a05:6102:8099:b0:7cc:274a:3e0c with SMTP id ada2fe7eead31-7d0725528c1mr7536297137.13.1793868909079;
        Thu, 05 Nov 2026 00:55:09 -0800 (PST)
X-Received: by 2002:a05:6102:8099:b0:7cc:274a:3e0c with SMTP id ada2fe7eead31-7d0725528c1mr7536280137.13.1793868908552;
        Thu, 05 Nov 2026 00:55:08 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fedc09675sm8659918f8f.55.2026.11.05.00.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:55:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Jinseob Kim <kimjinseob88@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linusw@kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: reset lookup flags for each hogged line
Date: Thu,  5 Nov 2026 09:55:05 +0100
Message-ID: <179386890168.13258.979830877015023583.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104115938.226-1-kimjinseob88@gmail.com>
References: <20261104115938.226-1-kimjinseob88@gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX5XhCgVupkdGN
 O69FesDzU714+6iewUCUmxnDmAlGWGk1Yq7THuAEi/PGOP4zXkjOunvpBWlMIBRNd//NOodmTGa
 PEiC5F49Yw5U57VI2L/UIkMBpgpFVNJYBDAInNry9KioI/FEcUcCO1zTzMxujj2Y5mthuQNuRBi
 98aLxtB4B/QrQWKKjspdDVz9nEE5XfQMlCrTz/AxBLaKRy31exBAwYJUxu3mwLwW81mSQHw9DN9
 Q0H9bsxp1mX5yrQqDDmnARWzZ+BKoP1UE+7PjOVQrU9zE7N3M4swhxsU9cMP9Pk7MiwCGv5Veld
 9szF+X3NyDLdRHX4Vao1NTHwKgVFGrK7Dh5JIDv3xjpUfumKd5Sg4DCEnl7MyILT5rNQMrEFg2h
 iRM7405i25CdwLh5flnLRuUrJ2dvIi6yPOw1xIwRitOk9+fjs1ig66k9c0zIZRF+fr7B1dOPzGw
 grGqRHtytQHMIE1p3FA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX8F7FNpAiiOvH
 eqE6RkqdHR1u/rcB3mWYQH2nK8orncb6xpb0wPz11qrzrO+uA5eS7qceZ3tKXAe/3V3smSF3AXP
 MuGwRF4lCMiYAOiqgtxN/ozlOizwPMc=
X-Proofpoint-ORIG-GUID: AJeUMXuH3DpfFg8Ap_xT0vr8LumBmlMg
X-Proofpoint-GUID: AJeUMXuH3DpfFg8Ap_xT0vr8LumBmlMg
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec446e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BRXwEdrC_15mm0w6M84A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035


On Wed, 04 Nov 2026 20:59:38 +0900, Jinseob Kim wrote:
> gpiochip_add_hog() initializes lflags once before iterating over the GPIO
> specifiers. In the non-OF path, an active-low line sets GPIO_ACTIVE_LOW,
> but a later active-high line does not clear it. A single firmware hog
> with mixed polarities therefore configures later active-high lines as
> active-low, including inverting their initial output value.
> 
> Initialize the lookup flags for each line before translating its flags.
> The OF helper already overwrites the flags for each specifier; the
> non-OF path must also start with a fresh value.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: reset lookup flags for each hogged line
      https://git.kernel.org/brgl/c/c20464a78162cf8b3a1c9dc7e0d764e535bfe582

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
