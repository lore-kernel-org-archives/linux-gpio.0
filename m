Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084309;
	b=Md4gSZqJ65JSj0fDFYoOF7zyh/yTxPIO3mFWUqBAVxRRax5Cc4XD7Gel5kGFLWnvblCn
	 NAP5vAAmMG/0ts5/XksT1Hoh1DCDHnVxEmAsyt5ukLfcfp2mDT/K3gfBFP8mOGaiMtZmr
	 QODtXoPgAacOTK4w82u+fwPg34djmvM/UrqWbwDCiYwuQEcswZDCXBaPg1+5bMhQXcZMP
	 XHV4Msd+T6dYmIKsBF4rT1wV5AgnabGF7AB6UNhEXzD3nV/I5VChe9hxcxgnnZlgcQPMz
	 qpvslXDQS6xjLQASEpZcMn2Ywuwrbw5RPtLAQyTTsnPT1t+Rw8ImhSKS77YFCaE7y1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=;
	b=WiQQofdCjjljtckRqwnTlXaomN1PFLqFjrgO54x8aRUOPyhfsAwAnWBdwOwqB/id7pBS
	 C8QSpPoDJWlh86lSBqFRRXM51+DKK7f7FbHL19mTKxvcMK4hWxhPOS9mUBF/J3IKBLYfb
	 SztLpiL/FQQw8Ftd0GXPy1hc7tqDnL1N6iBUvnuJRhxOAiOYl4CAEv8PCjjaqlG5biWzs
	 QkghC/BUoT3FGrMXzhsYmnlM0MziyWXYoD7LDP/bnR7y1L7udQDyYiHPqwTDjvnCXwnmZ
	 xFB9i5rcoJLmYjAZO3fX3h+Pyax+uObwG4TPag4FWuGpxF/R50e/YimIrcC6ljvjUzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rt8QaKIr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgQqxjwU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BFD606A320
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 10:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1BFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rt8QaKIr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgQqxjwU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAFa1d2018599
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 10:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=; b=Rt8QaKIreejd4vOo
	tSBSvpkwnB+f3c3Xf5lf9BqbTgQip9zblH6bavvWtEtSlQSsjXlvTt2j4RKSMWVu
	OsPJFbYX1ngJEuTAJVwuY/ZfNkLokyYV5yuJXTRCV0h63x8yFPeGnMDacqH3SJmy
	ZV+FVqpcYU5GlURs0OjYrYAC/JEfGq2IyA6ZHnFepCIvrukZAOS2Ezlz73pj6lum
	KEsgLU0/W9QfTNg74yP5TOoY0+hoXkaIKgHyMmCsKIhArpXKBbL7h1O9eTxAr0cL
	4TM35j8akQVEbbrP/GeH0QLIc8FuLnkyJlapE/VyiA5zZ5lvLJLHltZ3WTps7Rlp
	wwtvzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux934a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 10:31:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so316739585a.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 02:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795084307; x=1795689107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=;
        b=BgQqxjwU7nXEsAaxHrXhATj9uNnONr1+q4ln9jpgINdJGS3qB3nozrOO00PX4W5XRr
         RV6m+jti4g+uTHJLaS+WAL+A+R0iUpDwAYUJ+PSWG1UFyuyEwglxHEv52TpwSFJnw9DH
         k1+wqxRgQ0S9kLH8pHUuXuDc0mMRmfuXGt7Qvfv1+fSZTzp9UUvhiEZ+ld5AvKu0ZiUW
         rnMWG5FrCmetpX7q0fKmcaJFirv8hTVcnuXrBKlnNuvqa8ZLtIo4fVyLXXDGTLatM/95
         GkrLJJKK+9SxQY7UC6tV/j3wP/hc7CjpAmNybFrzwNuso/wnC012ym2vcExjpqnAu9fV
         oolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084307; x=1795689107;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=;
        b=N8Vx35IV4Mes+hzX6htfdmoQ4Ieru4kYNMAjF5aVHRFXkxscCEcwE7MX1Gmfmgj3Xs
         6u3KYi9ca6shJh5fGspoaeDcML620YzM70IHbcgNKbptGjDQ3lo0t4CFyUvtkjYH51qA
         CMy5Zmy85wMB3K1Ev4SRUf1WKUP225zcKZ5r5Lp4dRCPWFiyVSlkBntcROsW9nc2msSB
         ft2xHc6MgFzsGGXCYt97YbDnbtHW78JFMYu9pYr9aur0kon1k2R3fg5Y48+JreAH+CqN
         oto3hqhlnrz/tW2rvZyWzQ3usYM89upPHYumRzkgIi6SXgjNKjTjus5NB5Xvtkb3CZzv
         khNA==
X-Forwarded-Encrypted: i=1; AL+hErEP/i2XIExCo55mYZ8qkKgaJ92dLj4jT65vv2YlJwNbdOWat/6pCbDg2ixlI0MMbvvoIE3L1LurrB4f@vger.kernel.org
X-Gm-Message-State: APuU4Z9YyNoUDl91+lOlxqo/Ly90IVNf028IPjYmC0f0OtI2ZxLsvQ4p
	67n6EYWwAm+IlKp6yJhLcOV+TqVQH7UnDQRWtcvTdS3D3O2eg5+V6hoEAoWwleHp6tDhFDPep3B
	Dc72VCSCY5ls6fCuHd44cQNbCvmEc7KLaneBhGFQRrX/CmMKqPV/mHohH7zTtoDYI
X-Gm-Gg: AYBFou36gZPfXtsQol3Yh8wziOpQeghyRc98alNa5yXtSofUIoC+8/PDk3x5KeSI8W3
	Nrn+R6xvCvBK/aRaoQHFXrPL8X1o8TO6QibH8/mZh4JhMSjWUW2V6hFAzGUFLiOkPng68oc4DJF
	xZ+UMabNMIdq0bBOogKChmfdtovFxqmtMKd45KwAPtMWfqgFPB5ry0Ayvx3A1G6EwK//9Br1sos
	PlT1vctpbc3BvQG8VmR+cpEcUgto/mWe0TSoeLlr/pD5PUC1lAzmYKaHj4KxmwOs9Lxt2cVeZlo
	0RmmVmapRkkpZxifo3u3vzi+3eTj2I0EeC62fhSWKhVg+pu7NoA/QkMCa+yniYJ00FESyDGRoK7
	qLXpTF2VfLD95FWm/tkc56IazDlzhCWVpbt4UkOJPeYnjEB9AB42GrNSVzsxUym/y+ZDEQOUA19
	U=
X-Received: by 2002:a05:620a:46a5:b0:93f:22f4:f0cb with SMTP id af79cd13be357-949995ab612mr1085618285a.43.1795084306665;
        Thu, 19 Nov 2026 02:31:46 -0800 (PST)
X-Received: by 2002:a05:620a:46a5:b0:93f:22f4:f0cb with SMTP id af79cd13be357-949995ab612mr1085615585a.43.1795084306168;
        Thu, 19 Nov 2026 02:31:46 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm26124995e9.5.2026.11.19.02.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:31:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Haipeng Lin <jimmie.lin@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Val Packett <val@packett.cool>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sc8180x: Add missing dual edge GPIO IRQ errata flag
Date: Thu, 19 Nov 2026 11:31:43 +0100
Message-ID: <179508430131.48541.2060654933340230751.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114-up-sc8180x-pinctrl-dual-edge-v1-1-aaa31ad633f3@gmail.com>
References: <20261114-up-sc8180x-pinctrl-dual-edge-v1-1-aaa31ad633f3@gmail.com>
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
X-Proofpoint-ORIG-GUID: 2yR6lJF96MHDnDx0zzX3ROWv9PM5BF1n
X-Proofpoint-GUID: 2yR6lJF96MHDnDx0zzX3ROWv9PM5BF1n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX117OWV4nVMLF
 i7002lO1kVWd4Ny8Wuq0hyqEJDDy72yOWQ9k11188jWF0qW5Sll6QdLeP4uxPm/WN3MfR7qiJ1j
 rQAEodGIPMwO7oIHGNRU28HCwEDNT/o=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afed013 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_HFaMYOssqv2UMXnlhEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX/LJk+UsCaUWU
 dPcIzdPZQicnMjpuph+OSKZDVSdq+3m5z13+rhasktk9Sb2Mlc58MWYB/c8ItQv+2sD3rGhVR+y
 By6TUrCu0z8NHOD4U38xZisB1QYmEROv/sc3VJHOgFLxz9FSOyFoopl9FRHh0gcqmT42v7b8El7
 Qt0iNQmoANZjQbnwLAxSZAD/02PCtqocHqgfel8+c4FuSr++4gZaSY+DsUs/MqCiOrenN/AhvEv
 rfX8uMt6EUbf6Hy0uJ4Bo9wmUF4+59QIEhMLW+Y0fpgsw4rlbFfHdxc8XT5BiumKrPZM8feeFyp
 Ki9wl+NPVJuZHbUHZZVQdx7lvE9wroXXUU6Q3PisLkviK8I6LZPW/qrxBixRAJ0KM4I+378Lmoc
 pRzspezuVvFfzYUvTuEKdn7q3uBu8WiIy8WM3SN2khAicsBYT9l8+b2TO8iPreTyAGphPBOj8JP
 dFVc4hwa/HGW2dTvQEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190041


On Sat, 14 Nov 2026 01:18:41 -0500, Haipeng Lin wrote:
> Wakeup-capable GPIOs on SC8180X use the PDC as their parent interrupt
> chip. Like the SM8150, the PDC on SC8180X does not support dual-edge
> interrupts, so dual-edge GPIO interrupts only fire on a single edge
> unless emulated by the TLMM driver via wakeirq_dual_edge_errata.
> 
> On SC8180X boards with a gpio-keys lid switch (e.g., Lenovo Flex 5G,
> Surface Pro X) this causes the falling edge (lid close) to stop trig-
> gering interrupts after the first suspend/resume cycle, preventing the
> system from suspending again when the lid is closed.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: sc8180x: Add missing dual edge GPIO IRQ errata flag
      https://git.kernel.org/brgl/c/a67b4f18ae1c0c8597e2e4804c6f5460450418e0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
