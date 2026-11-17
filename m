Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906844;
	b=tG9yhYLTQXh7uj7XPSgtsgL60R/05CKViGMcel92oE3WtKAmCbX2Ef2sQ8ouaFqV57Xc
	 lA/siPX2OhJu0E7Rf1l83ZnLGyR8FV3WIYsKBNcEclJEvZp3BwuU8AS+2Bwd1IEKxsTiU
	 nQ5GfUZaVyQFvv9XSymvbQsScR9gWzEtm0C86DtKGY3SFFO8d/rqXRm8c+8KBT1FJHTyU
	 YIMFeI1n7OKGo8aMUF0c0YKTURYbPsot5+jrN0B6lg/KFCeRSQwCWys0oFwGJwwdJBPRg
	 uxkU2s2OSjZ7ejl7AU9TaKxnPZbJ8irCD4v55tPxeVPit/0x25/ClQszQF/D194AAHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
	b=eqm2UW70Y4GrosjTRtBb92rxk52bWSDGNMF6solcejrkRAs8o7maTnZCCfx38I0Npn50
	 IDrCSmcwTeHQ2hZacLHEtLYnXrzg11KftUQVpDe6mWPWnlqCT5GtCakjEbxC0+ZLX/zYW
	 ACvf7I/pvVVq4+5Ud0btCLvgXsW/I0YsJ6V7Tp5yH5b+e/33C4bUnDpIROhOmbVittz98
	 FconZYn/vic0rcT5bWiRODbAhv+tAxC5U7WsSueONZcRvOeKFlYXkV8FDPvrUr1Eu+AnD
	 ExLXbWzpXX5rHYmjHP4HjtSexcH65QkhmNBeO5JOxWh/PV/GvgNOlY1nhpNnWZssvQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hZVTzDz/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBaXqZMR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1855606A329
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 09:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1855606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZVTzDz/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBaXqZMR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8HjS71800719
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 09:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=; b=hZVTzDz/XtTO4viP
	FrXqnBfgsXE8rhjwexNMBxTEZozKv8tMrH9ZciFDgdjBJeW0OI5F4vcxAM3iAaDD
	hY3okPvDHyjGDImGxeNQQS3iUZ0ma49hba1JTDK626caUjM8zBPnWapjKZfdaIZ1
	8zXvVZh0Wj3LnI+WRwFFkF4HatLVTCXSpkFllwN4YGcGkJ3M2gumTxv4Vv1hW0lF
	v2epjszqr7uwBMeamodpZMdfDmrh6N9WhAmhhnp5Yn48G5YjJ8eVQkyWVeM9OFUD
	71kUTgeM8sW2j6YEq+v+9Ldo53x6nQbrUN+uy3Aq2fM7viIt0xwrA+slYyiTT0a6
	gpVXCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y4258-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 09:14:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960131befso542629185a.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 01:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906842; x=1795511642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
        b=TBaXqZMRTpNeSO6OLDFX8q9T+ai5snOlWnNAmVZEQyFoz+bYoleAHGWIgAQvaYDbV9
         NzXKpJz6e76UoZC18oS4AEv0rpHZRE04Ym7cGA6qF9iEm2ylCUUc37bM6MVPoaX9wS5e
         8KLxuHxhtk0JUmWmTLBcZ66eIPwm7tyui/OvBFrvSZhU8O8+CxlJcpxn5Y2KNcnEDrW9
         c8R8tx/bCtSCHByvR2kANqxT+ZSnFn/9w0z+HFTi1kDKhp8bTdLEMQ/15Ez7gCB1C2O6
         OcekxhrC3Z3YOGSsZQD64BH0UqV4dt8rAK6FSEEGOdFgwoJhyjRZCTtXPBixJjc43Zox
         dQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906842; x=1795511642;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
        b=DT1xlXqxUNR9atNW0eL5IoTGMIaccuSkUjr5LJrFy96FqS+UYNQkicB0Ej5fV6QZQv
         IrDLdtGVgKAvlrA/UJRhzh4mF2qJVluqROOHrD2MCrCNSo0Q8IPjLdmMm1a/H8NlqbIN
         4P2TEwhadGGsPPaepWdwTBsAsGbMNM3OOVXWquKobG2YHop0p4Qeo+0HKY6JaVD/3Iqx
         rKlPJI38lXg91QvgZfSFWJQQwMbE/FICsF3aP3+itP7pornspi/d1zVoaVvrWh54gGUo
         rZ/yWetbTKvBAK14wM8rtTgdQgi+OBKKs7wqb/76VmOMVtNRkeKVfnDUR74R+u617zve
         ILLg==
X-Forwarded-Encrypted: i=1; AL+hErF1zMd8nYu22s98F9a1DcvG4T5DP0QqSdl/crgJ2XqGWffOt1rTK6p4pvhMCdj/2N3fmHINBh4ptrCq@vger.kernel.org
X-Gm-Message-State: APuU4Z/LF9ywGSlFmBPF7JEigfKxytnVvY8dgBBYli6Z88tEWSwez3WA
	+liurMF7cADE6LKdsTW6wR2OiZ2DLQy7c6NLicMkI17+EQGJ0JS+gFbTmOsLkw0c/bS8wzp8snj
	XHNCI3ebBXMs7mQieJck1QgLy/HfyDLMYRnMRF4PVcntrnfsbP0nUMjNzCXgAZn1w
X-Gm-Gg: AYBFou0+GbRLUJ2fBZFwizQp2fXR3Gh/boSWD34/V+xTYo5MrH13Tnia9ntcwvhyh72
	+4KorlT/yEYXgnxcpB8IvHNC+gBLq8RXD9Q+lFJ8laZxR5y2ydczRUf4TF8zQNHhCym345ASkbn
	gFH3oGAMyj9IpuBffhomRqJl/v1BkUVORnG4nIYYyFn4wKuV38U/89SMAD4wy0/aqQ9W+PRfmcz
	o2IcbA73jrgV7DTiJnIHGkfSnQuNHuj08RVXl9oHOmz/LWjOiBF/9/VYMrwl8V1PtJ68R09c+Al
	49ICfJoKQQO5kaAfASLPcQKsUs75dq6+IRmSXG1sn80n2B97qYPQJZWIMtxxAvos2/WueNakVN8
	ptIOQJrDMrDGjh4QykRQ1nuewg6BOtD+RJ5HfsNuNc7tlIa9bPm287+Ql2RljFGNLzerI5fMDOc
	k=
X-Received: by 2002:a05:620a:3726:b0:949:6b0d:7309 with SMTP id af79cd13be357-9496b0d7681mr1398323585a.75.1794906841966;
        Tue, 17 Nov 2026 01:14:01 -0800 (PST)
X-Received: by 2002:a05:620a:3726:b0:949:6b0d:7309 with SMTP id af79cd13be357-9496b0d7681mr1398321285a.75.1794906841503;
        Tue, 17 Nov 2026 01:14:01 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4dec730f7sm1177496f8f.11.2026.11.17.01.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:14:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] Supporting LTC4284 which is a negative voltage hotswap controller
Date: Tue, 17 Nov 2026 10:13:58 +0100
Message-ID: <179490683060.18860.17025405055140807603.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
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
X-Proofpoint-GUID: 7EqVT0kZwmh79PlDQMZfRsy9LNBHdY9C
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc1ada cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6zx4bRIOlK1EkWDDbbUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7EqVT0kZwmh79PlDQMZfRsy9LNBHdY9C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX8r4gxIPhbU6s
 6cBviwFz8U/TZvOs8s7u4KLhZ1xcDOjMX8G1wkD58mjwenO1viaCav0dz8A85qr/SyzPE99z/bj
 V6LWg7vRU2lPKWE5hTqHAs3g0nIHnrA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfXz4ClxlYC7/SS
 YJaUwjFuVwSS0cNXCbEmJGm34QMf5LwVid6QIwsCNaIJwPRbEhiQjbKOux9vDY4AcY9iHtNz2Uv
 qGeZk3wKUfxKcrHGT/gN/23UsB4MlDk5fH5ElTyQOZwLTjZGP13VpZB4PlyV5t1mwE3LvWK8JzC
 CoTBoOAfUPVJF+081iLw4GCEO3YK/aj3KnzUXcWDJ+gZS8YeJpdGrU+8JG+SBgSHwbO1O6krDQL
 nuu/vHLzCezmsMq9iUu5SDrjZwkn++wniJwuUzFz8ppso7SQmASv5FQnet9uAvY7FP3kvJ7odB9
 yyeg+7mym/RBiSJ8sAQ6JKiwcnfnXqLjhmOMZ3pw/pC+ZS7HUtz5WgC2LrH+eiaW6V0QPhEbmBL
 NhK2I47/duJKrDC/NgFQY3tzHt0QmbYL0Rhud6Njpb3Fc2p+bN1deXTY/5nTTP9msR90wL9Jgr7
 ImQ7SQEZ/ebS6BA6ERA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170036


On Tue, 17 Nov 2026 16:26:47 +0800, Alexis Czezar Torreno wrote:
> LTC4284 is a negative voltage hot swap controller that drives an external
> N-channel MOSFET to allow a board to be safely inserted and removed from a
> live backplane.
> 
> LTC4284 is very similar to LTC4283 but for higher power. The device features
> programmable current limit with foldback and independently adjustable inrush
> current to optimize the MOSFET safe operating area (SOA). The SOA timer
> limits MOSFET temperature rise for reliable protection against overstresses.
> LTC4284 also has up to 8 pins that can be configured as GPIOs.
> 
> [...]

Applied, thanks!

[3/3] gpio: gpio-ltc4283: update Kconfig description to include LTC4284
      https://git.kernel.org/brgl/c/c6d8ebd7324cefda867a701b4341605b681aa3f5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
