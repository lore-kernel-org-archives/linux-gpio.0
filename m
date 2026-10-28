Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176384;
	b=ep7yLdqMpPwk1Z8v4zHJJd9lpVoXeH0CUfHK26jvDfGT7erIwXTZme3O1Eo5wIxSMJ+j
	 Mlr15eEneh8z8LX+A0F42duV6x3e9pUVJ7t0/KLtD/xifIhvfZbxQYlO/ZhQ1Gvn8Lyy3
	 pkq7YhyAB8PkXruknLxl4OKMy5uZo9HPh6YtRWE82X5NF7jGdEbO/x2uRfC7GIa4zBzxT
	 YPc9kPirPGDJYnXdMWmbPRdV4ezuNrqoS+OCYslHnX9B/JWAzQX/WAPx9xKwp71LNhA1Q
	 8WY3ZbNTFOoS5tVSxTCAPdwg2PTsC/L25ue3X9nyD13wXQRkIgSr1zOFuYXUXnO+J1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3g7lLq5xhPax1nntmOLGNg2Dkzd08UjGGHsD4/hgZN0=;
	b=Z73SeMjPiUaXOXCq9WowpZJrjwDYZHNMTGRWtlGTcPll3ZuP5TMmbR5BImxgc5OJaDw4
	 TjUD2BGPIVSOS7K4ZNCgKhs3PhkByUEUiQ1+8dFsy2/6RswF+PgjvzNH2pU1KEStXWuW3
	 iWoRkxNxXYwv7xP8e6Ls169wSdHRiUQDyzAXS+J4Gs68KLhKLSlbe6SKJkM1WpH6mw/k4
	 hSTGQYqqS/FOvBCkmODMgY/9KP6nv/YtJaHVJzW7wnSDc45YIl2SUI+SHcU9OQZoEkft4
	 reohYl06ylayaNbAqVtkgLiTt+4ABXq8b5EdHO1M3CQV/Xi+DDsSoW9ueIMlt7CCf7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncNLjPbz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdI+rD4C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C56606A32A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C56606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncNLjPbz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdI+rD4C
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K425065999
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3g7lLq5xhPax1nntmOLGNg2Dkzd08UjGGHsD4/hgZN0=; b=ncNLjPbza6dr0wlH
	kv+T1dd64Cp/ETy3h6mex1da3RFmHlVvC+c4BkrCMyWSmngCaJ0CJGppMrAe9WkK
	DFxxrNDKjpi6EIfLjqLFg1LXF5kCGUF48rTx0xYWCOL/wL+tA7TrDWsLkz4SVu0H
	ZVpSFK2eBzGqL7vi8apNaEf3LYn9J3mnA9DZSkH7ih5pGdxsETApuvD5syDNh5oF
	JoQjNZptJoRvG4Wfive5zwnJTRjcYH4XCfTgYBVRKqFEjv9eHQ45BwKTQK0KGRhb
	iwDeeDPwNvcs9tVaYKA3POYeUgdwnXRF861eg+4EtEs8vjMaczppJQbjLv6bBnO9
	a5GlYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g381j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:33:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535066512b0so10338321cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793176382; x=1793781182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3g7lLq5xhPax1nntmOLGNg2Dkzd08UjGGHsD4/hgZN0=;
        b=BdI+rD4CnSj+6tFiT9MyilSYZLen1oheUtqTZrXzeihwrhKp4PXjhFC1XU+B/Nfc/t
         nkzi44RwLR7b+MMQypgPYZvuqI5uVq1fGYMSkMeyd+TR1e0Bir7jJD7E72tr5YfcqziL
         xyQTgGXiGPTWjQEd84va+RR5MhnpgueSiUI9BE9hadMpUrOD08XzEoC9TqLk42sZVoW/
         V+Pe8P+66LGMtBxXTnpvQYW4eET6gCtWgnHxOBPRmbEWQPb81oqH0yzReEX73C9eXhKn
         UiHSMjDsz1Wrl2DLCZnJToyjvTItcUMLq2YR2XuQcrS7fIC+pasPZWyx4awGTxXvjng1
         sBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176382; x=1793781182;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3g7lLq5xhPax1nntmOLGNg2Dkzd08UjGGHsD4/hgZN0=;
        b=lG9O5gGSVpLORitJX//SyHJ8M4bmby/47naxFdCKOWEK3NI5G2e/b3Y9yrtexO7dOo
         Wot/SmmqwxoYWaD5qIyT3JtreLkYxPY6zkqPbzdA1g5hSC+jAkdNM+bN2JWaw1xMKjnR
         VX7+GPl+JzDbS2eBAEfsV0GIYUqyK2uktccwg8n93C3xPg8SkXQYBmY0DYxvfNr3eeK9
         QqbczciMLIABot6zHKy9uHs6/U16FcHN5ll6J8xuCL5DhGVgpm/fOg3hMtPAvrhlV56v
         KCNkYvNmQGdY1Cb8FtT7xgC5zVsHN+5plQ7VvDyi6RMBO5+CDn5Vdyga6cejEQHblLXV
         2zmg==
X-Gm-Message-State: AFq9FYKZrPTryses/d9CzGB+2b6cD0zOvoZskOa7paY/M9LWswdWQPrH
	9ID9VOQijDJuuXklUiRPltJTwFHSf4kdQ7yRw2u0yiaZiclj3tshAtdU7I9f32gWfHBpPkHfkA4
	QJVqCLC84x/ZNVvmpD0Q2OU7JllzhUCwoBKONGSMUECYLB1uuyNBQYPvvMYroT2Ny
X-Gm-Gg: AYBFou0eV4DwIUoAOJpRvo+f7ZzZcZ0Mu412IgGFtjaQst4/k/djeRsZfdgMHtg4PU8
	7LyDmwvVg6T6ZJy817slL+vE9u4Kxb4+fdowLH3kSYfa/1u8oB1ZY2GgXVHaGq5Yw0P+xxEzsut
	FysjMTbyk0RBjjBgr4NZR8XXk5h/GHiZUfGa6kDaaiuSrCDlsEB11mZK+lYq721lXDRVufts4ss
	2j/EMdZ+KqTTQhhHWRS17Cq0ZQUVJrTF0lqhb+av0y7utiotRtTrjh+aMzePLYS99lgJgGG6u0B
	uJb5Ho+xYuiPVbn8lBI88Hy+QcPIwtLZj027XvRA1rA2ZutfcfBZWyM+KXS/vj/P5DitYwPfJAH
	3UVxOGG7dwMc6leWqAz1Oa5E2YylZtedwb+Tel2WIC9A+oPQL9HYGMlI48nceaFz7ndGxCTHjOf
	YA
X-Received: by 2002:a05:620a:4505:b0:943:f3d6:8e89 with SMTP id af79cd13be357-94408a80e9emr210398685a.28.1793176381666;
        Wed, 28 Oct 2026 01:33:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:943:f3d6:8e89 with SMTP id af79cd13be357-94408a80e9emr210396985a.28.1793176381246;
        Wed, 28 Oct 2026 01:33:01 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm27503404f8f.16.2026.10.28.01.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:33:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: use const APIs for legacy sysfs attributes
Date: Wed, 28 Oct 2026 09:32:54 +0100
Message-ID: <179317637228.6922.14855638693910064261.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-gpio-sysfs-const-v1-1-3d89ac247086@oss.qualcomm.com>
References: <20261021-gpio-sysfs-const-v1-1-3d89ac247086@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX43rQusf6WV98
 SgvI4/N4mIZz6dT2uvM9/W7vYtSBXeRnGcjqyx5rNd2XHBTEoMlJ27zuuLs74k0h2QTfjReY/db
 5t0Tomn0JwwMptrudGtEiBzpSRO7L7AfnQj7qJ/1jYfVuU80A24iztzCbkyFDEHOoYMKkE7aHep
 GmFIsmCEQykbM0i0dJth/8kSmVmQDFoVgfugptX1uwrIJm8WOfjVSZ89Hxjlgw4GP5r8rAPSj0d
 C0tWnD5m5o/qyfjkTtj4dN7HUFblAk3tOPe12alUju3Rt+qIDTqAXku27qPBw5QRD/TZy7EAUl1
 zr6pWTwneCgn/TwL750xIREgUV02R9O0K9rbBETCPwjVJQvnimubWDjxF3gIxRyZMAwmWwoMKA8
 xne1z+35KGqgwGvA+gFIOyW2fxvM/pXxQCRdl3PyTDxF9LNLyIOGx9eII/sY0t+CPoxc8RC3SZg
 gy2o920AXw9hLNwkwLw==
X-Proofpoint-GUID: BJV0XSx4J8oa0Of3TUTVDEhwsVgXEBKz
X-Proofpoint-ORIG-GUID: BJV0XSx4J8oa0Of3TUTVDEhwsVgXEBKz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX865YocPqp/Mi
 cajykVMZxECfnE7uYymhNNCWDwQcNRTQfeRWKZgoaqd2EGmafq7B5bDo3+jbs7f98I9AuKCTApa
 PNto6HgyR+ahvzl2CYmOFonODHGzzf4=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae1b33e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=C0EIza42l-ixwskntg8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033


On Wed, 21 Oct 2026 12:47:25 +0200, Bartosz Golaszewski wrote:
> Replace the deprecated non-const sysfs attribute APIs with modern const
> variants where applicable. This leaves out the attributes embedded in
> struct gpiod_data as this structure contains fields that are modified at
> run-time.
> 
> 

Applied, thanks!

[1/1] gpio: sysfs: use const APIs for legacy sysfs attributes
      https://git.kernel.org/brgl/c/7607a865e435066087b94a42fef065756ca91ea2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
