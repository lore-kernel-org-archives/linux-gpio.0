Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B870319859
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857331; cv=none; b=IYF+L74Wcz/VVogFnoadlZw3yxBBekPxKfhrXb0AJ4CiwjdVgiZh90HoSBnhRFmaY8IqM8mnSLGZtd2RUPao0q6nkk2MxXuqwZ0gyEvoxYLIJoja/N1AWdW/M9bKNDUazgHr4hQfWcS67/+yTg6PyAVJGXTqZYDKcZJIPtLImQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857331; c=relaxed/simple;
	bh=eyMPhz4D72N34DaHLBk8TtAHe/1rzGfpY/U34NdyrfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTjLUdLxJZ/HP2xGcAr2ciOjth86L2UfM2b+3vcdlsqpiwUDseO10I60QOh9/+TfcXHuzDTiVvDq/pYFBYqphQqFUo1sSBeKhF5Qxm7pCNvD6TjmljrPneerH0mGy0qJjdkrAy//mw62ZbmlEYIQNr/Ipum6gkspC0PSQfpPnKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjdrKYpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EaDRdcoP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjdrKYpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EaDRdcoP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDb4F2873463
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=; b=YjdrKYpVqZ8H9XAX
	ibF7vH/kUADBSYjVGZClU63lnyKF8JVv5GZII67PEhUmScSfLZEtlySCd/8RXj6x
	o+rkx6Eto9cTsN3V7OIW3H3NJVDGsBpAi4uBgzMTXdfS8EGc3015nJ1/UL2kEZ4+
	BA9iwT1xYJSu51qvtJlUaI7KWY9mpv+Zf/4q7MA6Zp7fhxha5a52zn6FeCol17DP
	00t0lcWini3dby7PAFSuxWS4FE74H/bGbkax08nYfIc7ANpPU3ABvUKZKfwTZ7uA
	3ZIoFEoYf5v4XPixYIG36bcjUj9HG8lp6iaVzz8ebgdDiRlDt/46JVeyX2EfpF/f
	aeUJpA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sguhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:08:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ec3314f65fso255156d6.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 15:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857328; x=1783462128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=EaDRdcoPceYoAWWUwIABiowKA4xewzdMc0gWkmN5YI4B5fvUgR0r97ljpcBh7pYPum
         Iu9t6cIR/v6ZyzFFS+67GAP99hO3p9A8cR5pDpNEx/BaqSEtfVfaLGdXSaGKYNiN/YR9
         7JtpB/Rw3BQinIvKbYVHwtjr7VMPL3pYrzc+BlzcGrbjuD45LolyizX/ssLCjCOfdCFO
         21fDXXr1D8DW5xVOBg3DGONiiZxODGhEBgGmB9ZZKoj7DFKhN0Y8W9nwQhEWAXhyUWca
         pPphpA+1fknebnZUlAdDkznvkTfjuXH6gej05AM++BuzPNFZ8dUStE0eu88NiOVHJosH
         3g9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857328; x=1783462128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=JtTx/onYi4dWC1ompgwsDVRTGBdFKhshGV/yr2l/9grFtDS62pxbJl7w3E9DZWsDoy
         xLSvnflnBOmoIDTWq4MMHZ/HRGy7yJsd+BgHLUctvnqI6G9cIqdmIx/8vFftLUA+BkiW
         B/TkEmDgWp2n4/GUjJ5YNorGWJfV1KF9HGwiUeNO4GGyFkKrnDTZhPDMHYgxxKsH9ufH
         CG2RZFLHUFgg7NORwAzUqAn6T62zXG4+PiEmOqkA8CZE+gg3HxAqJRdNsl0QOMevjtT1
         VNlpE0nNyJJcgBYaq5au2Fdv78NBJj/oDhLXJ/eJQBmqYDCxk2QTNeHJST/NxwvLyj92
         ZIXA==
X-Forwarded-Encrypted: i=1; AFNElJ8zt+WttRgDEbhZJGIoXAXm9QSfxznuGpIKFnNQpxAmvtrO37FaeJan0GAKwKS7Lqy1BtgKds8XvHPe@vger.kernel.org
X-Gm-Message-State: AOJu0YzUhmegbpBMc+TTDGYLf6tYhoSHt5sfxRu52thzv+y/mp99VSlv
	tCV9s/8DgH06ciUsZ34StEbSCJ9mfWVmlmFHw4LrPh0HEV3h2+csrB5tKNkFbWL+CW0L9ymk4iz
	zygpdQJ+gP5kclvSh3o4LvS72NGxHvoqz+1sMG4PWv/pruPALr0Lww8PwKs78mjqJ
X-Gm-Gg: AfdE7cnvxYTBtCXzHs3lCH01FXY0Jksf3k/S5x+k5vUFh/JgWacaxxC4/tEMY9MTJQz
	uRtVdbTELiQpqkjixQ520JEIHzFk2+L6A0UkoWR7bL0U1CZMbukQRvCyyNIqlMP9WFl69tZkmC5
	HLDyJQmuX+V0wN7qYRRsYChHlChFleV+mFfwJLaj/X7BFDIGMKXaQrxqp5cGOdJtbHKhQgfh8h6
	gE+cy1X6fjGZEpA6CHhJNjz3dUD07FgK93YSHRpp4NT/X4cmEWneMV+BveLad2452/tx6eh/nNG
	6i/OtUf9ZAvRR/dYApCquflFNVDMVm4FfcZIKBMgFJV47fQanMH2nGZLsuQHJJU7HZ4oH0SchRP
	tUHIuZXEeBRekviUsDzf1+NS3bhH4/rr7LNouXPfThYbxDghrxEEcpcPH5GITCQ==
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404385785a.15.1782857328342;
        Tue, 30 Jun 2026 15:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404382285a.15.1782857327863;
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d9daasm28380565e9.9.2026.06.30.15.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Message-ID: <6bcfcfca-aee3-42cf-baba-9a926ef26471@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] sh: replace linux/gpio.h inclusions
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-5-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nYIH1e1neBmaO3XZ25Q3eduBYT3ThjXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfXzhKUzVqrknRh
 57WwrADpN5NvniYX1YF/YiB5jOsFhlus17CkdhbEsA0rNFUhfn4+zczJYyLkxJxvZsI+RAwUMS3
 vWv8UAk6SbVm3BIAnkS/VIxHwgn55ImO8ebEUJV4F1N+NNBr3xtY/0H7BY40l2KPMxcidGXornH
 95I4tCwU33q+M8/NMN7sHWnaUozANSaDqS9ai3h3S36KFgaeAaXeQbp1yqb67Qw6YsQ5MqthXu5
 1sV22yEIsrE0xBAmF98/+XyfbsrxdsJu6ctu8EnXIfnZZDokHiv548zmzrgoiyrFJ2nQdgjKWG7
 vFWWZkDPvcCsfDC6gWzBlO2wvvru1H7HY3brx1SMDx4oDixg/VPMs16lZH40NIKP/WeTk1gp04E
 oXBzpMOSl8fH59VccQ2/UMM9rkSJjVq0j5m3voq8IA4ldlt+YtU9KvCENOSiNQF8FIgU9zVVj8e
 uVB2tRs1XJWp41KLdkQ==
X-Proofpoint-ORIG-GUID: nYIH1e1neBmaO3XZ25Q3eduBYT3ThjXz
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a443e71 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX4YIKNIw5dTKG
 mzjDF/vtNhZbYnq9aSgeWNkqO5AdIunAQBMN2Abmm34i1hXeoiOppiSc7ZOGafR5vy5X1ZKhMe5
 MkCasPllEtfjGQiuoz4U9UWOkCuI5Rs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> linux/gpio/legacy.h for the sh boards using the legacy interfaces,
> or remove it where it is not needed at all.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/sh/boards/board-magicpanelr2.c             | 2 +-
>   arch/sh/boards/board-sh7757lcr.c                | 2 +-
>   arch/sh/boards/board-urquell.c                  | 2 +-
>   arch/sh/boards/mach-ap325rxa/setup.c            | 2 +-
>   arch/sh/boards/mach-ecovec24/setup.c            | 2 +-
>   arch/sh/boards/mach-highlander/pinmux-r7785rp.c | 2 +-
>   arch/sh/boards/mach-kfr2r09/lcd_wqvga.c         | 2 +-
>   arch/sh/boards/mach-kfr2r09/setup.c             | 2 +-
>   arch/sh/boards/mach-migor/lcd_qvga.c            | 2 +-
>   arch/sh/boards/mach-migor/setup.c               | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7203.c       | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7269.c       | 1 -
>   arch/sh/boards/mach-se/7724/setup.c             | 2 +-
>   arch/sh/include/mach-common/mach/magicpanelr2.h | 2 --
>   arch/sh/kernel/cpu/sh4a/setup-shx3.c            | 2 +-
>   15 files changed, 13 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
