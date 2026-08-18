Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DAE4499B1
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 09:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046917; cv=none; b=soEIVo6kGU3PxgQfEuncmkLvk2cmqqAnDOSs+1mTqEkLDhRwrXsS62b9T6HYa5B1105tq3gh2JHmqJb37iiZAReH7eVPgJRom9Q0S0u986qVibTnPcWw9pRQIqbuo8fohD9Kq9+Klg+xXdyVOvb87no09EdOoK/D19cel+/QkMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046917; c=relaxed/simple;
	bh=OMc49UYmUguEYzyKyIv2wi8A76vXj8J+ya6GNZJJ1g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/ozZV7P5cnfiGADswq4Su1a6uPgGwkDpuZIvQen8WOMjWUsx6HcN/BonjRZ6PvNfpy7zZAe8nI/dcjBFPPlnFqkxjF1GEjXr/LRrBs6XcdBjbnd5g4hRljGHvwKqkzCGmZJoU2smFeDroV7WTBcnxCafSkubUr1YSB7MTUsBws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpjmYld7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brXCOkOO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpjmYld7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brXCOkOO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BJrV547243
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 09:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6JfeiagCGXExL9jPLVYU4oyP0ixfW6Wo8aIWlrLOri0=; b=ZpjmYld7AMP9ZSy7
	xWnL1sO6gTN3wzp4BAEoeLdFKIacYJZ27ojLid9WHJLUdr5FJr+Itu/HUuLEd6DJ
	NQLKxhihJv9lYvUmmZq2F16j/GBSsEEI4mjmmkZpcVSD96H3SUsF7BckO/Z8ms4X
	lE+gG+N7wgJt27udUXq59hrdjJYD4NMuCyeMRf30S5Wiweq4DnIgCAzniup214Mf
	8LFtG1H5XFFGFebPUnyaXPHk3576+Nutgwx85hLbHwcEMAtPjvVmOY5YmbKIRUl+
	QBXFt4wWCkEn3KhqNe+Y4G3aHS/9JUHFuf7ouQyUScbjKHNP0TR1cG5MbdN90Jj7
	r7iJQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1d14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 09:55:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso99134985a.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 02:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787046911; x=1787651711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JfeiagCGXExL9jPLVYU4oyP0ixfW6Wo8aIWlrLOri0=;
        b=brXCOkOOiD8STcqBUzF6PgizfhoVAyo1zpvEPm2kPPtCccsnvZXCKqDUGmksoCZlxg
         5Hvh3tiGTIsW0IETn3QJSffBwuoHOskhqij2HrJD+YARxb5UWvKCZLLgKE466Rk0jVDK
         jWA1RXkczf7lO03lX85WqWf/Q+jwbOH6EqID22Awmfjvdrkb635PP4psNx+og9+LqP7G
         lYwRm91Ku0H+sfnk9WiWxxr5Ld97RhYbFfA1z97YoslaV0ZMaVRPPqdh96kWBhgvFAe+
         +s3yfOXHlLMPf7e+c/LERm8k1saTLbtmcp2ezCX9nPtxm1FxvX70+7sApriLZGsGzZiS
         OPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046911; x=1787651711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JfeiagCGXExL9jPLVYU4oyP0ixfW6Wo8aIWlrLOri0=;
        b=jgujWcldd7Ke0DZM9xIyYf/ZaodofSKmZZkVzygwZVyZ5sC1jm3czFHCF4WZUa2Ip5
         4f65tbbfVeGPH+qgYMIWvX2SNrNb4i8YOMzbs5ybWA6m1cpz+DhriXvGpS1Dg4AV5Kod
         W4oG0JASximMgQXnydaQBxBxsSvr9e6f6NBvUUFqN/dmwM2/N3/kWE9iyiadGuHkagr5
         aJrUTvSMr1Fnu3xBWrbA2Zht7iVgyq5N+zYbxlvavWwlTySlPa8ZXEY5yobuZv3zaQO2
         PBtNnauSWTVHHKK4BFlqbUuDEMntSsRKtxYpg2iZHqiPbiD76sQqX+9bCSquMqcyTBi+
         nAWg==
X-Forwarded-Encrypted: i=1; AHgh+RqlhhxD1m9tBzd55EZhVgXCEps540xO3olVjbJ+KyBtbLZzlzq+eizPwrFtTG8y7fuBDXphsUZaoGOF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx466v3TspKawiryuMgAgeooRjgt22K1lRcjnvT1L/L2gf1SHB5
	2lxaz4JkSj4Ap52HhEIx1pDMzjUCu3pgINASIIUbK50A7jzsz26lpj1PlxhjsSom8a5mrV6g1Y0
	yqPXcdCkMmVinzmRorS0IOCdnKwsv8eFsqkDciQcbaaYlbnji+EAvx0YvHxIaeT55
X-Gm-Gg: AR+sD11JYCZAuPK9X4NOUDa0oBYQ+Is8S2BwQYTHphiK/m27hLFi46PH9sk5DEVt459
	LyBjYcVkDvEJ0EsEDlWuXc2qHBMsq3fWzE0xcPnrhcLCPAWNRXKViT+Guk8d047fBGsWvpTvs0a
	Z9c8xgZl9Txe1rPJuo27YLg59vJB6qyRsMizbEblJGoigJrCiu+9zIddGqxrj2CcHUaHBCAtuJH
	cRJzpTXAEVpoX+B7DVqV0/pJP7XVozN+kfHwkdx992qnBba28WQbs8hD/iWvTBpjoFvh7sOrOFV
	dC24uzlJpnp5qrsQYMKUj93oXfdb1ADfrLwFbsgGpQUUUKXY+IXBkHB/AmpHd7mLxgN9AWMwzuQ
	6UT6U319Dg8uhZf0d4e9+ls2x
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr235156491cf.1.1787046911167;
        Tue, 18 Aug 2026 02:55:11 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr235156071cf.1.1787046910745;
        Tue, 18 Aug 2026 02:55:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b9f47bsm126108766b.52.2026.08.18.02.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:55:09 -0700 (PDT)
Message-ID: <23470e04-eea2-413d-b055-7451fdfa65e9@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] phy: qcom-usb-hsic: do not run the sleep
 calibration clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-3-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-3-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9YXWk-Ku2DY1seQj6ZqdJb3Hbsh4TYFi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfX3PO3zeTrLkBh
 9ycvYQ4+T8v4MtQTf2/XDMe01YNfhoicYSmDbam+3OV0Mdy2kVNQp9pARSOmiD7/PGTg2a+UbxP
 qmVt/oCz90uobRWnkV8euGEY7/fLyPs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfX/g2QeEO6THxQ
 Evuig4Bk8rhj109Mu3hq2PoYrLFNeskHyoyfxklQj+1cel3hl9LP6okBNT9I5XaIcg7NFPdtGnG
 mHPhg+qSP/BOOjLevsv5K7P01inm35G+wjXMEgGrNVsjVBoGHhqxc0uSF6bH1kqL9nMRmJ+vo/h
 NGfAUn914hhsympNQznAct6ypAM8gkK9FEiJGVIj4aVTTnW4mqXBSZciq4KgnKi6D+zR2gloQPx
 8sqU93NwWDnn/zFtyE6EIC7ME7cO72GOZs3ZqMBznyGo4fbj7h6ffxXaB0tGFZC1RvVVt0hTwgu
 IR55nr1O/G0+uOtSK4kQpdFJkAlessRGknGOuK7jCqQhDc4kT1o0vh2Iw/BLzQDNflXyirEVQPC
 4oMqHMQUYLW7mS443xUs5Ppt7KAysB2ll5xfVV944ymDTLIYK9ccZm1fo3PQQFO9qxcIRiqU49p
 pEDavET+EEuB2d1a/LQ==
X-Proofpoint-ORIG-GUID: 9YXWk-Ku2DY1seQj6ZqdJb3Hbsh4TYFi
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a842bff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-c7pCBK0zC3Ie-k0gBAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180072

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> With the cal_sleep (32 kHz IO calibration sleep) clock running, the
> HSIC PHY engages its sleep calibration: the strobe/data pad
> calibration converges to different values than with the active
> calibration alone, HSIC_CFG reports the sleep calibration state, and
> the port no longer detects a device connect - an onboard HSIC hub
> signalling its attach after reset is never seen (observed on the
> APQ8074 Dragonboard against its USB4604 hub, by comparing the ULPI
> register state against the vendor kernel, which never enables this
> clock: with cal_sleep enabled ULPI HSIC_CFG reads 0xab and the pad
> registers 0x0f/0x0d, without it 0xa9 and 0x10/0x10, matching the
> working vendor configuration).
> 
> Stop requesting and enabling the cal_sleep clock.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

it seems to be used by the slightly different xhci-hsic driver for 8084 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
