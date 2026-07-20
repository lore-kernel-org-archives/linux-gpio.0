Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975863CF200
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536116; cv=none; b=eykCxH9/1uMrnwsF2+7JeGtvlxRA7TJFIlGC1gwz1dgW3gqnu7YqfW2fWYzpX6tHe2Z+zmwfQYO0svVg8I1LKw9Mxa37a3417B/tLbMhqbZ0758D4SWWXawcCcxp7QqWI9ruRLD8ppmp/ZmwsDXk12Ckrg0Z6VO6P1nNdmQB5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536116; c=relaxed/simple;
	bh=MJouPz8tZawZj92ZcXa4cCdcIyni5ArDTo2gFWwcW3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9s7c9xjCQyQuoLzstM0VUqKFGymX1LV8yUgBH6toVA9Ce1klm6NNYEMwf+rGvJAVGIgReRJiTJJF1oIRamKq66U++iAu844DQItLDe9wVu0bJo/z9/O+uOtleNWFhWrLnKaXPa8psM+06IXIzBXNnon2/XFltV5CVVj/C3olOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdqlp0w5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LH74mu1F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdqlp0w5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LH74mu1F"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RrTi1263334
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XN7b+1lavUfVAe9Y3mK3B9ykSvUlLsIWi7X7sA80D7M=; b=bdqlp0w5Te55brf9
	JeXsIFk1+ndRMjaBMtBtwoVRdvTdLxQLqiqopX75tURAUIOM+T3/OKmRGHBz+rGg
	PA1wyeJ3N9tsptIoJYmHFjszLSiv0FTWkB0/DAGOdMdUpMxdIg6soCUu5eUegmHh
	bmAXmnthT0COe1qQr8J19CYBoD1nd+FVGg+nALLeQozuW3OaebzHcomXaR9f3vnb
	+CUjt7hoVNXj3B4PujAzELczpexzMyWO+L4RQaZw+Xf9O4Rxorbey6alA4qFzK6p
	0k5xFXoeowMmKHfwd25Brmg4+ojbeE8YwpxzyvdP+Q4CdPfTQDhPSAeMu0XRJZbE
	mXxffQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhn5x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:28:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51caa0b48ccso18558611cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 01:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784536114; x=1785140914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XN7b+1lavUfVAe9Y3mK3B9ykSvUlLsIWi7X7sA80D7M=;
        b=LH74mu1FIBfpw6M6BELyG6h/ToIYPbhdxHBfS6KFXgiQbdksTlvLyA1kJrRJH/qea+
         sxeLeQkJLaoZC2mMam8A73OlsehGth3v4vHPkw7MYN+0tNoZot/k1UREEZExT8u4KWKi
         lic04QJ7yfXm/God47Dw5kuVTYdwvdyPJGQm3EtxPiNQGRtk08ddybOExKcdm3IjVsvg
         mYcXy5iaYVjBu8pM5ow/GE0H6/h/msAwzLGv1K3oRIcM35Q+RFuFR+bN2BfWt4XyCWHY
         g0N5wxdqn3u1qN3j1XpL9Knslbz03t/+iQNDu/TimM612D02nh3BNhVw+B9Iew4+/Jqz
         VCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536114; x=1785140914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XN7b+1lavUfVAe9Y3mK3B9ykSvUlLsIWi7X7sA80D7M=;
        b=iJEnbt/jQ+pNnIPLsQ8A0EZOGXYznBfrO647DYDVRmHiMO9R+a0pOP1uHDnmbCJ6pg
         bOILPGRJ+41FRz2102ickrKnTS4N9IPpDDujiJX65fVH+4fgNtH4D1PDfjRHEzS2ioZc
         Y5aqRgVJbT7jzL7b95k21b5XjeuD6G8vkQZlKJGCv2KXmldenOSNkgaBprXFPcnZDwsN
         nXjHQNwX/WXeK+8OXQ5aVlDGX3iedH+0D2CRbpquTLkuc4ZzdQKyhmTSY9Hd9ig2oaWb
         XoGwbg7SYyyT4iyf7TwrkjOU4y92gZRhlbavVNIJHZFnifqVqUM/J72LIOYRU/rnhdsI
         gvxg==
X-Forwarded-Encrypted: i=1; AHgh+Rqk2UvXCFl5nIQXVfvdtZ1CDi4M8I8ixQRXxITMg3UJPp2uFqiHoszr/RxzSjOt9+EV4jLZNXNRxQYq@vger.kernel.org
X-Gm-Message-State: AOJu0YwiKDWIF6qyVJAAMAqHdl5wKStgu3qZL0Q3hvF3BWT2+RmQnzyT
	Dbf3iUPwMI70bI3yzr/NvyiX7i/72rq8AZzHCoRMENeoBDQ9TtQ+L0HhYFiu2WJvn8vOiU1XKiw
	UGRq7fDC/1xOnhb2KEMfOd+cFFKSzF1TgGNHVgsZThc735cLSTSWcQfLuwXK/2OkvK1ZPX0c1
X-Gm-Gg: AfdE7cmrptQs+2xLYhC9xL9ExoqBhwcWBMVxPvWzhsPLGaiCzJA3BieKru4JSRfYpd8
	zspsd2nrkw5EunZSZa9KFDizYwD6J7c3u/eVfS8E9n9YzIsyHHdHaoMpxcstrMGuvBFtxS4FKI3
	26u9/+NklBp8kD74lY7evqVUI6ZNwOQLsdCkRVDkXRRMUdOyTTfLTeyEn7clFaWnzzvTcHK7KQn
	AX67ygGY+MtgIGABfPwBkcZln9lHbywrTUYrMyeWif/kdNV12Nf7jlj654OWa8LgQogZ4pWo8pj
	m2GhaDSLzuSReUQl2JI6t1nNM/GEAyKnFa5FmP8HeHS1XxOmAPIuiLEjuJDSK9vR0tNibYWR9yv
	qLEQ5RnP+Wz62MtVDJLNNLH4d
X-Received: by 2002:a05:622a:1e8b:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-5213e17e0b9mr108644501cf.11.1784536113861;
        Mon, 20 Jul 2026 01:28:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1e8b:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-5213e17e0b9mr108644401cf.11.1784536113498;
        Mon, 20 Jul 2026 01:28:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f986sm426231266b.40.2026.07.20.01.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:28:32 -0700 (PDT)
Message-ID: <fec76d4a-c370-449a-a6c9-910703c70bfb@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:28:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin
 function
To: Hans Ulli Kroll <linux@ulli-kroll.de>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260719134548.8830-1-linux@ulli-kroll.de>
 <20260719134548.8830-3-linux@ulli-kroll.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260719134548.8830-3-linux@ulli-kroll.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5ddc32 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=kdAUHIhQg7ma7BpS0jwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: yALEqJ4rFLoJ3m8dhSpBEickwoqil3tE
X-Proofpoint-ORIG-GUID: yALEqJ4rFLoJ3m8dhSpBEickwoqil3tE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX1tgJERk1y/f9
 9RK44MuJpDE39EEXzHlU/fOrJZ1HFAEHZ7veG7WbrTnXd1JcM07pXya50l4dDt7OFNzJJRc8fpK
 MRlLf96Rybm8SyBdqXeFAs3pQTq+yheNIqeut8c12UoW6FnDbI2KHec7NBERQBVwW+DHWrbrkUV
 AvpAo+MtJ+m/vxloH//HY35+20NhTw3BD39AnfnFa1r5my7KnI7ZmBjpa4uLYl1zQE8qz1XM/EN
 VV3PRMGIQ8nTTqLok0eaDO6XLLn95qlEJfTsX/kheb9TD9O2Uk+1oi3zRWKvSJzpwjAaetTMEwZ
 9La3UhQ9jIxRez4TZOfbAEwwc7INZ6JbdHjEsAzqVWYJ6IAZ0hx9HixnELZmI6MWzW3N0sFY0z/
 hZRqyc1yShESkVOvrp5N5yI8yEeEZgD25E7Ja7rh2dhnoAOMVPpq+LbSYdUyxio7H7Up/D9bCBp
 jne4iHePzBqILd4KVLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX1atvA8t1OK/6
 g45g4k63DJNRI1/vbdoAQZo7T+nHbdFQyCyjjtwkrhGrNHksCAjKApfgu8AWA85PjHWPppC++5z
 W/8Kb2FRUIpnBZYotatduNty+AQb9BQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200093

On 7/19/26 3:36 PM, Hans Ulli Kroll wrote:
> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
> 
> Mark PCIe reset as GPIO pin function
> 
> This allows ipq806x to keep the PCIe-reset related configuration in DTS
> without tripping over strict pinmux ownership checks.

Could you expand on what the issue is? We haven't seen this being
necessary on other platforms

Konrad
