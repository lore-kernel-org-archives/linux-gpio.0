Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479683;
	b=C+9IJBBlihte0KqmUcFnJP64KAp7KHRB5XLTsYnqEFYOINut6WQFQLjRT0eUfE15WHo5
	 OPZ7ZysOB0D88Xql8QqQZCDzgqccfFh8iWtQncWf8XrS/xaFTC73Jpfqmqz6ztEeP9ict
	 ZwL6FVYwGVVUEvuBC5rVdRgnM543oMyJHU0AhRhd7vh2KV9RFiShF1SQwNXCWuel1iD7r
	 3eyqXy2Fg7eC+ID/yfU3VteydFTBe87OZHNiMuOKslELPn7uvlBQEdecuTeNZLduUoqAF
	 KeHNoCBzETcSjo7ahR5NnwgYxEYRkykBDZyUJdJh8OFsClf5AeYDS8JU6ANnaz11ijw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479683;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
	b=dxn7cE9yrtVZ0NPVgres7H64Hh0/rhUXPWD7zYK1Uo5r3dbobcaRVAA+7OM+txzjC5sb
	 0FAQONkgCQ5XCZc/Ylu1hBhCzpo6hTw6WiEbBcLf3oa7HGh8U0+B/Ju1FF0dYcemeqc2Q
	 W98oRteMcdqpRowwczNK3WKNzT184s0fVo+TTjlMQT60pQaj5O7g8lb90il3g1kZuspfE
	 6gM6Libf7cYxgiw4hIxA+0f+CgUnkVcWmXNpaQ4yH68rQ4yaiFDfEvJtdPgsc0lVd1hFs
	 n3Vb2cLyuBmMn+Yywf/LLt/HsYJUSl32Vxi7HgCHAGhlMIQ84XpEQg/Pev4Rkxm5THw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuLAlDlf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HTpukbxN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16625606A319
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 07:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16625606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuLAlDlf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HTpukbxN
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tGQ33486170
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 07:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=; b=BuLAlDlfzU/52Ipj
	vud1Do+m+MWPCF6KOAKryai1uJDwWpOaacr1VwelR76jsOIR+Ci0sJ8Sb4dECQxi
	4wZqTMqwrfZoeMQ+PcoUbiBCMhkgBS0w7iXbPWZGB0Vii3p1t+3Lt6Buy+9rUgcA
	/xcDv08qSMmUPF98ue1hHB2ezAYf/+n7YE6T1pFWVt+GxaJZwZhfE9Wtir0jafS/
	GrulP77SOsYzaHDBOAsJYv/ZpQQOu/GurFqmBAArgn/dQB7Lr6VPbWT5f5sCJxno
	tkeVWDzirRA1LNgFfxbPcc3E0z2xbReevoPLX2ziBof0zeO0ivND+N3DylUuOsZX
	Oj5OTg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n197a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 07:01:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a1cf1638fso72866137.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479681; x=1793084481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
        b=HTpukbxNgJQ38wQ1qjD4I3CpHweQ7ZXDxTQotA/BM1wp/rB0JmXXrmb2B/1rtykDnx
         qe2FxdfCMGkTJ6mqOQyMGQictxKvQSnM6eI8yzy+Yr55kepF3pgoBC5SKox3ueNxH5W3
         JSXBOvFDcIGYQQn5zHurne4Smjm2Hj1ax7oXDdSwsFgiZGY/Tj/xrrYwgVEAsmvi8WgF
         mZ9sgvDqz6TOJQVGVSK2E08kDR1EAVLj+X7WM3r9zERy1Te3jF9862CiFh+Bqc+loiLh
         IAyQik2CBqC3sw7J685vy1bpL82hozIyuiPg/suLv/g9e1V7o6ZWJugLJA9VfBknarGd
         m1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479681; x=1793084481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
        b=JNjrXTKBI0T2EMQrm/6X155uaRtuM+DwQP/HaAfdthjNtYDGjeijcP+0TZ8SQaVB6J
         SpeAv3AgvamRB9MBB8bYERQJvqnYuFEb4KbtyJ5OllUGB+zJLeiweSQ/2Yh4F7huHLaO
         mmT7s+mu2LPS/SdA2KaeQXTVTPbEb/TMfiAWOkDSR344bOyp0W6PtOWRnJzezuAhQuuM
         MjwJvuVc3ySeROJLCfWCOvJcOaXUbBJa/ifmOBVdhEMRcfayIbF/Y38r+P+1DElKX8Up
         +Gh/6jNEI4nf6GWfBoLhr1PbDLhwMlhmpYWSAhNv4QulaoIyOfFhVL0Cow/DsbZKf+/d
         6mOQ==
X-Forwarded-Encrypted: i=1; AKwUvBy01tp3YxlWGtYCsASQvAcGT2DWhIrxm6WABV+C2f+8+GiHmNbdXIdLFO9URqpspvs27Jbky849Iryr@vger.kernel.org
X-Gm-Message-State: AFq9FYLjEs4pvBiKHMrkuk2Ni1MmBEs/zFMiTblf2EgAlPiGmARCZG5V
	yoZrQKVyfwOpuAv/hcHJxbWCEw7fSlE28fZ8VNRoIhVoRLIsbnKV5M8d4tYZw0VAUi7bxRv7o4E
	8NXJu7OjPveb9xJVaecQ95mCgbZi8FV2CZKqyJCVf8wP8+iPlCdIpWqHtp8p5WOW3UH6vOHbS
X-Gm-Gg: AYBFou1PIsFcnLJGstZ23btTVGwqJQ/N3qOeuYk+5efUvhOV+4GRT69z+mH8N6dJLpg
	B8zjXDEEQH9fEfB9XF53J5vWbepszw1gvis4qaKxXNac39Zld7Y7WI0qVxBSd3DINpEbs50xc+e
	BiEoXCidYzVoaj+ph6ZZDRpIAyHgTov7/ZSzBX6371zLMdVJ+T6eT7rbA+ovfDiyGazzAYcamIP
	0FYfgFGdngZGQHXnI1SFp7DnzHkAOCGrgeBdQjqPjoWIyAyFbAvOGGB6XWe9O70f4ReU5rLm8+K
	5hhTdCOHEQLVjZjYq2MvVQXLifgVtFDjrBKs4LkTE9m75l6p1AX5IN2NeiKJZfXVWNlfAh44VdO
	t8rj1ogFSnaBf1p4FbhyIIA==
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1535654137.2.1792479681031;
        Tue, 20 Oct 2026 00:01:21 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1535642137.2.1792479680435;
        Tue, 20 Oct 2026 00:01:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm4659866a12.36.2026.10.20.00.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:01:18 -0700 (PDT)
Message-ID: <2640c0d2-e251-4f7e-a6f8-44bf721341ac@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:01:14 +0200
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
Subject: Re: [PATCH v2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad711c2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ajiliMmGaEjDzu8pHK0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfXyneAODPGw88H
 bPzCPm+Kttqk4MF8ibH4q0iN482pULzK8dPJJ3Vhc/BOINCo/m33h1bQWh4lEHFxM9bUTczDr7m
 9sDiQbjvVdzbwboeBIsvJxip3eun8BQ=
X-Proofpoint-GUID: WEFsfL4-R-CSrYpq098rJ0gJwrP3SM47
X-Proofpoint-ORIG-GUID: WEFsfL4-R-CSrYpq098rJ0gJwrP3SM47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX4tMgAKN+2m5l
 4g/OyeqWKFvHSXfA2UuKAjE/OKA6Ynt1lmLWmyDym0ZSXsLA82tQHHrOB3WkHHSqOuwzkWMoK9r
 m0uOPReDf120FAPwVjQsjPZ3nXI7QrHpB30bNDoUSN844HmPSc3aK4DQSTifpQoULNdTjU0I18x
 qDta64O/WSpktWIKaPy6vkgrCB5lPR+vb6ulxlfg94gIlpdO7wxyHqxmewJRnRG0iwQyXypAGSA
 6m77dba9gwpGFLV+IXwbiBx0L7Blzq1LIZbLzaxayclZ4WhrVVahcEm+exxbKeQlCK/JZ5hzoKK
 qbELyPbZ1NQo0a8kwYY4z+fE340VLwdPyLrbXdrEUidcFdPLD9qOXmblAAF4FAfu1ssE/xx6g+f
 do/RkIM6OOM/GKAnp6Gp5rqUzLm/p3SXz0mmxMGz2I3Tj1qJR6IbLiGTZid5hdQbqMm2pfIIykB
 14A51jAOccDQk/hfEEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200027

On 10/19/26 4:30 PM, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line is PM660L GPIO11, but the board never
> configures that pad. pmic_gpio_populate() reads back the state left by
> the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
> pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
> gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
> fails and the bridge does not probe.
> 
> Add a default pinctrl state switching the pad to digital input, applied
> by pinctrl_bind_pins() before the driver requests the interrupt. The
> ADV7535 INT pin is open-drain and pulled up on the board, so leave the
> internal bias disabled.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
