Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB75D4756C4
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782706; cv=none; b=ciw607J6vYnaq47JxURsVqbvvshvi7R1Sb2rPCqKjKUnjbikaNi8Mk5f+cgDJ1M/+dwIcmBotwflvnNlJak66W8GMy84iguOZfzalnFUCV92s7VvgLiwE3U2OSlFIDa1eg0Yy3xNBy6OBpPXEV2W1aYI5APdR2KsWyQ9HUoyG6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782706; c=relaxed/simple;
	bh=gMWErXSYRc5v7JBT6ywk6kOtY9nHKNpPH1IBdR78J4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5LWA7k0lchTMGGcFiMJ3ym+L0ghmwlD3Bed5wQJi0jngqRkPQONXfKuCcRKPXQMSfZLOLFlURtm2GRWvytgBXLL0Vf7TeGdOruU/Ppnw41scPjpjG/HqRXD16jbpCJTNkST2y41cD8KSN9L8TGicEZDA603dd5P+8tgmkQpnp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=op7VPV6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYIHepnp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="op7VPV6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYIHepnp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmrBF3872680
	for <linux-gpio@vger.kernel.org>; Mon, 7 Sep 2026 12:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bVgKgqOoFXytrZYRxPyu4M0vvgU1+iefS8c1X4FLYD0=; b=op7VPV6NmM8jKMcZ
	wMx7pL7Q+WP58EWAJ3qDyW5Feedf4y9JHQJjKBu/oeHqpggNUWwOBaBeSPnU9wR3
	fv0vg0FxhsJ2MOH4cAAayVvl62c/w00YLsQG01m55J2fGKIz0r/7A7SG9OdGVI8h
	5IslqqkrXnAP+ntKPoJxl4UG8RmBLnxS4EPrGlWAtZFFc0XZ5a7naGBzCurBhW3T
	LJQHe/SA9VaPFWtyA3zgSArjJd2eb3E01UJvOrf7aWGo0U7lUBdjlfWzsNeM2znu
	9yr//FvaKM4yjKhfCYp1zBQqr0yJMKGivF7uajcqkYPWFdeleBNWPCTj+Aosvnj2
	njGDIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1wfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 12:05:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ea38b1e7eso7935641cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 05:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782703; x=1789387503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVgKgqOoFXytrZYRxPyu4M0vvgU1+iefS8c1X4FLYD0=;
        b=QYIHepnpsqujDRnsb2puiA+MvM812tzmVuTI0ztuSL/ocmELtKsrMt+tlAESBgOgVQ
         RLgykWXqD1mtWIeZkpq2nDOKwEjZf4oqxnzGV9SEAOIMIsavp91M0FnuzSPDniDC3BXX
         oqnKaaxGOHGiSZLNYbcRvYlGWLYvUs6PFgPzbVedkd8cmgnBwCu2YGfg/o6NLRpJl4hD
         XKRq9b0mVjPwP7IR4XTaTaLFo/6rNAZ3wxQ1RwCe8yHTHp9SUBnI9g8LHE+f/fhrGFdG
         anU/DAXO4dYFRG2d2gc4xJv0u3EFsdqpY6GIc2boFYGSDZsiDRIftKXFd7qUx3BG+aVm
         E/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782703; x=1789387503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVgKgqOoFXytrZYRxPyu4M0vvgU1+iefS8c1X4FLYD0=;
        b=SSRWeYVpZyYVVIiYFVULByLk+QVZ/sgsHoD9EXDHKAGZFq2D4xa/sSqpkJlw9jdJp+
         rJq2z5IkNeKP/PYL/ABDgkk/meZFVBwvQ0cIZsv1J91hVQT4InluSkANsCWvFG1/eq9F
         kM3bq/6xWftzVP0j/AqdSW1T2UVwgtBtSWwD/M0mjHqjI25QMxMTyrffCF0vNWQTmXNV
         giJxrML/0HFNSbXsIeG5NtYC1j+rPn2gZQtA1YsvZSVkjwbtI07+KZTiqEmco0srJGSu
         TcJ5voKr/BrUDXSDabSELRhG6ysAjkCdSJ9OOFYtfx/aqh3o3yZFeH6/jtcWCu/XIj0O
         VJaw==
X-Forwarded-Encrypted: i=1; AKwUvBxXjZKGNUg+NrL73H3JheQlBrApqh58haub5TmuW9OoPyHffn97Fz8xI2iv3EqAi8ErZq8CG1QN7JSj@vger.kernel.org
X-Gm-Message-State: AFuF++km1D0Ee72Ygvu6RvqyIfwsCaBiPmI5tM0VJJ6lNqfysHuBnhqu
	3p1uL1/AjbTiK9Z0ULn36JW58umWvRdRnE/XYqi1RjFl/MiydYM2Qd68t/A7u96O6eKUoZG8nng
	+kUY+TY0elL7+NPJTrHk2YDU1s4tn8R9hGUv2rWXv5jo+PqgfA9hH6S977K1h8meZ
X-Gm-Gg: AYBFou0dds/HFMhnTlfBafS+MnKKb8pJxUXy/dnIy0YdahPlRQR28OKVn0Vk16jPd3/
	orINuNZiIEUz7uYCab2FbP33WRij72XeG1izGFag/PSPGbyz4L1sKpw6iuLgxLL18WgcaoieR5c
	j88OM7072+xaE14T71frdW2bXeauW5rk+5ISQKC/o4py+yzP8zkRfGPseBjz9yTxTjBuM6UB8DT
	CAxwMY50R3C0v9QyupVTkbuxYrYzcdRdV9sjT6L013SZ0rjZvqhCLOycZUWny3WtU54oFaRLsPb
	C1+H++c8/Vw5EX57HDg8o6qP+CeiQTeTtCHN8NrIQGP7tcjWpTKOun/TdpwQUJNZ9lCfFp98axo
	ZXXKDYIr4rD9KuvnBTGcQaANIagtHB2d0tg==
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr130309961cf.2.1788782702926;
        Mon, 07 Sep 2026 05:05:02 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr130309241cf.2.1788782702399;
        Mon, 07 Sep 2026 05:05:02 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm205136585e9.0.2026.09.07.05.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:05:01 -0700 (PDT)
Message-ID: <ef41a092-cd83-4e65-a16a-7a8b838bcb63@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:04:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: muzafferkadir@mainlining.org, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfX94YGCpHlvcxY
 ScpApJyyjzWDa2WLiU8xxN3LbE/U1vPiU9c1QthYWAU+nM6u7iP7urMkI/VqPQ1M+SxMTg3sue8
 Hd6Tknbqi6PhT12288SEvuG4ZeLZZk2PE+r8giQH6f6VuolgL/3VDguk/ILO99Vun1nkm7MnbF5
 0L0yXjvLv63ukJYFlC4HM6Puic/EWoYkz2Ttywn0hSVeY8vrHf4+rjEnxGBlYYK6PtB69/c6KuO
 hVcxi9ex/OoVzZvHXdEiZtWWOTCO2ZgsCvFhvKrkkMng0EeN0dtBb3x8p50ONYjO89tFP2CsRJF
 oGku5AZw3MFPKqGeobyP/aaAmSHascZo84ktLrU55T9CFDPr/drtYP/A3T/89v0qU6/vrKf7OzJ
 eONil3DYFLVAQf/Ap6WMi3T2HRHcNJ+4ZTICCfF9Yj/TLiRRpYZBYtEvI3CEwQuJWTIOGQbleek
 qK5TOiDQUOtuv6TNyyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfX0LnO0ww1z/Fi
 uEQF168i6SZda4CBlTWtCnJUJmt/wzUQkQmJQZmF8SksQf0eRoqQ6J2zWW4nQmCs7pjKSk8vAX8
 Vpm/wc6tIv0aisFP9+MYM7Yhu9U7XB8=
X-Proofpoint-ORIG-GUID: gyfV-CtDoTPgivHb3UtKiM7yKbUhiti0
X-Proofpoint-GUID: gyfV-CtDoTPgivHb3UtKiM7yKbUhiti0
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9ea870 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OuZLqq7tAAAA:8 a=7cKmDxSfVGQto59j-ZYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070133



On 04-Sep-26 14:55, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 has same pin count and similar pinctrl
> functions mostly with msm8917, but some functions use different pins.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

I told the robot to take a look again (and again and again
a couple more times until it stopped complaining)..

The following feedback is meaningful:

Hi Muzaffer,

  `qdss_tracedata_b_groups` advertises GPIOs that cannot actually select
  the function. Please populate the corresponding PINGROUP slots:

    GPIO8:  mux 11
    GPIO9:  mux 12
    GPIO12: mux 12
    GPIO13: mux 12

  Minor nit: use MODULE_LICENSE("GPL") to match the nearby Qualcomm
  pinctrl drivers. // and checkpatch will ask you to do the same

Konrad
