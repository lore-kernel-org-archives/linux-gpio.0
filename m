Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF894A842B
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440353; cv=none; b=VpynnsRjtlehHbgevsWvQ3tAc+RpMEKcfsFpPdz0+JWZRifgB5d4FU9Jmz3zMM5UnOb1v+foY8rNSbed4krKpttLRzJg2copJKD+MlkAXJ4uPRaoq7VUTWgQ58dhzM76viks4clw4d0UGTVrJwkLmzAF/vCec7Qy20JZx9+sUl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440353; c=relaxed/simple;
	bh=P3oqE7kNOKYXZC77rREqImAKkNuKIUdIgCpvmUwQb1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuCDQ9/+e5L1S34XpGfcivDpHty7MsCo86igDahI8IBwa/8WsP/wuyMW4Qu112aM9XGsILtaf4cA/5VIazNjRBbpldBoAVU91ljC+zLpqT7yucFbTC1acS4EJQg7jVJP1/z4ja83Dvh2anlFOAaAk1hNNbNaMtMIrKGrEEDHThM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxhXbovA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H7AsVTSA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxhXbovA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H7AsVTSA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH5iM3720252
	for <linux-gpio@vger.kernel.org>; Thu, 3 Sep 2026 12:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jFo7UPkeR8d8/1YANdOTPXiQ
	CruD4JrYi8Y3LZR29Qw=; b=IxhXbovAJoeP5H3m0RYajdE5JWEfs3WvEaEnUkoF
	YdXvQ0EpLeeVDkI3ReNCXn0ivET/bkl4+J9hnscGfTXve6gLtjzKbnPpUyxspQIN
	YZp3cD/upBuzBLmuqp15kcuS6vqmGwryXoEy5aPZieYtiUZY8IsiZNO/n95a77MU
	gJb0HeZhVAQ9Qofd38A3wNo9fufsaTG9lGq3nNangZpJKFuIMjF5qY1TFwjgDYFp
	njN2I1nfUMijaLyrXsl7R+HOZ3sR6TVbZnhNh7/NXrHwF3Ai68k44QCcr/B4WMcI
	i9bcRtR03FOdhGy53Epwil8mgWrK/u4ft2MhKPTGKWUxdg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjt6fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 12:59:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so435880785a.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440348; x=1789045148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFo7UPkeR8d8/1YANdOTPXiQCruD4JrYi8Y3LZR29Qw=;
        b=H7AsVTSAUwUKXpMBYrRUtqIfqMtOEUXHoTolUViOEwVSbP7ndhCaFJ5PmOk1nU8F55
         GynmBk2t7omQDI+CFcvlDAmxGBzdeQMZRDU7jDbUxG0pioUp+KVHXtQijFaPBEaIyJQ6
         EpgR+yjFKIgdj+QRccYmdDXd6EzdvA5lfFwN7SwHa3t8SPkqJyFpY/OrlBFd/a2ExVyV
         KIuf8G5iFljeC2+yXc4zzY+/KzI4MNLZa2kQVTlHHnuOCxXME1zcnVi+0LwV5YpLlAHO
         1Hu7e0US4KUGTrazU0mHkdknrEEa6+23UlnWJwHg+zSmtjLFV7RafdXqRZnEvOyRJ6Hq
         HkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440348; x=1789045148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFo7UPkeR8d8/1YANdOTPXiQCruD4JrYi8Y3LZR29Qw=;
        b=niGNGCwJaEDkVIijiy8I+bAmyl68BsqAdhcNphPzVR8zV8q53j0CI4thTtAXzAGCJE
         v0TVS2oiGdqBbZZhW/BdBMsoGdJr5QdDBy23vUse1NgLYeQYdzG7U1xa3YNsAyQymYEm
         DUUz9G1+mWdLzE51z9C4SC6jSY8sDcOVtKWOVozIrELoM0K82TLggkxSYT5fMZ/2zsLw
         BvS5mDuAuF9EsVpKXBM5eJ4pb6Apkf/px+dTAVm32YlbJgUFdBomWrWKDBG+tZZzhb8o
         OCQlwxhEkYn7YwIMrsp8U7GEyjazhHgNklMqOC962/rKEKfLFtj0e7E09N8/P876Y1tV
         2AnQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/XIN4VFWfj43uM6iPZhN8pypqfJTbIOamj8K1PtpMrDWqFqyg050Z4Fe0s8HemWRH2RuurtFmE0cm@vger.kernel.org
X-Gm-Message-State: AFuF++mWfmWf8Xv6R41vdA1+r7vNloKHkgSJTAM/Q6nlzpoXkeK79Xth
	ZjnEWpWNl5BItZ6m/qFlcoU33MOHBz3OSkhyhImggDbum0gOBTnzBuoVVknoc4xQSLx78v1UEUS
	ryGb1KMsYv6B+Q334hFctqArf82E4oMnR+TYKpB3SW7Ybx/yJVRQtnoLuPbnRPVR7
X-Gm-Gg: AYBFou0KjW51XrJ6Hx/2hhGm8nGX7q1pkdCwR2SYdJQg4AcOWBRPwPuuze8mVgegi7+
	NpfpMWMKdnkXPqYxK9D5ia4EUiZ/Zk95YEvReImeHiNM+OUrCpIu5rtGBJ/ZuAKdYK7xF4Cj32O
	1BCpKYKsljueTT0ULrkIf+ejsywTGBDh57XJ97CIXF0+SLNBMHe3/QrldAUUEyN+hmPSqObREJ8
	b3g15FBV6+dPOK2mybP9GFtGN52+JaoDDs0Ig/KqxclPNTijlA3djLvk61NbOCjXitkFSzIg4cH
	ev+0Ft44iWa9pfJt5ssZJkgNfvdQcgv/KPEzhiGQ03FQ1v53GAsxYuKYsDD6h9zsmg1oKyaAbZn
	rrOdtrMPDCOkkPw==
X-Received: by 2002:a05:620a:88b:b0:915:688b:aba with SMTP id af79cd13be357-93960fa7c7cmr419289885a.35.1788440348172;
        Thu, 03 Sep 2026 05:59:08 -0700 (PDT)
X-Received: by 2002:a05:620a:88b:b0:915:688b:aba with SMTP id af79cd13be357-93960fa7c7cmr419280985a.35.1788440347334;
        Thu, 03 Sep 2026 05:59:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60bae6sm85687405e9.9.2026.09.03.05.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:59:06 -0700 (PDT)
Date: Thu, 3 Sep 2026 15:59:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Message-ID: <v6dqcdbvtindkh4mosfbwqeqxooken7aynkf4z3q4craoamywy@elg3bjn6w6zz>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
 <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
 <33t3reowiellyer7bc6ipp3n5jhchf5ozbj5imkctp7mcibkq4@w3jbhjet4w6z>
 <CAMRc=MdH4jQjO2GfAnQsvgnEnC-WJ0eBKm2tvXgyWg38TyDbXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdH4jQjO2GfAnQsvgnEnC-WJ0eBKm2tvXgyWg38TyDbXg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX9QPongX9DZ2x
 0a4MS4BcjSAfGKII2JLCR1sGKuQDZJI4Lt2vlirD2CPu7ke0eLtaxolGn0Yj8EeRlo05qGcB1Py
 rtT9VoTbsvIhOKxbS8BkVnxBG2tKgpvgQgwV19jCGC8seLlRrYunGHO+EW7HOXT0x0cPIBmb/LZ
 pM4mB4kqV9XLXJB023RB5fAFdm207KHmi1e6SvYslQZUNLXyK2dy7tjhd9sFbB6J4P3ryTtkXt3
 OxDuhmmaV6RJMI415yMQr8tBSKyj9DZbNcfTEeDJXUAZHAnRAYagbmCNcvpG0Bl7M3JfWq7exZa
 2umsNVDUSrYX43pd1038a/spqsX4kq5Dc4DVEp8c8SHCCVnqvYliDp3BEgUoOWZz4EaX1Rl5Bwu
 ZQGC3ZpiR1BqpvdnVFzlAL66XhPTbNUDCIX9hFVGc0qSKCjATl2LZYafbfWqdq3jlgny/xtowy2
 vvi89e/UX+aCqMFqZ0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXzNY+8kMgH3tb
 CgWrVccDwEYoyoj3dX3CGhNCklDC4QGkjlpotTv83oAcTSyy9A89yvevC/e4SFZZ3GVgerW5vL4
 /k3306BbAZrwLOLtcEL+KHVgDgKYEOg=
X-Proofpoint-GUID: 0cx6bxKmgyXmVEdkb3rChH7-7RSuDCNV
X-Proofpoint-ORIG-GUID: 0cx6bxKmgyXmVEdkb3rChH7-7RSuDCNV
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a996f1d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IPKyqwG9_gJUVIbFT-kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-09-03 08:44:12, Bartosz Golaszewski wrote:
> On Thu, 3 Sep 2026 13:05:28 +0200, Abel Vesa <abel.vesa@oss.qualcomm.com> said:
> > On 26-09-01 12:27:57, Lorenzo Bianconi wrote:
> >> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> >> lines.
> >> The controller is registered as an auxiliary device by the TC9563 power
> >> controller and accessed through the same i2c device.
> >> Describe the controller as a "gpio" child node of the switch and use it
> >> to control the PERST# reset lines of the two external downstream ports
> >> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> >> switching to the GPIO descriptor API for per-port resets.
> >>
> >> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> >
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >
> 
> FYI There's a v2 already on the list.

Thanks for the pointer. Will reply there.
