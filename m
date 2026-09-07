Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC49543D4E9
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770256; cv=none; b=mdsBQXqHio8pqIiHeYYoQP5ZhAHe/fy1Mrm+QH2Xm9XcuMmV7ewQjS6rjCZa7sFgzbLyeafNhRGBmm8gkbgxBn9RqEhHLuSFwk6tMXvA8xANZY8eQLmtyk6uhqkR8oJef7NmA8USOwKfGT7uhWzGGQIBgDsp7v143rzgdglF4e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770256; c=relaxed/simple;
	bh=ZWsVLMOWL+WMhMuvkSvFuddvT8uc9TE1ajRBypOQoGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MZ0vPdGsaSuqRp5h0Q2yN9UFmXxiR3fludgKNR08QeFeqSEPb1duu/yBZMVH4APIacSpJsFKs5TOcsWiKrLY2KAd6rva2BDBJzoWO2FfKwFEpr3aX9c+7r5KMbqWQOtbkssukHaLCmIrEsxjclJzA/p39zF9kyTDoeU3CMcNPD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iq1Gv75z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPtqB5oW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iq1Gv75z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPtqB5oW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68787ZoG3411585
	for <linux-gpio@vger.kernel.org>; Mon, 7 Sep 2026 08:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiLTpe1hSry4jJ0vq1E8WMCzQaTotCcSwonEKu/KeF8=; b=Iq1Gv75zAfYJXjvf
	s10KvPqc5wMDWgSeEOGuoTBphKfozoXvnKHJrHEu2BHnXgpU8txGhX3TbbPr6X4O
	GTm2oHpb6waz6pi7Oe1vdxU21Zp7kM6kIHYS1av3s3d+ODRkGloxIMRmsbb0dsqf
	HV9Np66DBMwScpaZ9orpYhnKOZ33nT232ursRdCUPDhRKlLC30qKOK9PIWENkqbO
	t3tUK1F16aLcMXGr4JoNSKktwgsgMc+9b0xeKNFXxJLTq+EakG8d0iwXobALBE5P
	kmGxDUyeZ03Lpx9hOK+3AC8JYIQ4bG2I5795WckePFGtB1XGzqp/ejRAmmxpgKmo
	SVbI0g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyg45u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 08:37:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5308af39ab3so5120971cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770253; x=1789375053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UiLTpe1hSry4jJ0vq1E8WMCzQaTotCcSwonEKu/KeF8=;
        b=jPtqB5oWvHEQ/HLc61r7cHpB7NwOIAUhYDBkxg+aPOIdbb/9qbmmy4Z9Hb+rNFuC1l
         2vNU9+l+NqzlSlRGMozrd256IzkdVJi6+GLlSkbqPc4chMch4jQTOFDqJ8VKtz2Pon/y
         b5m0M5kbvsS6iVa+cciCvbqkRYelnU+mOivfvwmSyMscmnNgKdgzWJqxUF8pNe01G4k0
         mRK6C5QXcwY8YP8HiCHbp/1Zuddh+RuCHyV5xaQRM29yT5r+Zw8wnbKoSMldrkevXRu+
         8Sv8lpU3kreC4fC0qH8ZdiMz+ROxoGlU5REy54RXAG9MN2lRAVWzC/si/7CE5yw69aQz
         TC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770253; x=1789375053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiLTpe1hSry4jJ0vq1E8WMCzQaTotCcSwonEKu/KeF8=;
        b=R6ggLAZVHBnjijhiSS2j5f09mIFBmxI+eHkWOOf6FJUzd79XISW23arXMISbhe0GCa
         1UOI8TWlpMLfN68S7Ks8Wz3MA6VwBis4weFoUlZgSDthArXJRUCvPElJiKKNLFAT/MAZ
         feXgR9yZ62WNcLjpbBJEU4MPjGwZbcKWB0SQs2cTixgk/CsbDBx+gzzwRgEi9QfurHc+
         tWAcwJJ3W6jQeXZJ0DbTEZFSRdsPoCdyTlvFh7BuQrX/QNh+JhHxxGFlvggV4TQ8QzIa
         jTiz499UfgcWd+/ue+5T/Q1TTN1U4eE1Kym0BNUZQi9bciGFoPygRnK6Lf9XipC+n3Si
         0/sQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsNiOsH8LPBoFuJnknrqhGP9m9HJUacU+4cYqhHkp/eyNrVZY3Z0GDsaOLADn+Ueoreg8a4snHmeXT@vger.kernel.org
X-Gm-Message-State: AFuF++ki/rqxtp1cPDK9NQkTDp12t7P06UIXb0DiY/RW3ZbQtespPf1O
	Bw3vKSAA0Ef56oduVUC5yg9LM+jNg9xX30VJDzrJ4FlkU6J+ag0DmcEdXqdkeFvCaNJ81lhDk6U
	3a/uiISOo07e2efoieamOXPgTXzMHN+m0aJWg3m0GSPKC/ylUCnDlmCWAgejIvFbH
X-Gm-Gg: AYBFou3SlSDeL8UAq/tIphkvojWWssPqhXqXZ5l2u2z/cbvt04ATuS8auRY2EDjmC+y
	MSGi7/bf6g4Vif3d+GzxgX3Bpv5U0heGLI3J2yYj7fO9+66ddVsOx+GUAy4SMNL045+fKYiMGST
	tBqoQ3I01M0bUEsCbnobdF6UyXo9tlnNo7+YSy2q2i1AlqeIfKnppwTGKAZAj9JAbiCNVf4mLf8
	g9gvm2lhsBIPYWCJX567ogs6up/3riUmXGtoZSz7adcs1zVj5XOfhtRg6gkFrg/vwBrBhkOqGDU
	kXvJAnTuvPzpHWGJ+8l3mkJF3ePjpeMuSa+QZXP4qWAO1XuoYBff9gJ38kcbtgjzAa/Z/lJpnaN
	95ln96A36fnEPH4p+d/y1MBf6IA==
X-Received: by 2002:a05:622a:1b24:b0:52f:aaa8:7eab with SMTP id d75a77b69052e-5305481059dmr266168411cf.17.1788770252704;
        Mon, 07 Sep 2026 01:37:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1b24:b0:52f:aaa8:7eab with SMTP id d75a77b69052e-5305481059dmr266168121cf.17.1788770252317;
        Mon, 07 Sep 2026 01:37:32 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm292239345e9.0.2026.09.07.01.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:37:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: gpio: Fix bracket
Date: Mon,  7 Sep 2026 10:37:29 +0200
Message-ID: <178877024677.8391.10693598419369758510.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903155345.733244-2-manuelebnerli@mailbox.org>
References: <20260903155345.733244-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9DX6kZv6dH2XGjdmoi-Wf6e6C0Jv8qS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXwILUbMPjLw/B
 p3PhbJJ+FPu8MV8m9s91tUBN8h+XN6TtmSrSdh4e5GdwRw6F6ajautta677ab38kDmaJJw6U9Ts
 vPWsoT3W9XOEfnCoR25e6w6dWIIlN+lS9CtsF0+dC192IccpBb4uqCwbpGHyzs2BqxqCLXu7ofi
 3thbC84tlm5F8fGChSUoyKjVYtpeMM5FqVLTwFyuq93A+l11LSej7lDSf/4JFp57ktWFbXTJdEB
 EaAV5yFZdeupg/mrWVDSsRbVGUPe15hOYumbHm0wkWahy3Gu2vGZOmi7XWYDFXnkZ8FVyoDfkN4
 T6hCfbyJ8fDAAjqSCCnfrIMa6PzWJrhxpXJv2Zq63Lsc9poyvBCnWRYtASjTftSV+OBzt31RGRy
 ebNW4COp5P0ZTtuqxfdA+3vHF8hYT9z9IQ8HvvN+9UwU2J0U1ftmfx46/VJlpt2oe1m+otH5VNJ
 F/qPsCHCflZ8Uc5lJhQ==
X-Proofpoint-GUID: 9DX6kZv6dH2XGjdmoi-Wf6e6C0Jv8qS0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX8eO/2Ifsz2Q4
 eQ+nzF2Yf2OihnJj1uK4h6RaRcvVz7Kj/IhJT5HJpFj0C4Hisxea1eX4BSKNLQNQsMDbBjswZrF
 cwGzvbKxX4KqFm4b5FFPuCAD/X/Qt0M=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e77cd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dcql3xp4XYDMActl_T0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093


On Thu, 03 Sep 2026 17:53:44 +0200, Manuel Ebner wrote:
> Balance parentheses.
> 
> 

Applied, thanks!

[1/1] Documentation: gpio: Fix bracket
      https://git.kernel.org/brgl/c/31e7eb7e38978f6edb6523e43f3d8738e1837d3f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
