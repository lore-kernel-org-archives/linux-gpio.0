Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216433;
	b=GIo1Pdg2aUt11yAybEQLbo98sfjV1wkdd8oiOh6ioUWIx5ewvlNeaqZ5HxCMLtnCyA4r
	 8XjMlCR/2mZyk7flNZ5IvrPzV0UxJOn/yv+zhf1thE5VAcOqLOGsfCuD3D6CJLRmun3ky
	 0HK+6QY3av+v/+cIfDGg4q7RPt7gExDASuJDb78nsP9AFuUbn0P3C9RTo+JlEVaex1sR7
	 4Nx3hPiKGw4aHgZtaNVkrEcN/X+n4B1uzHh7rpBYVYX+S6C+3AS8KVMF2sEFDO4m7wTmX
	 4P3xv4DVF1qd91Q2+NinOF//uG2uIT0gC+WicP2qrGlPk4KJZZvaNRjwVGRtSwSvXKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LK8qfR/Aun2uVmWWdIXIFGgyjuzjhTdjWseA7YNgrGE=;
	b=5IQzgem41O59kBQITGWmjAIHyRhW2pv31moANXuDbro5K+Taf41kWAoI+Tk7MyFeTEIB
	 I1BDRtzZo/z/GN21FQpEnfP03/z+Dpj9adVFjdCOH+Nx0KzVri6qqiUPimBRnrjFhSjTQ
	 UiogsSAV8sojVX+RcQBxF97I3PGB65NbKNYy0gohEcp/EsW+jBwURFuyma32R80XNWSD5
	 ai5a0+KKgXmBIkbJhvSuGey/rRnwYOaHRtmvFnABPsTlNF2jdWs991Fk1teeLAmKcZZRd
	 444ctQHq7hqu1GB7TUERsO+7KIRWESALEFM1P6eITc/adPbF/Nzpmm0MWj4JgVBe2rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nkx2J2Ev;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C1v0Stkf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE033606D802
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 09:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE033606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nkx2J2Ev;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C1v0Stkf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969vk9055764
	for <linux-gpio@vger.kernel.org>; Mon, 9 Nov 2026 09:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LK8qfR/Aun2uVmWWdIXIFGgyjuzjhTdjWseA7YNgrGE=; b=Nkx2J2EvWO8oc993
	Du5PQOzaqWqiptZ9EJJD7gqQBEvGbvYneXJOy7W04wfoE0cl3b4nqa3QKC9kFxQC
	bOjm9HwryMCsczYLep+kZSc0OFwPuJP23XZfWHqnM5zudstvO/aPUr08mpSuaumw
	ns82GYZ4Cvcaz1AhVbmepOMcWM/BgFY5KYbE2TJNt/VmtwEBSRE07ELG8Xfnas68
	g/f6v2CNsEqbC2Ln+mtNNZNUzJY7CqrUrUJxut/qskfUdIJb3bncVt1cyIQzfVWi
	30yUdJf5zuZVNMqrIxutX++HjoCJpGC4QbmX+VgFTohQ/I7xtiTLLMxlaCYM7Rzh
	fE6BHw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2g0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 09:27:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so132100185a.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 01:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216431; x=1794821231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LK8qfR/Aun2uVmWWdIXIFGgyjuzjhTdjWseA7YNgrGE=;
        b=C1v0StkfBz/DLErhqGZ9gx8BsETB+rHi/98lWNRy3mjhVYnl5vXA7W24m7tyQrB9s0
         8fM8HzW+uKaF7MnthvPOTCQH3kKeXZFv3llsEH+iv4CLMDfzKEbBJItAWsGhsshX6d9i
         hBCTJqi7O9DhWzi6ltEF2T33TuHJpimBFcSaDCvO+mWhn2qI0K3XKHRNLw4QGNPk0dU7
         olK9Zg31Fie9Fm/D/1UBkaYlazQOm/SKx0McXboEmMlkJBePHnymTb1tMyIU8hG5wMMB
         5fWRYH7dNKWCmcWV37W8od3CRcpGADOjaj+IExImgZbyNRdCTyWVQuK2RdMfqJ3t+Ao+
         CU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216431; x=1794821231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LK8qfR/Aun2uVmWWdIXIFGgyjuzjhTdjWseA7YNgrGE=;
        b=0tV4PtD/AFXXMAxj0Wd910Cm3vkAWbvYpC0g8HN10RSbt5HU9JILWOi7b1doqZJ8+0
         /V/iczBQUPIWcxORW5pGtEp6+aFmSM/70e6gNScZDT0iJMGcFGMjRyrZ+t/J9sYVjd2x
         7jzzWQvpU4iS2MKrDGgcfW39GbbAdLmkrkpMPjccFDL/VYXZbt6pLEyytkDab//s7bMg
         QwZtdraXlTfWUCz8+9bo7qeDsJsFuw5CHf6ukqFn9SB9z7DdG+Im0DQpQrXSXzDXAcS+
         mkcpMAoJjZmr4dp0gvztVHl7KL3k+EXQU4r+SJROFTUXx5f+6jW75HU66sFnvgA+GgZt
         1oSA==
X-Forwarded-Encrypted: i=1; AL+hErEu0nswxrSpeivKzryeshnFw1kRcN3fzTGo6/IdoAeDUuaqSsXoSStRvXM/8B3Buv7CaxTUtrVBKOZ6@vger.kernel.org
X-Gm-Message-State: APuU4Z/4SidbMfYLOWt+Wuh5SYQ31CRznrw8YdOoyco8/y/5wbWkdUhU
	P5GSizAlBKyoIo+52fOfsfaIGSWX70MlP9vnf+ehmEMh4A9dTZC6mQqONOKOZjgCGeDewGJtc3a
	i5LkKXICKwS3B3IP1J/M9dU1dkhGND2F2ls/Jw9brSRTnZXWQEqOvhMizI4KeZqff
X-Gm-Gg: AYBFou2FWOUC4SqeuJDYUz4/PMgbBQUZpSKoM9gmhR0G7/wFvijfF1SfXq1fCHN3zHo
	SBvywodZ8+ZZQdhivLZAtou8+Y0v+c2KurUzhi4yrSyb3EzrN/9LtGEllSZwhM/J9K3yOtjwmgk
	QwHeFbP3Vt0cLlWh2qSZf/UZImsvwovRECEYmvhCWr5vQuto6Xptxxn6XHXdf660UOZJt0oSon5
	qC1RUCgmFOgVE5zSQZKJaTuhHClDpeAP0hsk3xaOiRdHY0Ss2cZt25BDxO6Kai52dHLeuKcxyX0
	xL1yrF6zugC3S7+RduR7rsRcH1LPNt6FJKVcN/1/S5vhJTdPFSYHqAp+C10zjZVM0v0GsvoCDwn
	14yqz6Cwx8gJqh7hiD54UwRZSoxsnvmJt9o53zKEqkj1bbyPwu5XiQ20KphMX8uscHSMAxcSOiC
	iuRBMc/c+J/iakqWPGAlR+EsxDsWe8wOao1KcvqUFfF4RnSsAXrTb13RkO8PgdJQ==
X-Received: by 2002:a05:620a:628b:b0:93f:3565:813 with SMTP id af79cd13be357-94784248893mr446922285a.9.1794216431361;
        Mon, 09 Nov 2026 01:27:11 -0800 (PST)
X-Received: by 2002:a05:620a:628b:b0:93f:3565:813 with SMTP id af79cd13be357-94784248893mr446920185a.9.1794216430881;
        Mon, 09 Nov 2026 01:27:10 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm143977425e9.13.2026.11.09.01.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:27:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Brian Masney <bmasney@redhat.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: convert to subsys_platform_driver() and subsys_platform_driver_probe()
Date: Mon,  9 Nov 2026 10:27:08 +0100
Message-ID: <179421642642.23273.316224743809455221.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
References: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX1Oq546Fy14uh
 wHal26bYUA4qA1XcvYvUzGBxr4mnqVHphA/PZIWLjZn3MrhpbDb/kSXxO1jfgqtHhIAQfwg2YI4
 2Crlf5PkwqH7VdmjH3unsTD+z6JjUc4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfXxVDcHM6wKPKu
 Cx6EjDSiGtryirc0FANTHu37QmfogFGEZY9SBz6aBeRuQEZIG91fFEVi0EcNHregpLGmcapmMsH
 jngEmycvdsENsm1H9Qk6p67tSNyqs3q6gnEgFwevN7lKlr0FmMsGKTxLcyOWUK5EjN0zxRgiKKH
 SK0EwtLaRkknJ3DYCXj/ZWMW6d7DlKWi4lGkFm+Z8GyTWd6RMdWgxcs0mOdELNtJ2gKB3QGMA0G
 RnS8++sep/YOJgyswKmNYm16FdG5noKZTAhsyBkztwihNCJMybQ02vycFLVlTF5Ae+Je4ndMl/b
 uuxYQFXMSoKRt4QYdYEyuXoJkNEGqQpf0vMy5Jm+Pytgzt7p3Cruik99Gev4Xjbfb0qtuo0Ib66
 nl4Vt5atNW4kmXP/kTX99UmMYuz3tucBwVrvMkjc0Z8Q8+Vjg88BHej/zFygnmLNF/SwC/LnhMW
 tbayI2hrO6wK6pqlWqQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af191f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rSSKzaeXPotlMy-fnVEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: l-NL3X7OMqa83K4XRJ1aqdjhQU_Yw1Fx
X-Proofpoint-ORIG-GUID: l-NL3X7OMqa83K4XRJ1aqdjhQU_Yw1Fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037


On Fri, 06 Nov 2026 19:08:43 -0500, Brian Masney wrote:
> Reduce boilerplate code in these drivers and convert them over to use
> the macros subsys_platform_driver() and subsys_platform_driver_probe().
> 
> 

Applied, thanks!

[1/2] gpio: htc-egpio: convert to subsys_platform_driver_probe()
      https://git.kernel.org/brgl/c/fe4afc147b43d578411fda8c360b0505b5b41f6c
[2/2] gpio: tps6586x: convert to subsys_platform_driver()
      https://git.kernel.org/brgl/c/4fc2c9ab68f4324bea62cb5a43e93392225f1d11

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
