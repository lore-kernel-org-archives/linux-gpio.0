Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0AB448B9C
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047037; cv=none; b=oMDsrB4OX39EZMlDELr0VQxmnDwrpaxyf7Te9Xv4W+7BxUY2+k8w2UAHK0EER489uVRchdjpYD5rZMnL5H8OHuNzh5arCw/+n7CG6pJyhgSfIPs2A2e+8ZsBnc8xLdCcSRBAv2Kz5Z8t4uVOPKjLYXzy983Nm2ITbwWkHvUOBW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047037; c=relaxed/simple;
	bh=9L3FrRvXQdWYs531pX5xZozuFPeO/mTA8z2sqTPlZo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzTW7St6Dej9CoYvNU3FMj/RjEyF6AnoQVxbYPtWrKM9mQ1E93CQiFPqze97GmRGehENtzA3wBa3hTsNzlR4N5QwuQv0kgGX54zOC19f7Fv3O9QtmnPa5v906/74c3f458FBmdURwLpaW/ltrKSvHmiidv8Ue2XXXOglAU1gX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fm30JKro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acDxmSSs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fm30JKro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acDxmSSs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BMKk310077
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 09:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StVit9BC+22sE9IEMOGQ8OH6qcU6UJJMBrq8fRn7njg=; b=fm30JKro9bJpSYu+
	sGJN1fKuNHUGn82cvjkrCwrQXLZZJV4BQ7Nu1eUWoFvpmZbWIAIbEgKWEVki2J1Q
	BHTaqzeCvqUjiXGX1nY1HKL1sDf4t0dAAdPrhfvtiX/Mtp8ILSrckoJ3QdS/7cEy
	jbUwIdHRPCjCDXJvXBYsS+oJk+/p285+QtE3fbXF1xpA6EAkseAbTEXvdHLOVVcv
	EXryEvbgLy41sJiw0VxMb4djKd7ZL/dXGMdsF0yIyY++/3CvlnEt7w/Z4KbqjL8U
	oATpYVeOUTlJUqzRRT191gtTsXBIva4VZBVX5zJMcgvHOwJ7GWMLQcXUojrcLgo1
	IIF6UQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba9kd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 09:57:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so6811701cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787047032; x=1787651832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StVit9BC+22sE9IEMOGQ8OH6qcU6UJJMBrq8fRn7njg=;
        b=acDxmSSseM2QhoZdmHANQ7sY7nVHRIeGHBTQK2ANcjPmzTVmp+QvGDQ/VNSOwVF0Gq
         JgOS3BqUSrOpXftoO98CGvMvoPQ3jGR7NaPC1t09oZVU3aqdrrf8Gtr8bIPkY9IcJUdB
         jRNfyaWH1uHkfU7U1iSdZZovi90XLZgWqzaFtF+OETMFCgjTrLCMXaePWwY0eByFMOpE
         86RttydxW7sXdCzmPuv8quBfAIqxGYrMM0P2AhgWyYOfDSHG8TLHqxktHi3L/+VhQlvY
         k87rDfD8zU8JH81Yg4bYOCB4VIAEPaFFhGMT1gIy6zolKPLXduv8KwsvjK86mqjRRT5Q
         DkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047032; x=1787651832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StVit9BC+22sE9IEMOGQ8OH6qcU6UJJMBrq8fRn7njg=;
        b=LgG4VkBSoOGdetcBeeobX+dno2ln2m2nJ61pL4jQefGPikTKFxAQw956iYEjDPLYax
         odmqJ0aXtOJRCzvHdckt+lV15ZgHf2I6KnhbQhx2YYya4IncW+Acvasx03UJ7HZRWKyy
         HW6PPnmDIv/1veoHTlAPZkvNOSS5RfLQFzox+rHwEhujJWK6/YblBh+/ngeqBlEwvXyG
         0jmPAwrX+1n1V16pYRtQVd1RmafJCw5D6a4AtIhb7nlU8Lhb5zBNrwOUcdLLjio7Q5Uq
         RUkXq/DFBMMgOsnE+g5EngLXmVZKhlEduGBYik08sqcXxjyKjtzup+5+gX0e0qrzfPPF
         6CQg==
X-Forwarded-Encrypted: i=1; AHgh+Rr12pISfyXH+uuDOjFPrfyQXhrLvbg2MZVX5yTGSE4wJvZ02VBu5vpyWcThizTdtUh57UUPC4hryyOa@vger.kernel.org
X-Gm-Message-State: AOJu0YxyEOTJqOP2+oxoto3ZKlG8lsAu6XrMn149qERLp4rNmlVHAIBh
	B5ZHV+D2cG74J9LX0k5I93u2LnbTLm0aGk5UKajpXg/9+lDCaxRncmnw7nb/fPbtxGR1sq/4Vt/
	RDlXPqFB4vT1qxF7JiSx/E34XlTTXOCGS+2CMkXHYLaQbym+uRh66LnChKRGZRNIJ
X-Gm-Gg: AR+sD13iLkGP8zp2KHgUzJCT9pbdg/SJQFAGi3s/Icq9oVmxOAD0BO5FVJW8geB94mo
	gHvmYlBHyYlzCNS6+sCLh0PGpTAVAgxGMv9qdgDWz5wKHBSv2dYRvHRVtsVO0/uVpw/QdS2dP1L
	BlvN2A+qW//szxi2PXkDa6Oul+4h8xNho5BsYiGFMxWy61wiqy36RP3ULmd0nt+47ndCCgZ8oh4
	S6j+Ah9DJL4l7z7fCNtxwOcyeZAYSODNP9iUXWgGrEHGZpa7yk0R1k6Uh2vObyfqXfa+NOpwA06
	27fBO58zlzqMg2DMryeEWqc0aDn+xynXlIiSnHf1q3V/3qvDlIo38ep8Q/xuV0edt7lB6WvjNVv
	smHwtxw3LJ0bqbHJ8oMOmgDCa
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr228656191cf.1.1787047032611;
        Tue, 18 Aug 2026 02:57:12 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr228655901cf.1.1787047032035;
        Tue, 18 Aug 2026 02:57:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bab858sm129104866b.53.2026.08.18.02.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:57:11 -0700 (PDT)
Message-ID: <398f2270-9d7f-4e23-bf4f-ef02186a2be7@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] phy: qcom-usb-hsic: engage HSIC mode from
 phy_calibrate()
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
 <20260810-msm8974-usb-hsic-v1-4-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-4-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX6lJp+IO21N1m
 sPZQwZO6BZgoICJ+7Prek0naxcy13tpcf3pYB87+/hWdxkwDoY0RMq6XaOyCJg7b1RMqkBU/DZ0
 TzRrYtKw4nKdyr2LSOOkKvKLtNxSUG0=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a842c79 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pCBiGHpxg2lVr5E8ZqwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 0X26js21Z4TZ5-F974j8yLFHqP5LHAx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX4/jrhhyQ0a8L
 JK9xO0aQ/zrCZhoniDWCFak1KwN75jYglNPOZYWLFyo55x5InkFZb+WM6sOfRXbIvA3FYtdFNgI
 J54q3wKyBB0sJGVQl1Bn0WQfZn/e1gkxx9pMc3rw++J+RKJVTC5EC6x4YZXCE31rY1PH59h0pBU
 lgr8k5EKoESITMDefkgqL7i/eIXnpoEd9jvz11OCEbVrjQRPhqu51TyeioJ4k6SOGVE5KSCAHuB
 YPV10vnLz5AkcobDo82m/9WC3zydjl45/la9bfGFoGGgYtdc8lEIqLZyU+f09+2esRerov+earF
 lawSaMcHTzHQn6UA+WHvOjgKtIGAVeluT600QS8Z8zfm14JiEkaCrR/U6eCC/zxYApk3If7SFIL
 gcBh1Ddw1L0pqfHTPjM/1TKS8y+XEVkF6zXe65f4Bsic4n3j+eY0bSTWwTkILj/wgND1PpcJZWo
 OjzcwJ6Gm1g4HI3iBIQ==
X-Proofpoint-GUID: 0X26js21Z4TZ5-F974j8yLFHqP5LHAx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180073

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The PHY power-on sequence ends by engaging HSIC mode. With chipidea,
> power-on runs before the host is started, and the HSIC connect of an
> already-present device is latched at the moment HSIC mode is engaged:
> performed before the host runs (and before an onboard hub is taken out
> of reset), the connect is lost and the device is never seen. This is
> why the APQ8074 dragonboard USB4604 hub never enumerated on mainline
> while the vendor kernel - which performs the whole PHY sequence after
> usb_add_hcd() - sees it on every boot.
> 
> Keep the calibration setup and the pad mux in power-on, and move the
> HSIC mode enable (and the auto-resume disable) into the calibrate op,
> which the chipidea host now invokes after the host is up and the
> onboard device reset has been released.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
