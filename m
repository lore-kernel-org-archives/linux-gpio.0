Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443818;
	b=NkfZszAag9uvvtemI5oh2qs7gzeThywNG6jVPr120sjoAunQPa1EDld0TvFziedd4ERo
	 OkvvkVwGP3JRG1kbR7NEx/SCq7BsNjZ2vhqP3lkb3f1uHTP/DXovjewcYRKXBasQWOP6v
	 Jti2Lji4OkhFVziCApxJz4Wmn4uAKx+2Aj//dfTkwRBfRcZwFoepFTEZyKLuoHaRMEbIX
	 86iZae12b8mHqREnhp8BKVq4ayydykVferpUqLQSRBpBGEFhV0+Gsu41wM4hv5HBONVqc
	 0qcq4EpVBv53r4P4PYY80/l4y74UFIodL8J8HBpAaYcptmQMoSXY+NelR95GIQ6HkkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R58ul7daVrn07krrAeNAc60Og8KzeZSAiSeUftpLzxU=;
	b=ucQVV9s4xNuEuv5UZn97Eienxewtb2nBfYcTdT9CDwxDgMaycSdeumu40ABDIUO+LbvE
	 7H+yyNaev39qwJGIJMEkYsTTgSQY3q0earIolybmBgHbNGMazEFxjx9dk4DKzRf0C/TjU
	 UP8T6ZuGxR6sKeLPZ9YIpiYisitsGhkZdoiBWbTEUOjkC3ZBA+UcyREEx/5YaUjI9D/Ie
	 Mf7H4CES8rdtnKO3Wu8rbY0TJgvWYjF1MjBO5508xOTXJDm2WftIG3YsIIT9ms/vI29ZT
	 pfFO260o/KcgR5A5A/uKW8ah1XJXXzp2n2lbU8Z8LCi4CC9A8PecRtXhMuXlFdiwRfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C670lo1s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RZq7LQ0H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A4E606A31F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25A4E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C670lo1s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RZq7LQ0H
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLEk44030389
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R58ul7daVrn07krrAeNAc60Og8KzeZSAiSeUftpLzxU=; b=C670lo1sjQfFVXfY
	xd1XybvDWPzhoF1dqWUngyLaarzu48aTnave5Nv0tSoFrJLzJZO8nUOiKAsNYyde
	kRlAfCVOJK7oiDkr+jPJOtRf0QceJmjaTZWHGI/r6ErcUl7NvQxSOMdpAoVr+eA8
	sMdAQkJaxi266gmvbLoXDwBrmcA6j3I2aFwrbCTy8eCvLBPkRpwWERGgicO/mr+d
	I4xCMqD8iYejyjkEkJjZpFOlxlI6qKmsr35ThunV61PYisFzxyChFYrZWN4lFeW5
	kNdM1/Dh7iBk/fojGNGAWqFUIMPk13ZsS7FGFSuKJ47pmwJ8dL0imMfZj0V0diWY
	rtcAVA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evshyxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:23:37 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67dabc6d5dfso5770414d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 06:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795443817; x=1796048617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R58ul7daVrn07krrAeNAc60Og8KzeZSAiSeUftpLzxU=;
        b=RZq7LQ0HYZC1eBr9kgBRDSa3TcCu7HAdGbA1SdXwtwCVlkMRuZBcNe3OAvWOdzD4iN
         Z8d6SXZQvhxct+e/PalHmOn4m1dTzTtkagmwB2EZIZVm1VrHYUu4OHhXyHV+BI+2uMa/
         ZzbF94ZKCHtzcf1B2Hm1BEk4d4FiD/vwIDHdmOsW85o/csYT5/i8geW+N4LljBaO/5k4
         7UdZIr0mrU5AmxJjF7zKg5s2MhKuRf0COG9Brcp+XITvgPb4dfglZ4IiB/9zjJC1dPlR
         kHUjkkIcLnhFwNLF+jIGMbGj3u9HJ6YC+7FvvlBYCpYNAoI8VGMmM2GFCRL9FUXx8BRj
         YlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443817; x=1796048617;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R58ul7daVrn07krrAeNAc60Og8KzeZSAiSeUftpLzxU=;
        b=B0bTc9qICLnIFJjRrPeHGPFU7wiWjL+dOYBjzF1xphbfbjA/8ZH94LsMmpay+XiS0g
         dMBLGxvIwcmnos4rZPhhuqg4yzFcxON+ngNH1B5KPrdiRLyPXCyUGB3ftkLxD7SinswS
         /jkcDPicgmkAWqsB9WOSQzMYwRwy4HWBhegRxklJt4g32WPfMBLEFBMrtPqGeJ9KHMW1
         5lpy4LzkQZ5ynyOFFGsXE733LZ1jaJjEdO8hHbOuesHbDKSG9m9D2jAHsUwSKxAQsepM
         YdUG6IakP+zv1e8OoLDa5u2uqphr+iK67PmTnc1IwPnxvS0MWiJBmKxxmtU3ywy04W4j
         zRxA==
X-Forwarded-Encrypted: i=1; AL+hErFECenvH2p1OgkXn96e7N9aPAUBK4zdSwVVYEBlQHgMAUp2xNrTbCiy6Ht3WpwHoKhfxdbePvUfgibk@vger.kernel.org
X-Gm-Message-State: APuU4Z+HGjJvAId2FaaBMMLl6EiEKmttU4nOrzIwaMZZTjrTK5S1Cxxb
	fZBHVu8u+ebWjoB/uEniuURndJpt4oKoo1Q2OH58t1A9fYydQR9j/dZY/4pNpGFSzn3vuYA2PKb
	cPITp1aUsn3NNklt6qt1Vh6wr78P9LTMQnsysepCjhpAWpXyjd29z0hwK5AjMu7VO
X-Gm-Gg: AZFdTZe8Wn7bF2rlNVilzObjzONnE3PWasINIQa2eu6thVChqZdb1xjCDd655h2ZWI/
	1deKJK6o8st1yUWAKEAOUlICn8GR6cLZEbex+j2XTsggkwNguwAFdmenYcd8ULza07Mm3DzN1tQ
	Nwnwi9BHPvuYGLFbNfUAZmlE0eG3IwcGdvuuMVX3YbHuw8aEB7jjgfSBzKz5/86yxWTINu2/HrL
	q/6jMQNU2AgnYVzQDaDSEtgFv/zS2WkoboK4FuISl1pGMFzyKRxfNO6yruLWn+ZpyiMnncUTgN4
	yHDJ8WsCzAPWW3KaAycUQr8xA4BGI9nqt4cXGW+IsHS4rK8biR1LGOd06mkJ1/52bwMDq+GUQbq
	19+gHyFaXkuBx4TI5W54YSgqYqiSmPTYf8iyI9nSUrNvuTB8FkZezlP7oPpq94bzzxXUTPGqC04
	2Vph0QEPt8wF5AO9tSirZwLMXv/nKQtaO067ki1iBAVlPifGsT4pgiYlLHH40Gxw==
X-Received: by 2002:a05:690e:444:b0:67d:ea44:ef04 with SMTP id 956f58d0204a3-67df44871e7mr3576916d50.94.1795443816358;
        Mon, 23 Nov 2026 06:23:36 -0800 (PST)
X-Received: by 2002:a05:690e:444:b0:67d:ea44:ef04 with SMTP id 956f58d0204a3-67df44871e7mr3576904d50.94.1795443815699;
        Mon, 23 Nov 2026 06:23:35 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm22145368f8f.10.2026.11.23.06.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:23:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Jim Cromie <jim.cromie@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-gpio@vger.kernel.org,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v2] chardev: GPIO common access methods: repair non-kernel-doc comment
Date: Mon, 23 Nov 2026 15:23:32 +0100
Message-ID: <179544374364.72405.3233920081843026528.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123004501.1771603-1-rdunlap@infradead.org>
References: <20261123004501.1771603-1-rdunlap@infradead.org>
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
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b044c69 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=noYIMVpM_wRd8bws4kAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: B5terOe-spxBAjFia3_dRLHAn-22uQ5v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX9PCrHVZ/nWRB
 yfAL8E+Wa3Dtlyf5XgzwsyzC8LcbAXwPyQQBZ7sa2QRd5B2XpvEaYSoAl1RYK6kjw4Qpt1bLXRh
 Irjr8QXaVxRuw3rkRxaTqkOHz9XyoOdCvME83KA8d41DlzyTF8y+F8qQNX9OqyWQK8Jx5lgxnMC
 hWN/SSVckZ4094llwwnJqIpUFVFnkws4MUENdj6cDJFMpc+AiRDo5jwTH/Ma8uDA/ylNmQiTjVI
 Mkretwt59nAm5wlmgSl47ebkydryQbGBHxOTPSe/PDWiofhONUkWg4tdpv/69jLx6nFcadWLo7H
 R9XHLwvuyJaiY5Jk+5RmgxuWeO6gs0pRjiRy0HpL1vqJ6d3xbRLVIMf3hI8pr0SKQNIhsm4mUxS
 25l7qgJZC9DYTZKWDvdZMxjM+UKBgiKNiP/L5VqmiFryYG101aDL7dGgbBLheTEbYbyIeq5YsK7
 sPQpg0c+rUaFEOejXmg==
X-Proofpoint-GUID: B5terOe-spxBAjFia3_dRLHAn-22uQ5v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX5qXX0UISkCxe
 zYPFy32ASZt+EEuxRkiUdREXBPc0AlKBH4+DS7G4XHNT8mYr6bVG7bRFy1glhqyU+/MWZg4mHI1
 TA6xOW6eBp6It28BGKVddWDzZLNwIgg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230057


On Sun, 22 Nov 2026 16:45:01 -0800, Randy Dunlap wrote:
> Change a "/**" non-kernel-doc comment to a plain C comment "/*"
> to avoid 21 warnings like these:
> 
> Warning: ./include/linux/nsc_gpio.h:2 Cannot find identifier on line:
>    nsc_gpio.c
> Warning: ./include/linux/nsc_gpio.h:4 Cannot find identifier on line:
>    National Semiconductor GPIO common access methods.
> Warning: ./include/linux/nsc_gpio.h:6 Cannot find identifier on line:
>    struct nsc_gpio_ops abstracts the low-level access
> 
> [...]

So this isn't really a header for a GPIOLIB-based driver and technically
outside of my jurisdiction but it's also not seen any changes for 20 years so
let me take it and see if anyone yells.

[1/1] chardev: GPIO common access methods: repair non-kernel-doc comment
      https://git.kernel.org/brgl/c/d4dc896fa2bdfd7d1a78911598a0fa3e3c831d92

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
