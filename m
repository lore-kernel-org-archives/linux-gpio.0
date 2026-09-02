Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517EB3EC810
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338653; cv=none; b=MGmUha40oEIRkWveLKBneJ0osAqscmbt265AisfmWvhfmXzY+/59nlS8G4oBOhsNtlFgvrtVxD58UtBQejw0kqS41PlEgOqxHwSKncs2sqwSvCNtUWiHhliKbrYK26uNKIbrRugtsqJY9WhtoZn0q5UvShMh9Qrad62/sNBuE+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338653; c=relaxed/simple;
	bh=GstLgIHtvyFTm90ArYuPevwty0lzfMMUujZRrcj/Sfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLQs7sZ7C+UAGFNr+U0tqKcBcjtkV4prOv7Lt8sS44kjmzBur+DMBHf6tBWkz30PoQA6123V/ujYs2tSv/fHY3iwTuXueqx+K4kQnBoCV2jQgK2bD4IREibFWqmbv2KV6GCcVBazI5JQuMhOXAvu7douDfeGYpl2pCr0N/sg2nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0JcRGmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kTaSIkJr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0JcRGmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kTaSIkJr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VZWg143107
	for <linux-gpio@vger.kernel.org>; Wed, 2 Sep 2026 08:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=; b=h0JcRGmOW3yXBfJ3
	Jwg/N1/SmEx2X+CMj+1kJeGOLtnZ0m3Hzy7ubZpgM3LSK5QO8HNKhvVDxFOTFL+n
	cdKpYpumJFH8c12HE2yzjcbcsPSkXkpYoHbCx6wqEzWdGOad2n3eYt/By4kq8tsm
	qXgWaWidssOkHkYai8YrCFKBDW3Lnrmj8tiwsYd5vzPPMq+xZuMBQUsNZtiGvdpa
	mwVGB9FXu2w5aUUaxzAuIKl6Ssexe97sB8v3UzobuhuBSunsQ87miV0XuqtsCw7s
	uSXJ0Se2Xbu5nXqkmc31W5BnQ793GX4bG38y+9NTNTkNPD0zie7MiSPiUNCfr8XH
	TjG6ng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397b1g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 08:44:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso2117901cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788338649; x=1788943449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=;
        b=kTaSIkJr3ag2BFJXWbIGWW8PKBlr0pEtwCgT7Ck7xdCHYr9CFZ8HtFTunjKWPo/NOX
         NkbzUIytFNBQUmvVYiLU3SjxNTRgGJQk4lqi3Udw7i5s0yY1FlxX2s1NvjAcM8UZ+1sH
         QnatP2oA75M3c/j4PBi627CElZOBevNgICavzx2LiInzIYSs37V+FiDvxmkTID9ps54g
         CaN25CBpJzfK13O6e8pUW9mM8/U0GzZn0MP542X93bbwNh7LWmYnaEqg5mGcoO7HLDZu
         wrqvnKXCLa/td2eoiKZKktXGKgainf/3eESMqztXUnJIOf6IbkkvKojYAYheil8YJc5R
         /alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338649; x=1788943449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=;
        b=EuEGtXHzCmkizd5ZMO7AXpPp38wgRzOGiAupl/oOiwyAurvFcukxEU7ZdKLDSibjtz
         ZlS/m6BU26y23/R8YoR01Vr03E7cueknyaiuH3M/Q1FE8QRKVT43i9bynHtzV1HneMUy
         8XX+XSlzleE75tyFl5Zw3c60eFe/2IAc1MWhmBEeagcI3inr7gITRU8oFyEtrfcPw/Aj
         6D6IeqC6cUtOnco9vkei3SWvWQ9XrSPamqdHHDDFRK27Y9Ym3AnY68falyDWp8qsrDO7
         lwdIYSd/3hhJRhl+RFALo4OlJG7viMmuPnnN+JVjmS4alsm+88fXWSNQxS+4LEgIxcQy
         Hb8g==
X-Forwarded-Encrypted: i=1; AHgh+Robcsn4ZXEYlLpHOOhXNismgF5OB0WSov4Wt2XO3iQ5LWa/SedowWXTFNjj43V+svtyjfefrWMnLWtN@vger.kernel.org
X-Gm-Message-State: AFuF++m2l4b8vcnSwLo/zbZIWjAYumjivXwfKeRAZOrtRxFSrEmdY/ff
	C+loGOXkq75ZdjU9GEFPzy2f+R+U6Q5vXEWyMjvwHLfPpjOQ/O6tz7sRgvEUQHCuasym+vcuvWU
	FE47Npg0bIhHEb11CaW0JmzCx5doPnbW9kBceeTv/uTteVjzrjbkzGN4svXP8FJRv
X-Gm-Gg: AR+sD13jVzMy9fC2H5TuR8BpcaIc/fKCjatXXjrZpjYRZYyybB2y6NOg1wfrW8bHVbg
	ubAISiT8w+l+jRtbLc19skVW3t6Nq2gUZIKayYoccreLm45Ay0lpdOndx3vaRAVGGvnwcspvWLX
	wW5GvUY6+KJqFhrUilzNHZ3bTVry0JehPQ4jUAC2Q+8Ulf95Xi5YtlYbAXWhwFlv0BnjibDzchz
	wqAaQv8wL4vJZOqLm/3I1LCFx7W0BkCOQoN16DM1MC3NpIERuDsebvbwfr+xqZDeBfxUa3C3ry9
	ebPnwxF1epyYBbRG+QavMvkvRUf+aVxxN1WuSDLo6xwzgTsOwHbMletKbXBqsAES/WA30fHWzfI
	/FLYutS52YS+5kL2r79kukg==
X-Received: by 2002:a05:622a:115:b0:52d:9a83:419d with SMTP id d75a77b69052e-53036992976mr22278041cf.0.1788338648861;
        Wed, 02 Sep 2026 01:44:08 -0700 (PDT)
X-Received: by 2002:a05:622a:115:b0:52d:9a83:419d with SMTP id d75a77b69052e-53036992976mr22276031cf.0.1788338643648;
        Wed, 02 Sep 2026 01:44:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895e14sm673780a12.3.2026.09.02.01.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:44:02 -0700 (PDT)
Message-ID: <8c2eaba0-c1bd-4db0-bbc8-5ae3b3d9a13c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:43:56 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: of: Avoid config reads for disabled bridge nodes
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
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
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
 <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfX0j51e+7H2o3O
 IBKEfWLdr1tKCARtwrTqM2vodojWNEf68FliQLATrNlb+paVdTTpbLikuTJjeI03DNO6hDbEUf7
 8ekbU/BGSlt5MtCatXYj4Tv24+bjFEyRz+RwJZp+KIEtEOEfasQ4x4EmzwUzKyduwCGpPAVyRV5
 gLsM5K3VBzZtaFjM42gRiQezNXnD2GKLDjGWgBr30zNhNAYqimIebnpF4VroMTsJsxLa0+zXSDz
 G0QghNX0/CvJM5H8Xp62j37/6rSsfz4LC5ZgZP7t/ZE/75cfvx+7E8UsfL/Tv8SRu425fZnYLgZ
 djMGf7K0JhEHfSUzV8DCAmh9cmd6OYb06ZMobdQGBQmsbV10E71ueyFjIcL9ttquBmHVF1WqSrh
 tiEWaICjQ9LqG17FzW2EMTfzKAnKH0DrkCtbX/DenkjKlXY0Jnm0CdXOWZVmo1KKNYhK1xSd+qJ
 16b0wXiUXCi7swAobCA==
X-Proofpoint-GUID: pQ76Awe8jW8JS-Advp-5g2blIwORm1Ig
X-Proofpoint-ORIG-GUID: pQ76Awe8jW8JS-Advp-5g2blIwORm1Ig
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97e1d9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=i7MDaAbus5dcvw8aKywA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfX8GThUxZjpD63
 S1dJ9n8KZhcSRyhRsY2MBYVzSzSDlLvQPz6+5BWpBfIp/lSHehu+EWimyxogIXukPi0Bt/U5sNe
 n5G5SooFxf+k6SgaqI8QYhwaxxEUIYM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020076

On 9/1/26 10:47 AM, Xilin Wu wrote:
> The TC9563 PCI power-control driver powers off external downstream ports
> whose device tree nodes have status = "disabled".
> 
> On the Radxa Dragon Q8B, reading the Vendor ID from one of these
> powered-off port functions during PCI enumeration raises an Arm SError
> instead of returning an all-ones PCI error response. This prevents the
> board from completing boot.

I agree with the premise of the patch, but I'd like to understand why
that happens - do you have any details?

Konrad
