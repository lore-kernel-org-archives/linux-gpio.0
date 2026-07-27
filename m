Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286FF40BCAB
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157697; cv=none; b=Oghx53wjJfHgxAp+HZQL9vWt5xy9Gl2YADnXe4RrOz6RGMV7msue3j7mEyUfCAtkcLRodR0Z751TwJbFBGlctMjLsaT2aOTC824cXIcUUrlY0Cqfhs1o4ORwC7dJUinPiiF/eIl0IiWif1uZcsIo2nOozwuwNycoqcoZ8ZEEQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157697; c=relaxed/simple;
	bh=HYLFS+OFcWFTtSFm1PiU4CCDIq1dnlVTeFE2rXyTcVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mlxLCv+6g8MrgZm0i59eIlq4m+D+aD0rGiD/spArU29hRohcfBxm0WRHc9fDmtAXiJH11qLOCFmqri8dMp699G7AJhoXG413j93inB97ugGOHFOe7IAh2ycjwFq8iNVMcKQEEIlfO5S5g1hAZNUsK3huadN63RarymfnEmMYQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZW+gRPaN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDfOj6Ik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZW+gRPaN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDfOj6Ik"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMRH23594222
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 13:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZHWggkPMw97tiUjUmvN6ppmZKNPFHubbsI0aW0BRH0=; b=ZW+gRPaNKY/yucJS
	oJd/kSuFbPVjfpEj8uMQSMeAxIlBsxYYC8FJKKcmKeJ/AXu60CBCOoHcxbX45Rzj
	LwUXf+AjR5YS61fmWC4o4H0Cvd5GhNpZ4UE3wihFmNFAvZkN/j14yam9Eu27t2cY
	6F+AbrB+iXOxNRAjlkurLNyz6PCGkSisttOwPznaxyCfc9uL2NB4pofg3xfyjKmj
	VR3QXFQ626o5cBR08gb5BpnXd27j4qhMcPJOB5cdVWpaTpAYTA+GrmYMBDlMDVdg
	EeLkZuaiVOXgDucY12jlfbiRp86QZMywuMNZNXunX/4fyOnzQd/IOShdHr1X+TxI
	lCWewg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq0u09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 13:08:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-522de3c645dso56026581cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785157694; x=1785762494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZHWggkPMw97tiUjUmvN6ppmZKNPFHubbsI0aW0BRH0=;
        b=eDfOj6Ikz6QVCi/UrQWTug9VJl0dLoj3MQi0fxbhQmX/3J1y44pOFQoK8NE37RSMAy
         8q4vmIXxhHsJ9XnN/VPoaRJqTrR+vUx8sLoR1Tk7ZPI4L8cPXr7ssEXDysA1Quoi9G7B
         kxdvNkZd4vMxWDUckaHMFrOLGJgh9bghtQP+nZ4gKEjEO2k07HQczH4lcNAYDkXic6HA
         wIkvU0cQ0N/tlEbx3Bviy/0LOJvqyAMhvsAIQEbrBl13Hv+vVSkgu+8YJ5mrvBsHymDs
         fj//z2PL3R4Te01DVN51n/hEj2t9WgbSwoMaGpKZ4NRcY+t0QawD40qV5sr/EvkRDmn/
         1Otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157694; x=1785762494;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZHWggkPMw97tiUjUmvN6ppmZKNPFHubbsI0aW0BRH0=;
        b=TDttZFb7bTyk8Liev+Ib2rHBbrGTw96co/tmBt1orGNjKmxavddcIgnN1aUkFRO0HF
         AJecXnKCNonRGqTdKh4dtPebeksMB6T1hnmtBclImWP3sgIt55xvnA9/mTiJY68woX0t
         vJsdUg/kBZyyQOT5fbkO1qOeSXMScl5fhCGXLRPdrt56XIlwvQkWHUbyixkh6jAZ5o19
         E0xx9l9jKyTktARhSzgmn7EvIyNNZEAxW2Ef2aNNWkBpSSJ98ezAFyWVIKj118Cv3xx3
         0AuueZFPjFY22+Hd3SnJtmfLx+6GvlyvuA0a4HmGwTMFLRJ30pwoWPrtoK4fFZwpeaMh
         dN2w==
X-Forwarded-Encrypted: i=1; AHgh+RrKGltorUuEfw8Aj5/0Hl+XCeC/uEDa+vS3gMIHI4M1z4mQ/GE4I55QR2wuAIqH6wa6iS4uXO58xJ81@vger.kernel.org
X-Gm-Message-State: AOJu0YwQpxvlIG7zQ6cgtjJdI4huBSDoxNEEQnBxA+PN0Lhy+MBkUbM6
	27nX9K44DkS49R96aZcU+qxXUFAA0oZQES0CEib8qV79L6LUKl3gnc3wClbfDy/SScaGSPGGmt0
	7d6BiMMxRpypYwO8NvBPVp4ALuSFP+1U1ONlnYcqeTA3SMta5FjCYrp48bUHb7MET
X-Gm-Gg: AR+sD11bzYEphnR+oVs9fPoGT7B2dy8fsPYrlgTNRyRKYMcvL7wg0rvnHp/+b8UhdjZ
	GkmFwGVbKLPt2Ew7leqIkXCejNz8iP+3+E/vePhd3JeVEqBZf/cyfjY1WSXDKbce/M2/UePcO34
	teJQQ6SWnT12NvSr/1COTf5WjQjT3usGR8E/g2R5GMyHJ2+dYxkcJCRR8Dw2Ysh7JI0IV/bnAnp
	p+aUoalPuD8wU+5g/jzzGbX9B3hU0zXLz/eMJwHvvvgJG7OrqsMAz9ESJ1SENwCa2PJqEqxGbeq
	n6JHcIViE6+u4eGL1eFTepDeiEhLS9JtDWojJfUt9y+J7zwPjRYfvqVJMY2zZGbCn9NVuLVTDFO
	nSzjRu8gCib6XxG52Nvaqdfxj8UU=
X-Received: by 2002:ac8:570d:0:b0:51b:f98f:ea5e with SMTP id d75a77b69052e-529a84bb82bmr84853481cf.22.1785157694244;
        Mon, 27 Jul 2026 06:08:14 -0700 (PDT)
X-Received: by 2002:ac8:570d:0:b0:51b:f98f:ea5e with SMTP id d75a77b69052e-529a84bb82bmr84852721cf.22.1785157693717;
        Mon, 27 Jul 2026 06:08:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1449:2d40:6dd2:20d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfe07e1sm233635795e9.3.2026.07.27.06.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:08:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Junjie Cao <junjie.cao@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: pch: use raw_spinlock_t for the register lock
Date: Mon, 27 Jul 2026 15:08:11 +0200
Message-ID: <178515768299.55050.11621180913720960066.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723014129.1129730-1-junjie.cao@intel.com>
References: <20260723014129.1129730-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNyBTYWx0ZWRfXymj1gBJID2n6
 97ah+W/IBla2RMYtWHPonPctCrgEpgGKOJXf5Szo5CCMWHJLv4pa0DByVXx6Vnw41yHOFG+Q9Ky
 x95BGWQQ4NGgCeJ/Tg1PTb8hQHz0enc=
X-Proofpoint-ORIG-GUID: nuWXn1FXGX4_nlXQ1qZUKXOJ6dOARe1y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNyBTYWx0ZWRfX3KArkXSjQ/zI
 L0GyimWMG8yudE0Kbm3Nvucz4iT0QX9uJzpTdqkwfWfVKLSLFyEinGRQelcGvvmaCKM5MYKsLTa
 C5MHm8Jq7AKvoPD+mj2ZJcaw/YvDlZQC1ST6QgUTJjl+XYWs1p8XfU1Vx5GC3zJOEuWtzWhCr/D
 jD7GX+5d9MSu/phDJtXLANJxaU/vMgFUaq9b/yxQuYSbWgx3y2/uL4Po4DYjOABmnifSuYbUx6O
 m4tevba6HZsYTdMNB3FbSkJs8eCldBFRPU0yLZv3e71JXBtSMIEUclUFAjBNSSok68yu/W4hZcX
 OnS/lfeYKZ/1Smfvu7Npq/F1bNvItPWvIIoRB1yvazTYwxj8MbDoOZ6qL1xaWfgPuXySUj09ch5
 EzTrUXH7UoVVk5gXibdHT5R2q+l9GRUGRCHxwAoRi/NUExhiMiI1hEdV95JEAuQu2BKlDcbtjet
 lk+hfxKY73AC4dUR0Fg==
X-Proofpoint-GUID: nuWXn1FXGX4_nlXQ1qZUKXOJ6dOARe1y
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a67583e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=K0IHqChC3_vQdOeRQfIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270127


On Thu, 23 Jul 2026 09:41:29 +0800, Junjie Cao wrote:
> pch_irq_type() is registered as the irq_chip .irq_set_type callback and
> takes chip->spinlock with spin_lock_irqsave().  This callback is reached
> from __setup_irq() -> __irq_set_trigger() -> chip->irq_set_type() while
> the caller holds desc->lock, a raw_spinlock_t, with hardirqs disabled.
> That context is not sleepable, but on PREEMPT_RT a regular spinlock_t is
> an rtmutex-backed sleeping lock, so acquiring it there is invalid.
> 
> [...]

Applied, thanks!

[1/1] gpio: pch: use raw_spinlock_t for the register lock
      https://git.kernel.org/brgl/c/a02b8950d619123da64f69b70fe1dadef217dfe4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
