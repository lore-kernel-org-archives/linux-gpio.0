Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484933;
	b=CFmYi6Elzfr8MLLiLZsW0WZdTrjYZpt0pl0CGi5BGXW3Ie+xKDgyxYV/O9fbkq9W2s+J
	 JMouMN6yKi+qS/iy907O0tx/ifWubam0YqXA+L/tB4sew6Hff5fTqzV6WqoZhiHo+Ze6X
	 vm/uGjglzpWrSIqdqlvo0zrduCh7TlWyM8OC42O/3CR3CcGoG0oYwLR6OfUsz49bKQIlA
	 1/y6BQlg/D8qlZxeUabnWsLX8hdIqyQA4/MTCOJbuHN1MNpzS0TZDgOuywZafm850He0/
	 ECFX7PlRDKJIQICk7KlvGQ5O0uUcDpTI3k0IZVMxfRDQHTAIMhSpKXTum9oe33gdv7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
	b=IqnqPLZKK77TNxWM9fyptn7vx2Epq8JagaY/xAjUgsYvd1eKpEPpLN3L9WnB8OFthTtK
	 aeTTYGo68uLGnqY5ifhQasY3z5v1GPMaWhtiSyAHNRiEAGSikcOmXz2Eu7qshHoBBODqI
	 LL91MVPm0luFYhIqnhcVcjqTvEk0vJGN91zrQmlTIoaH5fqY2kjz2bWaPMAhkf/2O+v+4
	 HNUqH+3uKs9dhRzf2BwNKQZhSfLTNXRslWPtaWeAmscGPrhrd6LKkJ/6qDk1qOHUMMR1f
	 RJYQC7KS65q9KVzI5SWeFOcxNFsG6CNzqknVI1/A3NLRI2z2yKtw3pNGa5hJe3FNUJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkG+4lf9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPPcrtSB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90CE606A335
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 08:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A90CE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkG+4lf9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPPcrtSB
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K89SJ13485863
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 08:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=; b=lkG+4lf97J9M1Jcm
	9rFwU/pY9ta+CZlYP8cdyba734bZluqzXOKHaZVvMjFY9cNTZ3g4N4J27pHDTpDJ
	KGp+pK7du9X4blUs5u0KiwWxGdv7n9oiFYG2JUWfieciXhVlJ4wEcOEYQqdMouSp
	0o53zwQVoZlr7Row84twP9dKTQyPZB5+g8fo3XkXfT0nNo8p5JYcOE0QVSXNDOjQ
	Ez7AKlSmZqHxcwIYaw6PFHkN+N4Cnpkb2xpGwuQaBrJ+aZXToBjFPGTMPQF4vRvg
	fb31HTx8bv9LEbhZTWI54XpwEas+L3AEVhEVazZ3XAjf2qpvt2+KJOXToRmyos3q
	rGgzvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1mp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 08:28:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb1091fffso31030785a.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 01:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792484931; x=1793089731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
        b=fPPcrtSB17V9olGUvvqwdz7mqYYl/1jUJZdqPUQVSN5IXo8QmecFstCzxB02aj5NNF
         T6oHPDLhHvlrXG3hcAZRNX2RBvVPiggS4iorD+HwH+j/mif1P9oxRPJN8XUeeu82pmEY
         1isest0EXYGauS7MnGnrazG1P4rUT6Trhr9mBwKKksiPOiQEcSx2g7Db4uKIX0IcHrdV
         ySR4sEE+dX5WAKullsUtuzJy+yEUkYA2nH32Ou88N3kbhMY5O4Wtnx5Aab2tWp5G+1Yy
         NXtdqh/tGehq5Q+xKXqxS130pnm/83V7TvYDsu/EgRR2GousuXZ8DcnxxXnpVRUQwoyB
         k9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484931; x=1793089731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
        b=XuHAd4h7rlucat84H57rrax5G2Rh4hak5vnoGw33aOdX/ts6lnlhF8nlljOjnhUrbp
         ioW0Cs2YOEVDwMPfYTKbQdjsAeXNYaoYKDbGfi7qMPYrxWLp8wS6v7mX0CxGvTvdVm2S
         GqlMGmD9s4zLbt+cMIJeLeNkCF0+k45ATAOrMPHUV/7UyZO9jQHDJRtorznXQiJxwZoF
         Q0UA8utpfdTj8T6wIgvJ+udxqIxZJyESXAwgRa8UqhRCnYbUD3VRAgR2f64kNcoDrnWi
         rsLE2aBSw2p5SnYYaQswL/JmgM8OGYesXvIibrSpL5ze1khI5dpstR0VkqtVZVfd9CqI
         HtWA==
X-Forwarded-Encrypted: i=1; AKwUvBzknGUiCwb1bIQ/G5wY9LhDz7fiXDUuo9fLibwQChv/7y5di9hYiEti8zfItgVUHKaj9X3dyw+fGNk0@vger.kernel.org
X-Gm-Message-State: AFq9FYLrDeavpZcocgaE184DsPrTy8OtgIArg7Jhd5mqFM45qCB62uh/
	sFW8J+f8E0x0PL5lnq2R4fGbMF0w1Xb4F2uGGggutDnYj+Bya3+pUsX9hvWGKMw5lEMx+Rdr2Gk
	zGdgwKggWjveBYu9NMmxJYENCdlHScbLuYOseYE3Z16Se4NdW206EXWDlKLIX/6m8
X-Gm-Gg: AYBFou0MT91RmWLJSuNW0lMYYKagr6m8Gv7eC84v26KwJkro6/gDDycZBqaEMSEIKcL
	PyEdUNU8JjKErKNXiTp0pHaiFUHtpXlK0PWSrk3XRkavCu/m55bhF7FVCKVD/rRUbNGJkcIv06i
	HFkyY6qYV05GHS0mMCEtbnuolJkwfLCukGJ6fW5+Fcs6V7dU+7aZuPgwYt3nFbqPQLgQ8WCoJCa
	yda4Ss/iy8f1WOyQX+3bXftK/bLou9wP8+GI6Ej9+L529MFct9Sz4kapYcT04DRtdoU1j5rArsl
	tt7CjQsgkCRBng/zjaJxEUr0ZOqcLd/vmRI6btQ4cn/3DB+5S42vFcyG/cx8v6FkowJsHZCz2K9
	OtpKQmY5FzDm4BTMA+xZESA==
X-Received: by 2002:a05:620a:3190:b0:92e:6485:f640 with SMTP id af79cd13be357-93f29d216eemr1869318885a.4.1792484930902;
        Tue, 20 Oct 2026 01:28:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3190:b0:92e:6485:f640 with SMTP id af79cd13be357-93f29d216eemr1869313585a.4.1792484930511;
        Tue, 20 Oct 2026 01:28:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm5026181a12.13.2026.10.20.01.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:28:49 -0700 (PDT)
Message-ID: <ec5ae206-beda-42d5-b152-91c457218374@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:28:44 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: add Radxa Dragon Q8B
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad72643 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6_vhy4Ov9suG7DV3KvwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX4PlFbHtZIpe1
 zhh2OkBkeqM0r7OFb+Jk7pGS0N6cHD/TskPBg3Gh8NDoLwWrcBXOkwMCTxYjpLaOWVWcvgIaOpD
 YHcusp/8dmMBuHiiJ0kJKuOtIeIx7fM=
X-Proofpoint-GUID: hVC9rMOWTk1iFQ4XtFlqJeVR-XVp0NRJ
X-Proofpoint-ORIG-GUID: hVC9rMOWTk1iFQ4XtFlqJeVR-XVp0NRJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX6Bgr00DytLvf
 gjr7iG2dx7+dFppc6gyattT7EaaZHMuh7105ezHou4Idrm8vOv0NJU1G9INORyDaWofoF7J9+DM
 B5RZgwlpn790vzL7lzDpuV101pqDVg0efjfON7bARG/G2cUwvhMPkUZgvCY8/eAKEHYyt4hjxmR
 nwhqe52Af6n8nk5D+JOkPWXdB+PTiV3AcFCZo1y8CFNSnp0mu7BTfxNtDxZ55HL10Duw7ZZIorO
 0vzr9gkDWf0TkE2+ETp5W7ZTGBeLl/F3KYAJyO/3Op537xJEdPk0ywicuf0ffTiVNJnBZlAesAy
 ixjixW2OHKvu9OCIR5nNi+KxktqFsyb62zm81d+Ky/XVeKlRC+u7JU0OhZhpGPDAJCQq70wV7+e
 LqsN3+T6iOqsCmfyOR/+ywdHXZmjqxx/2asehEsC+LG4qn9G1b1BLbYq98/M+qJUUKvSBWBdK3U
 ZHbuUGwLT1qknI5yOkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/9/26 9:55 AM, Xilin Wu wrote:
> Add initial device tree support for the Radxa Dragon Q8B,
> a single-board computer based on the Qualcomm Snapdragon 8cx Gen 3
> SC8280XP platform.

[...]

> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";

No i2c bus and hpd?

Konrad
