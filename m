Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5C52F6596
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726539; cv=none; b=RYYqjWBIPtsIsPnBzDOxEIX1TVCDCv6/AmDX4FbdWHmj87l3JG3N1SgTcSgJR5WsIkY3Q0REv2nLvpVv2TBUsuBDmCjpXdZm3M+6E8cjXACBaWVoCMcB7eoSUPkGIUgeLgnR6kz9hiMWenBGGJZ6rY1jekohAilCuD1JTfQ/Kj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726539; c=relaxed/simple;
	bh=3FVlVEA2rbZg38t5BnfDFvC9YUAId5io7btGly1WS6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbAV98LlslnWxu6eq1pKIbsZJO8jDA+7srRaHjthqjl8gPbrHcX4huuU6xgilzBv4fmOzVkWrZ1pLu2DqQgYsvt9c1XFPeAGhKt3KOrOi3P2q3lS1t0opLrv04DO5Lxa1GYogaJVtobIg/H50I9Ylcgp8Z9wyaHNv9VXOsRiD54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdIgH6uB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=So348kps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdIgH6uB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="So348kps"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDGs0T855683
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 13:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TOW1KjSIRoG1wS1X2Bm+3FjL
	0CgYhaf3Z+auuhuDAnY=; b=OdIgH6uBqTYx9sTwZ7fQPOnKR1EtPnJtC6UOcVdR
	TcPfB9fY3EKe0DiCV0fvB6X9aG4/Hq+1lSnT0ScuuQuwQuPXUSR+QsYvWHqtZBbD
	Pr9ctxdCPPInu4Jpg2jqiqqme2CPplfXI7SEpOSPgiMkKmtU9fSWZVEmFtghtoCy
	aMQCrC2dSr0UIOns1Peyai6q6zh3RXsL9eJkJWB6iWqX+yjneg3SrVvulSLxDAan
	dknXLJ/f5EYtiJDhV+doEzBEasD3nNVgBDdBlI8uHRdUSsGMZDEG6RYtDDcjHI8t
	va6c9Fi177jCg6RG8dt5DG7B+AaV3bwk5+8M1t7GvsWJqw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm100nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 13:22:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73883529f72so9996251137.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 06:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726536; x=1785331336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TOW1KjSIRoG1wS1X2Bm+3FjL0CgYhaf3Z+auuhuDAnY=;
        b=So348kpsCid7v8rYL8ushklHvf9J6q9w3Vr2zSAJUAV40t1QwuxUTaund6xB1wfcqU
         wrZXbGG9T/nWcxZB0+O7f5t76lGnHCQSd0FKKzPh14kAmyBOOv1Eq4OYKSlu7m0BYC72
         xiE/tz36QStmzlAKLapRpsY7aKpKmL2arBxuSV0rAN2RlLTtwY6TKZvek/F7RYpYgX9c
         tYKw6P0n1ycqD/suFRXCIC49k1EuPcvqX9b7wJ9068OJU7cWj15xn2B3rzwNSnARgtFr
         6p6qCEHkBRGVGxCoT196dkOrIvCoDcuFsYj8iAwtBeG00XQPungXHuwp0EI3EVQC0jXb
         3O6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726536; x=1785331336;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOW1KjSIRoG1wS1X2Bm+3FjL0CgYhaf3Z+auuhuDAnY=;
        b=NWCrkIKLVKQ+UHpJ2wX3mgGCsvtui7mdcCGC9yQVVgPtiLyLPm51R/mK3bal4/BoyK
         dtymPTtjEPvdRcDerp9Rw0dxIO6cBUc3AKieJqT6lPB1XwfYCseBDLttVZy4aPr9Gbzu
         p/VmVezTMC7RuK8/LpjI23KXive0bueTnG4qmlCX7pu8q4fAGMHJz8Bp+xKO7T6chs3R
         giyFBhWlOM9syrni7BHz2FG64XaOHGUn9CIspnzVqOQCnsQgovv0fgE5yHkfaEPss+Ya
         fDXs6TyDt4uy+73XYM8J9vylpxelH5xPhZCk4Mw5c3zWwIzHb7VVnmnB2osFGUge/LyP
         n4Iw==
X-Forwarded-Encrypted: i=1; AHgh+RpCGHOUyRV/wP0olMGyA1hcLo2U27xvORvLGQOa7cb4EjX4iZi5d9PrcyXlv3mdMFNDZvEneKQp1lq6@vger.kernel.org
X-Gm-Message-State: AOJu0YzDFnl61ZOGIZg8DwMnQtiYM1KxMcVnSE779t3mOsc3sAi97x9R
	IJz4O/LbBtuktb1b9vxswQ3CGWW69XwVKWxSOwFpp1cSNR4SOzJ0ps26LJmdfi/uMG63+qqSzLV
	iu0BRBSLm54pBxSJoC+Tv6E+uqbWDOMBqNN5zo1Y89K5It5YucPV1Mbh/SCu+bPJU
X-Gm-Gg: AR+sD11csMzUk/H0pva4ei2aXlItofVJfPNkph9e88PPxv0CtJXpuDZ9LdN4gEKGBIR
	4cEkfFKtb2ouvI/PTMWpCNR6pMg3XljM/+UO94ELbax3PtcBTA6WcX6u26OXrdI7GPKh0ZGLctk
	m3Rff/aOyyLwn94ymZA6dDXEGoKmbYjEuX0JPNXDz5Mk3KPK9Q8Dhns3BNwuG172KgV17AzWYNi
	qvnQCPxOe8yYtnbxAjZbV2GSmwVGaT4myLAEZFqWvspJT4cym/d2xdfzslcerKCzuPK3Jm6QJ52
	fg0/+o44RnPJYksz9PgWHOhWiG7D7bfdtPAyNUPDqocxWiIiHR6Y82EUWWYj1xsBMI2eE4a+B1R
	S/DcEtLECEVI2Wgcdp9JUbGjACDmheRsfybpPfMPsyOfjc2Z68wb38Q96jqvQbxT+uas0L41n26
	Gj0I89hO1UfQ6qGw==
X-Received: by 2002:a05:6102:3e11:b0:74c:dec5:86c9 with SMTP id ada2fe7eead31-74cdec59e10mr187718137.28.1784726536472;
        Wed, 22 Jul 2026 06:22:16 -0700 (PDT)
X-Received: by 2002:a05:6102:3e11:b0:74c:dec5:86c9 with SMTP id ada2fe7eead31-74cdec59e10mr187630137.28.1784726534646;
        Wed, 22 Jul 2026 06:22:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c4274bsm4347521fa.24.2026.07.22.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:22:13 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:22:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hans Ulli Kroll <linux@ulli-kroll.de>
Cc: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin
 function
Message-ID: <vanode7yce542zevzmmev6rigry73u75u72nsl4sw3balpali5@y2mr5f6mbinl>
References: <20260719134548.8830-1-linux@ulli-kroll.de>
 <20260719134548.8830-3-linux@ulli-kroll.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719134548.8830-3-linux@ulli-kroll.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfXx/e7xeE+cAAL
 DoFM5F2aIX0PHMUFZqp7Q6jizXmp46MtZFGe2ZNxj9zUOUxz0EYbtyDAB4OpciKjjXAATgogMDm
 HFJJMMAT/oRvqS5HfTG9wpA8jKDQrgM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfXwjGZoK7YTPFN
 wnf6eIjSjaddCmgYWPK/QdIldiS7EVOwgtn5RMdLZofTD3aGYNTqxqVIbyqdWKvH5NX13/ZcGCC
 yE5LcWbVH+p2ddp9MH6cpMxSIOGowar6TbcHqV4mIT3M9tJ62xpPPLxc4eLX4W3EdmLdJ5H17KJ
 r2cmZx2qfqIGqNecJeiQnd19lfUcpS4AB4I3ob3bmP8Z7xAAjnYGrwSlnZwqCcTgqnf6ZqUxauB
 CckR5s7F6KKUW0p2KgKY1k+ZYXPbKG8X5+KdCyvnPmmDyNGIEdDfeMJrqjpwoUAPkO08YzydY/f
 HpHZd3vQSQl7gZUF/dKOf11MkVZoq2t26Xv1OceaVZyj5iRGwsIdW/gxxUMvE/4VIuUpoh9Jqfd
 uXRILWwJLVlMqmbAHflqL86m9wd3FcdrJwpoYtz0axvqiVcAUJrP8XctpWN8sQcP/iXgb6NkDby
 Sj8K40E4+oeOzzhQ8rQ==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a60c409 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kdAUHIhQg7ma7BpS0jwA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: P-Ct24b0Kyf8mLXCUFur3gFOkaEBIHUc
X-Proofpoint-ORIG-GUID: P-Ct24b0Kyf8mLXCUFur3gFOkaEBIHUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Sun, Jul 19, 2026 at 03:36:00PM +0200, Hans Ulli Kroll wrote:
> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
> 
> Mark PCIe reset as GPIO pin function
> 
> This allows ipq806x to keep the PCIe-reset related configuration in DTS
> without tripping over strict pinmux ownership checks.
> 
> Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
> Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>
> ---
>  drivers/pinctrl/qcom/pinctrl-ipq8064.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
