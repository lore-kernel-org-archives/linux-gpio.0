Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957210;
	b=Bln2NuuLp5AnoZWg5JAZtsr4xDdcXsZFWYFsE30yZPCqwCYyYqbldCtKwV1v6EuzjtJ+
	 Q0qi9PsrkXLNYttRAmHRBztpPBzeKXQYeQuh//S+36hwF5XUHuwUTG2bQDdMemfrL0csC
	 lvRBVHf7d/hXWIutI5jj85gRqGL6ZWRWmX5IYNJZUpVAN63VEDc5xhPMotjrtpfwpVGjq
	 N1Lnlo7Rk63GiGnVtZv6mk7eUYZZNiqvqZDM7Z3d4JIzAcRXSb/7XTWgmis8nKFcW0SnD
	 kN5TH5GzJlR2AC4VorFCcP9yLkBy747R56S8T2S1KbG65m3jCqC6Sz29tjI+nJh0/6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3K44iXg682ES6cQqXP/vaebmy1hmlkMqK0BWGhBphpA=;
	b=0dSdOJwnDaS/CqXD2QvXFpNjvF7T2znhV5BWLVY80V/LemR6vu0PqlNsBPGnZqPt6Udd
	 M8X7Od0Me8TIOffnqGuRQEsuuilj7EoGCauJNvgqCKG4Cszt1XCaT3Iu4Ho69Y/hSKIkm
	 ISSuw9kNIZPb1SevEVon3WoRF2iZLue/zWtO46mvGZ6+IQOJMJzqaE5hPcw73oO9yJ1b9
	 7dm8K4d78JFHCSrzPlGryY/YK1NWUlzUjiZfdj5dx8pyWmcv2XlnrUpv9Yo4Xs/UgVpSp
	 QODIga/C38A0UmqPM3tGDnBBvZ5JnOxMdK1u57j/A0x7W7CxswNZZQlgrHmxmujA0kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LQtBEyXg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D8Mph/MH";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A072C606A336
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 09:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A072C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LQtBEyXg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8Mph/MH
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67ROUO3906886
	for <linux-gpio@vger.kernel.org>; Fri, 6 Nov 2026 09:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3K44iXg682ES6cQqXP/vaebmy1hmlkMqK0BWGhBphpA=; b=LQtBEyXgdvkQtjB9
	L4oquiSaCbd86MjTzPlPO0ozfjFeE7zCASJhcWw0D7+rBBRB1lne7CpQWwrWVLgs
	CuEHyCt2vZaKXj7yiQBkswTjZPRhrP0whFUV2ul7Kniw4PuliyFke2vzc4/sbCtA
	Evd0vs7qt1i0MfGfr3zVlb7J5i30ZM5yGCR6aIMc/8BJj8PElFCOo1YsJ4eGsqUU
	hZcOuuEc4Gj2XbIEJCyiB67WAs0qcA8OBkxpNgXvwj8KBIhpwJMCcmChChlmRUQ6
	wlfP+KpO1WLb4Z/F+WnT+gTM7eFQWbOJa1rCGUj+0rZx+ZaMsG3Xgm+e0rBXfd+Y
	Qu/EjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pat38j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 09:26:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso63859185a.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 01:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793957208; x=1794562008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3K44iXg682ES6cQqXP/vaebmy1hmlkMqK0BWGhBphpA=;
        b=D8Mph/MHYwROJ/8rsKfMpOxPPxyRqDXigNCCbkKr/Gxgu6Jnj+vIysGrdhENf5yY3+
         58LaJNkKhjEufKY2ZKia0iDntDfFAEY5jZCnf3dVrC8dc/HRc2dO1JVj2sLYOIy9Cqt0
         UQlfsFQKXiYivpmEG9PiQyKv1II3a1t+5zxqnSClRLXxNyNe8NnJ92BS8yjls2+86lS2
         3QeMLaesucXEgZ+TXmS1HwxzPLHLTr/31rs1ZmckBAieJOGkZ4P8RCA6I6sBPPQPSapf
         JG/WdKrkDFq/lRT36yGSspIdsfKdFS7QT7f9UhcHd6tBoeTf5iOSW5Cy0IkiLesi8ESg
         DEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957208; x=1794562008;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3K44iXg682ES6cQqXP/vaebmy1hmlkMqK0BWGhBphpA=;
        b=xBl0qKht1LE+8C9gZIwOwdU6P2XI9pJfjVFvFXPatyXuQDyLwUwDwAKNzHqo5qMOEI
         3ICiQbisjFBfEJcZO07CoYWs5evksu7horT79d7Y/8McVASsHFSCwmGQLc8zSYqczOND
         10GiMcr1Rxn31KLjte3qUW1bEhzd4cy1AVgzPSedzR4oWmtfzlg6vOXijKGKKsCFIJkq
         wXsHPc3jgAZgD1uNhJN/mtzyg1ztKv9UMelrkRP26Y9+HqbdibHMTLWfqbdTlePBnQo3
         NX9mBS1MCaDgFxw7WnkjeZo51wU5XBXYAHqRsuJHE7mBim+cQvAa7FyXE0P9uBsmX6Ty
         QVBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzi8NUjiuAvv89HK7ona8TW+U2WxpvJSpOgLZXocpv0tSECHponi6ibaAoVrKjqLIViL4vlU0J1HOjA@vger.kernel.org
X-Gm-Message-State: APuU4Z9xgLFq1ftFLYAiRRNKphAglvR5f5/1zBpdWh2tsRtkeCXs8ije
	4252CXPdIp6YT4brP1QbeqotOiLtKSmtSUDNv+RYh6QRahAPoP1OwZmNLWXwNAuJgUbcbdOiikR
	mX3UUZy2lIdzSr5Zrlggxex6vKz75fp79PQajx/YovvuHO8Hvej5uHTQIhNqO3C7+
X-Gm-Gg: AYBFou2blrsgX4LNVikTlhqEuHW9AMUGHEKfG2D0Myj95B1cVUldp/t+clqk/EPGeWr
	ZeOP9aVbpgrLZmzHrjnuw9ASusoYV7DhoyHZfMrI1Hcul33ES/kTRmepX+GWE+v2yY84t1l9oRm
	q4gkakKZKQp6uh1lpmtq2QDK+LtEmEXMSGpeGvJdY/TvKM5ivTVEQosRz5GAV9/MqzBbFIl20vK
	RT4HeVN20iaKfCjkRbOHPjndut6wowJ5vB7ueLk/pJK4J7xgE7Ctx+gaBbVhgQc5XUPL909YLsk
	+4DI2wKOMIgHLujWeA85m2CfvfqmUqpTwtipC/hhDc7B3M97WC09a+MD6VvbO9Ud3CQQbT1eJB0
	E3MkdjwmLHHMEGuM05lW/E3oafeOexAn1QUSjH/llD4tvrX6hkmzP+aEMnkMbSDwxqc4VbXy7xE
	DW
X-Received: by 2002:a05:620a:a0d8:20b0:945:fb2e:ef72 with SMTP id af79cd13be357-945fb2efacemr32797985a.29.1793957207855;
        Fri, 06 Nov 2026 01:26:47 -0800 (PST)
X-Received: by 2002:a05:620a:a0d8:20b0:945:fb2e:ef72 with SMTP id af79cd13be357-945fb2efacemr32796585a.29.1793957207461;
        Fri, 06 Nov 2026 01:26:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm123089945e9.8.2026.11.06.01.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:26:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Paolo Pisati <p.pisati@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] gpio-f7188x: Add support for NCT5104D
Date: Fri,  6 Nov 2026 10:26:44 +0100
Message-ID: <179395720176.5712.7302643079404579604.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103162738.135836-1-p.pisati@gmail.com>
References: <20261103162738.135836-1-p.pisati@gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXy6VyZiCirOoU
 XqKdg2JZasFvlNnlJI6QEE7dsmcqEIRB9Y6rThQhPu2C1vbFIzx3yXFSAij0+ythLnt+hu0uP8+
 vQQSBLSmXf4GjGcR9LI4sN42rgq8it62O+hmt+0yZmDOQShx3EsjCLvJOFdm2GbdoIJ53VdnM+X
 ZDfWcGfgKDnIqjDRpkMlyjN+N3hscvVc/WJ/WUFxAuql17S+/lZKirw9O1iZDZThtvlCSZREbRH
 CsE3eCiDANePEqANcGeXR0o69yt6S3lfkr1KC7pGkjH2lasVPHIqCYfmDbAQC9jVIxteHQ/9dui
 MldK9nsszJgSOWeEP8INVaSGHmoJr4s3gclu6K40ybjUHgpMH+n3+RbvAsowUtGdNDID/Vfwsnq
 v1uksKW4iEeZEcn8wgnYlTneQ2Y7IeWIhWg8b7zJOvxDaI0T+gdTEmzdeQWjTD0VmnYKqmGzPrv
 l618n1N9QbpXvZcqWuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXxLVKoCn9QMEJ
 rzPaMYW/mJJ7HM1S6nITloOtrbKDADvr8dQFdIG8k7h7ME5LbDH7grqHghKsahGEUbWWhJsabRy
 jXojlNTYfdjl8+9Qzk56//BSpCqs0DM=
X-Proofpoint-GUID: bNj--Wok9c9XniSM4V4lfsodG0KcI9CH
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed9d58 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eXtmUnHh1kbX-eyUVDAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: bNj--Wok9c9XniSM4V4lfsodG0KcI9CH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060037


On Tue, 03 Nov 2026 17:27:37 +0100, Paolo Pisati wrote:
> The Nuvoton NCT5104D is a Super I/O with four UARTs and 17 GPIO lines,
> found on PC Engines APU2 boards. Like the NCT6126D, it keeps its GPIOs
> in logical device 7, uses 1 for input in the direction register, and
> has a single data register and no Fintek vendor ID.
> 
> It differs from the NCT6126D in three ways:
> - the device ID carries the silicon revision in its low nibble, so
>   match 0xC452 (rev. B) and 0xC453 (rev. C); the NCT6102D and NCT6106D
>   report the same IDs and are untested
> - the output type sits in logical device 0x0F, one register per group,
>   with 1 for open drain
> - GP0x and GP1x share their pins with UART C and UART D (CR1C bits 3
>   and 2). Register a bank only when its pins are routed to GPIO and its
>   group is enabled in LD7 CR30, and log each skipped bank
> 
> [...]

Applied, thanks!

[1/1] gpio-f7188x: Add support for NCT5104D
      https://git.kernel.org/brgl/c/75b1038b88ddb729cfc8d5652d944924b16cc8a5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
