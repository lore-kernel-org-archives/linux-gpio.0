Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0815330D35
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210102; cv=none; b=N1oJTS9c0pvTjeccrrZJX73tx0WqUZ8omOaWwZUI2CZtuxzJtUXo/KOZ+ZorIdudPoYezo70zXCxM1Nj3ljY43cmntnL5B9F+QCvUMCd6vBVcEdS+87OPRQEipgWy9siMX560cAlAFO2kCLCuQWYFoimjiG4L+StGpPlCKwX8sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210102; c=relaxed/simple;
	bh=FPrJmaVk4ArO2ZSSTjX7T4UsBhOE004iI3cCowCeRO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FsWkeRz0LsoWwUrgyabE/4JP6vnLAcuZXgJ6/B7VlSk98bKAKrw8f5tX9b9lkqEYZYzPHwugy4xDkEQDzcGQWbd/Hn8TenClhthLeNbpCcIbyw85Fs8iK60DBn8vibMvQ34ikJn3hIcwfGiwrNCnc+Tp9b7bQld2jQKYFm+Fwao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cl+JlB1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1hrs5Ot; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cl+JlB1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1hrs5Ot"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDKVQm2858000
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 13:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76hpgwGdW+31xLTgUxLwgEBfOk+woSeDm8vuSdihgRM=; b=Cl+JlB1tXCEX/+pO
	Hv3FdXEOaS3PBOK5riAJMxzEJB1GKjBlgoZuEI/2/lYxt/dBNprzU5XuHJKrFfEq
	tYez/jKV/G3Z0afV2fgCKkr9wF2X14swBON7EbyglAYU3vBBf3L119GdGczGanLJ
	wEc5q3/ApKvQgLW7PuLqIFyGxLM/evvvdXEhXpe/DkXT+tCUlohV4MmhK2l56waY
	9GWKUPWZlzayS8nL/D4QNNhZ2SLfxa+tSc9F5teYV3rPWE10MpkDORgw/uhQW15R
	6PmpgaeYpzjoblgCn2vgUqFjt35Mqfbr1ql+pQ1b+WXgmua8AeUEybY1SEugx5m6
	u7ZCUw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex1fdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 13:54:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso5779481cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 06:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784210099; x=1784814899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=76hpgwGdW+31xLTgUxLwgEBfOk+woSeDm8vuSdihgRM=;
        b=Y1hrs5OtL0M6FxUuduHlZktEcnaLJH/Cwesw0u/G6n4oHxJ2Vc+BKHihIEmBIVBjl2
         vytxwQ+ANVTsFEMBBnFcDLIPkxZIjZPOUIXyLidipAEiRE5wmxYPaFGjfHnhOVEuVYgH
         P/8bs6peZeoQrNVD8qa0xkRroZtf9IALJ3GJ7RwMcU7zbLY3/01Tra368uyPrvS5NYLJ
         uIj33FHZIw99JiR/eZVRHSMnrJaGP+Sy2G7rOc00OEvtyOqQnyiT9yeEDdeuVhh66FBN
         4OAAZCWstBg2/N9aWIHUPGZP5LN3lc5gRpGI2oYxdOuG7JsiCswKLaeEyGAzbLmqG1SU
         48IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784210099; x=1784814899;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76hpgwGdW+31xLTgUxLwgEBfOk+woSeDm8vuSdihgRM=;
        b=SQbKv9DNTVka3s9rbh1aia1vkqFhPdPsnOKI0uyAtCjZmQ6CPwADHh9VGLnz4V06fk
         vFs8PRrq0N+BhBPfR0KvHjCiUp3hgJXKu1jYNyeTu15szYbpd3vQ0T1fFRA1+f/9Gcdl
         68h1AF0V7rErhzwU+Vpc9/hjL3xGCsJGnUKruNuOMp36Utpu5/ZFZcrzl9A1ve0HbfRn
         PFaaAlU2IjxA60FQf6SugJtob80LZg+g3E2ZP4x6nvkFOK1itECFl1+S2euMyr8rykun
         KU5cEV3mB/A0ChNi+HfZMQDtyGnioktg51j8CsC1cz60C+wDIjY8wVLLJ0XPHvYqqzjz
         RHfw==
X-Forwarded-Encrypted: i=1; AHgh+RqDaU3W+M6+QELqvs+7Br7ECg95UsrtWrY1hhgUFN4/2kEBChC7j2gIwGk8QP1fw/LQ4mquZVywEs/J@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCw7lfv1ghMjUSYVL2OtVOy1gzo0hBnXrCO3ppwlhvBRnNfsM
	0DqxHEwAeVQEq5yUMzpYVaJfgRPK1lu5fyyi2rOcaBGJEgRAuDKYCzqPdTncU1Be0QQEjTnfM5F
	g6WnSqn3yq6LUu8Cdx2m89eH0Wb4Ed/4FwBp062nZEILqnz/SHdjeNxKuGOfR/g2A
X-Gm-Gg: AfdE7ck6rTAySxQyt2lK1WWPYpyjJwA++2MSzZmOuoVPXevjOjaIFpAYoUFzW0cpStl
	AMPblT1PY+nyZ6rZ7SnBwdvMjSsABB6WuduOIbPoD9dplEGtsz0f9koXXG056oxZWwr2NInvEyo
	OlvrdEiFevyPI409K8ZvBdL6DfD/zfI9ZggbOcv9lYwyWQU8+Z7KyEf/We++sVUMFxaNVT8+DfY
	vGreSL8zaSRFBw/rVcOX2fht5qvFgFjf4D+RRjc82hsv4CatQ8OV0hc5Nhcaj8Y7bUFja4fAxVa
	Vdle5UgG1WJc1gZowho9++JDQUt508ryTpOAsdZJRII57L12KX+jO/Q8C2I5uiBqjYQTPbNb6iY
	uwTW5OyHPfk0cTl4YEGzJqQmsCA==
X-Received: by 2002:ac8:578d:0:b0:51c:98f:f282 with SMTP id d75a77b69052e-51fc1293148mr26127681cf.27.1784210099260;
        Thu, 16 Jul 2026 06:54:59 -0700 (PDT)
X-Received: by 2002:ac8:578d:0:b0:51c:98f:f282 with SMTP id d75a77b69052e-51fc1293148mr26127271cf.27.1784210098741;
        Thu, 16 Jul 2026 06:54:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm52817615e9.6.2026.07.16.06.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:54:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, ian.ray@gehealthcare.com,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: pca953x: fix pca953x_irq_bus_sync_unlock regmap lock
Date: Thu, 16 Jul 2026 15:54:54 +0200
Message-ID: <178421009045.21701.2719688493306554868.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709045116.2304246-1-mark.tomlinson@alliedtelesis.co.nz>
References: <20260709045116.2304246-1-mark.tomlinson@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a58e2b3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VvGnlNf22ANbwrc5_V4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: rWrXrrVnMMEfPkwZ1BDB93IAwMWA_9Gw
X-Proofpoint-GUID: rWrXrrVnMMEfPkwZ1BDB93IAwMWA_9Gw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0MyBTYWx0ZWRfX/9f90nZjKu/U
 SaSuxkXaBfn2e0HJMdY08XRYMP7QhPDjnHnNfE9SpVwz4MwX9QGATYUFiVoV6bxZuB/JOGCeC8G
 bU88816E3Ds2BaVYj4etI4WyqP1EH9s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0MyBTYWx0ZWRfX772D1NfDTvO6
 mmhMRwBUWTqaI43fxoQ9o+uKfQ2JW+qXvOXWUkHohItdcP1kbatRDVsPJT5PnW5JDywiZAfEPnn
 scH3sxUFvasFPKmkYtXrw69uRMEYTSzwGOqRabDfT3qgByEd9NjSJxUN9ypYhra+1IUYMn6PZPq
 Y/fXFHBs+Ri4EI9Jzvtd24hSGgZbAHrco4E7O4PdY8IzeSJ4OuxmvLsfMPTc01RcdUf++AJ8ITR
 A08q28CWYwQtiBHPm+jiq4vk7HWqbdtk5vF1Z4Eh/JW2wh+vRgjsqnAxoAJNHFODPZgCMbzOlFE
 QhxAcgnwn+Tqv5zWgRZB2nRg7Xw9L2b/ySWoOSJfZmZiN3ayM1dNcvCk7ikAL15eTvZ6TxjuWF+
 MqLGDZuCofDUyxS7BSDnircqX9MNgxgqy0lmbCQ35CLccEBKW+4clmxXpeTHFybFgybDYTqfXlc
 HoO9t+QYqXjLqDMxyMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160143


On Thu, 09 Jul 2026 16:51:16 +1200, Mark Tomlinson wrote:
> Locking is disabled in the regmap config as this driver uses its own
> lock. This means that all calls to regmap functions (read or write) must
> hold the i2c_lock. The function pca953x_irq_bus_sync_unlock() did not do
> this, and it was therefore possible that multiple threads could cause an
> incorrect register to be read/written.
> 
> A previous patch partly fixed this, but only protected the write to the
> interrupt mask register, and not the read from the direction register.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: fix pca953x_irq_bus_sync_unlock regmap lock
      https://git.kernel.org/brgl/c/9dc325327babe7f159e84cbe9380a45342da0585

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
