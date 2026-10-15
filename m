Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDCE4A7CAE
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048506; cv=none; b=NhfENJ6P20SAn32JIB4frGFobmQVx8rO+WbhlegcUcpGSpck+KKqzAyBOIl+KNTdSCLOkYqzXogJxTGMRdHYnbWOSezV+S/V/pZ4QqRMDc9K6V6h8635f/lI/xGCGqJSOIQqdf7aX1LP+juHsNFv6fJvuavxkxYPkGla+7iupBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048506; c=relaxed/simple;
	bh=NTYhrykTWtTBp9V+M4bLcII7SFmdACoA2QijUmOeDlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkOTYhTgre1RUXjbLGXmYfXdJjUCndNTqZztMaIbkLDFxTATzn2xABnpMpJWHl/cDmhPNSidv+29zr0waJGCFgyofh4Hle/UfJ59Ma+gtiwVISbPcgnjtQ/VHurH5WZ+maDSfKc7DaZSVTQtatoXGd3TADtaRSD3Kpd754NNoyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbLa2p3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8fAuNUP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbLa2p3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8fAuNUP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1Obk01707231
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=; b=gbLa2p3tR0PkBx/H
	h0yrYWNT3kkBE2J1Db23/igRBTZRVn8k8s8scP5bWJ4KFX2qQz2TIsLbkSy98P2C
	MA8hCDJoXvjVMDD4Ckclhpx5DzerpfbX0mON+G2e25VUqZhLYLv7XlPLlHBOBUG/
	sjj+VKXVO1cE2kYPwzFvsBLO7IP21fbqLVKize0hRzRYmShSCvw8M++35dVUqG1d
	CjgJrpgLN9mb/UiB6A5/l1th91bu0mGLSfp1JRUvNUJCku3K+YkvEpuPIndYS5QQ
	JUanF3gBIOemujcUaYikbY1U1fB5uDr95rhGpga933xtkxJglHCSQ1znePghb2Rv
	FZ/MIg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54s6k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:14:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so1107591a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048495; x=1792653295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=;
        b=j8fAuNUPaKxfo+Ae6vLk3px33SiS67719bABoMzYQQbyzNcHiit335FHJcKFotiZMH
         NF/4bK7Th2ljwtulcE8Q697Q7w4Wu1T1vrRmQNc/qM0xEBmqJFsKLRaw4mDtbgnjhISs
         I5Y/TgAHj95ESofFah8Ov5QlH1gKPllnIRzVTZkVV5qFLiJZ28pXrutx+QYk043SJEVb
         FRl2Nd2TXcsr2MY60F9YFfsVUlA2q2zu4w+WcrBGg2P5birc7nBMJH37jSGoHhGoCw76
         8Rg/QMjBnSprB7oMxXej+ecJbS7APqAgD6vaxAFUORoKEGjK89oNeG0yIoxpOUmscbWN
         EwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048495; x=1792653295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=;
        b=lf+z/nJst/Wd4NFcQ2g50u+VvMxU2cWrnA3dHTMgV5eZa/S1QX22hyJhS6dgk/3d7y
         avkjDSnh2XyRU7zcIJ5lBJQu6xLfM4/1FZPwCfd/xS+7js42kmiW7y17kGE2XG/UMAj+
         3GJ9oSIYRRbo5ykzvAT3wAEcra8tIC3vG4iA4aJ6Gmk6t4hfSFUharhBRw3ynikfd0/3
         jC/ws+vo9h0exuvDpeF3pR5pw3RnlXCUzPZW+44eMoOwZSpZH/D4f9DVhOOy+52tzSQR
         CwAKRVtIRxcz35V/zP6cW4FMyrlgl/L/S2igEmRx3SptsVgTzTP+qWT86oWCMbPvcEgc
         wAug==
X-Forwarded-Encrypted: i=1; AKwUvBwqSuwq47nhgdMbp+iEASkP2fio7h3QQJfn2sJyU2RGmu5pXV/5rcgrJmfbsn7OSmPh79qHvb8G2MTl@vger.kernel.org
X-Gm-Message-State: AFq9FYK6LkRWjVgaQ6wgDsnBsNSv6YiPetcHqW5ipK6CpaL9R84zQ3AF
	HQwX+UwinwkieJM3Q9tTPu1m/vp8lWZCXdZxHhcxqDFm4+n/DQGMWN0QRPX+cSwruxH07nhckOq
	yqBNMs9+/3kjHQS5yarn3Rkv1P1Fy6hkapt4XPoe6mMaGuI/2YQc5XnmwEkNzgDaP
X-Gm-Gg: AYBFou3FbtPYCetP8aQrs3NDlY6sp6Q0kwyBBb3o4zf0nmNwv6g7uk0qQcQq8jzWKtf
	DnuVVHIu+Z0t2ca2zDLA2s26L2XeBYm3dU6DjHZvsb4hjLelc7+VMYWQKTiOp5ZDamF7nLwqkP1
	SS/rkuGObV387ejou1nhAd20NwQS6dA8IjAnH2uOs1J4IG250FpOlW0WsyDE2Y3wXhv69v4c5Wt
	POv0RfgZwr/XYRaRlvTW1EBZ2SykRo7WXbJPgLO7P3fTLFsitfJSCppBxRhZM6XORM5WdfsgLRv
	XKaVgl3ZT7alOOWDDsK84ZisiBETiiwwq/bx8kCj80mCtRePgez0iYqlyXRStsExm2fVV+kiqB7
	Bozkd++ALv5MB86MMOBSvzt/k3js=
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15605949a91.14.1792048494905;
        Thu, 15 Oct 2026 00:14:54 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15605924a91.14.1792048494262;
        Thu, 15 Oct 2026 00:14:54 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3221300a91.10.2026.10.15.00.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:14:53 -0700 (PDT)
Message-ID: <84c2e489-05d0-4acd-a88c-ffbdcd111f67@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:44:43 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
 <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad07d6f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xfIMX-YVTLGOWNOYmacA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX2GRQGUQ3sg7t
 P5vhnUN+NAe4sTROwBH1dNz3kIa5sOX2zVrIZfJpZ8Cinn6DTR0hqELgmpWxXR80zwlTyh5odtR
 zvgKxw/keIoBsRJj50uQ1Qgz+msyJigP7HCdOhMWT0bu2C6BIjdJPJFPm81+PgLo3r+N0ueA+g2
 vaKkCxzDZ02ko+vwOSc/sUhKELazp7Oz6tWS55usuGMgQBraYwvcsavOayE9CpCHJh/Z//42lc5
 w3EwqQlv2saL5mcSy4hgy6uAlX+ZooRNEPuaZKowcAmGKe+CK9HQM2jXCOfdm+4C3xTEc1Alhqz
 n2n4p2iPecNG4ISGZ5IZLAIUoWk4ZGQhrpQUBbfHGnoPhZKOarU2fPaMj1hz3ZXxPg2NjhjeQKn
 pH26rkLMsyfYOzeOw66DynSZs00hhENlGGAHG3S6WtAYrcCqv4zaDIpFwm66NewM0DZZBC8t2ao
 gABBkGMMgyUsFAggGAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX1UxLo/ZwUhIr
 DTYEE1M5nJSRFJb2yyqjkO+Npr99G/k7HjruVIb7uNoSQ9NZUgEnwaH/Lr+9jQMti8FiQis+vx1
 LaFEFX1Bz0TfYYKjQaOJmLWpMXWQn24=
X-Proofpoint-GUID: 4tHcvA4ve3xWNJ4b1b1IeiIoprmd6LxV
X-Proofpoint-ORIG-GUID: 4tHcvA4ve3xWNJ4b1b1IeiIoprmd6LxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/9/2026 6:57 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add the gp_mn pin mux function to the TLMM pin controllers for the
>> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
>> divider clock output on a dedicated GPIO pin, allowing the clock signal
>> to be routed externally.
>>
>> - QCS8300: gpio32
>> - SA8775P: gpio35
>> - SC7280:  gpio60
> 
> With the changes split into separate commits for each platform:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Sure, will take care.

-- 
Thanks,
Taniya Das

