Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180226;
	b=FHOTVHrN099in2pBeu4sCZZg8SF4GG4VKOL9quaz4JG17aauGZTnQv8zXVQZDlNl6LDW
	 7oPX/23nNUFQptjPJKVuOagh0yWmAhdI+ggkP+0Y593ZSw73DLEmpql0THTwcxmivawxd
	 qX3ymMXDfGW3e/5Pt9OUl5WTykqGRHHcRn/bZrIZHPFTnHrYlIyloGNkurcCPkBlv5ORu
	 XYcD6c2NQhy++2nLDQwt+3TzLRJUpdCS5b5DmVhgInpmiLH2tVfk5jqViPuS3xKO4w/xR
	 kCrRR6wJ1Rdk0/la8A/X4zX02y3rDQMcqILH0I86bqhE6Nb7se4vzsMeKs0yzvImFAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=;
	b=dt+GFzfZvhYfTGwRJu3Ssy0YbIlL1pyTUuWep6TOfp62TEBVdikD/kphrWlBPjMP8fvQ
	 y6vvxFFCy+SaywW7cwtJ7ZWsec4aqSRqFuem9KbCgNnkMlIHY2Wvr45ym8UycBdCW84Ou
	 a00Fve6jsQgdgkxPRY56Y2ICb7PmtEIsUI2wZU83Er/qskrAfLnj/renN9bdPWiUXIM6Q
	 /FikF4hvrwM55LOGrybWl6RzzrVWOZelbgP/u0hho259xXrSjotQZMOmKGVbbpjpPvpy/
	 md/8y7ObbYZxoiecryPbQM/sGCNS/7qW1GDkTOHMVmHYehSdEmKs5iA27Cqqr4258CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBqdO2Ew;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ryw+AdFK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CE4606A320
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CE4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBqdO2Ew;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ryw+AdFK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KNPd570422
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=; b=nBqdO2EwPD+OP6+9
	TpY6Zi31lkbEfvB/xizxY6iRFclevysUUTbWecmOMJYpzgADZE4NDk+VMn2iwN8A
	iB1+7f1jHtHsyxgO6xxII43EEK0kAJtkvJQDAWnlJaYfi9lL8v/XboMDuwoPCADD
	hfZxAgBeAB0wVNOL8ug9gRSnE2yal1ntScQNDTbjeCcoVMBCqHxYAddTGyuCrpbF
	olxR/1kt2fBMJk6rR4Nm6O+tsQpFrsnrWAg+u8kKei5pi1IOHnm3whxuLJ8qJFL8
	uy7/9hWgG+d8/g2VOxNXZSpKDdc0tZh5XAgxLQ+gXFcWgMuJEmxZNZySjK3i7Xqb
	1OIoYg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy673gbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:37:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943e8ff02d0so65523385a.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180224; x=1793785024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=;
        b=Ryw+AdFK5t5+Sl8NMKnleXyGipACJMcpHwJKOJKj1lEY97u3gCGARyfDjF4jQL1rmU
         HZLZKwkhJUMl5PIWJNilk0Q1sw9f7DFMu7989sKC6QrFsJptoryvR01RZZsmW4ybhTJ4
         R2ixY3hGXCDLTURS2T6/tX7xVbS/2jJJ0djpRMMVAW98CW06nITw97OjZG8+x2430M07
         kIRhMlRb5RVMWdoyhMaIAmWpwfM25V/4jEW4Rzw7Yn+33uumG3X457MiVFFYgoGTTsTM
         tWTJz9CP+hSvDOojm/lV6+Bg7jQnepo2brt5RnLBF9Pse8bJ2ZW4nqatrz/XDnnRY/MZ
         JLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180224; x=1793785024;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=;
        b=CAsdFH0P0mNCz/azx84BodLZnCVdI/rmzvZ5CpGL1OGjarB+MVlvlSnOmz10fHpXvz
         q+VxCY9Dz/TBaVcn19jpVgTXeawR5rfh2ZlsWx7xkqtfA8KLFkxu2z5ZTtX9uNcvdlx1
         dR+fvLDbqhpw/YZdaSTMuPNN3YnXzqjHBdiTqxRrRqOsLbJc/1PNjiTA+vM2Ppuw8rsh
         KAwTyNVEMLDSUbOVifO1dUOs1+6gNGvpHwf5MhCvGuFDkfvK5LwyWnY1W/Yie0Q/GrK6
         tE89/8wvufw21m1weUzHXke3O2Y6SwRopONs1JG956UxmkkpkNJixGXnTxFhBbX8KtqY
         Hd2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzXDNb+Lf294rY2/Ah9KcfVsXeOlSOE6NZXwC4MnyEXeUrc+fojsbaUoLCgApG+no6z4loLctAVMi6+@vger.kernel.org
X-Gm-Message-State: AFq9FYIvU64xHlD/u/h17dNSmePCZpvm8pFS+fBVPweKekUvrbnbnoig
	/UalLEzwzp6R7eYAcWhcNHXtcugSstLpqVPLxJhGDleyb1h3Mwr5oIaQA2F4E+ICKUzuZCZrmbV
	zvG2hGwwp8/JsweK0AjmmoTq8C1T+YqCyO0WNlPkGF/K5/WB3tx5Tt01/u6YI3lto
X-Gm-Gg: AYBFou1vQbzRX2lDgbI5OWwlYfrFfHEstEiXeRB/7Wyk5ZpV3S1KuVzb3HKzh+oUYRk
	QZPCp9oldkG+o0zt6+maom+BiNjihtXdK+YKTs1WCy8KOYUoOxRRk3s1RgVqsOysnsigKTv9C/J
	isM1693NKhN32Ipua1c+gOPfEL5MAHrBLP9OWwQhYqvOeLF4K6lAwgl4wdgqYgtH0w0+vzim3e0
	JXXDeOLGgTjGw0Ozp4ByxPGTIFLFWyLFP9JClSDSEw+Vpw8LLghreEOOOcaFV4j4FLumKN9gpPA
	X1nMt22d0Ap+euJe7zEMQpa1K4qnzSXO77iATo5jPoG3QdvVQDQy5m4wBGsuBFWzFPS7LHfN7Ad
	rEGgskVXHIpKgI05JkGXduTG53Dbsq0tV2VN0KYzL++HqTWruq2xBj2EhuUG3Bql2JdN2IkH3Iu
	iW
X-Received: by 2002:a05:620a:2a09:b0:93a:824:ac8d with SMTP id af79cd13be357-94408a7303bmr234816285a.27.1793180223751;
        Wed, 28 Oct 2026 02:37:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:93a:824:ac8d with SMTP id af79cd13be357-94408a7303bmr234813885a.27.1793180223312;
        Wed, 28 Oct 2026 02:37:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97bf5d5besm38985905e9.5.2026.10.28.02.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:37:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Guohao Zhang <guohao01.zhang@horizon.auto>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: dwapb: add native hardware both-edge support
Date: Wed, 28 Oct 2026 10:37:00 +0100
Message-ID: <179318021613.11875.15753295922275285962.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
References: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
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
X-Proofpoint-ORIG-GUID: -3NelpVtzmYuQ7eeq-mixo8L2LUFPgMR
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae1c240 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=o6x5aZxaXGoRFeGydZYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfXwRsKhrdu44JZ
 ydQWI76HZxPRYGswqEp0jE+Ge2bB33ac/p5GNG97XNcjYl4nUnV//Yq1+WY69+aecQIK2lxU+NR
 AYydy2dwCYQIgPP6Jf4ilxOx5aLkAb0=
X-Proofpoint-GUID: -3NelpVtzmYuQ7eeq-mixo8L2LUFPgMR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX1DgSRbIHh+TW
 LIuzzLZavmyfI38sjJUxJRJNgW8W4I32cV6lsSDqv3TW/bJ5ZfRizx7uxHIjtOG+YZUKzLMGxag
 UEZdcqkH5yt2zqP6ZXmpJ1pPpGJdwsBg9WfWNieoSbUwoELQY30fznrv5WI14+uRysWu9h4UYYz
 Vt+kO2taM5JNLPCqfUibkaKpulFInH+3Ly2QvdnbM0d1uptl2L1ARoL5KPOEFZrpK9/ndOQchHG
 NehtwxljakoDW4JXSDNWyxHCAtbuzn/G+8ztx59bED2aiYWTuLXXnXBg6u703pOHxbloaPr+96B
 K9XdIi9YRavTFPQxEx0BfrXo5R9a7xw9n4UXs42WA0Ib0zUdazr4UkzqspAlIhRf944FqKLo626
 +Dt/rT5oNNgXgGLz6exGQJ5Dg/BKD89p/N/oNsbtsUNYaSRHWpeWgRuiItUa92QsYIIIIGd+lb8
 Tq6p9t8qLLbOIPGoTog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038


On Fri, 23 Oct 2026 17:42:18 +0800, Guohao Zhang wrote:
> Some DW APB GPIO IP instances are synthesized with the GPIO_INT_BOTH_EDGE
> feature, which adds the GPIO_INT_BOTHEDGE register to latch both signal
> edges of a line in hardware.
> 
> This series adds support for it to the driver:
> 
>   patch 1 adds the device tree property "snps,native-both-edge" that marks
>           a controller whose IP instance provides the register.
>   patch 2 makes the driver use the hardware register for IRQ_TYPE_EDGE_BOTH
>           when the property is present, and keeps the existing software
>           polarity toggle otherwise.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: dwapb: add snps,native-both-edge
      https://git.kernel.org/brgl/c/29f8eefb7a41e5012ea8c7f82ebab7b101a242c8
[2/2] gpio: dwapb: support native hardware both-edge detection
      https://git.kernel.org/brgl/c/b41cfa014391694a60f9fd52f758943d52b550da

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
