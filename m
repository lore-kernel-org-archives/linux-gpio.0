Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD9F3C0626
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784188732; cv=none; b=s6czRfkvaxXoNFf6+gVKjSljZqgu1/g10Dmlq45WuPLk/Njh6yOqv2uJiZ8XljDtmOSSUcCo3WTI/hTDz8qdtEtOrrK9EbN6C09PB6c8bHYe6yBxN74qi+oa2Zbbnkl4DUGF3Lff7bpXFnId9xHQy8yzWv5yLuliCDo3PYGpMuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784188732; c=relaxed/simple;
	bh=x7f6ykCk/miAUHqMVubQoMrHsrPAo7l0UksaILbihmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lCcoTw/hmg75BZTcTaB0li8Fz8qibnlo+a9LeRlBZ7MkiYmwd5pANcLl2jWtw1UhiJh9N+9l8VPfEPD20zW9Cqqcx8keezD9JRgUs/Ma8icv9pAFVLn52VjunjlZi1/YYSYTLslhqqjuEVKK5F5msDBXPEm3ZnOesPif0sRpNJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9qZ/WCo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+zirVuM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9qZ/WCo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+zirVuM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DUEl1892173
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 07:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCWZw4mQZN4disJevi7AP9Kq8qDcEdIma1/3n6QXqfI=; b=I9qZ/WConx/jwu6q
	wlqaSRhZaxdPO4fbt4jHSL9ut9kMHTGkpcxuVuW9YTVMFVm+utftJ4NAmXAYMmgf
	jhINJMadDzpbI2c9Um2izzpZSWvgfbjlZZ0pYUDNbAB6oxn/o3cBcdFdRFV98nWL
	e+kiE80Vjzb8w3uUqm6n/CvolmKDU7IqofhcQTNdDNxlQsvPyHOpquTPh8Uw4x/h
	atUALkY6uFwLjn94D61wCDMmNia1aOxBNgZRHZpkLo/AvojoUxHSujJ8MmTXkhva
	lDJsrcRMtRXnQRLgNfO66wuhAdJ9Pq1hav+F5D5bb3k7OTirrfyHrrPTDP78Sszw
	cc2qJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fecnyba6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 07:58:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1ada6c43so97170551cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784188729; x=1784793529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oCWZw4mQZN4disJevi7AP9Kq8qDcEdIma1/3n6QXqfI=;
        b=P+zirVuMMaN5yc1BpuvLs+cuR/xtCM8hoGy5ke3hHo7bj4GNikjdgPgOGQx4axyUZb
         rDNZ59t7RNGiNLScrU900ndxmFa0pxH/lakgsDETVkAN1oTzjQtUSCjcfyvk1/JYbisI
         sDHIhBX/weN+i67p/pj/sSY69IIYSCVy9V/sqM5lNeF4Wync22pE8brg5sXn+yIjavB8
         opkr2XBRFAqkX8O7tc7chKCVSAC8wxFEbbhi7AoqWVRrNhxFLVMV9umsdwuMIkadSPXs
         WKopv9qs45l0GFCvuQmDubPmug4/uZB3CJUFLZdhnDV5u2EeX2q0OKVry3P7QcD833RJ
         I77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784188729; x=1784793529;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCWZw4mQZN4disJevi7AP9Kq8qDcEdIma1/3n6QXqfI=;
        b=UYj1XHQLxrNg+QrWZ+DqqpY8Rb1MI+QI8MApr9tPISt1VwjSIeETjH55+8LIfwwkgf
         r1Hr+qLD9WAH7OzTxaGCcyAXoPPJ/ArTV6EpH9KEJpmBY+Fz66C1/WToSt6Mfm/LI5eh
         b3g3FbL+Cx9kzYYyt3bRlJP4P5EPnJcgEsXEXirTxY25+Vau0WhjfQx0T8eKJPW6rSi6
         PtzT7KtKE/Tz4fxSR6YRI5LcH15yxguRtIkmWnby0mmy54jT44kT5BWm8oaZamExJFaW
         8e4j9AA67dVeQBd8wtJ4/nrLNzxy53aSdGF1Wk77xfBqOjeOveA06XB1RsUKZ4Cnz9kh
         ZVTQ==
X-Gm-Message-State: AOJu0YzXTPkRe9WftPfEAiOSyIL5NGkaSGIptTAj9fJxa1U8NwKbUwi3
	uohQ9HEupnA5pSxGYdHhiXGS7GQu+FKptDDdKQUy7dqVxc0lNW7avVpnb31DOi+mmcrRAboTluo
	jUl7qmlpb0mYp/N/Icw/8qjawzBrR+IethKQhLphKAf2ERmta0eef9p8b7VkrEqPP2qeAa9oJ
X-Gm-Gg: AfdE7ck8Vskx6Ej1Uht0fcnQyGdQxf8ybeXTv0lJvOMFPuJAf33huwKlN483qpy+9+y
	nsZWOE+Q5fXwoDLmjGdeG8k6ABsyaxdo0evxmYVeCfbcZURQ16c/kWZjtn8bxxPKP0dXGoJU6jX
	I+Xu164WABqfe/eOb4j/LbST063g2X8shxwtHr9is1Cv0gzefBBy7Ekca6VG8P4KUA9w7S5bns+
	Os8XO0K3efHWDUQ2DOL1pgTSHH/uYV4YDuOwpRn3ro1dxLKAUJukQq7LH5oV9tk8PPcQsGlaq1i
	67b4tAFtdKVLQhexS7sh4EGsV+ntDkVey5OVI4jCSEutQJ68WxBTZWb1QtUCZRm4d/wFZo8v+vk
	nj14BPFFaBPG3HKc2ghthq+Kfwg==
X-Received: by 2002:ac8:7c49:0:b0:51c:de5:bd4b with SMTP id d75a77b69052e-51e4edde1cfmr64748481cf.16.1784188728987;
        Thu, 16 Jul 2026 00:58:48 -0700 (PDT)
X-Received: by 2002:ac8:7c49:0:b0:51c:de5:bd4b with SMTP id d75a77b69052e-51e4edde1cfmr64748321cf.16.1784188728621;
        Thu, 16 Jul 2026 00:58:48 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a63esm22876616f8f.9.2026.07.16.00.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:58:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>,
        mfd@lists.linux.dev
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
Date: Thu, 16 Jul 2026 09:58:42 +0200
Message-ID: <178418869936.4524.15759697748852640442.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4MSBTYWx0ZWRfX0gn7fXJb09QB
 ED/3XdHyEYkVKfuGsLL2vF9nfjxD5n3qkP2oPN9soCvglMDkl1UNkscE+z/75NRZH4lKAK/s5TB
 5cto19ERmgLxkKmvFZbQ7CH44qEI3zw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4MSBTYWx0ZWRfX1sdVdALlhrI2
 gA43LMWZ6xMMlLGBT6wvtvC0f/tcuKkGlHBCh0FKMU0X0dXv3tNEMzaheys898lCpCNRFw7OcjT
 hLn2wdUiez5hxckiQzIcpozgNRNBJ90QOJSSibYQ1h9RWF+i5BZIo39mKK9zGB3/I8m9TXORpsU
 UR65iWt+ZGG35Rie+/SrUHg3My1hTXjYloANv6GixyssWgumGE/64b2tgKIjgC2dtgbR5ZXMNRw
 B3zbFCsJgHFSsFv5/v6uTX6250hZA5gBZFTzMBrgHnlpgmXws17O8fe43S46c+oyS46EKBGEN1U
 dufF9Qf2iQwut6AmF1VsDt1ty3g2zqC5IokyUF2mz/lhSkx/4j3VrP+0TaCjZAjv94kqnpax1jE
 IJMRe0d3E6qB2yH91vCh2MCa7N6M+EHiSq8cxdOxlAmoPG+aevfsfMKxsQQZ02TrXCSQK8gnuXA
 BarbdDY54REaxhWSNMA==
X-Proofpoint-ORIG-GUID: UJGtvS0u45OrFzHqEhU6uX_254J8qXTF
X-Authority-Analysis: v=2.4 cv=Lt2iDHdc c=1 sm=1 tr=0 ts=6a588f39 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eBqHV7G4w-rDf1fxsOIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: UJGtvS0u45OrFzHqEhU6uX_254J8qXTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160081


On Wed, 15 Jul 2026 21:23:30 +0200, Andy Shevchenko wrote:
> No more users.
> 
> 

Yes please! Thank you!

[1/1] gpio: legacy: Kill gpio_set_value_cansleep()
      https://git.kernel.org/brgl/c/aa4bc3b7d36d52caf7c3d3214ae4ce96d609e8c5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
