Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702547;
	b=s6PHN4hv8mjc1IB4RYsORZIGiyE7el0AZvdfffiB84TK+BYen1Y1M3WQ6m4kqraZFjBw
	 lJXLRT41hRs1iRkHW+ea3eqFFKKBr1ZSpTaIIIp+uFzSiHGrXpUQLwmS0d66IU+oCWhhR
	 ZLwPKO0MSKi2FWMgiQOd+6EF2UVS8oLJgHMeKV5GQMduNLmZel+Egv180JT+dflgMCFUZ
	 FOVf+1x3UbMwIcWgUzQZsMURCi8jdNi4PRmhGEsXwwnDAjRNu9LpdscLY90nZ171KALUW
	 mnfkWDc/Z3i5t3F387TCoxAvrCQIDvol6IgtydSPagkAkKAHBFWLvpo92nk1NVAcD2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=;
	b=lfuK8s9b2mHYqGRp7LaLCEP9HXNi0Nldw+EzzfmlltEgjuhcR8VSDtZ2F+6/oibNQ19E
	 m4rD0EIHBegVVzYAmI4pF7PWGcuaxV5NjUBUQCFgX1G3Gvj9VwfnF3yzBsYTgqXXHVeSW
	 E8lGFv+dT0HG6Us/o3dewQCyvttS6VeWgf44RZpCJBVOI4vCDCVJLDWLcZH+8KTF6ELx8
	 VD+2M0NtjWSjoqISs0KiGMHNd0TymgHNvj+MI5FIUQTdsEP6h0Pwi4QAIKNILx+rT4SAp
	 NXsXYTVMFWEWL/m0sNtcV2xNqRrO22yz2ZUvISvARahGCSXiNCAuXN0hE/i8b8QH2wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vt1B19sW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2zcEPJ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEDC606A337
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABEDC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vt1B19sW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2zcEPJ6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVRJi1497069
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=; b=Vt1B19sWIBBA4mMW
	vnVJHGWXmelLmC7j9BsDV0rHCG1XZiAo9Mjc8NNfGKQRkudTdyJaFO6fQEW5Kq/p
	UFigf+BLWjKt87EiEaq8w05xNwSUUKucQ2jBzkU8CtxyRb7GzUk0Df4blpTzWoKk
	iXwfaRxxE6jIng6Ii+ZLk1pGMzXdC9qhRN7nbgAhexaDMTRT1ydU70V+aAjxEcJu
	LXSOiQ5MS5xLN2D3xMBelA4kdTXDaQK2y/hCB26gmUW9WokQivphwXqJMXr0cui3
	gheHH4YotDyfMyuEisLUnjLqqljhA6DBgdJktjmikGhgwla55DI/iLiGvLeMaf+/
	4Pu3gQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y3d03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:15:45 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67c1c64551bso10112535d50.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 06:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702545; x=1796307345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=;
        b=O2zcEPJ6jI/T0F5UgRn19bhDF3s6TlHA7Djz/OBkeevV8Otlr0m1eVKP7JrAiCGuq0
         A+pc4HqqgBTJMJzGxTTj9zMzIqx0rkroqix6beabLgspv5S3TC/elS3lkH3rVQLy5N73
         t+n8h7qu2jKNviTV703EGDe+wN4gywTLDOnxIkZ9qPfLaZhxf7Yl8WESP9ujy1DA9ikb
         vui4Qgn6JEzTUjgc7K5K7akUGygnH0I/hEBWFa7mdScDWaL4HFLm+ksU6SqcIEYrbJLd
         6IHDqd48WPiTThUMq9akn7APkKZOdcrN7tmHcBmaOVVnQkz2rRW2bKo+N7ch49tvh08E
         MmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702545; x=1796307345;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=;
        b=eIJDv4xfJEcKCOFUgzOsW5cVdP9gsF9RMPzEi3Ifpv64u8mjy86avP27tP341UGuNw
         3wzpjTVx0L5PJw2Vso0csRNZCvB88DPREF6KkE2MnTdXF4gkSUvaCy6Yj2vURzhoowBm
         kmV2jo8qzWv+XKaUQUKJNTRari4uXWu2iKQ5W5rH9xPmkZfAzgPIBxy/BNNh57eubf9Q
         gDG7yd0OtuOLvSgP0HWi9yrl9HlryvRjO4m3zH+EPHP8dGzyCxyDnf9rxHnCKAqbf7tc
         rWvc0XXRhus35CWyrxYiU0ZEl2sVhGVlSXyva34V3LuhrV7ViAdQ3U0LpglILjOf/mvH
         ogBg==
X-Forwarded-Encrypted: i=1; AL+hErG/uzYQQjwJsHHglpcNsR/F+9mpEv2vAny0AruDxfEZvRWDTfOwU5Vxvll8WVgag5C6vDDx6I0FUAYr@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wy3aMfxAopbGFCmx1glJbLwZkrAGYRK3vlajB5NbpPh7BeiWh
	B/GBRL1TeDnALDh9spj8PgrBiN27XrhLRZHMoj4G7DWPGds/r3en7PP5R9YudTqVWkAMFSjidNa
	URr6lTM2+P3os+RNv1eScYzEgN629zyAOucU/GzpyPtPbxTRQKYKnsYQAPQX2o1fQ
X-Gm-Gg: AZFdTZc3E32EDvS1SubIlHpwtuJMDON0ooGb+g8WlSJLBGShUm28b5ut3WCjJB/ol27
	CkcEoKZgBLxU2yUaAKdSphVk742QKDRYFJ8mZSEzpBUWplIcx9DA/l0emCrrbfHaTeEOKxgFEh6
	SqNCoLLnK1GcDelKWwbfZQ0d8XeoO8a1Q8xCpd/j5UsH7EBK5H+nHwfpBXbTMydML2gOEYqgAiN
	AGKJZsDGXsPQ4GM2YgHYoZO0XPHx8RFoDKWgMRq8dQMiUC7hj/Yb57698jHnO4S8+Txgs2KlQzS
	eeZRMwAgnImNx5FZqUyMMpGNm86PM488tnbI0SRV/jFrTKJYrZf8nQFg+arWzr8h5jbHe3B5Qcm
	aNklonY6/BIP8YMBbfvDe0x8TB7N54UdEHULMYd6+dXT9DIwngWKKINoYcqVvI8R3Dei3VSzvaR
	ypiewOUIoNVdFF5j4ZfMu/YzmIRomvo3mAkFNT9P5ZeDOuv+WDwZN3gJWZUvSDLA==
X-Received: by 2002:a05:690e:4004:b0:67d:bedd:494e with SMTP id 956f58d0204a3-67df40be117mr12076963d50.0.1795702544965;
        Thu, 26 Nov 2026 06:15:44 -0800 (PST)
X-Received: by 2002:a05:690e:4004:b0:67d:bedd:494e with SMTP id 956f58d0204a3-67df40be117mr12076951d50.0.1795702544570;
        Thu, 26 Nov 2026 06:15:44 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39706018f8f.30.2026.11.26.06.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:15:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Vinod Koul <vkoul@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
        Stefan Wahren <wahrenst@gmx.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vincent Mailhol <mailhol@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-can@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH V2 0/6] ARM: mxs: add EVAchargeSE board support
Date: Thu, 26 Nov 2026 15:15:41 +0100
Message-ID: <179570253918.23340.11898101233717977206.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112130506.12823-1-wahrenst@gmx.net>
References: <20261112130506.12823-1-wahrenst@gmx.net>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX2Qw+rnOm6JpC
 Py2rJcjUb6vfaOKss8OZq+QB6Wya1KV+75BD+NoZ7NTM/hq2oG5ifkqwTdlvDDvQDFQin/6RlPQ
 tttalcH7PazCEaOg/Fe1oVj5jOHBTMdx7EqZvZlMviIwDJpPkVYDTag2Iz/lmaYmTa6sTHdCP8/
 g9hyfkDZ/AIjJnnMcwh0JkmCOtyQlm2LW1iYLom5nT3J4pr+PXtW7LkJslnyA6OuwRMXUwPJPdO
 0J7FYXFI/HUwDCRhfbb+GN35jH8RF3wvZIv4RXURJy0RKCY2GTGOpiejgyhIfvQIriRrm0CoNTN
 2gPbcBmJb+mb2AbEyxPiHIo4ZR54m7DR65nuS2uhCsL+wSd/3aQlhonox/Z486fbrXF4Hficwpc
 +j1CLa9rrGI8tMAhG0LFkWHujMIM5zXLLN/nGj3og9UksY6OS1GZzuSBSlS5Fwd/Q8ZM435Paq0
 DVpGDQZnd53+oWna9bQ==
X-Proofpoint-GUID: IQwBiJZZ2Rc4thQbLCA-0DEj0NxsmSCl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfXzIwtV5SZ4air
 Lvji6gTVCFRTy6jAz3ydtpcTJVclIXG07f83QDXMmmZ3n6+/4g6tXM6aPno4I17zzx7ubffifrL
 X/MJQCcQCcn6b0cvaQxv+WMyV6KmAa4=
X-Proofpoint-ORIG-GUID: IQwBiJZZ2Rc4thQbLCA-0DEj0NxsmSCl
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b083f11 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WIf87rlHEhZ3lBRYjGYA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055


On Thu, 12 Nov 2026 14:04:59 +0100, Stefan Wahren wrote:
> This series adds support for the chargebyte EVAcharge SE, which is a
> ISO 15118 compliant controller for electric vehicle & charging stations.
> 
> Changes in V2:
> - add Krzysztof's Acked-by to Patches 1-3
> - align writing of EVAcharge SE (reported by sashiko)
> - add "dts:" to subject of Patch 5 (reported by Andrew)
> - add PHY ID of LAN8720Ai (reported by sashiko)
> - move enet_out clock to MAC node as in imx28-btt3.dtsi
> - adjust IRQ type of PHY (reported by Andrew)
> - add new patch to enable EVAcharge SE peripherals in mxs_defconfig
> 
> [...]

Applied, thanks!

[3/6] dt-bindings: gpio: mxs: Allow gpio-line-names to be set
      https://git.kernel.org/brgl/c/0a74985977e851196d69e5364f4787adb03a5fb5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
