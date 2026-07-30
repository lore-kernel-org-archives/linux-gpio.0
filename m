Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B30C3EC805
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403720; cv=none; b=URiw/cvK3StaiZgYCLTsiG3jSt6wjwH4BStvLod1hJhlwzcSMSDs+baSwaPnDCaBOK+Ua/DWAXnGGk2ZvnFM31zdfgjlyypCOLUSThBJG7sqsbb1Xin5fbcfgurFjg4dKOPOzdD5b5UqBYSslcRE7StwedEneD8mZYiJ8+wSUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403720; c=relaxed/simple;
	bh=3xF3BZeMbL9Vku84u70+xX0yKmLBNECOtVGtD2Edl/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5e86a+Z+dYZhkuHpamb18Vk7ysMwX7SQPbaI+F8gbfcodMvkIFF6X+SkpSe2y4TdOe5uMTlHD33Iwvq1mg+yNUB64XHY9Q1KNRbMnyDNREWJXhGj0GlGGAnik2iWhwHG8L8p1+agQS5Xsae0DZoQquZsyfT6ZwfXIXON+JtEIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jb54vuva; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sk/IG4vH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jb54vuva";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sk/IG4vH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9GlVs257050
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 09:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SnkuMjLgd4zfKyOblSGLPk6hM45einYtMWndJ/1aBYk=; b=jb54vuvatRvIr267
	ha7Z+fThj6o3r+FSoZQlv2zAS2UmSU58Bs1NwtHwg7IuKrohUC165UNup15zhJgN
	VpV+wdHmkWL3SJMWUpq/tVKXH6dt/91WigVVva4cNwBut+osfB9grQbXjCw6kB36
	V68f2TwuXUWtyVHTBucGf7Yz9Pqppwi0P4NmQ5Dg+TRXP2FaaaaqFJrj/HIsYaxQ
	r52SqShu+WbEM6IUtC7cYxvvUNjarKhFCDfzxTbfKb0UkiugqNmvJpmEdJFt/VKn
	npsZFe9s7rQw6t7v/Med/wQEmChBA0oNIcENuDHZ+seZbtfRvlgg5KdnpEtJam7C
	KaHfsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3ucr1gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 09:28:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52845bd815bso3344151cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403717; x=1786008517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnkuMjLgd4zfKyOblSGLPk6hM45einYtMWndJ/1aBYk=;
        b=Sk/IG4vHTDihh5Ij4Nj8YJcpxP57rhWxm53oxgFDLfHUsnRGFmY9sCdCMGYutUGSna
         ZR81EPJUJhDYNj5lc3axJn5XwKWfduGse6eQ6i4KYuBUmgGSlP0ZOFF04gRMxT3VBzXL
         /tokyAUKbrABy0BfdVhLQCJlf0hjXP/lYRb38t4ViReQ+MhkJt0g+ad+2PDiQEj1l7nS
         r9qtFisAr3FEXuUhxJcA6sMQG4Xsn6QV7l+MwTpU7yuduISCzQmWzPqEr1bSlpY3mI4D
         6qVmBfNGOqXt+qzu4COpBXoBVunIEGBeFO+izRi/3oT7iIOx95cCuO96euFE3SXbKHf0
         wIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403717; x=1786008517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnkuMjLgd4zfKyOblSGLPk6hM45einYtMWndJ/1aBYk=;
        b=oIwMkQkF4k2pi9eUvdNzjRkb+r3Xa6A5mvI8g5mb2R01h4Tn0+YgLP+Wf/+5k/PS3J
         O61dO1vj3YHNDMC1Z8eUsSNWsVd3D6yIjkOWaCWs8fkxdSjYRYy6UrUaW+qV/70pr3ID
         PO3WxlnsNRvvjWacYmCU/hqpsjdHsS+9Qf5glpou0OgFqwswAzIQMFcll2GD75j1xDKG
         VNf0cAan5yW0NakSUaGp6ucnPeeXw+QZc3a1mOA4QorzBgluMh7qNQOftEp7i7MjJN1E
         Z9VPTmWy/uS1dBxtKbe/1+Dm4r5ClpFsUgdDRh0Fq5m7AMGEXtsnczblt0uY/M0oJoi5
         NakA==
X-Forwarded-Encrypted: i=1; AHgh+RpQZjYMb+rNgHVuIADfAyT/Zs7Gjjjq5PKWZ7R/e9n+IJSs+F5AWZ/p4hCTpbAQ21zwqAWWFccaGAyK@vger.kernel.org
X-Gm-Message-State: AOJu0YzGM+qSe+Pi26WPMcglvSHXByG1XWOpBXIuxJsR8f92kCbErqRg
	EIrtAf+kiG91b0/S5suw01FKQXl5xXnTPjvVVzEOxVk+/B/EiUm8SZb9XfAbfUndJXwKKaE/JhD
	AuHHof0N/5A1/e81Z6uktyM/y2EetcuwqUeT6hCAQGx3/xpJs7TB0uWKZOEuEiBcA
X-Gm-Gg: AR+sD11I8WH80DcFscZf5px7OzerHKCUy9t/nXgFoA2Puf/b4DcFCuxcQX71fM4fm3h
	O5iiQQvkHwOBOB+o6f/W6Cq3vAkm749y7/2Apqj9jxcUvAaJI9rXlKLAtY7u8iAb1765ZHLi1Tr
	bO9ZnYTEpu+faybWVYzr0BWCdWAzmmCqK7JvIIA4x735o4+zYHT8lk0LUosLlOStP7n4APAsPyW
	XS/681LDQvrQX4Eco0iz11e+obGfIQPusUl1uMzOEcTmx9jSwoz7uti+Ag0Yy6rk6mA/aUqCTtc
	Z7kaZ8zlKCCVh2T4Uds+ChZ/8tZYWT4Rr+xct3Z3rHPH32UKhDyoEvRNyQYcE1S+5gjTKnb0cPy
	rEuiWEnIWMGpoMGYu9ifIDVz3
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr33596721cf.4.1785403717169;
        Thu, 30 Jul 2026 02:28:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr33596471cf.4.1785403716724;
        Thu, 30 Jul 2026 02:28:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bf2098sm45936766b.60.2026.07.30.02.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:28:35 -0700 (PDT)
Message-ID: <0b9554b5-b339-4ad3-919d-afc7fdf77d0b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Remove unused macro definitions
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-b4b4-pinctrl-unused-macros-v2-v1-1-315337a8797e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-b4b4-pinctrl-unused-macros-v2-v1-1-315337a8797e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RgMsO9846koga46yeMmRdLls-0chZunh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX6Vhgg+0ldy4U
 WappEGy/kBus8dggv0uLCPjG0g+oo1+k5KCABBDtBjTrUz277jBmLgzzshjQTK0Gw6XAu6qgUuQ
 b8ni+C7fW/XxxRfl2pIMDJMb7exozApIoz7gwRKeROH2hvcT3G6yqxdGT/rU1pUM655DFB+z8by
 fCdwpz3shHlte13zB1kr96Yp49WX/mN0lrlJJ6P2oJx22KInlMN07MVhHDgn2ARJmdeh7E0aCqM
 lzVeSWj9lwHXHcdP27vWDOGP7OwFGG3w8niE1ONcXQF0OAcJeZtveRLh6AyDKYVeBCB/HksxsZq
 BVp0QV92fgDHpLlF9skXRR9mXd57njBJNhnFtzFXMjY6QHzTG1WnCCx4i8O8Bg7/8vZIlOGncMW
 Wuhn5G+jdlv3LsAfUzxRUoBfii9csVDb/VO/88UlDxH4n1uc8BCfUyIPMRq6u1izBFrXbPMIza6
 XN60tq33bIXcYhoVnpA==
X-Authority-Analysis: v=2.4 cv=eZENubEH c=1 sm=1 tr=0 ts=6a6b1945 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9c4g9-vIVPbi2t5wHb8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX6eGGy/gZ9I0B
 MJhSaiqVxUa5l6aXb0OrrrEHWuPDHOShJ0fw924aAu2AksvvIFP1Gk4soWr9oY+4NvzCSte2s+u
 zJo5ggQud8Q9K8tRiS8causTzOYjBfQ=
X-Proofpoint-ORIG-GUID: RgMsO9846koga46yeMmRdLls-0chZunh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

On 7/30/26 11:00 AM, Maulik Shah wrote:
> Remove macros that are defined but never used, as identified by
> -Wunused-macros:
> 
> - pinctrl-qcs8300.c: QUP_I3C_{6,7,13,14}_MODE_OFFSET
> - pinctrl-sa8775p.c: QUP_I3C_{6,7,13,14}_MODE_OFFSET
> - pinctrl-sm6375.c: REG_BASE
> 
> No functional impact.
> 
> Assisted-by: Claude:claude-sonnet-4-6

Switch to sonnet 5!

[...]

> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
> Remove macros in Qualcomm pinctrl drivers that are defined but never
> used, as identified by -Wunused-macros.
> 
> The QUP_I3C_*_MODE_OFFSET macros in pinctrl-qcs8300.c and
> pinctrl-sa8775p.c, and REG_BASE in pinctrl-sm6375.c have no
> references in their respective files.
> 
> No functional impact.
> ---
You don't need to write a ""cover letter"" for single-patch
submissions, leaving it empty is OK. You can test that with
b4 send -d

Note that if you try to add a single-line ""cover letter"", b4
will trip on that and (likely) treat it as a series topic, which
will be unused (because there's no cover letter)..

[...]

>  
> -#define QUP_I3C_6_MODE_OFFSET	0xaf000
> -#define QUP_I3C_7_MODE_OFFSET	0xb0000
> -#define QUP_I3C_13_MODE_OFFSET	0xb1000
> -#define QUP_I3C_14_MODE_OFFSET	0xb2000

Do we maybe need to use these offsets for something that we don't
support upstream yet?

Konrad
