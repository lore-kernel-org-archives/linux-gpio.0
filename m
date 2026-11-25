Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603821;
	b=5nkQHnPMLEmiE1MPAeVOK9+S/ovLVGXsyjod6QmraBLLKqQBHNwU+kwCwkuHy01nEX45
	 5P3pmH34/pEWf6EP8YHNwMGkblGb8IRTrM1gYE3S70VPhb2kElRQL+FL/KL4UyciXRr8l
	 gfu/x3Kwp0ZuZzmJTKN9UqjY5XMHsSyrXWDyFohsCjjFUIqHJhAgJzYMlSKc0/7sESB4j
	 7eF7sfMx8mBw7BbKZbn4MCn3TF6zCN8xQSr5uPKlBwTOcCKoaaGaxT4IpABqJx26jcTBD
	 Khmts5miP8hJ02PGjLM6voIrYhNaCpZ4z4gf5WUtwt84y58KrsNmYox0PdIzF/oh3gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=;
	b=aXfSW3bFUMB8/Emgx2xgHolRVqzT5P1/5MXo8TM0FqHFbiNVvJdaWhQPEVcJC1UcWzyk
	 2J/znqX/Ygj/j7yZBxrVlF18+YIBEgfcf1PL4N+Srfzgm1GfxzYzfj0lC5INg0ZwPjhHs
	 l+DY5ygR/C/dtwBEqlXrjkKZhZtPJAJhGGg35OGoCbMgCKU9cgRggelPOVV82qwj6qsW6
	 2v+vvfGejDE6p3uvP8NMcdIfwy+nPcQWN7p48tshUdUoxRP7OR65uFTKptCn15JmMPP8h
	 lBI+lCGcNQVLvePHKEA1T7Nf6eqHUSnzE5dl/Rz2aAIoiJ2L0fp+yiKtMb1YRs9ABxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebZCQ2lp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTpfwP+D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B98606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B98606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebZCQ2lp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTpfwP+D
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mCZm4130803
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=; b=ebZCQ2lplJzbE/FT
	B07RgrpEEfdgeCzfUMTGYui0apgiyHgiYuTjn+sXx7Dic/V9fb5CLUmucvQAQ4SX
	Nwi8ky52KvNixGTIamDXDJ5NRyKB2xyZYolp1Cc1yeUB8zRd2sMzu1PKwdo/Mmda
	5dTq71cYDL2SZNcTKNUAnTRH8pVSyDlgxL04tHywoAiOPEfHDEARka+PCs8Rs0lR
	EfP1J48xreU8zC74A8QNR4fU5y0I0pvRm12hzG01V7iwzSFNjukJIm/2PcCGiw7q
	Y6aL1sz3lFyS5mDyqpcxZ0fkLI0sl6JrE+k62dPmvQC6tCGxg5gZ3bwFGUi2aOIm
	V2WYoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrf5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53635fe2335so8441971cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 02:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603819; x=1796208619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=;
        b=NTpfwP+DTs0KmDBr9zVz1d3hF/dyvToLBayX4veQroxPvQtm722TwJcXc39pP7LeTx
         QGwau/pO7RtaSDsdvoy2VqYfob7gYo97exvMh9X4svSm4tLLV3yL+34wFA9mgCE+6ohU
         Yb0l/tFLCuw2TLT8pEIRAOGjwZLXPgUk5yy4s1U+qJL8ZDd55K6Paboio7Br3mfWEYm8
         ZZj3uJw84HHr7I14pYyiauh5kzvlswINH9O0m5R3GlrO1NvslTtgMVoBGJQo+RsGLKh3
         RLZp5u+Hz0jrVPrdc+9mCpQhgch/08QvduplKK16wYvORvIhaSpraAjyxJ4WxIiG5f1N
         B//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603819; x=1796208619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=;
        b=EtTo/WZ4ewM6DsPjVRX4w+XJ7mlEk+kE2w8f56RuCO6oPyKVOj24rpRAHY1qeRhVs4
         sUxTanVgaArO8i1AOJ151+Oo/JsKh7s/DEbZ2oaIQx8NRQKKvPmveqHcCyQZm60Wu0j1
         ThKbwgCZ7O0wBOJhxMP5PfdTkuKY8gsqRwN7dFdQ9iJwtQQtmNUBWSSe+lF0gk956PPO
         dNbO64+ltiYM0yCINN0bae1QZMbCbg6Wt+bbGzg08WzVR1t0zZGAx8u72IZwN63ow1kK
         yyhtU3AD6GwHQIm5xIl2LScVNGz0TYKH+RZ0vKaAiubf7WPAbQAthLeNL1/ZZ4zwTg8r
         BZbQ==
X-Forwarded-Encrypted: i=1; AL+hErEssDfQymlMNBERBfXCfpyzktKyIePrlY7Dx5bnxUeSeRwvbmtUL/IHxOiHejpJKldkkLHVIofC0Lwp@vger.kernel.org
X-Gm-Message-State: APuU4Z9lqli0BX89K3K3GlM6WWmRFqouGdWr/aH7FrzbALv5Vu5fv3tN
	pl0M669nYzoZslkFPpdZzR2rHWrrHwsPe9iqlKNLJIr/esru9kZduGzmcNqMVlPWuWCr6x1IgPk
	z0Hj7HzWPlUa/cQcELwE+6DkaUPbBKBP8pmkp+qAe/gQPUVKx7pNInrxk2WHiC7F2
X-Gm-Gg: AZFdTZfH0606Vti0D4khw/BBcNv49/nIXt+scdWNrs3YpjfocK3mlhGTy2BDWEPsn7U
	jrskmNMK7r0cDlf5z/sBJDw1GvSWFyFiNg6B3OK4Xk0zaZYTbR/MvDKXsQSuPUR4WNqcGvQCTFs
	RkVPRbfs1Ijt5J+YHe+xpgRJHvO3D0wB7DNVbAYMsNa4uVYyDDU7aCBG+YAvZPf2YSkJ0jkNEIa
	VajF87yHpa/aW8fAAoJlCVZXhKrhg207HnrSWjFzoXpqBvvAJ8Z1l72PtP1vqY2mKQBWuvcITlS
	nIM15Il3xIRTjq8mXPkA/TndvvzScn3LcJTk6lW/4dsOIwtcJHKsMf2rEprwom1kiOiiciRsnNh
	XQ3ka97u9AwcQQx/xWOjje/vfWFvIWKSPAApkJWwgeYuP+5YjOLjM3n0mTSv0TMEfWGnH67g=
X-Received: by 2002:a05:6214:5348:b0:921:2319:36bc with SMTP id 6a1803df08f44-921349bac89mr369725266d6.2.1795603819266;
        Wed, 25 Nov 2026 02:50:19 -0800 (PST)
X-Received: by 2002:a05:6214:5348:b0:921:2319:36bc with SMTP id 6a1803df08f44-921349bac89mr369724756d6.2.1795603818795;
        Wed, 25 Nov 2026 02:50:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:18 -0800 (PST)
Message-ID: <7246e6c1-544f-4b6b-9eb2-26b0b42f5b65@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:15 +0100
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
Subject: Re: [PATCH 02/11] pinctrl: qcom: sm6115: mark egpio as a GPIO pin
 function
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
 <20261124-qcom-pinctrl-egpio-v1-2-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-2-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06bd6b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TBji9Qi9O8DpM7T6nEUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: M8pD51ET_Df9dkeedcc0UX0GIjx34zeX
X-Proofpoint-ORIG-GUID: M8pD51ET_Df9dkeedcc0UX0GIjx34zeX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX5figEMTHr6sm
 PAJpn0/ziw8mqYU27/6e8TYngqjLk+9SlVqEz5/nJTIH6u2LFKBrQXCV1dL3YvCbPd7lN3vwagL
 xr5BLluP+pR7kUwsftXILae10ZZcZCU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXyrr2wr9y32b8
 TV4Pce3WtXn9Mjw6KCxI1cAZYYD1+JxfOTLR74Dy+WVxMOkzpS4BLgmx/2R7Jc7wchPi+f2k9AU
 EDoTXfyDKZnkiW9RfyKUk+l/mHFON+XqnN137bGQQdtxuD3B9rTFTXdT7wH13mI46qtwtf//F7f
 BIGayn4uPVUU22z5ia7Ht2odpa4gm47/7zXmCm9STzMxJEfTckc4bV6gJBYJ/Ghj4y9eZ1+2F+b
 w/7A73tHFqbO90qC9hBfyD2vk8/Do+rBM14vWt48m2yPMmsl6TKBACSRQ5CaY8a+mf8xokGlsJ+
 1DsK37urKkK6t4rpG4x2dSTaoWAdy+pkmhdtxW7VL+mCBMwufV7lzO3fPCsPl3JdM7hKyzj//Pd
 MS6uxjBGkJl3rYkUtoLcdvnwfuFlFbPZoy0xigfvvg22g0zla3WLcuVPic69QjSvshNoC5vGdPi
 eakcBK6+WSElqveFsig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the sm6115 driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 0524a508b2cf ("pinctrl: qcom: sm6115: Add egpio support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
