Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868830;
	b=GwMfA8oH/rD4w1r9CPy6A9Y+F55xKE7nLpcmm4hwkFJZh/JDlyZ0CFtK8CiqxFk0A744
	 jaah1J+7fHElWEgXjBMqCV7F3MePX59YEWp2AFP80ipu/yri9WWcaRdaiQFHdb+Q4sNn7
	 jpAVr/y0TG1jR7g4RryeY3IFA7vKrVbKffrWUrP2LcxVAK0yzroGYQpXL6CR5ygaWUqKI
	 NFrxvG0fZKWyjFx10grb48DOZZQIm2rj6RBJE0f5e3MzZO4o12/UaCKVV+XEDUE0QQwmV
	 IqsmXqpDSHeS0AsISBVWJ0V1R6Nw4MxtDoLfNdTyIxWPp/wDEGGNQfqjMvsIeL2gblA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=;
	b=ZszrFVmRywxSN2CHN1yPnLByDrvsNy0YX524ZPKzY01Gt45LQL8OoI02eaz4kcL+5ceT
	 UtPEICVRMaRJzQhw7cQOOCy3e/kjhS064lo4rp/8U4FC3Y+NLVVWauYjn1z3q3++xpg1F
	 tzDSJsTZlcPrs30qsm8bYS/2cWOc+sid93L+HO9lDxP3+tGSsXvQn3xbYK12F90SireCD
	 yP0JCrcXKZYBPWdGgnr7daTiXZO4JqM1Fl1OapFjJWp3WkuhsNQIpfKOCVcbyB4lyWaH/
	 5BUy2E8sqA+pzzTWDD9D7rm0/xIq1XRMc7yTqG3CALrcjcv3Y8jk0LPc4jZVuQ3Ju7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtK1jRhQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iATxgeve;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1980606A326
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1980606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtK1jRhQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iATxgeve
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U6kn4169637
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 08:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=; b=NtK1jRhQDPmPfLbl
	lJRI9GXWkIjGe+ZXQIAyuuMwPV+w9sqhkbyijOxMRAOEPCF8wVttPc9wAE+UJv+s
	TDqIFpQmcKYTxDWBW7lAhNyZWZEviTOPcfBrHCnmAxpUtI2xfTqCCqFDJ4KtfU9a
	FSQlNTe8IJ957w51Wzw9AgndJLObJ/VwjK4dUBlF2CYMNItf8mBnfET2vi5IlcUn
	kQRWYMEJWtUxGDAio0XYqccg8SBZFBo7a4/2XMYePw8/C4JGkkQ2CJmH+YtrOS8X
	mle8yLeEz6aZnzaC7/fJmzgkaCtXvJlIo/uam7OlocQFtuyz/QJ/ae1h93ShDaTW
	7ZTYNQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd8kd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 08:53:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so1389026137.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868828; x=1794473628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=;
        b=iATxgeveKauDkMp/r+SJf68Ws+bDaS4YM+NpUCKzFCYQKKtWirZv/R1EqrCp5Q96IB
         aYhrMC1N1MBOzHaH9gM939JYVPlGe86SIBC2os4IR1gCKRj9h2DN6JQ+8yOq4MgW4b/8
         cFJU9CNxUB1blkv+qpEacbKt8dpVZc7H1D3fCM6CthZkpjh0mQTywZ6rqlFm2XLSu4k6
         SpO/7BUnbjAlGwYv6bLo4wCCRWrXQLskddFiOaP3sKunoPTRTqiOlvSTFJxxpQCMLQke
         x/8HFJxJWMeOfxx50Urrn/kwmCIU8xpVvWrnrK06UDYMbmBEq21Mh+ZdrWfd+35NY9zb
         5WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868828; x=1794473628;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=;
        b=NtflpKjkl/oyfrklQ9jgxg49HtWXFQGZhDGceCknB3zzJZl0arttTk3pqXG9KjtkPL
         T5YZch1IcEHSP9GWMPKht5dUtog1dAP5XwmHKshsaNbRl55aTa6QpibLAHZk1FnUpF2U
         e3UxUfhEWOqfO03TXEKSuEP4naU/Mb2HntAOcJkAWIyndRPFDcMtZhkrE8axxTbmX3Cz
         kOMx3Dzf6T9oBEGnOFuLSKH73sx9dj11bfUc8WVPYfpc7B5j7aInE8lGHWQxG/oBuNdH
         vWjI6e406lVL7kTXgrfh86eeDy8j0X2qq9rYZ9aYFZwPL0YjifI6pv7SbVAuc2TnLuO2
         tpxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZJzZsMmRMUr9i7OLCBcZl1EDjs5tNdcDbgvNU8D5kW50DEwYjJUdEHBDiWlxTSfyArt/7hiuT33Gq@vger.kernel.org
X-Gm-Message-State: APuU4Z9rDjFiOQywKSbGgrGYffPItPRdZ0xxHjpU8cVk0JehSl8OYqyC
	Uz+8L5494yD6WewGG7af3jRFf8XWCp/Q/BSSFdXsYERtJgXFT9PeVTryv63FLwtEdqzDiMfYCDw
	0ig7jFgWs8xr9RUuJwrDCkD+v7gfBuSFbgwa3NkFQTBpsTpjFKl45BRYPwy1deRah3iBQTmRk
X-Gm-Gg: AYBFou1cbpuea6ySPQ502PV25hSOKM/QtheZmpHDxe3in2MdoptUnXLxbL7C40YfH7q
	21anDf2pqyk8RjsfeBrzWZFhD0agRGBxAsDPNMSafj6QJrnBJUpNh0Do4frKS5fceafZ/6RcIOm
	WJtBYLWQ5MxFHobRpKU96NI2P9QT48boXgg0IhLg4mZQIIhsobM5csCoQrc+uifcpO0tmgH7i3I
	dZrgd4SSBOKGxSn8rXa5YHG+Ds4GWzlfm4Gz0IYYjFbUzzbjMyV4ZxP4fNbZEcju3/vDCm437dR
	PMyKyPM/9O0NhVuwEyiP5fzH1o5LgL7pB/x7sef6Gvig9qu0svglKqzA6ymWd5VN/LC67jtcozj
	+DbatXMtLTONWdDicWkEQPrcGCaKYrfF+VD2ZZSs7vyQ4rYYt2i2KApL5jhmKB5nlozp7alYca5
	6Y
X-Received: by 2002:a05:6102:80a4:b0:7d2:7827:c03 with SMTP id ada2fe7eead31-7d278270d6fmr2667829137.25.1793868827910;
        Thu, 05 Nov 2026 00:53:47 -0800 (PST)
X-Received: by 2002:a05:6102:80a4:b0:7d2:7827:c03 with SMTP id ada2fe7eead31-7d278270d6fmr2667808137.25.1793868827489;
        Thu, 05 Nov 2026 00:53:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecf8e341sm8972866f8f.25.2026.11.05.00.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:53:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Adrian Ng <adrianhoyin.ng@altera.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] gpio: Convert to subsys_platform_driver()
Date: Thu,  5 Nov 2026 09:53:44 +0100
Message-ID: <179386882212.12982.11268787304162434768.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104113309.1634121-1-peng.fan@oss.nxp.com>
References: <20261104113309.1634121-1-peng.fan@oss.nxp.com>
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
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec441c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DqZYlRkov0yPPlpfqKoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 5twqGUGLuh2-Nl_Is2USbmeEHhoPuYUL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX+F5PZmyqLJ8w
 CvuF+mb+4h7kWqT0OGA20+Mjzq8Mhfng5IO+Lwxhfn4pB6IThduQmmlIwBWa4412R/BiVEZGbVc
 CYrk9DBPTtKS/OFLa/ItR7hPdQkhVTw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX2mfK1WPDme/E
 ou1bX1O7PQ7uq8vk7KNISBZTkUVibz1C1Lyz3biK3NCGAR78T4totghAZflCkuFkeOzyudTFu9w
 SFo+sLnBsw74iLIrVTKb5u1Qq17iArQvnDhe7NpyHwD6j6PwehBrCCXu+egq6JXv4mF1vSeWluY
 mosOYzvfQJS6ANHbZBgZ0DcsIHuffFt2sN60fTW2+cEuuxdtMVsoOoKtLf6HTxz7EmdrURJpjKw
 vscTeCTsmP1A11sBJO8nwkR8Fb+GWIIcwYzZpF2fhN58oOE+lYnJY1l8dIu8128Bk6edD2UjTs1
 EQTBmdHS7Sxrvl0KYmUXQVXAhfu7RtNhVqRSiu8J1NwBGY85yIO/+SZdRT494tmw8ITjroip/7n
 Nr9dJNCrFOC+oNQsvMbyD/cR4w1DZpPz3oFT1/Gi1VLBtJt2+/nuMc/qfk5aoltBjWDJUZSpp3c
 k4R0w5dRvPvI6dHuY1A==
X-Proofpoint-ORIG-GUID: 5twqGUGLuh2-Nl_Is2USbmeEHhoPuYUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035


On Wed, 04 Nov 2026 19:33:09 +0800, Peng Fan (OSS) wrote:
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> 

Applied, thanks!

[1/1] gpio: Convert to subsys_platform_driver()
      https://git.kernel.org/brgl/c/123be56be13ca95f5bd5f143bc2d6edf0fe71221

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
