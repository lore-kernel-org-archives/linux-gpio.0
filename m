Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700218;
	b=sho759wmC60sYggeebdwU0GjsMW5Q2VmqoH6g7UeuW8pZSfSS6b/MjSfKHpn4jx2hwfU
	 m1yjf+avd04YT0MftmvakGv2dksmuuhFhKd+t5MBIdxzl5pC0jqUMjWJMNX6NmnnbzCan
	 3Cg+4MnRKaA73+KOy5RwImo4xUJdzu6K4iObr7nSf6hN6XGPFx6PUtcJTmUvALt9nBj6w
	 APYhMC+fliIu3n/LjZILOp3+i/+AMLfO22JvOrjz+taognvZXXEoysmElGFf3FiecdfIb
	 QgVHBvoM2gR0wbNJVerA4Qs/+0auIaud/VVrViLzS84zk1iMxUlH0sEh89/vHk3/yYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4ceB4cgpS2thm2HUVX9spFX6C785VTleaXqIGczbl/g=;
	b=Sc0Fo8/E72QhMiVtIzB7yP7yVqwGUn0wUy3syYaBj65NWCJO0n9JKhwOEq46J2Jy4k31
	 WKBVWwiBNB9z0X6MW1KiMbht2tRWHoIXjLaPwM8TaWjBRC/GqSuG3uxvwFGbCJ7hJdAln
	 DiqdAbBdoyQlVKlJJYYP7ReY2W0xrgqeSKcS1GCTx81go/dSW3zekqlYgYMzCjVJRzxBg
	 +O+Tn0QsoQvJLL6BVyPs/nnlvM5HOnUKIOuahqT4iyeKpUeoLZ72HovwxdA2aBOiGNBCX
	 rbDbgvcyBL06Egd3efG4kj1Ll/GICbGys2V1Slq0uhXrcOheC0RykiJ2C2R93odTZKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eDYaZlkL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NcYhZVwj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDE0606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BDE0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eDYaZlkL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NcYhZVwj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVYMQ4129195
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ceB4cgpS2thm2HUVX9spFX6C785VTleaXqIGczbl/g=; b=eDYaZlkLt+GKawtZ
	B4g2+os+1cxJ6C/BGXQMp3Lj1Z5E0Oj0Fryp30LyK46OchlmxqXj8/ryXHGGYbEV
	DHyudmJqpshqNnuwIxjk1fYUdJfZnW4nqMQEmjHAALWUv84s5DprEJKtqGWVfq2H
	SmBNT30gDXRMggI8Ppfdg8Wm8Wybx/B/sJHdlC4Y/5brrKG3VOULjD1jFzr8yuXv
	hlXk//8c0zVKRzAx6aQXPvbHpJ/GZI6qc4/58zF0eI+WQfoTDQFgisBMn0nyENjg
	3gKiuXhPFm5UFiVUs11mIwkR+hgzYLgNPVixBvQS8WCMPfyaPy8OE26JCThR4TD+
	GbF7kA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vav4db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:36:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-947a607ec40so701677485a.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 05:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795700215; x=1796305015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ceB4cgpS2thm2HUVX9spFX6C785VTleaXqIGczbl/g=;
        b=NcYhZVwj5DZp9+o8mzh8doG/79+m//iTBsXBy9+OuJOvW5W7kLLlOJoqyNAwWDdqAZ
         o2E4WDZptFcYThgerzUGc3piirtpnspfMslFoSnGcvIJKvbcmj1i+zqDMbJe54ucJ8Ld
         BjOb/3V+vJuJd/pdDe3h98KlB1Aj1Ro04T3OvUSjsf/MeRk6uDxcCChiAB5fiJ2a7hYN
         +tJLQY81bwsvoeGpPwkYn524x4QOxLEdVqSKqM27zL3lWAEb2oYC7LNlfXSBYxHVspc7
         Zm6tr6rMuFzRJ7d6Fy1U9svFav/JL7YG99UFow+Z0sIB3ZKgUhg7lZcKWtImOrlA108X
         Pf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700215; x=1796305015;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ceB4cgpS2thm2HUVX9spFX6C785VTleaXqIGczbl/g=;
        b=aTB7shNbYoiwCKm3rUSeBRKNSOKpY4926LQbGOfFPPZwU9XtEU164Qb7H4ARkMmfSN
         McSBb4bGVGvesUx5rASDDLAGzYkc985rwevhWaG6l1RpwfchDjnoe1m/dJr+3bZVRWjW
         eA6SYqLe18SKHAMNtFzWKjSYws/fEhOx7FVUTJkESWhrs2hDFwF4t9h8FdHezD6VLKsp
         +yYu4cl22Oo2RbB89jtwa0GN3H4RTlnyHdOjnIEKA/SaUMMeX8iz/ndep0d+IlM9hdz0
         jlobTsFYWpKZ/Fu1GLlsP+m9Gb3jFsXNnqC6yxIvPUKZEw5G6ZyKz1SvT9tw4Ic/nYDS
         iahg==
X-Forwarded-Encrypted: i=1; AL+hErGAVgFSwe8aT6IeN396ma7CfLox95ERk9OIR1/aspcJ/KgzRevj8n2QSRPYIe6Mp4KRS7iK3Q+nmB+2@vger.kernel.org
X-Gm-Message-State: APuU4Z+1CXkpK9HC5Q5uqxcOG1HLI5j71lJkIJkgw9Xot0SKdwmQMYoU
	u5ylWR3PCubs4nenRFItxS+tCwo8thTXGBQdY39HvlCjD0Rmj9gB4PeZ/4QYNhz/qB5Hgib8blZ
	EJW5LzMfaqmm4JwbYkcazK3lIy+9qKJa3pcX9vkm6bJh4vEIgEfjWSV3FSBhpFtoK
X-Gm-Gg: AZFdTZeOMcziGRdiCLaFQlmeA2Q/jDTcMPJ4BWCXBYdBNUnoETEqOruITjohM2hHCpe
	CcUp/+3q/IPCGwMFO4UH6rt/7S/hfb+dOOF5ggK33UjTh2Ajs306H4cljtbQpGPy1Po2qn0g3Ke
	dzNKd9V0lMkTBJurRbi19lP1kL2OmotP9q12KQnUcsEb9eshtNLsVKbUZ0fdo5VJ/n5BwICs944
	SZm2XLjlPaicVWkLA7y3pf8bvx1BQkavPZdeivknawabWRe7E6Hx+T7n+VFv3ejCIYlwink2QIz
	S89Q3lFqHZxugHEl4dGDl9GFrxPgnfPOV6tvkKfTGhIjPeMaKjFHeeJ0k61CE+ijdfR3YPHx4gc
	62oEOmTvtlbac2E0xW9+VSwScwQugMbBRrJKuc/xqOW/nZLEfGDl6XDpKbv2A+FTHikC0dp8N+c
	PopPTvsNne4/FFRJw+CLpgtlvSTL7GqDxQrtt/MZbLdaYwh8hhjC4o+RxRX/og3g==
X-Received: by 2002:a05:620a:a012:b0:949:e60b:e0ea with SMTP id af79cd13be357-949e60be137mr1872242685a.16.1795700215431;
        Thu, 26 Nov 2026 05:36:55 -0800 (PST)
X-Received: by 2002:a05:620a:a012:b0:949:e60b:e0ea with SMTP id af79cd13be357-949e60be137mr1872239385a.16.1795700214944;
        Thu, 26 Nov 2026 05:36:54 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm547828705e9.9.2026.11.26.05.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:36:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Christer Weinigel <christer@weinigel.se>,
        Jim Cromie <jim.cromie@gmail.com>, x86@kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 0/3] Convert National Semiconductor GPIO drivers to gpiolib
Date: Thu, 26 Nov 2026 14:36:52 +0100
Message-ID: <179570020768.19257.6131446330584583033.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>
References: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MyBTYWx0ZWRfX2RFvXOwreG47
 atyA1T/iUu2puboT2reOGFzuc4nXXnI/0Fl7DIiu+PV7tflZ+7tmPLg0g65aVfnqxUutwXYQcww
 cCiskzYvCxD/SJ8zUkXaT2XaTaQXF6A=
X-Proofpoint-ORIG-GUID: 92w1pAW2USUnVyQdfkAJL-HGv0S8Kfd3
X-Proofpoint-GUID: 92w1pAW2USUnVyQdfkAJL-HGv0S8Kfd3
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b0835f8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WzfH6FfdUaIZdCNYEXQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MyBTYWx0ZWRfX2qylnfIO7Kjx
 ttRtrXrdu/bSdr1xuSlN3qwhFebsOmjsJT70LaR9IuSqJ2W7PCF/9Tg7yUxdYCYqeIOJ2F0f8X4
 YIp+qjVTUH+GFTh0xoe1o3IuN3xOP6+0D1FCD2olKa3JroO/Wa99ytM2UzBztq4KXbRfsYcdb0I
 hpQOUv2WRs4M7w2utzuviEluSqZgEILz8spvJNIlfTgzFVEKg9n4V+4Wav1VnuvI4IOTHJNvm4f
 BXa59t8KZQLAWtpKJ39DEQRJLRQt1LurMD5ZgQVNgHrgGAGoA3JgL9cOUWDWDXC7AEttDL4rTOf
 XB58T0Frc8IB2SCkFrJ3lzWmg0ys6rvFl17/51X6VnOZ4CEBamkTa3pY4IUyKfIR24mtguexqXw
 HgxEkr+Sc6NEjvqN/U+jxNc8IBhVlxHUyTixCFNXOmeBYCh13wX6efbnB4QW6Z2GAlDu+lUmmRz
 67Am0NW//BkTSYs8I9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260053


On Mon, 23 Nov 2026 13:29:52 +0100, Linus Walleij wrote:
> This is an obvious attack patch to see if anyone is really using
> the custom API from these deviant drivers/char/* GPIO drivers
> from the early 2000s.
> 
> Probe PC8736x through the ISA bus API and create the SCx200 GPIO device
> from its PCI bridge. Register both controllers with gpiolib using port
> I/O. Describe the net48xx and WRAP LED GPIOs with software nodes and
> switch both LED drivers to descriptors.
> 
> [...]

Applied, thanks!

[1/3] gpio: convert PC8736x to gpiolib
      https://git.kernel.org/brgl/c/e17ad94aae09b7a3ad7b2f6886c77e38a7259990
[2/3] gpio: convert SCx200 to gpiolib and use descriptors for board LEDs
      https://git.kernel.org/brgl/c/7ac0d49a17245a044fe7a7bb9d26231279006a6b
[3/3] gpio: remove the legacy NSC GPIO API
      https://git.kernel.org/brgl/c/b1e22d55d4a87dc48b3ec74cc7a07c5b91450388

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
