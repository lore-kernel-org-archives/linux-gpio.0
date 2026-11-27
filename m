Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768719;
	b=gE5xHYZ7bLzae8yjymZ+XcbskUp50TlDS6Q3oORg3/X4se7Xi/YosQrsLd8C4JTKNgag
	 Qci1r409nkAF+1p0KTlJzWkfLhqlc7NmB5Z/wTKqfjKB7Sx0qWn/+f8Sz6htNJ714gHL5
	 0lvkAR4KZRLLaaqhPaZ0UABaXMpl4wNS3urROqJaielNKf+NIq/xfBxHkXesgnDrRgcL/
	 FCclW3R4utUP5PnCCqcb2H0A8f4kTF4etMxC+XAD/v7t5yu8bNv3HsdpEDBv89hw01hA9
	 Z49YB0Y8KrSBYJYNfVqJnyOG9ABnHBfJBfKRUOJQbhPmgGJLAtarxtPufB6TlUu894A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
	b=rmgYutpmOdxnPA90qLOOR2BmLGh43Pi7rWZltFhhXmfWIafclCvLKMdK90G/21V73oGt
	 wCunjdhkHLaSA1sq5Bam1Gj40MmRpWJW9NVKG5tUSBWA0yghwmF/je2MPArjZvntgBoYI
	 xw+NSuMc68BAtgE2wMGEtNI4e8uSnZvtE3uaxPPPdedazuYumNmj+qfLyuqHzZ0JNDIy5
	 LXW2EBxpzRsj/D7JOqCT0jEALTTknKWEDO75WqjsV0mClxfXMXesR5j0F/FMRVfUN19vi
	 knY1YdewUMLeJQdf82bUg4T7g7CorxgVZ4iQioeSUZSk7H6olTel/Kv2izQ6La1bYtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTyPVBKF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yc0Ua7M9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF11A606A32C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF11A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTyPVBKF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yc0Ua7M9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GogO560373
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=; b=ZTyPVBKFf6tDcZS3
	j69kfanIfq0zT99v7awhutNb8AEGt7nf8GIY0VAOpuTNzh1bhCUSBQoctr8WRag/
	2G1HrQA4KC9hlaxz/OL7bABnSt4YVGXL8c9Jw6SpVjf0WXvs/AEnmyj7Ttxe3+LZ
	DQVl+svr3kkwl8pELwitzqTuVEEnUR004qH43ii4KBOhG3oFEPB7r6M1I+M3FW87
	eFDUrjnf/5wR2DXvWqmKUVt/bF2Ki1kraRRw08AEZG6FmOV5vMlMT1JQQfiePK9u
	6n+jmQEGexaqqDJLB64/b3JXWMqcy2u6Lib6wYiHdMbgRRAeqzH7x5EuBEC61M50
	4Rzdpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqk1t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:38:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55dc6fc65ebso3397101cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 00:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768717; x=1796373517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
        b=Yc0Ua7M9lQ8To9fWdrbilqI9vTQgtYb6n4IdOcdMuWFxeNtsgnFGcHu6nWCAF8u91k
         7jhTeCisP/dghy1ILzJKVhurn8NUQFBOiLpeWXe5HmOgnoc4l7r7YwXwHmH4E+6O2nD6
         QYLyEBJB4Ojo/0BeVN9SFQtHoNJghR50Hb3vertIvzXsY2TXf1rLxar5J8Gyhn6nFbv2
         McXvyuQdYQWrz5VPnE+Ql1SFG3ZZPBWArFkigitQgUai5nNHBeB+LhnxfxhcpqI3o5A6
         K/hwp38u9a52Q3pyCCKuMXXgnPm3UsIau+MAWWYvrSWkvnNRzkw+l1jgVS+sso5HPIzv
         6fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768717; x=1796373517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
        b=GFemiPPKa0PRCbc4Iz4We9pdWl4GxSMAlCCIyUX+SAD/BzpzCB3P+MrNlyPCOCJWE2
         GHvpBCXw5JZk3FyQglvPBvfJaLjtZ9dqPjTCAKlaK7LTO+2ekA3O/rKP0W/drOlDQPzu
         Puy7+ornA1D2XELf6AyARP600L9HCu70WSy5iH97hDmgfBCT5gl4jP3Koe41CoVqAuHL
         7uEizDjBMDKAZcWh7k5DWhxFeGj9hyMXnmvaje4bFbGFrHhA6wIh4TCGT7sHL76cmzMO
         eeu/3cMsT651evvXxE9Lg3DwzCq4MDQOFVVopaftzL4TIFReLypArOEBgeuu9fOyaNo4
         skww==
X-Forwarded-Encrypted: i=1; AL+hErHBVG6cQstiUZwTwFm0s2U8AV6ZgjvBJcsn65XSsYU4rexzbwS14UMqSjoUjrhXr/OYGWWzOJa2D53G@vger.kernel.org
X-Gm-Message-State: APuU4Z+urShtihZh4XRh6E89+W7GgRgH8d9ZFuGHhvMOEA4xK+KwTmb+
	DjiuoIQeGxcKPbUOnWRqwiaRDnHK+GFIMzrstU+BZiChdTpEbCaTrjh4/SjdobjSXxI6WOPtPwc
	lp6H9X+h5buS3zaOyW47QonKUh1hn2SK6nLLeyEykiwK7mSiGExbf0jDVgfE3IzrB
X-Gm-Gg: AZFdTZctphTc77UpKccAt5gXE7Jf9EDPmWljpqzicF5nIpMfBKX5Kp5I4b1Uj6IW7Pc
	TQT0w9gBqZi6AdA/MoKps0n9nbyTE6CH/wJZHBNL7F/IMeF/vibsV2viYb6dHu0WeFPtUWH/eaB
	OjiK+Fmrqdj4TujpRJxq1M2o5jmeSWlqbNLrLt8YsSTJfVb1j7IBmEjnD6gvM5WUdkPtrskBMTH
	XZMkN8PTuGOJs60gPX9cThW5EtyKuLgZaV5wQA5jgwPI2FQPSb3Le7ZoQMCZ6Cl4/hM18EjF3d0
	1ou8RQr4gKjKCVm7c42cmsqNm36+6GDsAKxxjIOuchrgei0FeLbEa4Zsrg20MypT2a1Aowkh+x1
	ooSUKpMklVcL8MtaCyq6zqmYpmxKHp+VX43s2bFoPoFDr1P95yjvcgtfWAHPMwHQ0vEXljbM=
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4421016885a.5.1795768716760;
        Fri, 27 Nov 2026 00:38:36 -0800 (PST)
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4421013085a.5.1795768716319;
        Fri, 27 Nov 2026 00:38:36 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeca720sm838130366b.53.2026.11.27.00.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:38:35 -0800 (PST)
Message-ID: <dafa31ae-33c3-470c-bfd9-ea16cf34f583@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:38:33 +0100
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
Subject: Re: [PATCH 2/2] pinctrl: qcom: halliday: Add gp_mn and gp_pdm mux
 functions
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
 <20261126-halliday-tlmm-gp-functions-v1-2-b8543d6a83eb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-halliday-tlmm-gp-functions-v1-2-b8543d6a83eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2NJlfDg4gyFEiYHJoyNtl1SJMQHsZ-go
X-Proofpoint-ORIG-GUID: 2NJlfDg4gyFEiYHJoyNtl1SJMQHsZ-go
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b09418d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uTCT-FCyihPU-J8YwhkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX9kJ4PPvoZiTl
 RAx3Y+VP8znDYN5MLvUc4uT89U5yXuqqGS6BPf7h3PrgAOEh6P66T9wxaZh4nb3WJvzyHtBcKpr
 8pRN82BtFGJWKXoiZSlQoK3JzQIgjQ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/sjzUnS4kg9Q
 F3dM5biq5OoZzrEJrTrF2Zd1Ue5PcPd7WeZOi2cRGFAUQ9+kTMn3BTWqTsAwshDkVbgYBFFoKSK
 qEIk+k6hETnM+h/B2KUWCgGMZ0Oz3j5DWldjNgw/LCBC7mQfZ909A6c2xX6cFzLdE6/yto8RZxI
 0+rDjj+ZSb5U5nHQUR+wjZT+ahyiEe2sQohiNIh6Se1vGHlCmesKyORWZaPE+DGQV/5lqDte+VC
 QH/zyLcXFW+BWyT415rIlk/6iJASB1sflbKCcI361Mzb+z+TgTXjVGIy10yd6Eq0E/lUVwRWnLI
 CJC00YO/DuSEniY+D6xJL6hXCpcr3IRdIhCdD3XosZDcSrmf2vRY111vfGiysaMgXSEXcNnZ8de
 dP38VExKonbeRA61fEmJVaywHQ3KeWm3hbD+6Kc40HIF7X87gsd1TB/yPzP526GZclXkygvXHC5
 uhtxT8WEFJ7nZL6gZtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

On 11/26/26 4:22 PM, Stanislav Aleksandrov wrote:
> Add the gp_mn function on gpio63 and the gp_pdm_mira and gp_pdm_mirb
> functions on gpio35-37 and gpio88-90.
> 
> Qualcomm's downstream pinctrl-anorak driver does not have them. The pins
> and the mux values were provided by Konrad Dybcio.
> 
> Link: https://lore.kernel.org/r/84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
