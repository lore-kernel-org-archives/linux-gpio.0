Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704398;
	b=QFQaeXlHrq5obOwbN+j+agDRxAIJVYF9tgeIWU6luUvbOiIYr70Vhig69gHJIjXyTCGp
	 +uvCYNHMcDRjLc7BkMwGJym0oxmfkL3tNb5k2LmpVig8Mir25jMpXCgb12ABmUinAFv/Z
	 eZKd5p6y+POhJpYaAfIFKBWoexqKr0q0jH+bz7MSKKlojIhlrzCb0tFD1upUeZdIbP8C+
	 yBEZLlRL5vOcF2HcAqK0EEvOGGxFX9qUqTnuq3rLobhwSc45KRDtafFDrt9JIYTW9/xpS
	 i39J6otAQPatgi7FbXL37Mk21msPtpKKUyN2zmNaOi/SlcyGfM6wld31weECuriSFiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wFLdnzViVQExQFveC2QeccdnDcgniYhvPZabrU5FjTw=;
	b=0iUIxi1PiB8vaqlawuTjSj6xhy8SAAHgNGXgM1oAKHLhzOPe4qSF5YFGQmDOj37mH4Q8
	 UxpM66nbZ6n65Bs+erf4p+ncVM99WBZCMHm5DQgGK+9L4b4ky/lLBh5iq7tieNofr7vi8
	 ewZNM6OOnKIh3igQ8ndP2h34jeVWI/Rcx/bn2j/rItc7+OsMbbXqRCdFBSt0jaUmnbf5z
	 cl9ZwzBd+dqpG6nj5h1bMlSXNWsT0XYTcl77WmlJelspqPVvY6TnzY4ljejAiKy6UV4u1
	 LxrAaRNpyb9u/tLqw2u9oF+LhTmW116zUvQkeDHMnOi3JA4wfuDJnN/wZiAOeE977Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J1c4C159;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZ9nBuI8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952F0606A329
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 952F0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J1c4C159;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZ9nBuI8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV3Z71882502
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wFLdnzViVQExQFveC2QeccdnDcgniYhvPZabrU5FjTw=; b=J1c4C159zdogg8z7
	itHe1ocGpwoXxtZHGRjFWNIjM4YW/cpOUUQckuH8dpzWcJCmkTp6LcUlbpni27y+
	Xr0YIaIDRbzbFhlYhw0Yo0/oCJMJdCcHYZbAZTwSt9+DrgY7mZll3OO68ea/ZD9x
	c3iPoukVK4L8rah4qyQaA5TT/XM+fERmQ/8YSdAef9uQkpJtljflK/lcnX0Vq92k
	kk036Op8cj450bYrx9XfTNgitnnFmJtYoFiyWZ06msYsNuTQj1rcT5KCZjwKkgqf
	15uI1PpGSfhYKvqyHH8uBuoFaHhBueHQWNBAwu7879foAn/5CRRg47VlVVsJ5wmH
	FPG8og==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y3ga7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:46:36 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b35b88aa94so87150017b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 06:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704396; x=1796309196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wFLdnzViVQExQFveC2QeccdnDcgniYhvPZabrU5FjTw=;
        b=AZ9nBuI8JDkxCrRiiWRj7e0Mact1tWbaV8VwqfYPF67E7Efd+4JRZm//DUKUjlfZCj
         lDJ2FmSKttL2LvP6hKQPrxUVm1XMtM23X2rk6feJqlYxVCfMTCb8Jxl9UUIp+8NAlSrO
         gT+E+8bkWS9ZLAaw1w+68Brsak2d3z36tydL9aNt2K799JE9HNazrHCSzVxVAt9cqA4V
         te9EKmQ+X1b0FOmjQNRlf+7d7PEEAVbdSIoVJvph6dp7pt3TmspYfQwAcjc3FbT4GO5h
         4LPDpWutfa1XSKjYKEFvxYep/1DcYtEsvXkrA7ijp3InEDgteyK8ydjZIHYLEZCEBXQX
         H54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704396; x=1796309196;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFLdnzViVQExQFveC2QeccdnDcgniYhvPZabrU5FjTw=;
        b=0y8prjrmUp6SYeOeQbkvccPD1v/hFYUeUfoZfUvlLhdHrUKy+VPuscQZTS3qXjMvF2
         q8PZvXdC6+8LtYRy3sHTOwc/TugZYaImr+uM2NXXWfBJLBBa+eASEWKVNE1RoGKPnzj+
         QZ7+V6fbD6sLv9yU/aCmkG5sYYDV2/yXLpmF4vb+VkKvHXkFMRER4dVt8R7fWqRxUvg/
         PCOjeMzpxicCiiqbofbxpvRP/mUrtlC7qqhiojRmJclz6Fqz568/DZLFpdY2tCi9+UWh
         sNS01TpZEfdBOVE8EV3mA4tkyHZ82Q7MaXFE7zV3vrdzgOdNBbu1QeLl8ZDmQB2TB1jy
         u1vQ==
X-Gm-Message-State: APuU4Z9KnyzylTTBFaIUh9nHm+vlccGZbxrQ7M27TQUtSH2y8F1DHnWO
	jenIbwRo8X9X0WFgzKBqC3TCQ7Zc4NjXGbi5hKVyXsjuR5Kz0zowfx1nA5rakIZ+p8SyP/M8bnH
	OFdgtrLU3r8jL0eUUK/BICmJ+SkOnBht+ghnEYVa7pUFtxPRb+7VJpXTdhlUJOO6GwVg+8Dz8
X-Gm-Gg: AZFdTZfK7j40TCS6zB54x0eC+UGTna2+3kPMtvcn+6xf/1MdgixPQX1ps3ZQe7qB2X1
	gty1H4KzdYToG8rhx7ROpmwinC9/ndwDaLffLmDZQ12AczNdWxvIwfRGv+c6YM3rvIScMY8L/m+
	opAg0aY4Fg/sEzxVvpDEjjszqObpZsDCsdDMYphy5Feu8fThAp2/BH7HQV0EVugVRh5FIod4Ldl
	aiwX/juVX4EhRm9iw5wVyvRSUpjFuy4biNQzni7CbWnTF6T6jP6e/r3sm8nOzSp8XtLWWuKc+R/
	WJ2k2TxmlzQgeSteUv7huGT70HvuC7vkjU6jmJVhotcrAjkgJpY2wF9bXLHsbzGP+eUeTcfZhui
	nFe2XRWRWJ5GeDJldaYxAwC4OKyRbAVbL7y2NUKiS1k0LvmhLJsgaEezle2easFm1iEDuJZjWfb
	qgW/2yYN0A0JqCQvU1YWzxMh+BkoU/sEs2wSmIMtZPUjeDHMI4X5DxNaH1JdEj/w==
X-Received: by 2002:a05:690c:10:b0:8b4:c3e4:9c4f with SMTP id 00721157ae682-8b5204356c5mr76922247b3.30.1795704395723;
        Thu, 26 Nov 2026 06:46:35 -0800 (PST)
X-Received: by 2002:a05:690c:10:b0:8b4:c3e4:9c4f with SMTP id 00721157ae682-8b5204356c5mr76921927b3.30.1795704395086;
        Thu, 26 Nov 2026 06:46:35 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm33618249f8f.35.2026.11.26.06.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:46:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Alexandre Courbot <acourbot@nvidia.com>, stable@vger.kernel.org
Subject: Re: [PATCH v5] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
Date: Thu, 26 Nov 2026 15:46:32 +0100
Message-ID: <179570439030.25582.7595361557378134716.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126001323.583722-1-rosenp@gmail.com>
References: <20261126001323.583722-1-rosenp@gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX0/GMwbKStL99
 gPRKnGyPDHNtqRPTLqSNXMTZUfHuZqZX1kA/eSfwJrr0BqqPQNaBt+MqINHZhxedf8+9+rhUWLa
 4yNlVnM1WboiZYoKLMQSqm985GUmjOZfuJ1gbPCD0oCAEZamI/kPxcU4rvmI1xfxEv6lCCWS4s3
 KdW+NxLjZ1IpoCpZnIDhvkM0qpaO+eg8tAXsIKRrvFQNry2+qBERdId+GnvNw0kIDY5RHdNSrk6
 3vBH9187pj1vekvceFMa3LC9/E0k2XFkrHdzQQdkPlyh0V/9ANfIJcDDdhNZg4ikmmUb2FeyMFv
 3Ago/AIo3r6qXcDdY3PRoWAgDekbHDfDDc1vZADwMftfelcTOcnyUfRN8muPx5QS+4PZZ0U1pXe
 A1uYMocTzft0WD7C6+c1Xy+ZgyHhXtj3agBl5kslMPt9ICeexBtU2azMlBoI1j/zYEI947etNai
 yK1tHEcyiESLNjSu/dg==
X-Proofpoint-GUID: sbrm_fkp4LViPk4nO2jNXDez5dSLVbG0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX4fK5AMCjhXaG
 A3xW096Hgl0Sgjh6iDr9X5ahUkejp2ZcpqACjyeovgPDrc1W1cIoMXDH7vfLK3C3jYNQIorQrK7
 rM01W/gAEwrKd8w9paLtfiiRkG4dReM=
X-Proofpoint-ORIG-GUID: sbrm_fkp4LViPk4nO2jNXDez5dSLVbG0
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b08464c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=l9ZZRpswVw4obxJKafQA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260057


On Wed, 25 Nov 2026 16:13:23 -0800, Rosen Penev wrote:
> The Armada XP variant keeps the per-CPU edge/level mask registers in a
> second I/O window (percpu_regs) rather than in the main GPIO window.
> The suspend and resume paths however read and wrote them through
> mvchip->regs with the per-CPU offsets, which hits unrelated registers
> in the main window (including the global GPIO_EDGE_MASK /
> GPIO_LEVEL_MASK registers) instead. The per-CPU mask state was
> therefore never saved or restored, so interrupts the kernel had
> unmasked could stay masked after resume, while the main window was
> written with per-CPU mask values.
> 
> [...]

Applied, thanks!

[1/1] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
      https://git.kernel.org/brgl/c/d8e27d04274746093f8d5a4e909efd9885262166

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
