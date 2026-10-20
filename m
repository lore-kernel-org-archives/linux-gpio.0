Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500565;
	b=R/AlJdvf5Nl9AbPjFc9zTAW7BIWg7Tx+Yb6Gg/DDzFjELd5uPfVPqGTjvVwMxpq5QZrg
	 f+Uwa1rma1Bvqhc3HG+VbsgywD2XdphH/nGXVyrpL8+SwOC3oRd/ydL5uPI9WOC79W8Qp
	 0o+A7X/j3+7wZp6LVjtX9D4wCL9VSeEz7BSLLqieyn/hKRCT8nbGZD1ytyD00ws3+SaQu
	 vz+lFdna9GMjlIjKAZ1w2aaspKu20cKJSMh54rvsAa5QCV+dGU4GHfTI42WOli16pg+6Q
	 /u7Jw45hNWjnSf0kMyKdurlTPPpNfVIRMXGzazSOmB/aShGuAOhHXaHNB16jbsIlRSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500565;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H7iI6Ga8fhdCz5hq4p7ooE7r+TKpBATYe72xhgVL5z0=;
	b=KYALQq3WoZnJUWGeMkNY0z8ZWxJGer96Hnth6gUJbWK5LAxPbq+2chh5+ZffiYBbuK/I
	 HDSiqMbvfiOBY3cFvGBYCRKFTiKcidGaIPaiDVZdvROhJzKNfCxGwxeHAIuCFZLr+E99A
	 RRk9OhyjRgAHzUlVpZNHz3nVYvOqvpRdWvHCUN6/9yvr51I1cJkOGME9NiiKeHxqgjstc
	 9V2KjlCxz3q3+Ej6FXU+E7p7/t9t346CQ+KRbHXDhkZ8xyXTifgf+HQ228r8Cj+HzOlRr
	 150j7TQWyZwQSLvAHp7wArFLq2TGRD8Ia3ZLFRC0bS+o7ZkfWemRH1aVY9cCZcS3TWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QkHw0pZh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbuO0Jp0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58689606A320
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58689606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QkHw0pZh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbuO0Jp0
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx9Ch419805
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7iI6Ga8fhdCz5hq4p7ooE7r+TKpBATYe72xhgVL5z0=; b=QkHw0pZhkxx5IXtP
	pr4T6IknbQrlmaVytILf2nqc5vtbp5kISlPm7g21GXv/ygAEu2hk2D1Sa+HYnzDL
	hkz/oqdr4iCOdwUdBZTK/HypxCw4Y6B+569OyazuQ5eOCbL3u1FT7vBsx9z9YPWL
	KgzGFOKYZvH98na9CAPYJCXcRclAwpiLPg9ITRQR+knW0Wmef7L1q7vZ6bhOmHDT
	0y7BUnHDm9fI9iMTmRZG13NgQwFX/dk7M9mN8LuRdGpgL46iTyStdYuTNzRvok+B
	3twKc/Z/cqNalE+m7zPCB8Aa3ciGii+ilyVDxTRr5kro1V2D8yt3TxmyEjpWqoRJ
	to78UA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stff2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:49:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so640057785a.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500564; x=1793105364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H7iI6Ga8fhdCz5hq4p7ooE7r+TKpBATYe72xhgVL5z0=;
        b=bbuO0Jp0tJK79ZGGTk+2JlenUX7f+xQAQZIVTuWHQkDvIiLKdYskqjzJW/Rii3yP5k
         bS0jsKWSraZAV8aSSkdMK0mHSBAt3znrDfFvAUUh++teYBmsgMD72peA7HqVI+6TGXjK
         MzKOoYSMoFaLUAK8XORTg0QNsIaKky7A0+4iHJe/Eu54KSTnetIE0sV0V8oULTsjeXUQ
         cDmNBzJnMPMwyRr4C31caNMJmG81PMdzkwEqqGL0CF0vJ5oSP+/pusWUSPlGO35S0Y+9
         eFZC+7dH/ElslKrPGIW9Hah8K3r7qbeNcdLsKYBTJ9gHUTpH+wbR3zMWpZJGP88JwGkr
         0sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500564; x=1793105364;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7iI6Ga8fhdCz5hq4p7ooE7r+TKpBATYe72xhgVL5z0=;
        b=wvoZLACWYLhXT2HmI0VcJDyPdkHlzaoaFklO/H1X6g6638s+hcRu8l48VDEQeOKlbE
         xYNBgIV/095xqJCVnh0qaruTQKpmgmF5gOqkn6n2y0LNW94RJ+GDfv2QuGoVsGnuQlJJ
         YmY6A3qE4yCng5CpjnIz4lF3L5YfQ4IwepPIUJx+GyzhoMjFW4BzHWezGQ6iUTGLhDup
         aGjMSU1qLxLKfiUoPPa9vQbCc09a46tXWpiVIqNQAXWrhD9AzFZMKkjqMRuS9qFdDlPI
         7p7ODXSl5Sizwc+ggSOJXEHvNAy0EVVPv6FVAP8n3V+DUhBSBlbTp2Xc8GQNTQiMwnqj
         420g==
X-Forwarded-Encrypted: i=1; AKwUvBxiZ2xxVBjftEP7IAxtudLLw5GyszavrBtqyM1CVwenW0ftAW6g/sSCGOuC7BRpPp5ujZFe93US8LHj@vger.kernel.org
X-Gm-Message-State: AFq9FYLFtdmBw0A4tOk3Pb/FT3e53+6QKPdsGRbT5S634EzDzYFCUNL7
	NBu2iRmZ+bNmHyQcxp0vS8HErBTYhYSHmZhTvRnstehjNnYDXeyASUhTcX9/swRSR8DECIQuRmw
	m7J0GU4oCiRYneyQv6IF32jDe4B+3iN4YT+wTCfGy1cBQ63D/+5eUQcSqFmkVMnVf
X-Gm-Gg: AYBFou1NmbHxIZ9yDLsA2dS8hqT+ke12vSAwOys15cz9sitf2JWtMBlyEJbCndiulMs
	MtPn4/NQov9LAEW75BCBySOlpTkDBZsZPl4OKoNIJBfrkSWlX7yuBJ+D28XM+7oMI/XzeaPLs8b
	CO7AgsY54kimTMBBU7lr9p/FBt5c/tPbLhg+SOnAN6kGQxHaoOjuRLwBNwa4wluwV7gJ4BWaZJ0
	q6DdvOyHgkAVVHqxP5Wp46F0GIPkClSkkpwKtMb2c/k3UBJtgv2CkvU54XBD9v5xEUb17qUMTIo
	v8YFTpXPyNYA1TUtVzZNj4/Buh2yYP9BmLuDHSdI1U3i5GcZmbVUeySPSaE3oZJ593SYkX470Or
	5za04jRkJhs5iOYktJzUDw3X3I94=
X-Received: by 2002:a05:620a:2948:b0:93b:d7a0:d9e4 with SMTP id af79cd13be357-93f29dc566dmr1638626885a.62.1792500563790;
        Tue, 20 Oct 2026 05:49:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93b:d7a0:d9e4 with SMTP id af79cd13be357-93f29dc566dmr1638623985a.62.1792500563242;
        Tue, 20 Oct 2026 05:49:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm5839957f8f.35.2026.10.20.05.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:49:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, linusw@kernel.org, Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: cdev: remove redundant direction check in linehandle set values
Date: Tue, 20 Oct 2026 14:49:20 +0200
Message-ID: <179250055867.31470.13231144086896623317.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020080646.45985-1-warthog618@gmail.com>
References: <20261020080646.45985-1-warthog618@gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXxcjJpW7yBbfP
 p9TKZeNA5Q40D/53eKCavKhMTOVmzrWWazQWE6Eo66GoVKiVT/4SDG2DTNqM1eUcY3OdTX50/SJ
 MYBr/xalElvT25Ykv5bENwH6yx2RCN1XV3l4Tq7ZRkyUjY0Z58G18kIjvUShMUwdLor9uacpDeK
 RfNgH/2y0ZzCHGoelUnd1RqSinJlflEOLAXSUlOlv33bnS12su/+vLnV812oXFmVvrZ/9361Vox
 XvQoXmxB03rZ1NvQLpM9uFFc+WNrq8lFh3qQ01E2LMqzJ3KzIirwVo9A4AQn4fd5PtFqLsJ+cdK
 Y6PY7nbEi9Y+oLhj3q7Mlz1oHh6BUlTfBZPQJFJFrUMwW1INMXkbkK+ouQK8sjXWzU+baBPG6oZ
 AMY1DBzrT6HS+asuugy1ZsG0JP7jjPxAzanrsb38KAzu6exMeCufhTYAmU9pq0WchzOT2GlkYg3
 X8OCPv73jzrA1naqFEA==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad76354 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fYxsPc73JLq1812L9qIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Uh-19I_irF0E4afZu3RAPNFYh7GX2U8w
X-Proofpoint-ORIG-GUID: Uh-19I_irF0E4afZu3RAPNFYh7GX2U8w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX9GG5uYW3BH8z
 X1QIa4cLLEjuDO8YR648gnJoVgQjQ2gP5GGiXxrFY7w9C6DOESnhveWWIv7gBUWp95x1UucDMHF
 tgUBba6oiQ1yCjCkSy2hDujvHMKTHMM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050


On Tue, 20 Oct 2026 16:06:46 +0800, Kent Gibson wrote:
> Since commit 92ac7de3175e ("gpiolib: don't allow setting values on input
> lines"), direction checking is performed by gpiolib core code.
> As part of that patch, the now redundant check was removed from uAPI v2
> linereq_set_values(), but the corresponding check in uAPI v1 linehandle
> set values was left. Remove it.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: cdev: remove redundant direction check in linehandle set values
      https://git.kernel.org/brgl/c/c890f6755369247ecf3c27199ca3c3f4b007fc1d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
