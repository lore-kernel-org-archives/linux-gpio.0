Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216335;
	b=zu65ZouAvEaaCv/2CWAQRYHBuD4Qbe/tPhLX0vo8/QKFzg3Vrg9on+wgJO4ymFpLQNx2
	 F35wmb0bldTwWQ0ubGyq5UC/zEwufKkl0kdLmHbahc/NmmNqB5o/QIDsYs3SHFHRm48+z
	 xP10DvSmAkO8hoOyFnnmuSrM8SkIzLzIlJlsZOO1UFK+vFI00tsf8Fg32cQ2xem/967ZY
	 5SH1rLP+cF2+HftbOmR03vOF0sguoPtc+IXT3CVoNP+UWbFcH1Y2R3tAlF0i4NTOl7q+R
	 Vmr2NSCRDTBYaMWNd/qC89QAtHSAXF1NQJk+Z64x5wiI25clgQcuwrCuW4QDipXEBcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=17v+OoQf3Jdgs1t0m63O7kLXI7eeNSBiKl4ByK4Hn5E=;
	b=j+/7N4AtdGDcqqGHLyZbp9pv6Igo1rx3JZtSFggOqsHOOLK+U8wARcmqBTC9uiyzlJc/
	 KaWvDru2yhJyT1F9qlyJ5HEBXO6Lseo8xq//NYKIuUD3xzItlqtfY0wrGEyWSVYfE+pqS
	 S48i1QHDDx95BDTs1nacvZl2CZR88nVM4IKMXW7eyaov8BG/FmBQemsIhn/0t+i/NQYGQ
	 +DPDT/HMAcKo7vzKtsfT318LW2JET8geAiX+chkDS+MOF8mEsH5fv2ZReWkymRnn7oCnO
	 pAwwE559MelXUiWhboTaXU9VQK/KNIRtmGXKBhYpBNU298VA4xkOrD8l7RQsYSB8SBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PEPw83tW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwfUHZlP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2665C606A32A
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 09:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2665C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PEPw83tW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwfUHZlP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969w0B2668055
	for <linux-gpio@vger.kernel.org>; Mon, 9 Nov 2026 09:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17v+OoQf3Jdgs1t0m63O7kLXI7eeNSBiKl4ByK4Hn5E=; b=PEPw83tWAheJ+RYk
	VPKbSYQ49fG1l+3xCMk6XKaUFpa4BSVMc+Y4RoU+auM7bqokYR/NjB9yybDwPO6S
	PhDDjEtPaAvn37hyHwlZESjLwkhhhYUXMuOU1lc5TTN+gI4PiL2iUTrFRL30C2XV
	AUrrJF5G3/gaJPP7xofpx7WQrqHwftjKEIzYLLStzrYLIorYeY15bDHWkxWeWSOW
	A7e7uU+ESMp6388TabEGeJQIWT6z1OsldsCONofaNxmlkUzDoSaw6+Ro67MYq64N
	U6QX7TJh+xYWy/JuhZCZM/soOU6zu8HnK6Qm3xG1Iqg15AU5uR7/fnY5+f5IT2BI
	4zvnMQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99ne2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 09:25:34 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edfbb5b812so255558e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 01:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216333; x=1794821133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=17v+OoQf3Jdgs1t0m63O7kLXI7eeNSBiKl4ByK4Hn5E=;
        b=fwfUHZlPhg1gYjm7wtioJf9FON+BX7iXH1cM4FA11mDfcZ98nVe2BjIWBe79fEZ0i8
         NOS9+xHLbV/gneStYYToL2LpH/Ge79ycvX9Lrs4o1Ahun8G+Q52nhedG9VV/TjXcPNvV
         QV0+8h5ieeHXx7XZwm984PO7/b80x0OODYeDUVz7ZaBikacAFKRFGM1IriU4QkYrCoB9
         kHe4BcIwQG1OxVwFmUs6i9uAjqjxI92qcedOt5kQzwSfuZs2PJBznidr5+P08442FzYM
         T62g8DkGmJF4cIWtWDgJkQhtU7U6PKzJg0EiG6W7CjI5HAEWkzdTi2U9IpErZ+CPXQCj
         US+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216333; x=1794821133;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17v+OoQf3Jdgs1t0m63O7kLXI7eeNSBiKl4ByK4Hn5E=;
        b=z/pQ6LniIGRgkF1YXXPzWWSUT8qu0oJ396BNjwx/m6YtSNbb8D0ZpDvdKSrsZC6D5j
         6VegOnYw6eFq/RAsQ6fGIvAX7+tMnJDcy17ul5Cxb+Smy2XFW/lzGKoZGCZtcMRt5OFk
         R1zfdKlofGvRTrbT0k1EwSY+S1tAauYZd9itqup4LAduXw93r0HD4NfwVX0MVkSDi4b/
         7HPD6MHfYxhks66Cor4G9tfo6jRq07pDwJayNw4q11lIw+svcwBQCLBMzjio7cuMa7Gr
         /XCXHoPSLImu25K2ohJ91ccFRJw4OXP/ABkkMqryLnsYI65KkSknUJlYqOkQRr7tWJFx
         oH4w==
X-Forwarded-Encrypted: i=1; AL+hErEVgg5UWq4h7s5/RxQwot5cJVk8bbq3Pgln7sIz1tYxnRepH9MWi2v2xFQlS212nQIvI7N56cL/LPgN@vger.kernel.org
X-Gm-Message-State: APuU4Z/bBqdeGtP8H91sy/2VkV12tAFAco+AC8En+HYi7VrOjawQWAbK
	dmTtxIVmBFWPC3W3qcLd3X/q1PT0BpiAu7BrDxbtQfeB3094OQ473iofVAO/ZPRcGuPFsQ3tuqt
	q4MGs3s+9SGoG6TpsvTMr2Oh8i13Ty0rVdgL7AjTNFbL2RT84Sxfe40YuUrpHl0v7
X-Gm-Gg: AYBFou1BNgcheEEj5jhyUDgeHsB6UqpWuYdr2DTNfPaok9FEAPmzl3HIvlRpacj3sUE
	aiUW9jtBncHESo0mx3br9Hd7GaGz2UCLQg4VTeHZ3xjjoRCnDrkvslx9IdRzk1lzsj5EeJDAXwH
	/Mp86BfVhPC1z6kx5ZQWCm59j+lyY0VYMSqYF+D0xOv0e0tNs+Yx6ZX+5r+XVune6L10WkoGTxH
	rFDjaDRXKDwtdMbM84coKPyWyJ2NQqeTkCoaE11C8dCJNhwC7DS8U0hfCeh5U6KIgpJSENthJ+3
	5ETWeFmnamhO7vhFECXv+ryO0pegkQ1YDo7fD5PpDMmRKpJrI0rr/D9WaQ1phrAo4NYh+inhfR2
	kKvQQW2tNkX3ixrb1r5nzN61LCAAe89FCqsO7RmDHg5uE5LbphG0I7h1Xz6h6K1it2JO8CvUJBM
	kiSBzBH4GHYaMfp5nLccFteZ8jHlBYdI/tt72RUKqAHKKiZGGl0k68bQr7xehr4g==
X-Received: by 2002:a05:6102:2922:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d2db11e9camr642875137.24.1794216333187;
        Mon, 09 Nov 2026 01:25:33 -0800 (PST)
X-Received: by 2002:a05:6102:2922:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d2db11e9camr642861137.24.1794216332605;
        Mon, 09 Nov 2026 01:25:32 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495974660cfsm8968027f8f.38.2026.11.09.01.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:25:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andy@kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: (subset) [PATCH v3 0/8] gpiolib: scope-based management and cleanup for GPIO descriptor arrays
Date: Mon,  9 Nov 2026 10:25:30 +0100
Message-ID: <179421631091.22822.17268223007589060557.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
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
X-Proofpoint-ORIG-GUID: i5JDzl0W1ctrlyWrv9KFUMsWb7kfpE8j
X-Proofpoint-GUID: i5JDzl0W1ctrlyWrv9KFUMsWb7kfpE8j
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af1918e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8ZxHLKPBVxxFydpm5EYA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX7Jw87pXc6AO2
 VoaqSCyq6OC+E95BEwH7YxOUml0NuiQXMUOGVsW5c+om1hH4r+WyUBHdHNVx07w/d2FU/O0cxE5
 UT9yC1/bpXBStp8+fPQ2zvN+CdnkwyPDpH4CAbi2IftfV1VeruQYDz9TkRrYIC+Zd4dHUekZKPh
 y9z0uUSUPEh/yJPq106O0X8zqoICqCeNqUIOwdvlQ8IJO8BXsPLFHNgVU4wmDnxCa4Fnt2eEaCw
 t5tPrWQW75nSS8ywBvsqeAzj93807/9cVeQBgpNys34Z7jQy5Zavi6W0aBKC1vaHmLtvzEZAMsN
 wVTSoTz4jm7ZXj9T9tUJHzlpPvO0udPoQdhozflq0NezXeYkyillPGHmQBb9ZOUmOggSyslVyGJ
 xoMzl5HgT3bD1ocF6DIwnfHf53fU1diSMVfgM1ADyOaIS41n8m/buCroxLezkzFxL21vvdTeae0
 DGlUJGnvDisL1TFSu5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfXw1tcK2KrLE9v
 QIx7RjzruLZjM9djNDCyK7Wi9FMM1ThpcptPFaWquZNeryPL+gL5eifBctCfrrjMo226+XNCXXv
 UC26CgOT1HjEAeS30Wv91QS/RryWG/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037


On Thu, 05 Nov 2026 22:30:14 -0800, Dmitry Torokhov wrote:
> This series fixes a GPIO descriptor leak and a fast-path cancellation
> bug in gpiod_get_array(), fixes the !CONFIG_OF_GPIO stub for
> of_gpio_count() to return -ENOENT instead of 0, introduces
> DEFINE_FREE() scope-based cleanup helpers for GPIO descriptors
> (gpiod_put and gpiod_put_array), converts gpiod_get_array() to use
> them, reworks descriptor array allocation to avoid krealloc(),
> switches fastpath bitmaps in struct gpio_array to bitmap_zalloc()
> and bitmap_free(), and uses the %*pb format specifier when printing
> array masks.
> 
> [...]

Queueing this for fixes first.

[1/8] gpiolib: fix GPIO descriptor leak in gpiod_get_array()
      https://git.kernel.org/brgl/c/b2a161687acdc297aa91fec7fa0966b5aecf0d16
[2/8] gpiolib: fix fast-path cancellation in gpiod_get_array()
      https://git.kernel.org/brgl/c/51c85306270972f672737dc5e28332e2b41b26f1
[3/8] gpiolib: of: return -ENOENT from of_gpio_count() stub
      https://git.kernel.org/brgl/c/e20e4b8cda2b4d7dd32dbd2c0875a15d92545f04

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
