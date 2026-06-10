Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18AE38F233
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781076662; cv=none; b=mUjCqYKq1fyyLCAkdtVKnJlrivBdX+P2xetbWGHRmJFSEAHZegifLrALP7LPLZmsjfQkQ7lIU54ddMeyk1eDDuqdumwHY1aqupTx9QCncd2Ibj2G0633kKSUiywToW3XYZQqZDGb753v+ctqS4zEfkcWnhM6DBiQx9VkaaBhFPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781076662; c=relaxed/simple;
	bh=+7wCiWe7xSodk6KewszI/QByDWJOmQtrfi2H3eRuJlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lfsSVLI25IzKW5yyUKUAz4KAVwupHynac9xNmsuA3TtyPUxx20EkWkYHX7Rarw0lkzWRd7pRKhWgub3OIvptllJCijBAESmdF7X8twtnrRm6tZ9yxSN9FVKZoMJ9S7RaPvyWMQrT5kgXNrSbMSei5Qv1qPGowfY2vctTYspME44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPWvggMT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvL1LIa6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPWvggMT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvL1LIa6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A45JrK387509
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBuNOiMOhQvIrhbtG5bOxTJ6HJ+ClG/EAfE17uShmTA=; b=pPWvggMTsJrvrM5M
	fnSO5gUVMb4h72g8gz0alhAXm99YrOeB9bPtciAnx79A/tL5W/VEI2srAnQow5EH
	sfFEhOfH763GTdX0N8UAZ4LWhjVE510By728J/cLfKsPbOeNeQqCebTWxdBDB3VQ
	edO4FtE2l/NXtgI7UL72gjQWLbO2O0SXJsZsrSTIPEYOAvcsacn2upKpeCS3ngB4
	1PEwS6iILC62HwBLjTGIZmCWYgs6KMeW1ORGQwg0DiigzV20mhtZpZaE15plT8NN
	A6hGqsARSKLGcuyAdbMnV/kRzPSZoiBRrDuG0YlVmv0Z9x9A9oNl9ZYKkGbES7XJ
	xZfEQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd8p4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:30:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177f07ea82so157462061cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 00:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781076658; x=1781681458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBuNOiMOhQvIrhbtG5bOxTJ6HJ+ClG/EAfE17uShmTA=;
        b=EvL1LIa6+VHvkmUoS52a52mFPgNeT0+92aO9j2n3dxMp/Y0DvzDMZN1PnaRjzkp3n0
         2Ly1Arlh1si0xMLEUBHrCNgA22+9vHO2EiC8j9/g6JXur6wp3ypRHjSnifd8FMFGvf22
         OZJVFzyjbpx1u97SM0YDas3qgkeQw746mcN6mrNvO3RADZ06dEPSFZg3oEys/0deQpGY
         mi+zUxVIkStmpDXrHYVbzPj5cv66dkxa6Gds/Uvckvlsb0fDGhIw/OWncEZOfhPQwz74
         Jrx3M/OFbhl1RgT1NwnlmTvg/qPvygfUkSQfvlwUE6daiH7aNAODG1H9R3X3jnu84/Ns
         wg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781076658; x=1781681458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cBuNOiMOhQvIrhbtG5bOxTJ6HJ+ClG/EAfE17uShmTA=;
        b=iivPbfCD6coH/nQ9zKQJKEPxXxJMQ+ivRNDn1x6gLZQ8i4BnZauRdJYkJCcA3sk3aZ
         Vj7u1H7BXVF+fgPmdVUtE/1PE4v43YTmNlEMAP0ULviwuymD2VKGORk4kc7ET+Oi+ISP
         jPfd37R/z7hBr87rLKNp1CKjusLZ6yZd8+zFm+l/2m5fSZPoQbhvBKvHayhw/LNhjx8n
         q6YKFXGecXI71x2gca3w/WoNYAzm4UgU+1Fv0UX/JRW3ph+XBaIy1Ka+K21CimMR20O7
         j6W6s9Th0whqCvdLcnBX7aSTkPrWASHtC0HyPlAmWmoYZJ0dEDYRxUchgFWor5sWkS1P
         eRHg==
X-Gm-Message-State: AOJu0YwcTvJy0mOiD8iBVaoKtxd9BPmWDawanJX5dtrbbiSDPy3AgWO8
	SQrwko5QIGyONdRyaMZx7wWiqnf81yKzS/ZXHzyejtittQPSkoLCqkqucWRVuZ7QW9Mz2E2NXmT
	zyBdq83Q5Tjtf6SdZEa9OV4wwf78UVXjIQxOqDoEKPBYJL+04R3x3wQYJVV1ZTSSd
X-Gm-Gg: Acq92OFrUtILfz78aYA2oyY8A7DWP2aufBvi7qsP+FCBxgmvSbpbIZ80aK+jCahCKuv
	UnoAqHH7Vp0irxLgAI82ty2cdL8ZHSJoTTkYpA9NoNn6qfDuHgeNTVR/q5Y9AOm92et3ENvXNse
	CYPDCzEeKacb5oyLbkzlUQlq9B8koO2j6GbhetIjODvP8a7SbzOPzCx/VqeQhnqW1wV2ytEUo0x
	LDYwcl410+jrAp4i8honG+wS5RIemfGYGueqDZVWQGcqoTOuLLLCXt2hYsO71Na9mP6EZ1jMKoP
	MT9zmFFFNGrfYkDK1Gc1CxbuqAtQhe2bazpXMKGKgeUaNABz2JC2Lq9CQ+spE0mrfkNE4eGXRQC
	/4kOzP7j71Tmo5cwPolPZX2PuTbfLF9hstlrIlI9qHoAySteju9qcXi+6f5aX
X-Received: by 2002:a05:622a:58e:b0:517:626b:786 with SMTP id d75a77b69052e-51795a2bc8fmr362732151cf.15.1781076657981;
        Wed, 10 Jun 2026 00:30:57 -0700 (PDT)
X-Received: by 2002:a05:622a:58e:b0:517:626b:786 with SMTP id d75a77b69052e-51795a2bc8fmr362731731cf.15.1781076657541;
        Wed, 10 Jun 2026 00:30:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:528e:d8e3:7d1b:c55f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm548113935e9.6.2026.06.10.00.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:30:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] gpio: fix regressions in GPIO hogs after the code refactoring
Date: Wed, 10 Jun 2026 09:30:54 +0200
Message-ID: <178107663895.5906.8130575302931174801.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
References: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a2912b2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DUAIqU9UZ1F93QMig8QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _sMsXamxuHULo03O6pGO4Mtz441ZTgWE
X-Proofpoint-ORIG-GUID: _sMsXamxuHULo03O6pGO4Mtz441ZTgWE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2OSBTYWx0ZWRfX6s7AwsqtW6VO
 bAVUgyhQIOvoLOGnyaA+eK5bd6e8NhNrLuUnuN4to1HObxOEoOii0XFd8a1DIj/9RrIDljOtDF4
 bdRlrqXIh79qFBfWrRu7hKbIS6gi6GKcmbnrYr+G55pqq+Ot6ALtV/GRX3xFH4McRU4Ulq9Ov2y
 sMz2huDKd1BxD1626l44aKB8SZpC7vzCcUnCL4jQrBbgG8lKWurMKgF8ez4f63TL4ua47gNwdUn
 LkuHrsQSK/oQFqhDJJiQqMnvp8ryewSwT+c0pwRXkoA38028S/oGDIhVnPaWYU+eH0e4anZfl76
 WQ2AZb3o/69ZR6eZnKLFSLDFMzGCklssglihN0yBXaR4Xt4hwOkCjuTgSysv1QMWc8qvZeioZLk
 lMnexEVKHBn91L6UZxxmiMwuhs6Zp4RTLCouXg+NmxrkTASOIB2o4f5suiOw90Q2Ba4soDKPP0q
 O8MxWwFQzZRFGanyKuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100069


On Tue, 09 Jun 2026 14:17:48 +0200, Bartosz Golaszewski wrote:
> Fix issues pointed out by sashiko.
> 
> 

Applied, thanks!

[2/2] gpio: fix cleanup path on hog failure
      https://git.kernel.org/brgl/c/64911f5aac534191e6b9a52ca1d50ba870a12d86

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
