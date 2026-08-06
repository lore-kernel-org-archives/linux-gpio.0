Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A323B3876A7
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 06:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999484; cv=none; b=SSzuJISoo8QXJ19QcBWoTsv5OgqUEnIq6bsrFA5s0v2rGLnOug+gqtnwsA7tbSF7NhpSMx0wTfYPofGqMGCHsBHsYdjm8zQucFBBbJB9UDE/KqoUfBkkhsdRlpB+WhLdRxHADgzEszjAtIjDw5YP3yFr8dA/2cDZLfJrKFuI7aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999484; c=relaxed/simple;
	bh=pciF0FpnPJhmI9WDwgIDTiJjoE5sgXT4MtZ+FqfZjc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9Lw8h+VTwakIwzOuOmOu06EGEvaOSDwYk5GCvR298TJSkzuteGAYWFTS+3BbIr8Uq32WTQoJpHq3VS/fm+uEARX1BsEvOTbTtoB6iYoQAsO/mEVUmxGSM9BPvUzU1IYQGH1xlcOvCPwiDXoq4mPFbHoecU3MrhjEzb80TeYCRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEVhij0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDc03rvQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEVhij0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDc03rvQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wiUt1070733
	for <linux-gpio@vger.kernel.org>; Thu, 6 Aug 2026 06:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6mBGbXoODti3mf86ZaLpTnIjEBpZlKFAJOjn8DUdqg=; b=IEVhij0v8r5dJ7da
	KhFr1pYFLU65RdVNfYSvyT2Zg3KNP4N1tKwAzxrqg/TpkGp2Gy+vkIqhyeoYCEx2
	wZSOBSNCZU9lGKQaRqMPbqdFIzhcq44vghOH9hzAUhBeCJbu787TePBA0z+N7yNM
	vMlT5FUKEWl2PtXVerHpP1UDaXPhuEVWzSaeVQOeLFiwZ5qLL9gGaOwy1lZU+9eo
	O1cOQmrU9WdoPt4mJu3ivCLL3N9YdXI8RBx3XT/GL4TqyuGZxdOt8mII988szZ0h
	I34GVIn8wl4yEFxz6b2ATLQx8dyFDOH/ImOCy6hoOzh/ih3AkpqpGLyM5VHyUvv1
	/Dg5tw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjucgn8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2026 06:58:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f39a46efd9so5170296d6.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Aug 2026 23:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785999481; x=1786604281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6mBGbXoODti3mf86ZaLpTnIjEBpZlKFAJOjn8DUdqg=;
        b=JDc03rvQFtP/FJVEuKXtBY63cn9Dis5QzRj0DpQqnbio0EMQ5T0vFm60rh0ZPqGEyD
         +ZvVJqfV2zZ2v/M0OQfIupQIxJIBLW2+OLCUviMDO1XmXf95aEWy0HIUHySIE1hOVlhn
         9jy7/H89OVTlztsSlTl2HXgI7WzEbV/0ynFSK89ZSKbgswokjGTyFO3ugIBCv82Mst5Z
         3r4reA7+2bVvctU3vjM02GpdGBLuzxxYBVK6IUms2XE4jkpE+yLdFQBewm7M/sZ8+0v9
         ozz/uQ5lH1l34E0EYN1fDDoPhETkytYWpvGi03FXIe/lXh1Z5BJOPp4c0bA+C2rPP8De
         i+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999481; x=1786604281;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6mBGbXoODti3mf86ZaLpTnIjEBpZlKFAJOjn8DUdqg=;
        b=S/P4a5OVHlJG66JFwBSAv7NqT0k5yZAW8Qtv2RDUcRRdU1FlVIWMeJa0CVhBgmv0TF
         0WV3MTZi0TfEjoFwbpSa5Jvu8jScmeeo9l2Ndv/3dyUnuz4soFWgQovKSRoSagA2w0ew
         J7kFuP6v7yynHs9ytsJTmqJ9CpWISAMYBnOOgVIB8u4Rmg43iU7aIpr1Wod18e7PYcgJ
         vG2niVBHQffj49TX7pwnqOIAPlk0DO5pPK6nTnNpi3UX+5bJIoWFcdxFGthd1Lb5oQFD
         YnoBWoW0/AWV2ZhoOLm5yYsKg3I4Fk6vM1WvsjzIhmdzdW2cncfP1S7zqONAHHy5rj25
         nwtQ==
X-Gm-Message-State: AOJu0YxcdKy1iKl2wMXUGEEMX902G25pvCV/In5yghsh/qf8oacRnu7n
	c8g6r9LmddcIRZQOnij6Fp00mLnwJcjQllhijlq7GtZhiuH5U0lHumBJXac63LieEREOeAslKXP
	PiS9SQ2h+by9L2D5EfZHvMkYAAGVH9Cojb21W9MLUtF4sZtH3F3BVZL6u6CyfbP9A
X-Gm-Gg: AR+sD12rUVC/zOT49XYf6qdBRlO7hYdTR1yK1YZ4mjB0nDROHuSnpWXcl+5dzNjIBlx
	Xu8gnLltOITzdG7qcHCp3jYLZoKV8OB37eJBlTjLCgeItqvmI2MzPj0gcnpFjDLsv5gBMldRspi
	Lup+9HSnAuivOff68Sh1sWKoKQlAE8Dd+ZbUeJ3TWsYH9/iRtJJPTgQ+/VHfXOOnXeKiLCVZUZN
	NmlEOcEdJrYZHiUvI5+2ZzgYiik8Qsa6kaDNsw6/6W9TBEDAoGBQ6PCt+lThnBPE4El3OmDYCh9
	HWYStMg2AhxRoDkdYtUGkkMLFOdT5Ak+Milop5buCKsbw2I7B4lZ5zxoUs6N0dm5TZ65jwdJQ/v
	PKx4GC7PbGJwfjCwZNK1gnhtOcjaVcw==
X-Received: by 2002:a05:622a:4cc6:b0:51b:f992:9e18 with SMTP id d75a77b69052e-52cfaedbcb5mr49249941cf.2.1785999480924;
        Wed, 05 Aug 2026 23:58:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc6:b0:51b:f992:9e18 with SMTP id d75a77b69052e-52cfaedbcb5mr49249611cf.2.1785999480420;
        Wed, 05 Aug 2026 23:58:00 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a7258sm3667089f8f.3.2026.08.05.23.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 23:57:59 -0700 (PDT)
Message-ID: <b1a713c5-9402-4dea-8263-f1bbb3cf90fd@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 08:57:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: gpio: cdns: keep AX3000 compatible in enum
To: Swark Yang <syang@axiado.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jan Kotas <jank@cadence.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260805-ax3005-gpio-keep-enum-follow-up-v1-1-9155fc19b631@axiado.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805-ax3005-gpio-keep-enum-follow-up-v1-1-9155fc19b631@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX97ndks4Gtghr
 tdM407LDEKH4/E+s6xNYCSi7SyxTwubzuiFrWdOxg/Y8yrv3I9Pq2auO02UWpKSDOPWupi3RtcR
 Ya1O/g8A+oSp/D18ah8O1KLlxWQbh5E=
X-Proofpoint-GUID: FOSnuHORt2kf88Ab7Bv4FT5vx2TfvjMI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX7SnZv+QyuFia
 4ytGzwtyFNIS51X/CJP1zG4NLUlikEH4x95yAs544LTNfADBGMm9hT1rNk2c11WxItDXPEKJ6I1
 2W1Q7Ucxn1JlsMHbttfQOuEyB8iW1DiHL6BfjSsRy9fnxBjl/d5RPCT/GNc9EW3r8VeUS7OV0tT
 ATGR5dO6qp5puYTPUUvomNOzj84WebZkYdHvoGnh/ANhdxHCUXa2o5j+6Jbs6kfRgu6TsdKZDHU
 WTQvFZDzDnPgNob9po/V4pUHsC2ejIMWpz3P6zKFFDtGsppwnhK8ANkee40jtQgZuQNTlO4NG4j
 JFXg18TM0kXqCZWp1C4PZrJ49nO1btXbBpBMBZN5Aln/VL12e5CNqLICMzhwlRDDOMeavTU43qa
 QekI/hUKPi20tgQt9WZMPJ7RI2AkKL5vtOkj8ejQCx34rz0VOsnF+UQlLadDuCDq8U4U3BFj3gK
 GfhBuzfRVpthzNlpABA==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a743079 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Q-1bCtxDXAzAzqhOVWAA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: FOSnuHORt2kf88Ab7Bv4FT5vx2TfvjMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060052

On 06/08/2026 05:55, Swark Yang wrote:
> Commit e8a40b356688 ("dt-bindings: gpio: cdns: add Axiado AX3005
> GPIO variant") replaced the existing single-entry enum for the AX3000
> compatible with a const.
> 
> Keep the existing enum form as requested during review. This is a
> formatting-only change with no effect on schema validation.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

No, I did not suggest such patch.

I asked to make changes to YOUR patch and I replied within a few hours.

This is just churn and for sure not suggested by me as standalone commit.

Best regards,
Krzysztof
