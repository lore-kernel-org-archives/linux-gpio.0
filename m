Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182981;
	b=I/TKuq0YkAcur/nO78DTzS6U8k0PjarzW1sRJvnIFpF/X05FTF+vuvXJvagPedw52OAB
	 emNyvyGwG7XwPaHiAoOjRu4CE+TWD75BGfH3YreRA1Lc5r41aZkuUcpQnV+RKTThpirbA
	 +b52XA4hFE6dHpCGvOmrWN4kevXNCe6GeYenzwpArtMWwMHV7+mRKLCZ9B+dEfHM24hW9
	 rtL4BwWgWyBvdZy3G242SZim4RARUhcw1fVvIV+D86Ki80pobFVizZPbtTE3IZpn5XhAt
	 /SwrqRzMeWyZArwr8ex9Eq6vNVeSLvG7xLxO/k1Nth0DUM/HMKGgSEJJ5w6ciip0FbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
	b=aEZEP9OKx3xRp3P4ZToIfTzXN8AcmFtMfutq8B5AjQQL6OvVCPkl6LznIjCOOfYt0v3l
	 O1WdKwaIi7gUgM4odQ2mjXO0q1FZ2OaQ+ndvjvU2suqfr8O8eG+QRwJDLqe9Oh2kqCzDn
	 QOsj+KYkZiwNFsUeRCcfyFmwgyziI/cNZ6UByYTiz3iohz5Vo5TeY0jUI2PNcxctoxQpM
	 FXUhDgo8chk3rK4rcMLbClpeOAvBzlJiSERkA6HQtg0eI6CkJdL1ykSZxRilQQBGgbNPD
	 wlumGXRtXkodEMUDtN7GyataPavwXSlZWcIjgJbhWlkkKLNmqSRLj7w2bRunvfvy1yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqJ49b6j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEelwyrf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85440606A31D
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 10:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85440606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqJ49b6j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEelwyrf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K3ln1167639
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 10:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=; b=UqJ49b6jcBEGRk4N
	SMcg+4URhJJuhk3SeW8bv8F4v6ep04YNfItmRsT7kGdv+WqjQJKm8XECwY4SMr0l
	Cw/OBTIt6b7DBmuLNZWP8tSDKfneEmZ9lmTLN4s83EFFQ2wUGYRQgdk3Qmsx/Sqw
	HmjX8jCJG8Ku0powhzuVEZgUKBbyf+LRYDEpuzykx0+rHBLgnExjTCzLMLuaB5Nr
	NXwXvgaq8a8hJvmaBjuRP02xX3M8WljiBZQ84/2smhW8KyRJ9piZfexGD740N+Dd
	l3uF0WZOQ6TPpfwjtKiQUeG2pXrZB6HgovunNh649Zgzo8MWX738zXTzSIzmSdhS
	B5MMcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7hqrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 10:22:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so130578485a.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793182979; x=1793787779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
        b=cEelwyrfGfmlt35tTqod9Uw9EXTfW+0PqqluJChECzfmxHszHmi524Yrh/sCXh9AxM
         sscjoDTAIjs8OQk7wTnXfZ7M5NlZeCrJpwDVRhAFMzml+X0uj2SZxOeeyS8lWbDlBZkd
         RjuhhLSANG4wmC+5ZN1LDpJPsaPpAmv8WKwEN6W4w9YRnv8fWmErGzyLGahakNw+u/6o
         VeqFM0/z0Xcrm2SHQhK4AuGpqs72lseYQJG8BQGDQ037Z11+GelEbTOBHx4Ehz8s0z6s
         6tRg2HpqWbzFXgAEFE4Fh8CyUp/GseaYCuDT8LtUzYpggWrPYOwhv/lxpukkZc3md7r4
         UJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182979; x=1793787779;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
        b=so0oZezpQTde++bB3NAzoA3YC5jhNO27FdkLb9CKaS7dnQdZ7pE5WPniXLlqdFo0I+
         WSMFR9iYq3cjfq0SbV0PfvEgf6q8uXbXI9K0s6V3wtTBK6VXw79WixcLC8jDLkQj0Sbi
         2dyMOzgdciuKccN1E76OffK+lo+13dasO1Nskc3i601WNb/5P+IwLMKZu+YqHgWOmPAo
         kvlL/FCYQph1QT8nD0Ks4YTezGSQAMX6RgzRP/dsYyOAIM4gaKWOszGiaCXwqlUd5IFz
         sEYj0jSZuWMiWLHBa2gvCAvh3ORZ1jm+0n1n2jqQ7SJSr+4ITqexJzwDsHxKruoM+3MY
         +a4g==
X-Forwarded-Encrypted: i=1; AKwUvBwbU73pVA4IDJObnUx/YiOTCHD739HbjpwkD9wnNovhc9AW9nacGxekYzOpwmlUuGdFwxhIIp1hAxKt@vger.kernel.org
X-Gm-Message-State: AFq9FYI8uoPlMOB0xwtlww5p0/H13NQQgYj6ZzNA+Xd2iBSUypke+Zif
	t/FlJaekli2m1tgOPIpR0WL5fJH6g1L7uC8XYNVKcYrY7lvBti7P10/GlasC/Rs4kdyLSrPAAiv
	9o3tpHLwCekeDz55jipNf4cYhtMWNFg/co0YWA895bDw0VE77qVU/Hc3Yz9s//TIM
X-Gm-Gg: AYBFou1Qz7DXQSFS9fLF8UzT/qoBWSbKXStR3a17L22VFgHW7LVQfGDdD73zeP0IrvK
	H3TPUxifWFq5TfZXg+UIa1Z32FscY1LYarjRxcW2TnqEf+nRc83QSUMJh/cCPnhN4ho2BhvvbK2
	JTK2VJ8iRx8xl9+4oCeRZHIAsJi9HK5gJUuQ4a3hPa4Q1KjLy/6oC0Nf3NJJiHk9Z1FibyTEROZ
	DeD9+CFxI7cST7qnCnf926eoWhnvQunqFhE99s7ySvjKKmdkNB4sU+pZk9Wb5PQz0vmE1Jmg+vJ
	VEey7dXfC+6rbreEj+NakNusFAta9DfMV5tZsfkoqGf3dbjAYedyhLk4l0ZCk7SBTCxh1uZQwuE
	BmkARVurATm9Djdg4ym5VHm0y4vKP0odtTqjHsZ5cDe7wkjwmc6YpLpHhPy85HRG+dLY7mkVojE
	nh
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr227997285a.60.1793182978714;
        Wed, 28 Oct 2026 03:22:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr227994285a.60.1793182978265;
        Wed, 28 Oct 2026 03:22:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a976010ca7sm36225665e9.1.2026.10.28.03.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:22:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] arm64: renesas: r8a78000: Enable GPIO support
Date: Wed, 28 Oct 2026 11:22:55 +0100
Message-ID: <179318297302.16022.6984836476337905961.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792776697.git.geert+renesas@glider.be>
References: <cover.1792776697.git.geert+renesas@glider.be>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfXw1wEK8NLbNUy
 su7cQ6cu2F93Tpn30mGgl3m2Mwoii+7s4llHXLu158ZU/+9aPxn4ifY2pwawMwKWQRGNEw6IHAq
 tb9+9npX+3GXDsd1FbvqfSRWQSCFpMM=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1cd03 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0_pEspLTn5AsfqPZqEwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WvANCqDF0Ypp5Whz3Bc5ywaXztpOjcSN
X-Proofpoint-ORIG-GUID: WvANCqDF0Ypp5Whz3Bc5ywaXztpOjcSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX7oYC5fsfQy8e
 z7Nq+mrVnhlyC5/fDT/qeHOWbinyGegqsWW4xfWgFfPwVHQV2S7mSZloqedvTmEa8IeisLOswRZ
 8kygEehWWkvyyxZB2It1WB0ptb85nBGQAdYEAYdH3QyAaWNgJG9pOv75tI0ZUwfipuV36evWXk6
 1RLwxdU2gfLPrjBlj2X0OarudaVyvIEo2O+IASvAN2VWSeLsDUKeoXmZ0jd5OR2ZYtFR/pbYrSL
 F1hi5et45qvbmsJOeKZ5kUZ8/1KT3O7dSyGPv/KtYv4Jg5pjv1wzPAeu+kC4ZZh10hG38D5oPPG
 SXMEuwGujX3MTfolcw9KBI93uJtf82EemqBg2wKNmnGiyUvk1gTbTZsSE1/3XH1wNGuLWZknosS
 GwtW4Buy7S1TnX3Cmb4d5N2FD9pi858v5sDOQyz4vkON87Ng1ZBgb2lRn3O0rD2aCAtFn4VW3ky
 2ZXQZ93EzV+0iP7VN/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280041


On Fri, 23 Oct 2026 19:50:38 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series enables GPIO support for the Renesas R-Car X5H SoC, as
> found on the Renesas Ironhide development board.  On this board, clocks,
> power-domains, and resets must be accessed only through SCMI firmware.
> 
> The series is a bit special, in that most patches are not meant to be
> applied upstream yet:
>   1. The first patch, targeting the GPIO tree, restores the abily to use
>      the R-Car GPIO driver on a system that does not have pin control
>      support yet (pin control is not yet supported by SCMI on Ironhide),
>   2. The second patch, targeting a shared DT bindings branch, adds GPIO
>      clock definitions,
>   3. The third patch, targeting renesas-devel, adds GPIO device nodes to
>      the R-Car X5H .dtsi file,
>   4. The remaining patches are marked RFC or DNI; the latter depend on
>      code or DTS that is not yet upstream.  More detail can be found in
>      the individual patches.
> 
> [...]

Applied, thanks!

[1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
      https://git.kernel.org/brgl/c/5e826d71d4839d8471784d968274823f1f492eb5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
