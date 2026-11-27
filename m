Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769320;
	b=ACUNAXonvPffOoKOMeUSbjqG7lJT0+FU3kdWmrtuxE29LYKTTIdQCkrAggkOLClvaUMU
	 qwdmhpvcj4EudSjrPXpj5Ht93OGDeq5nkJi5Hz8K0D9RB+Kco+xYPZaUkzjQhLtdh7/n/
	 Bm6HJRSqF0siWzaXaV76zkl/qwJnuKsxBtjlElkJahEbX3mAh23DLV0z82ls7NdrFzmDT
	 7xAxEukaquryew6wETsl5YuNegtyylW2OfbJ75zeXtAQfKHGjtKwfs65+RsxmXHLHtoLr
	 gbIh3CJUFXdQv/CyMVhR4w4s2VngAPC8KOn7rBVDmzd88cQ4Uf30PDjCddqtbBhsvNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=;
	b=VlABTNiF53ldvwsz9SpuLUoyXxb3MfsEbDFnm/romGCz5SzzVRP7SFBTw39NNoRZTlJ0
	 ONMsWAlHkYx7lULrt6bnYWqjJ+a/gqYqVbCdBKqg1JlEDzd8urVlguIn38My4IuSvpQWj
	 JnPt6YBwyTO68F60zUut4V5bTywmvZBIoB7FiAWFcI6sVRzTsj51FRxdufKP0zk6cZa7L
	 wjgzYyHsoVgVKJHhh+OJDmalYIpWVJ6Va/EyQbq5NObpm3bM24yCFGzgvnN90g3otaYxs
	 HdQNDo8A4+Yz35mEt/YDf1+1U3lj2tts9W1W4ZlBfAdLOoNzZZVASpTrcN9Q6XX5jHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nDWie45z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpn51e5y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5EA606A32A
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5EA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nDWie45z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpn51e5y
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GcMb3983857
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=; b=nDWie45z+VgVQqd4
	nUeWEVlwdo5nsqhqz95Gtsyi2rMbw6vXTbP6nIxtj5TV+6e9YZLtZY9gHyPoHPEO
	KbfEvWjQlpueeOtFTNH2alYytLersTNi1+DoEYtFbZtbXCT0fkB88sFna4env2DI
	SMsFfWlwxR2F4IX/AK9zyntjqCHZelREmztQq/QxN7nz6kFC6gykEM8CG4jeXd2M
	JrENzts8iiLBXQQ0NYURdNB6SAYzr3Zbe2e6xmPXKY91PrL+wHQzPQjwDFq5LZIv
	GRnGv3hOX1UUbKVhWL1J6ODzya33rqbL4dWJCTBvCrlnNmWF8EBDkkxeRCJ7WRRC
	uv09Mg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a4ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:48:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso1322352085a.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 00:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769318; x=1796374118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=;
        b=dpn51e5yozIWHhXw8iVTYLW9vYNyw7pFOkPMEqcsXupjYBZ//1Tc0z65XzatxTjRsX
         phgJuyZ0Lzfb3/W/ZY+tt/6cQ4cFpHaypeIUQ0F8ekIt1uQ33we+CoK9SGLFNGD5aIrY
         VxK3sooS9uUFR0TSG4jrkZPn/Gao+clfCy0c3FmkvSgdX3Cgi1Hy3gjYnvjRr3Dr/A5c
         DuAOCVh8RAn82ZYUpfla4wszLBFv63ZCFBJiQdDurtMYoJkcL8J2tqemRxE3ZWubQxpw
         chJy2s0KjqW/V3OVtHj7lSoErGjp1HeAiZl5wRscLx/iNJt0gEcyvgOwlMO00roWRdAN
         giHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769318; x=1796374118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=;
        b=JOHzHGMR7t6Ob9k/FlIVejQ+YOkpV7ooLve0MCVTgMVYgI6KE9AXz8Ze+5bzR+2Iqi
         IhjxjUd32shkxZkhC+NMIP8zqAwBE65nX5n7ee2ctOdlqI41k8x3MbBDNP/Lf/Bo2eLw
         +rB51c+hzlCGJLu9338WvLWVpPsHmWirGBeJDqF3Z21TMEt/6xWlarlRBfdE8cvtWKy6
         GTundYgxkiUYu6pF1ECkRqHXycNr/4A6bIDJkSGHd4uel8IoAtNTjki4nFNezMsr4Q3D
         tivKuMUd5eC2T/BlD5NMi7Ny7NZ51K2ca8fpVnJm7tf4O7L0/ETemEp4GC1zfvysWNzN
         6JtA==
X-Forwarded-Encrypted: i=1; AL+hErFaRd49CEQ/MU4UH11bveI8WnP3uCp0qqYir5LVjWNnL2Uyg3Vyz4LPv1lTjywFiceu24c3mZLgj1y0@vger.kernel.org
X-Gm-Message-State: APuU4Z9HvCXIpLh3GP8pH7h7A0eJXsbp57jihX5ANjfHUuGsb6BiUGz7
	h0M44IgByzEAwYygZ60xITHab5qNeUNfPbT6yrZLh+p66LdWTLgKN3S0oOSgVV+aLiCHg0vLAJg
	QjmDlNxaIafxIhGeg0nLVZUSwoEmWDFmQ+1USNeVRq77lN3TS+dIiW95lFjnGdoHj
X-Gm-Gg: AZFdTZe/tx1ay7tmzoSlg34s7QxPJG5l8mxPKBVcmJMr6UEJZwJsDLgaX6omNnDH7JY
	YTo4V1Xch7t6w5qmB53kvb4pJkEQ6oC5CoLHNmreSmSW60dgT3c+VB1ExCprkZDrBjqu4w9Ve4r
	j/71qcL1wdVqINIEAGZjjBTkFSfJqBMXF1IyHkUjp0nm6BC3ZNLAzPsjQYKADRkIG9hsScNFrGe
	XSSKo9Zc+nlBDXVEzoOzucysllogf07E8Y3JgZV+bBxPcwzKR5g44hOGG7hrwuSgZmdqWLUkYrK
	aihJR2G4Hp9W338LSuV49SzdKTvTcGyC48N5/Vv5G8MzbFPSs9SsDi1mBPm2zFo+FOZkfeXJkdN
	z41dZeNcv/zVqNKS/WNqVSs4T9vitpEyz+7Vg5maSKVTjg7yuUQ7XPcayOrdgpRu4Hd9pkeeGO4
	BeoSp2TIM/DEUq/K0V4/1pkn5sQbyXtjWjh1U4zcGtDKpwF60C8nMFo9Tr+Vq+Vw==
X-Received: by 2002:a05:620a:1329:b0:949:8119:6702 with SMTP id af79cd13be357-949ba8236e3mr3942709985a.10.1795769318305;
        Fri, 27 Nov 2026 00:48:38 -0800 (PST)
X-Received: by 2002:a05:620a:1329:b0:949:8119:6702 with SMTP id af79cd13be357-949ba8236e3mr3942708185a.10.1795769317869;
        Fri, 27 Nov 2026 00:48:37 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm698492095e9.3.2026.11.27.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:48:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Sasha Levin <sashal@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: shared: restore the atomic set_bit() lost in a merge
Date: Fri, 27 Nov 2026 09:48:34 +0100
Message-ID: <179576929354.17776.11182158061067630768.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126231704.1303448-1-sashal@kernel.org>
References: <20261126231704.1303448-1-sashal@kernel.org>
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
X-Proofpoint-GUID: kUjcaFj6ECsWh859GlKHibPEFJNmdEn-
X-Proofpoint-ORIG-GUID: kUjcaFj6ECsWh859GlKHibPEFJNmdEn-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX4SD870uG84hh
 pEV59he0x95SbPtmKOR9cazZULFZN4tVSx9ENUskvNtdwtbVDshLnRV3VScdGNsrkhXbzvhW0sK
 LxLQ0zepFdqERDcDnhvzZsRyhtFrRQk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX7lAZBK+r/4wl
 mLY+wLBQCULOHpC1t5Xv6uH4Ah+miqaDKKEJ9N0dNwllEEZZipHTpfhTemqZGNCCvzoaoEud8Gd
 XMTIRHPQbGXN8XSZiSzzw7C+AxXEQMOVUbS9AzLsYLhjXWvonHrgO2sJH2D2xddfcUz5YBVk2nf
 Eb6PNzOh49EV4EiwISr/IUWTb2GWrzeASq67hEuRLVa0km8m+jm4Qg9NqjsXq26qrY4FBnqa32L
 xTYiPpQl/ZmvQ0FauvcL0GkqONEVAWLsbxsRZAszZ9EPpu5IRUEP6UqdjSugtG+PryEiJno+NUd
 ygIQiTGUBWt3KvOcGhWUma5eZLmJ1+3QtqvWwYh9OvJnhBJtP8W8dCiiGV3mCK3psTTG7f86MkK
 2A1EJZ17/XT9V07+BLCMWf729qkdgzSkUNwtwiemcM5YEsUJp7PCqLkuETWm0aplsmk8GOCNi7K
 gJfLZEZyQiRqkQl7idg==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b0943e7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dHVLDEzWKCGuJUyMAcoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034


On Thu, 26 Nov 2026 18:17:04 -0500, Sasha Levin wrote:
> The v7.4-rc4 merge into gpio/for-next took the for-next version of
> gpio_shared_setup_entry(), which commit cda42ff53c4b ("gpio: shared:
> factor out per-entry setup helper") had moved out of
> gpiochip_setup_shared(). That dropped the change from
> commit 7d1d799d6251 ("gpio: shared: use atomic set_bit() for descriptor
> flags"), so GPIOD_FLAG_SHARED is set with __set_bit() again, and merging
> gpio/for-next into mainline would undo it.
> 
> [...]

My bad, thanks for spotting it!

Applied, thanks!

[1/1] gpio: shared: restore the atomic set_bit() lost in a merge
      https://git.kernel.org/brgl/c/838e2af4fde3f180abdd0e4755be078be7e132a1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
