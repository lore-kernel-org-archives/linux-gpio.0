Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903523;
	b=niTXdf6fG4XFmjgCulchGqzr2AfFnMSLHeZ/ZoVSngg5uvGOSQM4x84FXai6C1twG3QK
	 sMFmK2ASNx7Jh+RJbbnz7PmNel2hkEzlN5lutf6cHznyMQe7mEOSQMH8IZAiDiHBvLzu/
	 /yXoHyPiaEelWV6yycN/gLlnROeEJmMXjfCoYdcLR7CPDc6Iu2OTJHoJ1qkpQMscZRAx9
	 RQj0AwOMs33/raSoPCw0R+clGK1ZQdBQPV2nYKs46OfQyd07KW0Arg5/tUaqcqfjCLV86
	 +1uEwYaOFrvUiSMoix0bybGXI5hl9mHJrYSvOJL6r9wGcOphr/E+ffsvv1+kZRgtnyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=;
	b=OyxEU8+T8jwyeEPdZ2KVUNDlAox/VraJGhGG9eFpLyzM5SFVc1IZGZBHtVm8/5F+Su6g
	 ZaRWQhsMhlNR/OqjChHOpyeb4CCqX4+AHMzOaYUY0s/yQIGJgZ1sYINOeTUj/Ar6+vHvw
	 W6xex3gaizIeWtxtueUQf/UMfaFh7kc0sT9JDzJqq87oL3ReNbTLthzwTkLFMudnsnQQQ
	 8MRvgjr626IaGDrygGCjc8q31HJeYO4Qkz6aN4X8LQx+iyq34ot5z7gy20Szxm7anV1hL
	 KW9e5vI9HH4CwOdZkhhzjZFfQBy1gd78OfgWjR+Zu5zGlNKliCmLQcdeeld6NzEoVsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UrZv0HG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKMz2X4V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FEF606A323
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FEF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UrZv0HG1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKMz2X4V
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6ex3j2998599
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=; b=UrZv0HG1/5tiJl7o
	QYUgONRGH/Ftc1BNXgagMHZZt79S3RXOh1w/gGDO4dMcyhW3POOU9bxRm9FTkSCz
	lbYlivEUItvQuMtZs7XHpbeixpE7aT532Rp4FYiwT5kjhIr6vggPWTlJXZbYQQPn
	gvCSL6gzxWO8Zs1sLHVpoXnNxwvCKKF1CyU3pB/32JwhXY4df38PbDJYP8B4byNH
	LnudeoSo9oWspfsZzZJAke7rEzVeAPzr0qdnPncibo+aB/XSb6hhcomGLKAlADl5
	XoQbY6M7ejT619jnXoWfCwGPzeWEZ0f23WsHjEUYiKdXVVTUF3AlIpR9gFtdgOm9
	jrDWtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0cdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:18:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-947a607ec40so419042885a.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 00:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903521; x=1795508321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=;
        b=iKMz2X4VFJRyYwloOVlwUiRSAG9le+Wu4h0v4sQSfW+YvZ3DcSWv3hg1rOYkV+OrbH
         WRfSdCeLDEgZgIkY+I8+roOW+5uzPbZkBnV+wDaL8gieCmh4bPgOvbaJS61ZqRdMTOvh
         EzLwpstrMGdrtF4Iyh8n56Sw44b8EHa4mYwW8erd0ohCeuP8xUg1sVCvaeSGKpm3VOsR
         F2Ik1dzdHeU/eHKtQobFgYQD3QU282SLVlgfEYMfzaP8OCFWCkl9sXx/1XzNt7Pt2/R+
         KWdyh0E1HRRJtS+FNhJgCwiWaLDxlCz98cJj3kgcznr9IAW3pdNfGljwrmR2JCJbTNze
         ltMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903521; x=1795508321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=;
        b=Dv01bXwZoGmA4oRL9nHAEeP84Quk9J/1BiHRidiRttBMOkmNCl1d9GeoC8G6fNqzRN
         281zTJ2CwBpqv+izneaGq5XtAk/27SbQXShI9g8Zh9+0eK4yEL/yb903Uos9vopTe1lV
         CH379iIkQY2JOl7W4EaP/1gU7F92cw1z2BZ3t/AmhbIIV69+BoOVp4BnSD+f03S5R0v/
         wS7WW6THPwRMzwPLj4tEBtt3qtdTEp8ggVgM1On75Q/JZgE0K5UzPQjXs+pREW419y++
         1sHW2uaA2CSNN8GRriGfFS5lrt2QAxEedvGRNpR/+5YVETlmAXGMJB0VAtC/r2ZGnwp6
         3iew==
X-Forwarded-Encrypted: i=1; AL+hErHJjRRNQGfyrokcFjoSEAuhcEHhcbkrng92T/OPwtcz344/cxBRytN47QU86Grv7J/Go47JhfLnfM33@vger.kernel.org
X-Gm-Message-State: APuU4Z8QrIeE1cv+sNHmHzyE0aRdu5wXBa2IQ0iTCC66p5LwjmkliAwh
	lEY9/gQzc69H7EO9Rp8T+yPOU4mfCRkxEF5CBQLPNzk6V+PX+87TXLNJnHt6yFqzqrI9sYey02y
	m9wkR6hkXfv6KrN1i2RytpmemaqDZoz1BjDhdeZkD89mh3thu8C8mjFN5WYAJyFTe
X-Gm-Gg: AYBFou2TZmY19+GUQBXLpIjtuDHKWHhGAXjXq3OdtG8VR9ZbiEStji9sU9+4iw690ey
	l11zpHwY1jb6GrWd8n245GswRo9BUpeXv4vC5fkzqXbyj5pK/McRaxfvKiG7bbA/ET3J5drq1Y3
	U1KbqTaR6tzKJljBFhc9mAWoor+5zuOV7bP2K9w8FhON7RAXkpnj5ncDg1/6u220ms5yhhxa5++
	AZwTcjR3a/+STkpTQxUEcdNZP7748ivDpSp/4seCb+jbXDqUa5it502ivXNz8M1Y9Xt/0MGYZgP
	ODQEv9keivp2nSIgzSgI860nkZCiifO7iv+tKMlUhqpyEeef2PYyTg7IF2eT+YEPJ0v0Y08SEXm
	a1UBv/PDI/tS+Lqy01NE/BukFV3RSMU+vpNo+LlFyAzpXtw6kGHYWh0Y0Vopz59fB4RDqlvYqJF
	w=
X-Received: by 2002:a05:620a:a212:b0:949:60f3:1cdc with SMTP id af79cd13be357-94960f31e90mr1296401485a.10.1794903521103;
        Tue, 17 Nov 2026 00:18:41 -0800 (PST)
X-Received: by 2002:a05:620a:a212:b0:949:60f3:1cdc with SMTP id af79cd13be357-94960f31e90mr1296399085a.10.1794903520642;
        Tue, 17 Nov 2026 00:18:40 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78344ddbsm54700015e9.0.2026.11.17.00.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:18:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-gpio@vger.kernel.org,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: realtek-otto: Add RTL9311B support
Date: Tue, 17 Nov 2026 09:18:37 +0100
Message-ID: <179490351545.13804.18132721202337342128.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
References: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX+829o6eDw6rM
 69N1ilfKqXWdjfbHl+Nb9f0nELaDbAjZ/1ESLeKkw91RhBmphjuCDrH/Nkic3LA650hhs+ZFFfC
 ukJadd63igDmIqDZmTpqklG7JpACtdI=
X-Proofpoint-GUID: c40_ODivY7mThDT_lIvvR_gi3-3sbVPQ
X-Proofpoint-ORIG-GUID: c40_ODivY7mThDT_lIvvR_gi3-3sbVPQ
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc0de2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PLZoExqmlYKt_qTplwoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfXzLB80DX68vom
 0bLGmG+ENHUyp2gioPDtSfcreP7moPOFckgRhT5nKLeOWBV3/Tc6gP7hGpMKJ5dcK6AXbBEpF6v
 Zv2h3Q2a6VSpo4c82OMLAkPDTj39yND0l8+hs9LM9VzKU7WEaBIdc/CjIRNaz5xvvoZelx8zIcb
 cFyKX4BV+QoUZ2X1Ih5xqWu93yBf4hDmMquYHbK1eIwAuqTfW/GGqN3WVMm8B53jAn4h9dSEvai
 /xGaMYPg1U97C8tq8OFzRL4ygJGxzoea2lr+f6l/eadizbcw4B0oFxC+VWXX8F8Hctrv5Qm5AML
 66bAf6eGW9oYGdEI6rHC5Ty3OdK+pWzjBUdnnh3+hcdHnG817uvxoB/46xhcWabfLKZ9fyqdA2L
 +ErZ7vDxyG2qkqEK5htHNDVtZAiyImyM9oh3kQH6cr9Xdz5VUwPz1iSzyYV7ZS9Wg+HWIoFnFMB
 vEUiZA4frtxWAqzPHkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170032


On Mon, 09 Nov 2026 18:28:06 +1300, Joshua Scott wrote:
> The Realtek RTL9311B is a network switch with integrated ARMv8 CPU. Its
> GPIO controller is the same as the RTL9310's. This series adds a
> compatible for it, with the RTL9310 compatible as a fallback, and lets
> the driver be built for ARCH_REALTEK.
> 
> The RTL9311B node lists "realtek,rtl9311b-gpio", "realtek,rtl9310-gpio",
> "realtek,otto-gpio". The driver binds through "realtek,rtl9310-gpio",
> which keeps the interrupt controller; "realtek,otto-gpio" alone would
> bind with interrupts disabled.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: realtek-otto: Add RTL9311B
      https://git.kernel.org/brgl/c/13c7bc6932c08d6c170b4a8108d3faacf7cfff71
[2/2] gpio: realtek-otto: Allow building for the RTL9311B
      https://git.kernel.org/brgl/c/6884633429d1581ecdf1329ff11f8e34a83264ab

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
