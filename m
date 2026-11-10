Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310218;
	b=X+IQGYpis/OqP2kd5QiJLMPg/JrwrG5Zg6NRN/2/JWW/8UNj1ONvAP2mXALr6ISJYMBs
	 Q2wmA+jyqwzpw4l3738Ls92Ue12kVjwHprnvwONGVFtoiMwh3Fcw4N2kkyEHuLifBzck3
	 TArgNeMHVPL2SiqX8LDanydUHhlO8xQ0se9srRR3d7SsSImNdV590mP92SV7RaF8uwo0k
	 ZJIyn3bwfdPVgaG+HCfdDMGtqzt7qon4TuLVvexcq1Dl3KtMYfq51LJ0Xx5ABCg1OTKgB
	 YHBsJDJN6+BDljKm5XLxkPhNxe/T63uhjmh4RxT9h83AYBDe6aSy43bniLIzE6t0g0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
	b=DwTkP9fsO55n9fWZkrbi5hsD5b45GvT/cltlR/+0+4KfYfbosOgze/7JqiAwYDgr+x/d
	 eyuBUWnktyBrybtM4rgh+c38eCz2ap/M6RpI2PzFZXm4P0ebCI6b9iefUPQf4aRQS9K5h
	 8dYBdFmIlqM7xbxVNI8KybldzJCOe3h0Bz9kQl5EaKAY/3e1FJi3Bdnaaz49k/aSce/qU
	 qZdUzJx+PC2O468ls79IBqkgRijDGN7pfqZgY+m+RlqKyKq8qCykNBs8GEbv2v2tmYUsN
	 JuTZ4w1Nz530JxtLylluBBJ2CqcDsbB/xbaiBF+sDQdookp2hcCGl+UQrr7+mmGCb4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqnelBNb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7bbIAyB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAC860A2603
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 11:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DAC860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqnelBNb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7bbIAyB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAb3q3850926
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 11:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=; b=QqnelBNbbS62un9n
	7ny8IsyVSWcBmz6Xf0VREBrSrSnCpvech2cV9YL94kXrOxcASwIRy+h0AgfiAoJD
	wyRFSAVn7H63KnF7UbKqKoCJakBJpBuVgVNRvm+Ay4CSdZ/YSMdhSSZn6m8L9DYU
	WcO21F0zTvhilgLPVXqBsbOXt+Cen0SaKaPoPHLE6PjzNMk0kpkiiZcn95esr67N
	6GJVmIJaeo2anyJbus5ugKMVf8tIKBny/CgmR0ge5/y6N27TvXOF6QvgDW+OxxWV
	lHEQwLnrYQHFb8uZcvaevnC388/FCcsTQqssJMV+7tCTgjLAUF00r8jkfeS0mFBb
	QV///w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx84ghs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 11:30:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99089f9591aso389616241.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 03:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794310216; x=1794915016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
        b=d7bbIAyBjzOP+rGQyYdVsvz77IsNcsBnY1qiHF+tzWAmwGFefTYjwMw5vi4ceJ3QkF
         FH28xG9p6fWLIKst5KoqpICy+jGPU+awpeo1lt0GCWFiL4fw6L4uvvcASNG9pcrNwV7H
         IQ5gsf8ZeQvW53tUx7y/PYEALMF0TMvR0hiUnPh9Ro3Nw+aV21iSW66zcGNO/P+5m99f
         ceCOul2CXKjwj5N6saKKpbmeE228BcFmO3ycrfwQVpm6ax5uWWfrjJpEPLY5AsqNii40
         qe189CT+sPE+WJHlBjkxcRxmG8BcyOsjyJCF/BbOzeeiBLLIoTl/+oj0KemTVy+vcfSK
         uVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310216; x=1794915016;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
        b=UQpBefS7GqedTV6FFEyxGo8Dj2ItAT6Fk79MaXaRl7M/s2BjzYuWaK3qcXBDioGF4l
         4Ikf/XZSEozAQ3qiJPeCvo6dV2FNKxAqkbJren4rykZYWH181xc0tWWk9YpvMPfpdsLx
         TLiPMbssDNKaadJ1GuZtXRhNH9qAyLQDDfrf67wAEmB+jDDU2KwkHV2GNsUr26V5hwBR
         TGfVEvjiOavlq1BM6TTdYsZ5GmF4U6OVtN7YOxkGAxew2hwkjQIBUcI02C7IQzua7nIU
         binXx4ha/waAGJEYXXSIgXNkZ0/nQiytItSY+847ce+bT5edYaxJqDDDLIvV++BK0gV+
         LtdA==
X-Forwarded-Encrypted: i=1; AL+hErFFzXSlgYn37HWE34XOFORF5DGIjxJMLBnHheYKmiYxVE90sZZXrpNYjmtl7NRow5/G+LPrpmD3mRof@vger.kernel.org
X-Gm-Message-State: APuU4Z/SPzuatmYySz41F2uAVrcMTNwTu41wXAAM1/T8eRU/6GmtCPyu
	ZgCHQoPz5XUs+40wk47BTp0swwmB/eo3XJ0bnq8vCmYy6ikEe2/RL4uMGN7GiGUPGBBNf9jlTO1
	Th3diYi6JmAj8RZQv0G6TfHrXsVgYB4jFrqu0YKPeBPx0wDqqiIo+x60e4G9dFOOf
X-Gm-Gg: AYBFou3bw+9KXYCZrlqKYqnD8dne7fu7uUcvaP9s1XApZSVfzrHHiLqK9JsLGIV/Gxi
	kqVCXJ0jJNhn2gW07TsBDtkOFt/fTW8pWoqasxAv73eun+7BVsD/ZTsqgj1BbGQWDdLfvcTUmET
	l2gTXFMIbgwKT8PV6gjpzYvoNGlxgiQeKvl+i+T3r3xuFq1U5WPkcj6AQzZth+zw7zcy5sYPkP7
	kcji11rjjU3qgk5tHVXpuew3LvDGbwpv+qUtEQF5Hr82Jzd0kYRad0TfKBtMlJ0cJAG5dxdwOBT
	BOt7fPdRFAAOL65/C/A+9AJ2QaxdcddFllc8Q/fRNhzby0qIEuHSMrH6AEn73sp4nI+qfX23atF
	uCISBXIm6XGvHawrTK9KMf7sWroGI9N9L7dM33JUhY4LHElToNiABss5WXMt6O80DUPfkYJn/yB
	/FtChIyD0gc+KxOHlVFp3QORijtCFpdKhRYsosO6+vuzKONXxMfGmyb/7opoQO2Q==
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr613069137.11.1794310216444;
        Tue, 10 Nov 2026 03:30:16 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr613056137.11.1794310215878;
        Tue, 10 Nov 2026 03:30:15 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm68744635e9.15.2026.11.10.03.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:30:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
        Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: (subset) [PATCH v3 00/11] gpio: vf610: fix clocks and misc cleanup
Date: Tue, 10 Nov 2026 12:30:12 +0100
Message-ID: <179431014821.61906.16254753709778386743.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
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
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af30049 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WvVV-90v2Qb5btd7p0QA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: SBvxwDFts35leCfEAd_7CDrMFD_jxcex
X-Proofpoint-ORIG-GUID: SBvxwDFts35leCfEAd_7CDrMFD_jxcex
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX1CrjYkJPg9x/
 7WPTWWGksOOAqbXf8h4UJb7w249vqQYhCkJNDpyh4pbEha67SP47B8SdItXxfXF5vUgNpaA55Qf
 Cz+xePoyQ32hhSFVTZsB5k1Hw0EAacU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX+FbeSjvhAAY/
 e+TjAtKiJPUaTHYwVeQAZ5pECjOn9EmdKtcZhKKE99eez3E7EqDlXlyhaF7/mgbTnVsgXSWDG9V
 ZXkWGREu7rz6rVpwD1M6e2l+WUHOCXe4PzqAYzrH0rD0npHSjZHOa87/Xfq5Z/psuKAZMBYU7w/
 bTWh4V/5OENCdXLtszIRh4YihKqS/wC8iRUHS0N/7tx33kO3mM2Nn3ydRjrn1WTqfBdFu06sa05
 L8Ic4dWeQnrfEbBwejGdG8H/rkb8UTqjEkd7LvKUdoeTrwTfLXA88llhRzcREDDw17ePIFSzWt8
 CVy4auqW+ySqmOYNZk0GS9nnmk1cUhpS5Das8s7wTdp+/kDGGah9D9EIAC7xLqM0lQ/bc5sSkEA
 BdHAvTmQ2jGce0tnmEW/uUyA0Y/LrmRcZUBWVOxSWeK4W+CeVmMam+/65iPU0K7R7qGmMlxTdXg
 IGl1mVSbSnOwLt2wdJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100045


On Thu, 05 Nov 2026 11:52:58 +0800, Peng Fan (OSS) wrote:
> Per i.MX8ULP/93/95 and etc reference mannual, there is only one
> clock for a GPIO controller, so drop the 2nd 'port' clock.
> And for i.MX8ULP, the 'port' clock is for digital filter for iomuxc
> PAD, not for gpio controller. If we need to support digital filter,
> we need to add the support in pinctrl driver.
> 
> With binding fixed, to avoid dt-schema failure, correct gpio node for
> i.MX8ULP/93/95/94/952.
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: gpio: vf610: fix clock requirements per SoC
        https://git.kernel.org/brgl/c/cebd1c0961d802092bdb68c591d4007b1b662296
[02/11] gpio: vf610: simplify with irq_set_irq_wake()
        https://git.kernel.org/brgl/c/4d49c80223fea433266e5b84464211c6acd86347
[03/11] gpio: vf610: use devm_clk_get_optional_enabled() for clock handling
        https://git.kernel.org/brgl/c/00e3c475fefd0eceb7e1e01305ae3587e654bd94
[04/11] gpio: vf610: drop unneeded header
        https://git.kernel.org/brgl/c/78b100b8a3d2119b141041ddb3fd358190c988b8
[05/11] gpio: vf610: drop unnecessary wrappers
        https://git.kernel.org/brgl/c/0cd60ba4dd958f343cea5970f237c80d589f4cd0
[06/11] MAINTAINERS: Add VF610 GPIO driver support
        https://git.kernel.org/brgl/c/c8c2a017ea2e656c3e85cf39bd2bfcb2f460695b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
