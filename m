Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811442;
	b=Vv7XOjft5ZKooK3+uCxk3qqZp3rSyTwV75GOqPDmCnqjFKrjwr/5K+xTNBBah9fbOHj9
	 FliW9SOtbs9Uad3OB96lGd7T8p78C2upz55pJkw53jMZ3ZyvybU+wVsUMieUgOcZzLKRZ
	 ECgGTrprvwtal6z7emY95OLdWmprz6PD1IQhUhrvv3VpWHerySKexQU5cBWQcZzo70bXK
	 772XenNBVrSkIqPiKg0BFD5w8bmn6GBK22hNT/y9E0YiM7dd8E/A94EVUzaORuqJMCxZ5
	 Dv0NQwyPdsPdnzjWNnZAATeH9Y7HyeOnPkBaQMMzaDLfwRMR7oBDn1+Fb8y7fLx1F0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811442;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
	b=ncC5VS24fYjnNy+ShK3j9yCJbninkJ6+YD6LbBXOpp0vbfAjRFOOO1/JMyfM8QG4GEpO
	 Kgg/ObAOSXbmE66m8A2EL4v+bjGAywf72safawTtxt1Ig+bcSPUMdrdNecrV3pI6CXiTr
	 XRCT6WhhLi2I6+RbowFVRoppq9yn7kcpt5DRcJF1z50uKnLHnSW8Fa1k9Jh+Q9nJRCclR
	 Kp2xK0aVeN7xJT0t/hibXHdZ9ZpGNW97/m3Vd5KmxesXXoCMQYufsPO0WEcZKXSMUtebf
	 WNnMqoD+wewyQPf00yFbTgkegebDYkjRaTXioOkGFJb20XaX96bSChB4PscV48i5MOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kNdXS4/7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JER9oDJK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B433A606A31F
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 20:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B433A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNdXS4/7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JER9oDJK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJB0EF1127773
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 20:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hphn3ZfKORUo3yr9W6IsBbo3
	W049JwCJrXs91ZHeeMA=; b=kNdXS4/7/27Bmjheg0WPfQA0MdTG89+3TYQIrMtP
	KPX1JUzQQodVcJqU8ZuOVICrLCwbfVGxY0KtiAcPltWSjhCKumY4cq0hP/d73q0k
	cAaDuMqGtkCDpD9q+2XFu3dArsBdBFA7IQPBbS8Q5N4es80BriYOYy+nF0xvpSRU
	qJct5pbmkoRU61yfmFWKyHBkw9IKirVLWipywZK7r8utenuJBSa2EG4p6jBJHIK3
	myQwJmE1hSIGngZxKB7kPMV7ZOXPSC5tRhJPSCRfWLM1oQOVwMV2iG7apDEB6TXo
	sRdUM6onL8HQN5XYj9uOEWhDjIhpFS+Nxd2P6Mqr7EzCPA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6tv65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 20:30:40 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67dc4e966b5so7924171d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 12:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795811440; cv=none;
        d=google.com; s=arc-20260327;
        b=eang/GarmeMk18+TydH6sqJtCrpPtpYeA7RrrHyhEzBk0RlnDHtIhFdO7F8sxnvWuy
         y/4B3yjqs4N6x8bDPGtN4ZQh9VNDeNaWLdboWOo+Q9DRZzFPuVcr8cyKLaicEQ+IVm8J
         j03eOsYaYx3nz7/FQQsuvoeuNSPpve9Os/qw7gdE6jjxRaDZqqdpM2X8lVL6hnjLQ3Co
         kqeoFKgBGTy9ca7rMj+uPO6oeFUThLuaJL9bofkjdHvpu3Pvj62kaqrPpo4AW8djA9XJ
         cXpmyFfadPNIt2T4Bc+7JOBRf7yWFDw1Rhg5dlmmYt+eeXy3caEaW1KHpXySX0zarbgs
         f9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        fh=DiXdmiFzeY+eTw1BdeuCaHILTZccMsbxtlLONrGVyjc=;
        b=CZs4woZFapu2+ZGHaP418A2wjH+p19VxGGx+incTWMN1s5vztVTABJMvz/a6EsqFIL
         OnRTJzmxhpzLh8uF+p77z8KyqcO7lusO4Fic5IL98TKRV6KmEN0N9dyOZ0BE1sMUHXZZ
         DigJl0Hs8wYOUbILm9rOnb5VYfENGaUdTAk5sUlF0AdZJonJRS2Rh4exmhGEpO4b+1TX
         aglF7+9RMvdNkbXbwM27FYugfIzojicH24gKCvuinOkZaeV5REfZDbBo5t58goTA7OhB
         2Qge9H5UyqOV1Iu449wt16DNLgW8O10v+OjNPS7byoXbyevKnTSefSmYagBZzgXNBpXO
         d2IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811440; x=1796416240; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        b=JER9oDJKrd+p/VOFiEVXJktXs+fCy8ZWlsGHbGQkW3otoDmAHelb2RAQd4Gj3jSxZu
         5gry8Zp2+0y9O3Y9eMz0a989TJ0UjcSZtWF9/5PJlajEhJU4GR5dLdwek3C0ioyFbOGE
         z2Yy3kbvqRKhrw4QUMt3MJcds5lq34NJP3u7LdS0v6OQzf6AdVCRQC/c2uYgIvMjGLxQ
         dBahEFwtT/IYlWRNwTHGPXhoyP52nu3xSSthJQAME/2PjiBuYT5YVUFpkKNrCMp3DTIg
         5v38iOQeYv8H20nLxQRquKDIK3JEgPlDk6iieQp0dZp5WQFa5aFkTul0UBmR3j6o3aOG
         EZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811440; x=1796416240;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        b=aXv/F2RlkjLCqw9eTSZF+z/eXNzIW0N6OjVl9MvV9dD2e7e5CI8u7b+yvQmBjZL93Q
         zLrBVrfZZmj6tNGH8NDPldh0Furf4Hsbh9sNXLnYa6bnqECeT72hbXvM8PKNO7zzR+J4
         TlJdvZMoX34u4E3shlkocmMS2QkzsPozHjY8OBJBW+OUlTXIP2ujIKWmakxpCc7TmllD
         Taq3mMd+fD9Xt+1oYLY3bDoSBTPt8Mds5/rpMrnNBoU5woDYm05NtPfSJXr6RRWSUI6a
         VB4CZMMdFgm973gTsiE86cmPXFsahMXt/NzbfbjRwYO/DVrlNFnmUZbXyd/UHrfLBUHH
         NS7g==
X-Forwarded-Encrypted: i=1; AL+hErG8dIKJ4m3KV9Fvc5GIv7UNnsRrAVX3P4WRWlsmdyK+WauIsU/H+/JS3jj92rCHt9pU6wjIQQYuDFC/@vger.kernel.org
X-Gm-Message-State: APuU4Z9zcAaXvH8KPhF9qNWdk7u7gh9DZDT+Su24+T+f/L9VnPTOC7HN
	g4NpocY3P4qkF0SdNR819S/YABMIT9CElc3gAVIDWQEP5aPYVn1kb5iMUleVI7zY5HZq/k+HNWQ
	L7koa+YwUDW/hCItit78xa26Qgxy9XQen1mFiRpixbh2p+x2MAeoGRg44xx9HIDcnti1mGnokPQ
	hGsFRhjk9HneN+ux05OTZfiiHmOk9/dTF2aKaDJME=
X-Gm-Gg: AZFdTZen4rh4ZTGdUazEjpGngRF3cLaOZbNjyv2k77qKNCFizMw511H9eJ4r+7S4BpH
	2uD4sB/7G+kHC6j0mRg7CpmEGXf/V0CG9LA+VgtzMPbi0QqO/VIH5PDYURONMG/RlsNuzWG9kr7
	PNiJlJq6hMmrJTNS70xy2LhGFttiUMzeq/IY/vXduVeQ6SN4iZI2R7lCtKj8X8l+hBSTJ4q8Xnn
	mqmlrFVr6RedJD9JA==
X-Received: by 2002:a05:690e:440d:b0:67b:ec5a:2075 with SMTP id 956f58d0204a3-67df4446b92mr7114670d50.78.1795811439912;
        Fri, 27 Nov 2026 12:30:39 -0800 (PST)
X-Received: by 2002:a05:690e:440d:b0:67b:ec5a:2075 with SMTP id
 956f58d0204a3-67df4446b92mr7114661d50.78.1795811439276; Fri, 27 Nov 2026
 12:30:39 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com> <CAPnEM6aAK8hwJ3EfhzS=gdMPTf+bhVgS-=JAoM+axcHzBQ1CGg@mail.gmail.com>
 <FE7B564926118C33+50565d89-ad83-441b-b85c-cafba0df5546@radxa.com>
In-Reply-To: <FE7B564926118C33+50565d89-ad83-441b-b85c-cafba0df5546@radxa.com>
From: Chris Obbard <chris.obbard@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 20:30:28 +0000
X-Gm-Features: Aa3M54rOA0nGZYSsdhumtFBM_XfbHqu3BlAs81Bv2P-Z0wUA71uwNq6De_uad1M
Message-ID: <CAPnEM6YXXVJ==OXinyZyGBfKS4iX=N+eMJRGZframsnfAeTtjA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: Add support for Radxa Dragon Q8B
To: sophon@radxa.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: ZRK9vuPbSTmOSXTFsIy_ZlZ2KWe_aIye
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09e870 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8 a=NEAV23lmAAAA:8
 a=05-C0eYiNmMOl18pgPwA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX9soQWIgAiY9I
 bhywfhR836zAa/QDCxJUriLK669v6yl8XV9nclV44JmqJ/9yYrXG1Vn05j/HUr8kXREjsQFEO4b
 32bENCB8F6q5vmN0n4I2kpNqKtD/WkA=
X-Proofpoint-GUID: ZRK9vuPbSTmOSXTFsIy_ZlZ2KWe_aIye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX9H0AMkMt8hKy
 d98oC836ePYM08V9RgMKvX72540pbEjKfhjuMGqG6xjQIU6VduWz8CAQ2sCWHwM2k/rChuREc9K
 BgY1HowsIyvnbo1FgRgbGKr48idJMb8FkcZ1/2qyu9H5Q1vMj47wVwoSwrTgWjqRx7TNMcTtuL0
 dAEDbVqQNnu17Yghc0GLGRyF4xwWlYxcdxxxlXfNdxxaRGiBkQfv29nJOg/YozWdbgep1DTSJxY
 qHXczHXNCZC5H+UwVZKT3VNCFDV6N9vPG/E5kox3A6CQruJp96sHJybInIicRt5fkw5Da/MUJL8
 qSd9CLWm7pUvnmsMlkPU1xoZ673Ku0TxJ6Cs+mdiDXQYeVNCUf1QU7DGy9wYs5yhE1aXiew8mJb
 UUozCOcUvxO0kvjyL7P9B+jK+xyG59aRVmxJcoDjiCAPyUb3efhyrPYvCwbMvHEwkJPm2mhBYvQ
 VtzooElprJr8pSyiwfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

Hey,

On Fri, 27 Nov 2026 at 02:43, Xilin Wu <sophon@radxa.com> wrote:
... snip ...

> Hi Chris,
>
> Thanks for testing the series.
>
> For issue 1, the Iris init failure and SMMU fault might be related to
> one or both of these patches missing from the tree you tested: HFI Gen2
> support for VPU2 4-pipe platforms [1] and the missing Iris IOMMU stream
> ID on SC8280XP [2].

The two linked patches solve the first issue!


> For issue 2, I'm not sure what's causing the hang during the password
> change.

The second issue was quickly uncovered after adding UART - it was the
SError you mentioned
in the cover locking up the device - which of course
https://lore.kernel.org/linux-arm-msm/20261127-pci-of-disabled-bridges-v1-0-3bedcbe51cda@radxa.com/
fixes.


> For reference, this is the Linux 7.3.x branch we're planning to use in
> production [3]. It still carries quite a few patches that aren't in
> mainline yet, both for stability and to fill in missing functionality.
> It may be useful to compare it with your for-next build.


Thanks for the quick advice - you'll see some T-b tags shortly !



Cheers!


Chris

>
> [1]
> https://lore.kernel.org/r/20260915-sc8280xp-hfi-gen2-v2-1-c52075bc284a@radxa.com
> [2]
> https://lore.kernel.org/r/20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com
> [3] https://github.com/strongtz/linux-radxa-qcom/tree/linux-7.3.6
>
> --
> Best regards,
> Xilin Wu <sophon@radxa.com>
