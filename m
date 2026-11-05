Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869994;
	b=5ZlFiY+bIkIdErpebqIZ7zXj3sYPXCu4BQwJVcnVF965j5Q3FVknQ8Qb7Cgvt+75uOS5
	 q3obDoXr2zQ/TdoCNZGC96vDZ1T9ks9z8nYD6hNahJgWE4LbfZl8aRYKKcIUTLPtUePvW
	 gYnANAf7cHxHAfn6i/vchxswareyRK6Ye/vOwIAZRscBnKhWfpvYnPMeLSQC5Q7eRFlTm
	 6w383VW6TS92CPMTnGvWy+hgkBokrc4miLLoK6/GOmNUutFWp8iHM0KXT4XxWsWAojo1p
	 TIWR+wM6Ww+IPym97j/wMayh7T4m5Lwu1sX1mxdiapp4LPtq/a/xtjOs9K5rdFp/2Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869994;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=;
	b=ldH7hbMbNwCODXwPf9PcGatO7wyh0LxayMVghLE3lCYYTm/JuTqH6n2oMCYhKGXounup
	 fqk45FLwvC0QQPGSQm3n08/iLPnwMtkP3CNG9ObO9Bwxr9jxhohmXSqvP1Wz5Q9CbR6p8
	 EUjmtwzzEGkkF9dPbP6NMXQjMw21ml/kXmDTyHuAJOBmvuGgIVEoIeEs/nJOFWOMPjXLK
	 pUOMGXqL8Nkyuaaj4W0bTR+L2zpm695FsZVFjZiIoA9EZmrEMNzx4IoEexLdqpD7t/qdk
	 ToAWI+AIi/A0YsWCIgGW+Vg+seX18ROO/5G0kL3AjNSuz7FoQszkc4TacP7PSrmz4uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VQY9vFS+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1SkfBGp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C29606A326
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C29606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VQY9vFS+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1SkfBGp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UC1l3819755
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 09:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=; b=VQY9vFS+f916fsBm
	rX3P5iE9IbgB/XThZDvdwekJ7uK6K5qkEEV/GOdy++Ybca0QLidKN3svnWQjIFuL
	e/sz8tVl5tbtUIEcZ4UNlG9au0DU5Kmq5aXsfIGhSmnn1vDPZ9rHxjUgt7uxhmGz
	vpJnyA3qo4Cv5bY+cZ0xVctvGrEbRZqgPWkyC0hVrK8MJ+Q+r+zejMh5GdfyPxCm
	g65/vC6yBgHSZByj+mjuZNByeCLUy49DmrLweKGzv2YsfzeLxooAvVsa/GMa7s7m
	zZfgkrDd1yaAEHWh+P2wJ+7/VkdCuHDoQx/CT0BKuBKe3D0mnR+aXtr3FqAi7tsx
	i5WkEQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tk4uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 09:13:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf3a6cf1c8so1296175137.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 01:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869992; x=1794474792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=;
        b=Y1SkfBGpVwIMsH5vGDMeMLMNceqWWnCtDiTEny1XVCCdTAZoVtOyk04LAD6aJiJ/3a
         XaCOKjPhO62jZpUe9kd0kp+CweUBMZ7sMqijoOpeteTG3U++Sfk8hsQLumaUCeDNJZCA
         GITNfWKZgLnyiyvgav8rgwhJ/FyKHqtqVyesXQRQy/mn+TXN3HmBNSTJR5sCntmMOwNf
         zOPdiPgZRFmGGWQRC4qN0YIEMe9icI9IeJzM1qr/uwG6LyrySbvv9tqwmXKCPZB6U0hJ
         0UXp5oV1ChZYGKdVvpgQZhPnyfU/RDxeJZjheLeVcndLzxL8j+17WyUlEMDAFyMW/usy
         gOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869993; x=1794474793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=;
        b=MamWvEq8Dt8BSieZ6tB1+o0uA0suDhK4FYQYN0dzbhiDI0JOQTxzV+bQBqMZvtU+c5
         stB4WtRRvvb8vASDuLcFEAiVQNIN0Wcz1+AP9yS+F/iW8lWLlMEthIITIv2m58MsmVaa
         bhg4UXgABOvmdoFMQw2MdZPq+T+zCeDAYjg4ZxDK/IotjoHt3NKeEi+lFoosbjoCe9Tb
         Tv0OjxDB9Zo66VcLzRKUDBiPQ47VdrvWBNDaQBr3wG6+ZWUDc7K2LJzpHaFFLFt5u8Cl
         VjhUQtLrSMHKo0RznrrV4TGRUouinsqN3Nh+Gnd+QavcTg1JoadaLvKm16dXfWzezDFN
         hCxQ==
X-Forwarded-Encrypted: i=1; AKwUvByR+BHX1Iaoh4yCvl8nRe5WKdD162qYpBSDoYpGGVlVVB/+Ep05QqATNrZAx2jPhqWeRkD5SF4iznbq@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ph288qE/y12MbNOT4euvCDHtm7owbewQjZKvFRiNAjyd4b53V
	S2r84mbC/HuIMTyh5sJ29/EexfCLT3F7E3XPB3S/Dg6iT2b1WmJChBOCHa7OOpsNHH4etgRHFkW
	STq4UPfvTrHUpcvZJC81pjXesJGjh9H3SaedmWbNQkimlz+X73o+/CxKAfZ/4acvX
X-Gm-Gg: AYBFou0D9wiHTvbUqA5qzrbdPingxBVXTZYQQglT/1hHFO2gQ4uz91jjRT4rbHGaRWK
	NA9xSPTjSAULv7N1CADP9Qv/tJCIDPF1EnrLnOAa3samA2yJyM3TqvjoxHTMp9HLVC6wFknyLW/
	dKY4w23ofxN7ezdjzJQ7K5vLLVBfpS0egF3J6OIIdQIYrhHk+DxlC+/d5KbIka3OZtjkKPALgjy
	hwuX4VsuKLMfQJQAz/0Ip4UAQo2gHJdVYhanp//oJYCPrmXQj97LA2LTYmqeT31i95zx2YYFSfu
	GdhGNQAEPKc6D5smhCU1OtdRo/cZuBopfnNxyAmfHrxvXl1l2zfrVAf0pE8OofjAEmQzDlcznYd
	vxad636m/rb6fD1DJ1aNDwWF8L4Iq3AQKXKtWkV2ZkUBjFqwUTmZ41ufwm7gT+EkMMcZxLeOZao
	Mw
X-Received: by 2002:a05:6102:5243:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d072cafbdamr8260497137.25.1793869992590;
        Thu, 05 Nov 2026 01:13:12 -0800 (PST)
X-Received: by 2002:a05:6102:5243:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d072cafbdamr8260470137.25.1793869992117;
        Thu, 05 Nov 2026 01:13:12 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18175bsm8523052f8f.7.2026.11.05.01.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:13:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Aaron Antone <aae@amazon.com>
Subject: Re: [PATCH 0/2] gpio: aspeed: Fix lost interrupts from write-1-to-clear status bits
Date: Thu,  5 Nov 2026 10:13:09 +0100
Message-ID: <179386998646.14190.12898260042958043905.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
References: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX1CR/kMI6VfrB
 5BvfDy38pCNGEROvUgxxTE18WBtO8GtgNeo2z7d5jmg1upuw4yADUDA6wNxtFUGsjU7v/T9xyj+
 W1+HjJx11tpUTlFF7+dxelmol5FCakM=
X-Proofpoint-ORIG-GUID: XEhEGjU-UXz4nQ_Q013abyvDOcs_zNf1
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aec48a9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=voHqOY2aTaljLMbC2lEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: XEhEGjU-UXz4nQ_Q013abyvDOcs_zNf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX3Tk+wd944P/3
 B5BQRDdf3cwRDxxxiVEbFznDqYmgNauEErj4lsLLg8UGZwr24AXdZxmqtq7MZjAscUBQjJb6RBj
 Zrxk3ZZAQMzgU6NCXVsstXEQ5/VipSo2W9H7odvZOCn7YP3R+WKlwXzEJOgjO7seuVkIRxa5/pY
 HNqVDbGUCKfylutoZFFQrSKsEO9Gu5b/3UslCmAjedU4c0A7FJOs5sDEJRyv6IR2TKMPNbtkLIk
 i9yatWhcd85AGAA+1LvrYN5G2xnvCHNbavxS2ACpkP4m1l4lBw8Ny/IVQPRnnuWdu/7suP2KE5k
 vKSQ5ZofiLvRvjUCVRvc+q0tOmEA/V+kqcrH934DDiu0I363OPuRIMKk1PO6xEDNDdOCIyVeaFP
 zThOsBCwhQ51haEk7fI1Szyqtu1ntvUZ2rms0Gwe4t7q2jTi1CILeTPZNLOWaCQxd8upKTl5Tg5
 B6qmVsq7ZPkvSoUYYBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050036


On Wed, 04 Nov 2026 11:58:34 +0800, Billy Tsai wrote:
> The Aspeed GPIO interrupt status bits are write-1-to-clear on every
> generation, but the driver updates them with read-modify-write helpers
> that write a pending status bit back as 1. Each write therefore clears
> interrupts that have not been handled yet.
> 
> Patch 1 fixes G4 (AST2400/AST2500/AST2600), where the status register
> covers a 32-line bank. Acking one line clears every interrupt pending
> in the bank, and an edge that latches after the handler has read the
> status register is lost. This was observed on an AST2600 BMC with two
> lines of the same bank toggling together at host power-off.
> 
> [...]

Applied, thanks!

[1/2] gpio: aspeed: Clear only the acked line's G4 interrupt status
      https://git.kernel.org/brgl/c/5d362564bd2982def7e80d7f1e756a97440c7adb
[2/2] gpio: aspeed: Preserve the pending G7 interrupt status on control writes
      https://git.kernel.org/brgl/c/18cc1d1ad94df8a6760fff2617d3d6923550cba0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
