Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CD8414A1F
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 11:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200224; cv=none; b=onN56uKLEmOY0dk/i0RO7QaxcpTbjoeSnV36hxBoivA8KHdwwW3E76Ians2RDY7cdpGy62/qEUdbeyOsiv7G7f8f2eETN2kLzChnNHSxSnrGbIksogOeAweNMdNZhr9hGB4v0AX8YcPzppHsM7KM3ByyvJ9nRdi0o57StFu8MY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200224; c=relaxed/simple;
	bh=VS1DNOy/Cl2K7mK9aAa4L7mA+BxMKG5ZGucF/etqAkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBW1gIGTzv1tHFNs4s/Fpzuuf0u0XS0udxD+KlG3oeFaVHcitErut4dnskzpC27MQOcmqrNniopi1guKv3K6ihi6fdWvlNOAmmKTNfiwFrDsmvg8+7ys3UNAhPDARYircRXtibIu4J2CC11aYY4gjnmFFSp5SMQl2CwI2q22AhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZX5DEri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4r1Bv+p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZX5DEri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4r1Bv+p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rHla2259598
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 11:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	But9yWYuJfwQsmOxUxGCBVIj5+3+kBHnnxzj50vS3uI=; b=SZX5DEriBSO+MYXQ
	ObhImhp2Whq4JtoOngZT2eY0pYpnNBIk9kG/iNBboAC72LlgEqrIj2+KMDXUv8Wb
	49MFytd9A4W/r9N4YrBcvlaUYcblGexYPn9EeYbo00A8f/U4/6raO94Hp2udOo9B
	nU+n7sDODoWypDG9aZLJBbLHHzrul9nsl64qyWHH0/BWoqOC6PMKxmp1o/T02SWO
	KinslBcBBSljYIEgrk0J4xZOq9puFyqvN9XvL0Do2FvGxT075qZgJiMt7iZV1NEm
	d4i/WafzUfJlv45gC+AIVigI8TGaFtzMy2/j4MTvTmfMVxQoG2iujC4ZT1StIy3B
	3OJJgw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv0f85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 11:10:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84870e7f498so7442837b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 04:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784200217; x=1784805017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=But9yWYuJfwQsmOxUxGCBVIj5+3+kBHnnxzj50vS3uI=;
        b=b4r1Bv+pIUFcfdU8u97m6Fc6THbN0VwqwXMjjHJ0U9/C4MT5bIDaLRHOMo4q+nVQmu
         QuGQ90jFn9TZ8v9Fe2WoB/DFp79gOZ+QVAUGOt41StEaxNtv/0v3dd1cdtI6RTzPMoIK
         aPuyzAD9u0i+gV3jD0R0zwxKsezHHIEV3FR/z+NKcwV2h3pAlawgWkaAO649GJwwKAcL
         2QC9yUKEmmHPFaAqLtNASmnFSzpM+CEwTfTfIpgYJ/REntjlWH+7NWs2lDpE/Sb8f2tm
         YV69soYhQiIAnvUIskkMK7s41BMup7xiwgPT6/6MCOtfjktF/uqddLho5DqlzQlM02Sg
         RRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784200217; x=1784805017;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=But9yWYuJfwQsmOxUxGCBVIj5+3+kBHnnxzj50vS3uI=;
        b=jVIKZ0I8r/6I2bLjNlsTLx0atdCjZzMIC2ybBTBjfB/wMizsti3mORKmt8s/3/Y/g+
         zTRjNqRMHZ8pvYXaCJzpSzWLrPsDW02o5WjXSdREd/7Gn97FSqCpg1oBfCJRUTZAFr0H
         G8ydJY2a5N9G/GmtkGIA+HQfyYdVBifhS0gyorZcRjhBjzYmBrC48lRuHdtTAlePJbHt
         Us/wAIF+2IAjMP/ttpZdBdTwsAXIXo3lB/okRVvi4p7UOfwYl9jEiGBb42/EMpOXZ4gL
         G4PhSDHhuhzBvnFdiX0mF3NQj5fFEdQwDKMJatyD2SSWJWIO9q1zsoE+KXCuZpavWL/8
         gASQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHBHGag3zxNr/sByJVmKNjM204kWSPgrXCO1EU5jUSzoZNtLRub1oi9ZYK2kbG4Czx2hbktzm3AJ/q@vger.kernel.org
X-Gm-Message-State: AOJu0YyzB+WWTqD/gKKE46Iks8vuob0v9ZyfvfBDyzP5DgpoOCgIVD9Q
	TIt9em/s3CLPo98+k52DTxANVxevXc21koA5+LJDYISd52YzAdDskhyuavfkFk+aeCcfIKP2LEE
	gnbSqNGlU4/jEkoCLJ0vl9L1yMdQl+k/D5LggX/M5Ag7psZsdJYKUPBvGnAYqOjHW
X-Gm-Gg: AfdE7cnVp7V+g0hyhpIVyAK/nezE1xtc/2WIQK+Bs1kBII/ruAgbmHnVyjxuPaPz7PG
	wQkgiMEunU6P8SAVEK9JwbixFVPiuEu4tZL9U1bmLlq4cz1SQ/7gvFOQss87t+uZKW9RTsXiwEx
	SsMtsb052yIHNLshdnXnkWiOrJa8dfUNNnt2a8wKaLGimHsOilReOdnHbAZgD4wWEu8hgMMpHxh
	9vqdwCA5iiVl/j6T40EFWoV5FRycAYVlIXlEM7JhbesyLNUe2JoybSZREfRewqJBC5HhwnUqQgJ
	k2FVWuFyd/Q7pSb5qIGotBSp+04z5fH5aoBKloQ8FF8Y3zujdDNrWR12ahz+hGjnVEWNyj4rZ/p
	1FnRhVRejKbBIEpdr8RCb1cCm3lvKsVc=
X-Received: by 2002:a05:6a00:a114:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84a6726fb07mr6139597b3a.20.1784200217025;
        Thu, 16 Jul 2026 04:10:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:a114:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84a6726fb07mr6139551b3a.20.1784200216555;
        Thu, 16 Jul 2026 04:10:16 -0700 (PDT)
Received: from [10.218.6.76] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6beb97sm4643536b3a.30.2026.07.16.04.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 04:10:16 -0700 (PDT)
Message-ID: <d10e2b8a-ee88-4a92-8a95-7468c7a514d6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:40:11 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Add irq_get/set_irqchip_state() for msm
 gpio irqchip
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExNSBTYWx0ZWRfX9dUm4VbNy0qP
 +rIVnXJ6IImo8a0ZqDqKfeY+/JG8dhHLmtXAtM2QL+YthKfxWAwbqeCJxIA4MQENeUJnKl1AhPI
 tcjWkg7zDDLUfFBWqpIJHVYRJzcmfBjKPN1l3q7LmvUnjAdsVe+B28+ganDbxxRO76sjwlYIOWR
 Xp40R+5m/4WKFqlOJyboHtje2xb4UY0VbV4k1csXtSWp5A3humiZfrppo9iUj+KO3FXHs0Ko1j9
 oaflG6KrtHrCdb/KJVOly011IyA4JHSanIyQWeWlcmkh/fmvyqJdSnvzLjYjDfJD1q57F+lXLhO
 cUgA8y/olSuZjeUQuIeuDjMzYx+7700WR/DDBb6/we2HAZvGFVZhngL1dDTadqL2bsTkMD/kujA
 5aq6BQ7ePGYRIjrQ2Rwv/rrFRsEC0BdqG5wf+660NCjxzah9nqRAqFL7YF5dOaQ3HgzvvubH/b3
 HC504uVEWrlnwEFuaWQ==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58bc1a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jlfPM1XiwSsKjbdNI6QA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: _wWQS2PX-N1Xkevuruuu6O7Aob78zS-0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExNSBTYWx0ZWRfX//qmGjv5p0er
 AImFjBz6g23StrciL5bVq08mezUHDmE9SPyauLFBcOMSQ/4OOjUZ3kKR+X4vtalKBRtB6ZMomrN
 2dFbHLVkG6B6uWzDycm7A2ZpNEq2U8o=
X-Proofpoint-ORIG-GUID: _wWQS2PX-N1Xkevuruuu6O7Aob78zS-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160115



On 4/24/2026 12:01 PM, Sneh Mankad wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> MPM irqchip monitors the interrupts during SoC sleep state and after wakeup
> replays the edge interrupt by making it pending at respective irqchip by
> invoking irq_set_irqchip_state() API. The msm gpio irqchip however do not
> implement this function making it impossible to replay the gpio interrupt
> on any MPM irqchip based SoC.
> 
> Add the missing irq_get/set_irqchip_state() APIs. Implement only
> IRQCHIP_STATE_PENDING case which MPM irqchip uses.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Thanks,
Navya


