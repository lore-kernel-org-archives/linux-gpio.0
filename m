Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DF540097C
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210436; cv=none; b=qSWVxe1PVV0BKqpJVkQpy+k51hsLepknDl8/jtAxtVxYOYi31Xl7/HaoC7Hx1xYaT1/6/uoiIm/37o18KuG5CnNhx2OzrVtvi93LdtXx/nQQpEwTCf0SAP4Vd64R2V9HLbGPXHQPLI1rnJIlIwdg8c1VWV3bBeD0ldc6cIt687M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210436; c=relaxed/simple;
	bh=56hH9Mr+UgEdqN2uGZiH9TzE98xa1M1lsd2ycCH8jyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FLop+Ku81tGD3BGw2/MMfv5dUCV0X/PX2xpj0rhuZ754WSX4XpbFJuG4DLOSDXh2Lv4Jx965C8fJRTwCYFDNhyTCPSPNfPJVp7XnXJ/Muij/4hAIPx7ytAJizsWzinGvcKCM9JYBTBonxqpPYvvSgUqQXgw5jZNyX8Vo9QrDc2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/ii1LdU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1cgNYBi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/ii1LdU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1cgNYBi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJwU42721945
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 14:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHN1NUrzH93BzEWa68cZOrZBhMZR7sIPS3jRxXBQE/A=; b=b/ii1LdU8In87Yl0
	OomwRG2cqCZMELNwHKFP42mW035yPfWoNXftEvucTiqhDa+v0Vec99Sf5jT4l6kE
	Nhaew5xry/W6FcnC13oLOua3UwZaM07fxpVHhm0Lzuuqk4ZOQYgM9o/gQNjcBjQv
	ZfuXcw8l6mQZNMNcJvGPZ27qHyTB/GJ55EQWFUWvHNUDskWUBuHoBysphrayNLy2
	ZKV1SD0EgqI95o9aC16bNtUg/ymAexYz1HBX/M8NMB+493iILJ2TjHiIxTGdKNbI
	bjnJISdG8p7NZj4QZ/2kzWJ64maqozQyNIXwN8AzHvIiNDX8nTKFoMb/KY2tNG4E
	W3KTNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvc6j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 14:00:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e4ba1cfabso43721211cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784210433; x=1784815233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kHN1NUrzH93BzEWa68cZOrZBhMZR7sIPS3jRxXBQE/A=;
        b=d1cgNYBimtNFnELYJnk5lLnVzeNVO6yQYGa0NASG6FvqsQTP0DYc/5G6x4A9cr2Eq7
         LWxUSD7hIj+MSCciwM8FOCyvnLV8m6huzz6j25KNhbbIY6QHF6nkHk+ETMkrcVHrhy7l
         ticV+JoMo2cQCHcmLnmeRaJIad95ofXWhqWut2mbIMykZnIAcBkvMWUb6QetgGDS95t0
         QVYm3UCDATHP/lrYGfehTxoExrTZBdS78+CR/8Qm2K9jfpcgg1rvAGJLtZqYKcJPdHXb
         sdyx0fQAA74gyoaizV+3lSIV0yIplPZD9quCogrASr8gf4QSxWnXLA7TBu6Cs1YAwykE
         frBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784210433; x=1784815233;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHN1NUrzH93BzEWa68cZOrZBhMZR7sIPS3jRxXBQE/A=;
        b=Gtj0lO7eVZa1nXg88+IkawmZmQkSH3NCbiyBDM2Qs/URr2Os+74BAI1K2os1aUDagm
         nluVoQjaTDHuHZhANLgSzYrO9FJRSRYYQmS0XYeDp9JxQaZ5+ebpRXLw7x+lOPyXMfey
         UHKfskWWUqVifdY7gVsK1NLmudeA3ex43d67S0y92V4ZuewsPUV1TYi1wMRqyixBpijh
         AWGsr2X3TQkZ1mD16KRm0uxvtrOsfccfp3rWO5mXT9mHI/akzjJjrTwQs9Nwt3sIwHqs
         yOEaTIjKJHkDyfHT1jVMfqlov67w2UQreRZqMIx0+iTKdq1qVH65KELIi1IsYMy+5VQD
         b+ng==
X-Forwarded-Encrypted: i=1; AHgh+Rri+ujJUsqMEcyOYxYHsNZuZS/fg8tNoqcYsDsfyxN9Nb7mnHuUdeziSRD0IpUm90uhqwH3mSWltAt9@vger.kernel.org
X-Gm-Message-State: AOJu0YwYEaOj69znBNFUZIx1uIbkv3WFyXmvQbk7k/3EpFR9HPLmij3O
	gNDyTBBLf13e6iPoenaISc96upjwSBFAZhKYCkmi90VI7mMnlln3n7j0FWf1zHgqPlr3WyazraS
	lofEcFbFvQMHRBekldzslW0pS2tiepeTfP5W+/UHuTO500OE4rMfWV8Vp/sq9vpBy
X-Gm-Gg: AfdE7clwtiKbicREfUsXshb/ZbPZgLKlLoFx8WgPCwgWYlSwMkbCQ3iPKmII4wvyloi
	OXLqAiBlfQH6JEcuNKvA34+qjEYvqcpArIVNrkWjfK1CHnyv8fIGs22kOUCtWIxkCk+/L9cH4iM
	Yhv46igahR057N7csmKnLWg74srnERlTW+AmIJcxeJ3nizEv8n+rskk2q61MYHa6QnQKA0TEnVf
	EvQbPxKtTIs4SaWFvKhjVJMTs3z24nNoHB26BLZ+UwlWD1fMKwYPHUfWeaa2HcFUQAhRaqa9aWS
	ANAQYlFSGu9UxzF26ppjf32oeVwXMOopWpKRBDNIA1RUVbAYtgJoATSDImY2ueIAtGBgv06WccH
	mCYXQKhknrg6/5FJhBnIf/a7QcQ==
X-Received: by 2002:a05:622a:248b:b0:51b:ee04:5a4e with SMTP id d75a77b69052e-51e4f001fb9mr78303281cf.31.1784210432512;
        Thu, 16 Jul 2026 07:00:32 -0700 (PDT)
X-Received: by 2002:a05:622a:248b:b0:51b:ee04:5a4e with SMTP id d75a77b69052e-51e4f001fb9mr78296231cf.31.1784210427591;
        Thu, 16 Jul 2026 07:00:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634debesm24715020f8f.8.2026.07.16.07.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:00:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
Date: Thu, 16 Jul 2026 16:00:23 +0200
Message-ID: <178421041977.22068.381645557591400339.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
References: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58e401 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eKRsk0K3N-AHOxSAbpIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0NCBTYWx0ZWRfX+BRcOgmthl8F
 a6HdezijGaAniVM5xAF/1Ew15AxypmLcqrAOjrTQ8Z7HstnptJw/WgFYCJhdFttNj+o83qO57gJ
 wpKmTRdtMXsdBO3XgpbtZ+GBaLOUBX9wrbl3rdYxTXtzaw0abhZqsv9aX9sj6u0m8GfvPZdRDKY
 TFrzMu+8CJF+S7OD8iH4k/EtoxrSGfF2YVxZrNuCyEWFdskjCgF74v7EY2IYCUc2dNUHULpz+dt
 BmoIzd5GSEsvXksHsC7NxYi4IMRsD2gJVRIMSR1v2o22l8HCoN+6DtnFgMUQwEkojBw1OVogKI7
 S5ceCYvvPlfFgQi7C3pSuNfAIenNMgrxDdbF64m7bOQ2XO+fb4cMVFKUOxV0D3xhey8BKrmymNT
 d7se0cI1XYPHjxjf70C5ze5wdFMqKjyrEufA2QMcIugVjsAKrArd0VSS4MhOwPmcN9DnPBkMKzt
 svdNhnybf7ppNSxoX1w==
X-Proofpoint-GUID: 3V_JtE04jXI2Wn4y2DYUEdmmUEXFDzhc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0NCBTYWx0ZWRfX2nM+bjrv6jvb
 oWwyOO1N6Ot1/KKrrKfaQ8nz5+N79ODymZQ975jlP0qmRT6a+ESYqAL6Hga9IRvW2VMrsJSl+Du
 BP66cbEL6WcKtwem/ySR4IVV3WB+/68=
X-Proofpoint-ORIG-GUID: 3V_JtE04jXI2Wn4y2DYUEdmmUEXFDzhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160144


On Wed, 15 Jul 2026 18:51:48 +0530, Ravi Hothi wrote:
> Eliza is a Qualcomm SoC that uses the same LPASS LPI pin mux
> functions as Milos. The key difference is the slew rate register
> layout — on Eliza the slew rate field lives in the same GPIO config
> register rather than a separate dedicated register.
> 
> This series adds support for the Eliza LPASS LPI pin controller by
> extending the existing Milos driver with a new variant data struct
> that uses the correct slew offsets and sets LPI_FLAG_SLEW_RATE_SAME_REG.
> The pin descriptors and function table are shared with Milos since
> they are identical.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
      https://git.kernel.org/brgl/c/f81bcaae1edde95c684436310edad8cf849f1f1f
[2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM
      https://git.kernel.org/brgl/c/82c3edf8701154e2768973ebd4c0d2f3bd29621e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
