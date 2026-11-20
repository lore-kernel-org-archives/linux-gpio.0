Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178234;
	b=h4a9V8X8rwYAYnIFxSu6h5t2ECY0Rfn+ikkNTz68N5dByTn83cJgHsylLc76CcW04jm4
	 phwC8UiLd37Jmm191j91aMQRKQuEJuDSfFgap1rtZFJ6jxHRuWzbjZ71kZYRXM3I3ntFa
	 fS4FfFGSNEeJUnBSHOqeFqlHjOg96t3DqdcmNzGMQ//V2Rl+6jlYyT9xgFLUVJKu6Tnr/
	 CVf1+8fUA5tozgcO+jnVkGIqJzNkHe3vj3zJGMuH+xzJt7z3Aqu7qYLqUT0xuvPMbLx2G
	 YXbNmyf6bfDbFRb0tR5BClGBvQRqLN9Ev6ONqXcP5eIuJv3FvNU8qAmEwBtaEi+ywTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1MCy++OEczESId1w7UeszvhE1QKe3Y8ej98CogpqwBU=;
	b=4r8KoVxYSC6ewKejKpfBJ5OSWXgB00YFXH/hV/WsWwtsbW2pTwFwueXUHkpMOedxviYm
	 tJVPZcLaGeuBduocgLOZTUY/TSOarqMv0RO9fPyPgSgoTxJfPIvWkcPKx05+d0n3e4ETk
	 JH3/1nJNnGtU5fyU/5HKG/fZ0KiC7NUmZtlFmqCkbIJXp133Dk+JjVcvz/kWZafT7ZQkm
	 JxFEcK4s7VbRJfu2ZoDfV7zfLfcYqovIDkmuX+OKZ4SMJsvpvzb344m3hDC5RSr3pGTZJ
	 mGm1Ue/fkd1r9LxWKEu1pmf5CnVhL7qqbbpXyaL2XVx5YLI6fGstfal1W2krFlv8xvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJhMIUaZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eE0rGLDl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EF7606A320
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4EF7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJhMIUaZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eE0rGLDl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoWX1462889
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MCy++OEczESId1w7UeszvhE1QKe3Y8ej98CogpqwBU=; b=XJhMIUaZbPbyauFG
	+A9448z1u/ZcKgVC+ifG9lurk+QmNr1bLrALfRqbaRsRpYeabm0khXxQH+WBw9r2
	6crRz1sOXL4Eol+/ux76H/nqZI42on7kDmQ+VtVKwIFkomlfoji5TRYIiaaEUBQ9
	Kd4wj62CW7RlCvD0VgvTQ2hGOFfInKuWbqP1oB33cZLSX2YGRKE50R/lHXwlej51
	31jc9C0xT2jgZEEbcWfruX2VBU8NGI7AAO83oKASRjVhV0MwNeeRP7bQ3cYXufZa
	gjQjLXM6ORWy1masMKEImisRxlI7RH3feus9+ZPtX2850fN76ub/d3SziLby1YHC
	CAi8FA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahhk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:37:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so157872585a.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 04:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178232; x=1795783032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MCy++OEczESId1w7UeszvhE1QKe3Y8ej98CogpqwBU=;
        b=eE0rGLDlnO8N+eAm/q3cdcE1Dg3NjeFmSYvwaUFNaCATkT6ML5jQ6jAK7Mx9nj3Jpo
         MXie8wo3PtzEXnku7w3vEycUzdlkAJ3KIMUlDss5hUc83AU8W7q/sCdu/qETJJ/gn11o
         e8VBVjx/aG8f18PhXRTaUOeRLAwF+ndUTrWbDNyjwuR4Z6ZSlHljUWr/doIga8E8QLX/
         CILmaGS1Jh/TQzLgWvWIp1MxHfh9aTjwU8PH52ZLALYWzpgA+Ezgrpgr6zA6FZhYhsGy
         Dg9ApiHiKGfELK/6iqeVYPPJ1kn+lpOU3n7P/iJ0NLxfPNVr6vHo+eooIxj2SjEsAZvr
         Xq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178232; x=1795783032;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MCy++OEczESId1w7UeszvhE1QKe3Y8ej98CogpqwBU=;
        b=ECdqoQJBtDuJ6fc75oYXkN64btwQV7uEb2l1j66b8Vj2x3B2VcrIOoQF/a7GJKTLXx
         /xlqitWk0Xofq+GEslCqa6GAhLUj/cipmTgMdFnt/aCvI8xJS8OiwAsZcc06KU51h4m0
         Q16hUYzou33bWLboprqoQFxpKaSqRBPdqoC7uX6+rSu+cwwHBvf7gqoJUDQLFh7SIugc
         fp5i23Im1a9BgLC97G7b+8APO/crbg6P8CO/gl5JZbFtu7x5dS0CYbkt32QjoBWP9yFW
         mfL6Obas2wOGxPpOp4aBsDwmU2n13mhA2NvYAWxZvYSnE/BnFpUYo/vwORfLhucOK5dd
         10pQ==
X-Gm-Message-State: APuU4Z+SDXKTfLX4zx6235tuxHo/3WOBN5yDRJQmci6PrqrYgbQpJVqC
	vqBNAom3IrRUtAoBfxj0SzlGGwCwQ56bdMNSjMNCImhHBCCGvilh/MQpn7dS0mYyuxPoSV0tO8W
	VTsRJ+3kVIzsYTIKJN6pvww8O6zxmQ7c8LTMd/6jjkqCK0htnmmbD8jU+FvV62hX4oG20ARZR
X-Gm-Gg: AYBFou3N4ugymXOK7UdmBsOhu8fd1X0NXYqqWVNLVjeQcfaBFXF7mwKq3t0HoGGpEIH
	6igFclP5cBgpjmhw8PaHWVmGEPsevAstX0wCyWYVKZQkybNS0YriB+IK6xQiCyEQKBnQZgETtKe
	aGhLUR/CiXijIOs7IKB+Jyi4i0hDQpmMr1eKeqmwnjpHmUAJK2JPgQJ2ZpZEMx+OR0au/43FCiK
	O857+qE9HJDG2fx4jaR3d6cIFJNJx2ABxCNxudGKp1HiJwNpA2ywkHWQsYCODmCi3RSn2Kk20iI
	mlOMe7zI4mrsKvHlxr9NeJqmhqJUQntPIEvenO5qi2jngAKjPxtT7QuVhR7eP4tWL+0sjjc7yeR
	yRRXuuJ3nRo9Ca9e4N5m0T6RW6T8SIXNd2KafEfLsCUbSREFnLEJw8cueNnZI3NEi/6G3jGYki+
	Y=
X-Received: by 2002:a05:620a:4551:b0:949:5c62:e779 with SMTP id af79cd13be357-949ba954fe8mr443422285a.26.1795178232111;
        Fri, 20 Nov 2026 04:37:12 -0800 (PST)
X-Received: by 2002:a05:620a:4551:b0:949:5c62:e779 with SMTP id af79cd13be357-949ba954fe8mr443418085a.26.1795178231696;
        Fri, 20 Nov 2026 04:37:11 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm5879554f8f.1.2026.11.20.04.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:37:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] gpio: shared-proxy: propagate -ENOTSUPP from .set_config()
Date: Fri, 20 Nov 2026 13:37:08 +0100
Message-ID: <179517822289.13060.16911265181019600871.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118-gpio-shared-proxy-enotsupp-v1-1-39d3fe4d3aa7@oss.qualcomm.com>
References: <20261118-gpio-shared-proxy-enotsupp-v1-1-39d3fe4d3aa7@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXwllvkws4Crtw
 nMUStPL2zvhkd+DD2TF45eeW5eXnOYGsylEdcoUFI44AA4huTkBb6w7Cewe8Q21IBP6G7RX6t7u
 goXupLV6wdA+Pzv8j9hMk59TJgdAPNJsZ8jiCHl+ZvzLhu9j05wL1JKPvpb2hok/yMCZSg32nma
 iKhD58PLxd+8q0rg+RFPkxJII/38fXSrE+bka6v4KNW1hmUevqcI6ZvjrzqGJJTCM7MsNZ5Iaai
 BXQ9/L9nxTm8/qBLVgfOk4/3g1futINi9X+gyCGAu1KYrL94Iczu3ThxKPk2pAcvm2TAQeEpuMS
 c8VZH4m5l1Rbw47yem0Kd4sTSS7IApQUVQq9oRF5nJf9Lsi03MuNTpIJaox7ncBFepEqSWbrYVo
 DN4ctRhYJNfK0jLkvW2kZEz1dbL49y2k0NgCNJAo3y0GWZKz5EcdRAUpOBHj1Q3tk0pVHrp4MDL
 IMr79K6ydFCl8H/Uqyw==
X-Proofpoint-ORIG-GUID: DXo-MmkhRpf7qbwTjs4Tev2VFRoXZkQv
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b003ef9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rYdBfrT0Zw92CG0bHwwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DXo-MmkhRpf7qbwTjs4Tev2VFRoXZkQv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX7soDEAwlDOFW
 dwACoWjpBuLFDCLIfnzVcsDfM6iAz31fBoMSQU4W4Yz8WLoNFgyQhsPmOY/ws7IPgF859qqcifa
 FpwWssTOl5hvO6yNooFWsoOXG12m0+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050


On Wed, 18 Nov 2026 13:45:19 +0100, Bartosz Golaszewski wrote:
> The gpio-shared-proxy driver does not propagate -ENOTSUPP returned from
> the set_config() callback by real GPIO drivers controlling the shared
> GPIOs. This can lead to a situation where for an open-drain, shared GPIO,
> we take the emulation path on request - ending up setting the direction
> to input for the initial user - and then fail to allow simulated output
> direction for the second user if the driver in question does not
> support using "real" open-drain.
> 
> [...]

Applied, thanks!

[1/1] gpio: shared-proxy: propagate -ENOTSUPP from .set_config()
      https://git.kernel.org/brgl/c/31678e68f82636a27fbad58ae40054557da4fd7e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
