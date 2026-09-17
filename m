Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6335049E5F9
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638762; cv=none; b=MjtFz0iQ1+IjzxC4gB65joORCXjglcnWKnFFNTyWyGdY80UHWo9T21jj4/9W+vDETEXkswz3J4P3onx9FPE8u1gzQmyqrgsjK+3gSXbFK37F+IP/9+wIRq6VwrsdwjOyl7/ciqAeae2oWL/CxnDco7Sv1Tgm890nfHWUCkZ5YZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638762; c=relaxed/simple;
	bh=eCh+lQ06Yqem0J/L72w7Iu/+L9tJW4QJJeQpsqN+QMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ShWM9x5r8jBMl0klFzojiDAnR7vGvxeazbY7I54iy5esUZ4uYbsCJ9QYQEM1fzFF2Hy6SIgA3mrBnnwU6IGUKYhI2v0BTmJsGK62IzsFWUqZLwo/lY90LIZ35VDue0DF51JfurXxeABq79I6mEDE+HTQM6FxDwKv24MH1K93xxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRQanFvj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekDW3YHZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRQanFvj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekDW3YHZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZaDQ1150010
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vj3q1rEatZbNYhDgOOz/n/ThSNJKjldYi19PJG85UUQ=; b=lRQanFvje23OlNKQ
	KqT8zUnUqp9FPzKbNr2Gp/oUtnxjUzP5x2c3Vx0qs5WOceuBBheHn5c+vaLRpr1p
	pmRHnORK+zWx0bptt3/Ziu0iQ28p6ZkZVJFADiywpEDfa0Y/OzgLkmCdlpfvEgY9
	tsVQzZVMDqlYrsH9PR3CfO56vKLrM9NXiDqxQJzheWDVaMyLMCHEYG1e4TE12YOF
	aLuNAC6eNjLFTfgMPJ4vV+Q+6fdayk4AT45G+lO/hhpuggvk0RAQJzLw297JxqEK
	DOW0Xjbcjk4BT5MUaX5zL0F127igLsF2719KgmJYB1qPwvY3t4wZv+DT4b6fmoO3
	UZRpIw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w8f57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:52:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91214e93c2cso8281036d6.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638754; x=1790243554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vj3q1rEatZbNYhDgOOz/n/ThSNJKjldYi19PJG85UUQ=;
        b=ekDW3YHZGEX1ifUtviIMvDjdoxIcjl9HYUj/g4e79PWgOfwavyZqkYkVSdt8j9lQuT
         9RHltY9fpJzTo3baJxd/W5S9jIgcZgM85bqqpemWklq4/4VIF21RnhZZlCBxxL4epXUW
         o9L9EBU+td7+LqM5LWeJY1hqOPr3LtbWPpylPlD36qTjm5lOBT8nDP8tSSOYpttJczdG
         xqDT3SU64VEW+vkhYq3uMCpW1KhZ9y3rva1+PCFtLWIkQg5pYgbE4TMQwnKrXM9aL0Pr
         m40zV+A5DYYWnXPWg0GqrYUCxDJVN4WeVNJWPfOYa09IAw8HaUnE/6xL4hCqYNa5+CIB
         ytQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638754; x=1790243554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vj3q1rEatZbNYhDgOOz/n/ThSNJKjldYi19PJG85UUQ=;
        b=xl4sgpGgi4rg08sn3xJjayV30OMr0ABb0hgO0N76lgsIyCMIAT3SgfB5vcxRaW2eZR
         gTcCcFtunmmFAruZcD3Rb7FqUVQdi2em+3shwfmjNgr54LUqC6E/qE4/2yWRIiRTYyWc
         1vH1hqAlXOcsIxzTnpsuvy7qOXJGFPhlAQtJo4onH+z6xKwp1d2MSLVNz7qGkqZmK2Py
         nenKiiospZE4gMijtiRF35B+0JecpgU/1R4LkUthRxQCt1kUEJ2a6LUUBBtcQvS0ERCC
         pbV/xGXKH3hCjthRf0BU2lsqBgKKlIVHFM6sdXZ2EttDyOvxfp6NJBruFeNBLq7B1S/A
         OGBw==
X-Gm-Message-State: AFuF++kbX7OTZ5MQDcmAdTgcfIF8tDFpU5bbUqwxGiLwE5KhmEZC7Oou
	oeQOOmVYlMeKLChfhREbOKT7VgWqjPJARsXmyPZzU+lC7hVoUt6RGoHXYeA5wi8Sf1Llo7ppKT5
	3bxq1i2bjCp+Gc08Bk3uBaMiKDU7gym2oqb8RHM/NVsLEa0I8D2RCCdwyZqE4q4c+f0NxZ8wr
X-Gm-Gg: AYBFou26hHc/mG0R7/u+ihgMd4u8X2LOaUFKKVfQrKQy1NaDkHcVGgIPDWsbOgtTW6/
	t9vNrZMvCcErnEWbB9oXn1VdLTVMecONT2TgipTgHFGrySsij/q6ZEt81TsQavDKLOr3TKwmYRk
	TzymnrPf1DvZbzzG2uLHbFAIk8keNB48neIc9/7KpZSJuQunQUPUriiGjTscnYATizZqDleInHg
	ScOnznfSe/kO25PQK6ll9vf1kHzNm/vcfk45e2pGPCrWNWQsrkxvOkefkU2RctjAb+/aYLDHi0D
	eCQWSzff71NO8YRQiKLkPpYOTvW+Jc72MI0StRb2Zw0yHbvYdnCa0ZMtR669oXRUpaMrGKPMUkk
	MOB7g4pYJsJ2EM6lVUxBEiUFyzh4=
X-Received: by 2002:a05:620a:6188:b0:93a:82a:71e5 with SMTP id af79cd13be357-93bb7703f59mr919230585a.19.1789638754217;
        Thu, 17 Sep 2026 02:52:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6188:b0:93a:82a:71e5 with SMTP id af79cd13be357-93bb7703f59mr919228885a.19.1789638753876;
        Thu, 17 Sep 2026 02:52:33 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216028sm60330255e9.7.2026.09.17.02.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:52:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
Subject: Re: [PATCHv2] gpio: mvebu: keep resume masks within the irqchip cache
Date: Thu, 17 Sep 2026 11:52:29 +0200
Message-ID: <178963874726.7902.8784965092061133801.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915004406.115230-1-rosenp@gmail.com>
References: <20260915004406.115230-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX2U31eJtz+56S
 5ACQU5h5wEkScWEToVnHgJ+MhM7/p8EWrLMb235ljPZYypkqWNY9ytTaTKw51n+cIRXOBLaZZqo
 u9ON9rQMLvV1GdvXXL3ecbdIU0ApmCzosj0a8dH2GahGOn8IBOxirHlDYYocEtwrdd2P5QlgD3t
 6lmpqIeBuIZiXBl9hBoeDPjnFTpM2TNXuQ6qbLql1yLQGbf43witjB6ZxkUJJ2NQufNk5aO169V
 NCtTwsgMZehzxOA+3cj42iBv3Q9AyPDgREO7V4X49OjHfb3H79I4/Ta5AlvgZkjvK8PhpUAWW50
 vGd269Vh6o7cvsvsXtZJM0KG29gOg/hvYBsrzp9FeoVk7VCbb5xHX0r1boEPr2rxK/NiRdmOqv5
 9+5oNTp3PVUdzUzJdWfa+S+Izn07HL3M2JLgr1vIFDwablDVrbahXV54SChnJE2uyxq2ovanAST
 gFFRo8RA4AlK6pQUzXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfXyxR99DEUfdmf
 cPuykkihJNf1Z+2OsE5wJLtj/vqHgcaclLJso8pJiSrUU3z5KUxQZq5jfat9o+FNh1QLBdfvMEY
 5QLg18GbhIzt67WfkQWaHoYYdmTmpbY=
X-Proofpoint-GUID: 5OEIyeDjdEgmzYdGry6QxxkYlhSAo_j3
X-Proofpoint-ORIG-GUID: 5OEIyeDjdEgmzYdGry6QxxkYlhSAo_j3
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aabb862 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hD_7jLK3eKd2lVZaDy4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170135


On Mon, 14 Sep 2026 17:44:06 -0700, Rosen Penev wrote:
> mvebu_gpio_resume() writes the edge/level mask registers saved at
> suspend time straight back to hardware, bypassing the irqchip's
> mask_cache_priv.  genirq skips mask_irq() for a line it already
> considers masked, so restoring a bit in hardware that genirq thinks
> is still masked leaves that line unmasked behind genirq's back.  An
> asserted level line then has nobody to ack it, and the moment
> interrupts are re-enabled the chained handler storms, hanging resume.
> 
> [...]

Applied, thanks!

[1/1] gpio: mvebu: keep resume masks within the irqchip cache
      https://git.kernel.org/brgl/c/02af7eac17bc62a72335c1fc8c4af4471654f6cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
