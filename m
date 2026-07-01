Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C923BFAEF
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892348; cv=none; b=dHp8D7AY3y1z4SSKaK+EzWNyxUTWw/9i4aUfhQuVRgVBRdftXCeSeOcJXxJJ6ZtF4aBXui41tC94cLANf2gH0likb2NYy0Vomm3Oz+C7Ihu1y8LvHeuQKrd1rjy2Sz/L55LztiSqecTJZf67+yrckKRlA2abzxWbw9UGgTXgIpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892348; c=relaxed/simple;
	bh=XX9+R41IO2Waz3zGfCXQCa/MiWGzIhUUWvcGbPET3HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3QZOUJyWYZCKL1YZ/zTcAD3uxLyN7LbsYhWlotOFF8+tLKmje1eEhFI2xrLmCo7+doL8aJKSuLiq0BTJIviK9TBZ3e3JUWU4IZ+rx9v9xCOSUN1EL1FoRcEDOf5O6Kl0OooeuPBoUbfWIB2CoO4i2JM+lSBWdAU+nFDly1tcjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJyLHyJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBfaJq/m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJyLHyJz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBfaJq/m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lRNJ065867
	for <linux-gpio@vger.kernel.org>; Wed, 1 Jul 2026 07:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPg2mmrIjGtehWgW9WQsfatVGe+8LkRJPKi00NnnNrY=; b=DJyLHyJzqpZeyj+t
	F3DOIOjQW8UYjMmnGpMkTdsRPKh6IikBpBePlLH1TxbNlxLWLBP1cAR8Cjusx965
	JTMRZW8t7Vdgl4MY8Bp432A/Ex++vazJszT5d3zobKpXUTgKsW5E2CANeiA3K4GC
	u2o6h4RUHFXoZbxZrkbJX/rArLdpODLhtvtEDp3NN0gmzoMrY3L2BbJfNTCWz+4I
	pIxHScDr7e+f963vYAENp07x9TRGb9jw99gwElOqlKWJdFbz6Lu0s/uI8nrXx3Wp
	r8Y+gv7rWa5JlU+MMdEvFbPC/+3yYJi/WH9QBAYhmw6hMvhXDqu7G3Pt1lhN3LlA
	u3jQQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqk0qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 07:52:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e66f9e2baso35297585a.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892343; x=1783497143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPg2mmrIjGtehWgW9WQsfatVGe+8LkRJPKi00NnnNrY=;
        b=FBfaJq/mdN5nVK7MN7aKVBD3Y9ltZOxbV7OwdcB4/SW+RWAKyk2RVvxvsOKC9dRsqb
         C4xq1Z3U4zz1yWj2yISr7XQS6GxMVY9Yv0LvMgfECX7BwelijjiMNm/zT5OW8Dt1U5Gs
         OSau8hj5lK3CR3J469ADt4NnhchldKcE/77A9TP8mfes7yXw76dQOVANrnporHp4TeKc
         Ap1kE+aWvh/h+RF+qnBNHAHSWxETCpeIvdkn90NlLSrbCh7Jl9WPdFMhhjT6FrENx2+S
         MzaykTDX/QsQkt7VsnaFs7GsuDF/zYswPg+OZqT9pmxAiDfQxZ2tOVXqomZOgtiBpPBX
         04xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892343; x=1783497143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPg2mmrIjGtehWgW9WQsfatVGe+8LkRJPKi00NnnNrY=;
        b=Io+RiuZPrA0JcaKFTziYp0Tif4QZiPqLUXK0zYMKWJICAXGy9J2iQYj3Qs4v4PBiG/
         kBQHvFaicGWBr5/boavloBv7NX5Ero3vSfmwJZ9KuWs/plMAXdmoyN66E7AF+cSNc2yd
         Ro5iLLHf2IppfZlPYav6/marK+ILT+IDvThspCBlHFJGmybQsF7ZBcyP9MnNCkFuXHuw
         do40sBEJtG4xbuW+akQdYCQFL9aihzO6aPHndNiJuTa+8NHvwxm13xoLkara1VW67lGV
         oFCoeXYNDvbkiz3S2pAQWz4jxULhUXa4+N1QQa+8uHeoMLjvkneMiYWc/sT65ONMBAuj
         GRCg==
X-Forwarded-Encrypted: i=1; AFNElJ8R/QLiShsJShBvM8H/xsUIXfg23l56wqd/WCxFxlg74jcia50XDeZWGeFKoYa2MD3kQ8qRoovDNHFQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwpzpZd9HfDK34MnPALKzVzFiobn4HeWlOUxhd1yywKuQ7p7gJi
	W2Wq0UkdtNX/ULXKgbX18pgr5kY7a40CGZKPCbD4bGsRnnaHS6hzNMT3dhMk/Zw1pGsfdB8iX/z
	Wr91luxekEpl5SyaS1Yd+dGw3JHIRCmX1E+48swlDZCkXOLEaqaRWPFu1L+j9SSN+
X-Gm-Gg: AfdE7ck7nLhMbC0Fk6PjRWv0StehUlCae7V+UGNZZ/QllBvjF7zg9rymzOIDf+YYiq3
	+wq+yj/XLI2o2MJW8SZwt6odxgDoNhBn0Eq64LPe+1RSdqrPok2MIlf6KIYLfvQW8y/Gs8vm6Sf
	g9/LJJrI41DlMk3keuDfBqg+Y28V2xHUExOEoet0Dh2t77HuPHfRrBBXradklrkcg5RKOQCgcAU
	8aqpP2TjnRKRco/c6EZPIkmehLqNFrgbOQ6xKCfhHOLu9NHYcN2UNF15fdzOGqlgNEM2BtTKkN9
	pWNKvLbNXlAR5K8VyG6en0Ms4OWVEV/fk9DU6UngiEavEhOiG9LY/c3MJaNolw3NUoLUBeplZ2O
	X9h0iUNgpLgPtjxTiS+HdBhpxecIeJep0u7NOAMo=
X-Received: by 2002:a05:620a:6497:b0:915:b852:4361 with SMTP id af79cd13be357-92e78227432mr76176285a.20.1782892343585;
        Wed, 01 Jul 2026 00:52:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6497:b0:915:b852:4361 with SMTP id af79cd13be357-92e78227432mr76172185a.20.1782892343039;
        Wed, 01 Jul 2026 00:52:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4718:fd49:e3d7:676a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be45f244sm64974065e9.0.2026.07.01.00.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:52:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming Maili SoC
Date: Wed,  1 Jul 2026 09:52:20 +0200
Message-ID: <178289233634.6073.9735895489826233582.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
References: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iQzUVTnmUAgw00uMVujcySyqbIBoeNvs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX3Db/CxeHWsrJ
 f2TNWMf0TurV01x5qOfcVKMhhoVXyiwRLrcayguA0rXl8w0CURp69AkIyyzMbzJ0xwjgJEJ1yFy
 BL7KGWkktBTXQ1SYjiemwUg1qLLVoHa7Ct4MwKnOC3uO4K1RpnMZIXt/DB/21BU29VFbXk7tILq
 sPBVFBoqtMyvbrV/7h6VPG/SLt5UY4DdtEdeq0dNEZvLs+TPXRY7LC7XNgaMTqDVdtiF29uCGTv
 WBCJzsa3hn4PG6Jfoh8cPiF+vD4Z2BLv+T412AOmkOH2kb+AgTZ+kchsLDipk5gqADLJc+pxqOH
 rU4dfLyhX0Iy68ZNAnsB5kBuV2SbeWeb5B3gifXF/FMPdpJyb0dIg5F1oztFnDYT3p25u8Mp+VE
 fccqTA3c8kgKFrIGKZeawGw60qOb96qP360nl/7Us3euBuZQtVkM3kQAUbbKvmQcfyoOOAlplqX
 CFq3y6DlMot/VVj+Umw==
X-Proofpoint-GUID: iQzUVTnmUAgw00uMVujcySyqbIBoeNvs
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44c738 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A8WTr56GNT0h8z-4O7wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX0gtQfTXtFYEj
 9+l4ZQQ8h5w2o1iEM0ossIMyaK5NKd/eqaIG7/ZDoqla7HdaZvEuNqzDTzW9be+RRy9fRlNiRVI
 tELfj3E2Kyou4+BuRCFPF2fjWS6yLhI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010077


On Mon, 22 Jun 2026 01:35:31 -0700, Jingyi Wang wrote:
> Introduce Top Level Mode Multiplexer dt-binding and driver for the
> upcoming Qualcomm Maili SoC. Maili is the new mobile SoC, and its DTS
> will be upstreamed later.
> 
> 

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      https://git.kernel.org/brgl/c/e95f2b212c4a8ec422b1627e36e951e778809965
[2/2] pinctrl: qcom: Add the tlmm driver for Maili platform
      https://git.kernel.org/brgl/c/251b53103a2e5770658ae106c490cdd2b7512c3a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
