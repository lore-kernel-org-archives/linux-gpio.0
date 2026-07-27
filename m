Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3C377034
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162282; cv=none; b=daH5mSnZbuUkIEtUgrg50MalL6xvIo9pAyJG9d7Ho6h0hMNjUi7455kU4mIsHV9neeF2wCL2kd01ONDd07PmFZDevSf76CwugsXhvjFMtkM1JXa+zJmz3lOi6d4BMUHMb7v9U+wBIgLVDg/XGUnHMrsB4hl0w5O5fLjAO9XxeDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162282; c=relaxed/simple;
	bh=3mAT9UG0+1ju82uu5uKy02/xIaDL8I/hhIjnz08fkBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ItTMsxnIJvNEWLJvTjmqoxa77u8RnOYjmCmnSWwUL+mlRG4f/AotD3WILLM+K6q0Jbro8L09LOJJhQHoK6nNH77YF/s0jX3QAeEOF0CWyvRnC4WTnlfXpBPa3KDbZdztnRdf3yqjpXIcoNG3VF38wqQcd00heFvziYkgGOrYvus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQJtbZDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2l2IJCN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQJtbZDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2l2IJCN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDldCf3905491
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 14:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A9fjSlQsE+bogjI4QCB1WAwqrOdnkvqIg20lJlfw+zk=; b=bQJtbZDUhZWVO5yI
	pdHskyTFt39bOZDcY7/QYcY8O9WXDkudFTBVQJXakg7aYStYYicj9tvChjiCYPP5
	hwch5HMMAm0f591VCP56DTdTPw2tY3SM9rhyj3MyKsczNajBcIuLsoOQ1b9mfUep
	6ksg0oWCM0LupL1Nbjoe5uorMCs4ilxVTEaY3Dq7eS0t/4PUAWnuyZ/tII4FBpaQ
	zXWtIldlaSVKzgf5QMgF9tIhc4w0a+FV0gEn2ApkHSznKZpQpkdfu+kyKvAScJ75
	+e5ZyVmzWWthEN+Ir54N0IOtsE7vnlEiNU8u/AoCxXn1KdnxSq0WBnbOu78KmGJF
	BymNcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uks2qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 14:24:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ebdfceddcso36666961cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162279; x=1785767079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A9fjSlQsE+bogjI4QCB1WAwqrOdnkvqIg20lJlfw+zk=;
        b=M2l2IJCN6BU20RPGfpqXB05niuV2Q5n9exhVrHs5CTavfghUPWy0i/fYWHozEHannj
         zOAlKkxBUeV8KZTBPfCEgO18Oo0IOfxzPJZ06sYaDpWVrKpo3Ril6k6oYZ3VBItzTI+V
         QpxuUjWuU7XUmH3TXNzxZxZ2S+FWdy0v7D74c4y0o7GU/LkAABo5N97W9yRHUsMJthrk
         0SXPr82373993RrXJ6CxFiA+tBIqvh+pcZl0cQd12yCG5kfAFvmgxdyhdz4fLqZ8/XRB
         n78P0BtrPgG/gF/RWIPELEQ1MYg+QbG4oKG71jsL3EM0hAM2kMF0mPfdl69Mwi3+kJ35
         JQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162279; x=1785767079;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9fjSlQsE+bogjI4QCB1WAwqrOdnkvqIg20lJlfw+zk=;
        b=tI6d3rAvrHpXSl8LpRv1bgkP4bVkBGUqXjVpSFUC3fDDXLpIYpOxXkLtZElrEhlS0H
         48csW6519Ksol960yDYs1jUucAMlQ53MhCFuVGvIwOE1JkMQRyqfX4Y9d9oWT/ZL2Qm+
         xz8AlDJXaNsyhW1aA0dQi56VM2ctlOS6HzvmUtGvUN1UvkQ0mtIN/b4ps6K4tulRoYTX
         XC0wxciyxo3USCTHNyrLruMANl3gGr1WBic/Upv+NwSsglsGsVTj1jjenp5yOVP8e42O
         F0iqXI5+aPWKk8Q7uSjq6padDDAYf6JHlfB/27xAjfaVWbyizwJFVtUMYOs8H249mceD
         ng9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro60UPazNBRS0b8BuvJA+F/3vx3MLLsR7PRBGTE8Xkj2XEp2bfPnAtjkWbK6KyOBBPlECCDFD+QFkEO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz7ia87EDWi91fnCz050wgKCuNRfFBVVwvdieMFYYAxZ+XTzIE
	cvQU8oqIqvzTRU7I7ECzf0Xd2nZB0fg3DYT2nn98rh+UGjA14KAO1T+PoZsaAo4nnJCnCksRUtg
	w+J9lrzJ1eqvSieCijcGG0ZWJwvDziTb94p1OSEgy8qMRJBvqZkjmzZS0iPuBGMDF
X-Gm-Gg: AR+sD11699IGVpoKZscIdHeh7cfSb+fXxPfdqhFfVxDwiYdi3kTIf6usMMMP0eHqS43
	VauSn/8lDD+BnpXnBH52ysoPdNLkYG/Xr5mDibPn/gd/Xzl7P6ygACW+hK4hPIp9zRLPImtGg05
	5VJZMG+qQL+5Jf9XOC+taEmHC7PTGLiiB/DuFIJW4+eWecw8cO2tWJ+IgA4kbgq3zd3h5NW6ZPR
	bFa1NK91X3TtvLoHyhfho1h2CaPwEpLqDptDyiheXeFmvwyyZYPYlpnWX52jaSbobtgrlvgoZtO
	sKBkqDw18N1pUD/hyDCB4EMEpdLj5Z/fBcvbDc62rRSzrRgNuZR+GBGG3zkbFbvQHEAwFSR97j+
	w7IeiGxMNv/+g8A9rIeeZdK7l1A4=
X-Received: by 2002:a05:622a:138e:b0:51a:8c97:938b with SMTP id d75a77b69052e-529a86c6a96mr89951981cf.66.1785162278940;
        Mon, 27 Jul 2026 07:24:38 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:51a:8c97:938b with SMTP id d75a77b69052e-529a86c6a96mr89951461cf.66.1785162278433;
        Mon, 27 Jul 2026 07:24:38 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1449:2d40:6dd2:20d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a6d7sm48955047f8f.2.2026.07.27.07.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:24:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: Add irq_get/set_irqchip_state() for msm gpio irqchip
Date: Mon, 27 Jul 2026 16:24:35 +0200
Message-ID: <178516227335.59204.11412409197069855135.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
References: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PgMGaXaSYF7v0X1cPN-I5HLEooQZzGWR
X-Proofpoint-ORIG-GUID: PgMGaXaSYF7v0X1cPN-I5HLEooQZzGWR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX/ADsRa2DtIso
 FC3TSAxNIBRgpqr9OkCOOUGJDmY1Ndp+Ykd1F8ZaIQ810tBd6qjztO+7nzIxgwDIIp62eLK5EL+
 qjDz4+MaIV6K6DkiAmWfKQB9l2+uNmI=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a676a27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jlfPM1XiwSsKjbdNI6QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfXzb2QACrHrfWo
 CzT3Uppyvwca7fl+8RqBUVYKdMKjQ9B5Hi30gJB/z4fXhQKJOKUHGeVxkOgqL4hTjYHpKyVRA9U
 BrJ01DN7z6aDalz883bU3WCQeqsUm4ohHxfCoZIXsQYCXvZPTJjtjz/6zhH9ZqMiS2pTCkD8zHT
 bYk7lIwBkZRtGd61ZoghPE8ASPwcG5f0GoMp+H9730uoZjD7M6p4Haja7CSsmwibWpzMYtNodIj
 Fll60+he5CYHGyf0DewRoZv+rKAD8+m4yqntgWrrMF7WQN4z1Bzk07D3jamA0NWokUIponquMCd
 nORDkBxg5vRow3X9E9LeYyZwlqQ/T5L38X9bZBJiXim/XpAmou9MzD26OBgk3NGoYxXmqH9RcMP
 DLkLsG1wmSHcjQ8Y1BsL+sdPKzXaPSLk3Q0PZapKNOJv7Pnxx+sKk1R74zu8dL/l/qCLR5eKRCT
 nHhyU6/uiG/DQKv3PgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270136


On Fri, 24 Apr 2026 12:01:24 +0530, Sneh Mankad wrote:
> MPM irqchip monitors the interrupts during SoC sleep state and after wakeup
> replays the edge interrupt by making it pending at respective irqchip by
> invoking irq_set_irqchip_state() API. The msm gpio irqchip however do not
> implement this function making it impossible to replay the gpio interrupt
> on any MPM irqchip based SoC.
> 
> Add the missing irq_get/set_irqchip_state() APIs. Implement only
> IRQCHIP_STATE_PENDING case which MPM irqchip uses.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: Add irq_get/set_irqchip_state() for msm gpio irqchip
      https://git.kernel.org/brgl/c/1860fb0be224dec0e4d170f46d1cbbc77e25e09e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
