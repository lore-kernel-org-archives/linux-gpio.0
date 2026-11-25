Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603838;
	b=ptDPMkhTHzNvthM5TMcSxuP78sGc1ECnMEWWSeNRlULQGjrJ+XpUURTBDO1+j/23NkBb
	 j+FhNeMknlnEVkbqGynEmj2x1C0KYf7j0b7MU2MGnUh319KcXE9QQ6TgpI6cJztDtqSvI
	 1u6NRJJ6be3PEB51TcFgB6fKlmH053PbJjl8wGLaOa2+oD/o1xcrdKj2NVr6swfDEnqHW
	 zX8NWtCwms6+q+yZnmQaQ9zMbNxKVtoaXLwFJxX6ImZvDzz7M8lMFpB0kkkBccULcMcCS
	 OOOttxnrfTjFMjBEf7AopJWr1ZzVdWEWGY8xCMIO3LwSYVqrCMVxzQhty2aD6Tx5EmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=;
	b=lzFM4eyJAM9D1i7Q+H1Hsnx8tyl5tCywmMaeV0tojGxsZkgaA/+MG3T91bRAZvBAJzIy
	 EAu++wwEyWdbq35fHzGFQa8UAlif6K9Nb6RReGqzumucT+SyaepjM1zmMOKeTubdatvFL
	 vMRwEzf/4sLfTdh/ncYofaZ4zm5zLueVg46MwvXNbh8BzVDmB0P82pAA8NtlY+3zbvdOJ
	 Iv6hE4MIR4ch7YvC1e4U9ZI2kqDCea993cjfsNEHHHsk+R4FOJfqezToG/Y6T4gQy8kGW
	 XApBW7MfynKfOB8clkjhNx6nRLOCJYoGP7kNJyalAmsf3EIY8EA5q3oaMi9Jba3Gdew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TleGhjP9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adri+XPa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F071F606A327
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F071F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TleGhjP9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adri+XPa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTwJ4034191
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=; b=TleGhjP90vAJirP1
	uRWTJF5wFA/lIJlTCjId0A1sxByTdk1IgbbIx78cD8acha/op/5lohbRM8uKTlli
	o7jVVhkkt7pxpNf3Xasjb+aqLsyGZnqz3npkOaBE+cQrpWWScD+Tqh9DQIRcaN6R
	fIgVAYkl51dEHr2YUgREojZ7FZ9Cz6SIPY6beMDvTuaCKVFlsih74P/m/FXasJyl
	ZoCXDoCoX3EUm3x2TL9M7MMPzjUuxaySsDDdLlW0LJ66gjXnQpSqbAu4C5cRtygw
	uq2g1BxGdjFr3b2x4ogetoIvDYZOzxyfzCWd+FtCMB8iRD688BYaaJO162v8Uag3
	ZbXnLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjch1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94965dfec53so69421985a.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 02:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603836; x=1796208636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=;
        b=adri+XPa7Snh7QJ0HVyWCvU4eP/G2C+eLAsAqFPeDoZ/LDTygwnFtTxCz51FZWcEL0
         S4MevqwM4o5yO3zE0g+gun8yBxpzcijQmR9GInPjEldMfKqORAHniO9lq/TSV2xiz8jt
         nmHw6drjFHQZyIWnl4ofpoj2h+aIqrEQJ7c5KORwLtZ0mXGmtWwPEJmIlNFBwCE+e0fR
         56hmdL7vBmUpm7UP+0wcjamFTXGjmmlW0A5wZdemPMcXccU20kqDQnif1Yw66lfn6HH1
         tx/a6tJvSq7PyaAJxQp6KyuWRv2fFFjxHrQuIMEMtnlTHkulLq6nJU8tVviKz2IGs3Mv
         sSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603836; x=1796208636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=;
        b=lNPhGImE8NZNTuTdkLTVKuiMAhEKg/IgTEKpsAuvaYw+vgBGcMNSCygdIKaDlymfv8
         jPD6PXR9RhvLMORoAp8DPxmwYFOSZliRqMn5WY7u8YwcFIP9kJ1g2tDX5STXmNAuh7n5
         fNEGU7hAH4kRH+xUEI11DfH3TgExkkkQguvQRi5vgiLbKOvZHpNjX9dt3Qwo+bFhcd0q
         SmHt2HtiXxSJoFB2hRvsCLSw1SWqpfztxDrZTCf76HhnAu1+uh8OvLf2Yjnvhf7CTSJu
         MeE3XEpiZMUy4Ey93UoZiikim4ExoI8xM0m2/rJcPoESnWwuhkrjnrauZvlDTd3RHp+v
         4xMg==
X-Forwarded-Encrypted: i=1; AL+hErGGTS8wPxu9Z8750fgUydv9Edb8743RTqgK/Elj9U6mTdQdxP2XgXBcqXa/ZNwkaKxMVtbojLxJGQtE@vger.kernel.org
X-Gm-Message-State: APuU4Z//WZ1nBQ9ZPfXJU2E1yKFsrmta5n+MUeUchM3U49WJxz5/3uel
	sRGkd31OXE0K70FfrYBHRAvMRMQPQgUw5wOSuF5lXfd10cAweFL/72jWS3KKv1rHQ2vyqeJinOW
	FsYSb6NJNUw4kZpEGU3Nti+Cj56DSRjaagZx2hyQOGFp5SbrQLl/x2eQ7tPPuRXFcWzRexlr+
X-Gm-Gg: AZFdTZffiUMcNKW/FWEB4aLwSi6+3QV1G8NhZsxcjy2NsvCjHEHEtFDdxtWsdJAUpgO
	y/JxO0B+XYb04Sn9O2JalKyhOc/0H5TBLoC/ohXicW7w0nZxr8lhS9PIVnU9+NEwdnrQrWjHfuX
	WQkwxIkDIrrtCIQ/Tgce55hRiKBUL04VCbleCwpbfno5E7ZzSQnAgUM/1FZ6j3op75OEe4r9q2h
	/2oGWeS5i5uGuStRK2Led18hpOdL3gt0utbyPZvBa+i1tlvcl9mZpPl/xaTRyAaaS4hMJHB2/Tx
	2NUM01C545mwtSS7UyAms8yCzWqGQgmw56b5nMx6LmXJmJ0r13xp+T126/fbrlEasZgqAubjb1e
	NGSiLtoKnxU51jNYz/8Yj2XycCnaG04Khq7pm3AWOs+7LLp1UBOJIfQ6cXHD2erli7z96N24=
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr3229762785a.5.1795603836244;
        Wed, 25 Nov 2026 02:50:36 -0800 (PST)
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr3229757885a.5.1795603835728;
        Wed, 25 Nov 2026 02:50:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:35 -0800 (PST)
Message-ID: <51e487c5-b18e-4940-9353-ef5300c51122@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:32 +0100
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
Subject: Re: [PATCH 05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin
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
 <20261124-qcom-pinctrl-egpio-v1-5-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-5-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX/jCv2eRdzkpS
 w/4OV8DBgrCh+DJUOHgBRHsfWZ0yOYNYVN/WFA8RWlVh0I5P89VtJXJkW+ZqmjnXZb0htg1y4If
 saS115NEEP8pyeF8qSo9qrGRQKgkIU8=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06bd7d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cf3dnyIY6h9DwwF8UtQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX+OfLDK8CcMpi
 5h+677rWFd/TifNDkZbCkHctGnje2MEQCNdt/tTm8zzzXXm98JB1ER3h32rmtAV/tbTC3pTxQFQ
 7KtQLaUrhXNPC/i+0SBS/+rGYeE3wF3tGat/MscLNQC4vURCvB+rYulxkkjgc3z20jzpJqxc9jZ
 hxyE+Q6jHZP/TBEABSKGdewEEEBcE9Oj/E5azttPTmLyMZkN4V8AYIQPvnPYbRzQF/hO3cwa3oi
 +dQrRyj4Ka7Hge/5bti5BHBWEKju06ZykXAwXag+RbT40Iiq/DxN7F5Ua8rclPJqLhJS8eKHWBC
 J4NqzJa/4kRVCY38z1UYORO9xfocRlnJ/cSwTvOPFtYW5fgdj134rEoWTp3gLSF0HgLBAJsAr+n
 7yf+XrOn9PfiK2CcytZ6Pd2b89UeL67ARo/hhona2mdKdRjuPJzJy8a5Et5h9s3gySWGh5hqRx7
 /hJFLCK0K+3lI0o+QQQ==
X-Proofpoint-ORIG-GUID: UPH1cLVGhalQY2q9q5obP8ryYjwXAY0e
X-Proofpoint-GUID: UPH1cLVGhalQY2q9q5obP8ryYjwXAY0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the hawi driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 90700e10d2ad ("pinctrl: qcom: Add Hawi pinctrl driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
