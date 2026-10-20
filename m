Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502405;
	b=LZm9jPqnYs9qN4al//UR+xIjMZ99+i37Kc9gLuuKIvNHQ2/r/F3hhweJJ4tRSGNIIQd5
	 YSL/uC63T24b909q51jh8drcCBfGXfZZqx9MqDGfyfYsTFg8gZl2VhVihaCE0nSXf6G+Y
	 +cvSJFr6++OgA7utbjSaMaXi60U9kgX8hndpY8BHt5FSBMxVbmcBheXvooJ0KCSqIZk2f
	 Lv6ZhuTggMsxTSdJ0unMjUJDkb+agcr96VexfDm3SrTh5gOByjaRzNc+JbEu5KrWAdpJh
	 zvQLqF+OdL6BctqW4zE1lC/XxOTAMXD3XHFLBdxbPZw7OEEpTSUhBaCtek3XbHhPx5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jsz5go7Fr+PyZnjWF9NG/8p6Hqrw5fnSeFiniwyLeRU=;
	b=TIRh/b9Dk1ofgT7d+XobzO788gZIOcZc5XNSPcGxcONkQ2PZe6Mfrh0Y3Xs13Q4SKXPn
	 3PqlrR1IQfmLOorsmW5O2awhxnbKC/1Vo6my+iZZULgBH2v5Wd+LJbOWyyFzBVVkS/eGE
	 /zARYITmxHvQaPlkfnY3N3f6S08OR3uBGjP3HDAMN+xoILzFeIXx1QiUSkdgLtrY7EiuF
	 Hq2GedFgjnGN6oMxSk55qw5X4xSzGekD1gX+am/MdQU1gppSohqrHM4bPZYJ569j7Oj4X
	 ikGUEzMumBkhsHZ/PQWqiv4Us0aL9J/WrGYsbylHRslb0TJzkB3oSku896vX+zTEp2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZGNJw0iz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N9Q4qmp1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59487606A319
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59487606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZGNJw0iz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N9Q4qmp1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAM6e1430156
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jsz5go7Fr+PyZnjWF9NG/8p6Hqrw5fnSeFiniwyLeRU=; b=ZGNJw0izoFLblHbk
	3ncKK2m28JNhtqOUNNLHlFox74uuE3hb64ioUhQyU1iLQFHSIywNg8j2PhHsWbwG
	SEC+vKLM7uUaAfyI+kmEbTcP3PC59TavdZHL1fphM64Tp1xWJhn7otCFxukmTQUb
	kdbnTBqCIXGauCbMLR7lEJ8ExaVyMUselAuO+iN+2EO0CuRRiPjT6+2q+hFk0AS0
	x2RuGCv3eETs+jCOPCss6daWyT1xzL7Z0vmOwsfoVFXYGuG9sCxEzOymRwOL0A8B
	vYTFMA8/Ch49ACeheFHR2/qsmoylHAnBzJYrG1x0fhkmjoW7xStGf88blpU2B3Pm
	DHHs/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qaktg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:20:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so684162485a.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792502403; x=1793107203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jsz5go7Fr+PyZnjWF9NG/8p6Hqrw5fnSeFiniwyLeRU=;
        b=N9Q4qmp19ANKDDX/cLc9WwFLkSGKO3nen+uLP8f7z/Zg9AvDmwtY36S2nWKRwac7UJ
         ec9wvjKwYWXxyUXybszURXwpEfqBiKqMoGot1tX9VR6z0AMXipjLGDTMVcQ5JBcaA+1I
         wdCeNxcpxFAr2pzd5xbNGa/0lePunoerVzMRUjm+OkvzKTlazSuzkewuwdW9gOkB2qNk
         //ElSKeuT6XIfVHp6hzBNP5QY579nH/YW+fPzLStfFAbZJ/aVXwMfkE0CQjzN8ayGEfQ
         Ei2LcJAtrEPlMJkicJ0shEraOdLGnFoYX9qX0TmLrJsciijRAPPwrFdDrbZSyfx9kVIR
         3D2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502403; x=1793107203;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jsz5go7Fr+PyZnjWF9NG/8p6Hqrw5fnSeFiniwyLeRU=;
        b=irMkL1naioBoJi3TmkPw+o5Jjr8tBImC4QLXah1nTVDaaqRnpSJMf1ndsIK4WV13dY
         YjlYrdUKocvMbQ7yEHU3rFYmr24hXjSTuvpTjzoKU2thJJXtZt4527oe++y8r5VyFjJB
         DcH/G9qBRW+YRtWQMZlmduFKt3dV9sFFvI7KCjCGKQXmxtEmUed3jn/J7ww8EpswK/d6
         z0iu08d9dG5D/T3IAewPga+Nkz3n2pgcWsM1KAhx5+0LJ/f1lbTOr/riiLTl3uWoPlPk
         DuRRZA/qVXApmEcIoAQwXD+f99OlUTGWB6dzoCCZH8ki0l7YiT0WUl+Rn34OwLpbOTHR
         f/Kg==
X-Forwarded-Encrypted: i=1; AKwUvBygb+ZxkbZgX0TTJwT/R5j7OvXypPzEaTawyxpJzn6rfpWcicpa3Udt7xpFQ22m+SMoHedK2O0qe0aX@vger.kernel.org
X-Gm-Message-State: AFq9FYIg6h930dKPG/jlu+l7EeD6by2kbMpTzLmupJ/jONC2ZI0zgfsQ
	vepMuwsguUbFZd9iF79hLKBM47GwcqAgQjRLm1f7pwyuU3X5Iq3fmAwrq4Ge0naBuA4nw9c5CYv
	lr9XI+lhrbJVBm+h5IkdXQxQe0zK56cyx1tN8Ex1qvFyVgwugtt+YfWEDU0gfUHw/
X-Gm-Gg: AYBFou2S6gdVcjlI2ubfPZp1oajtMkJw4Kl6sovw2r/DyjnSrcEFc6vAjR9CymBbA2j
	garpI80J1xKEQe6Tmnhk/qsx6vXcnhKB9jG2pmd1LVX+kfB2jm2rJNKggSUx0piL/Fpytmj7gtZ
	ffUZJzRABDKdeV5/ZRvjjvzJyd5pOSvo/S2LrHQV1cnefb602wSpsRo7Yk+VL8+mb117bduDVI3
	z+yy1l9tfLss8XT2qCNGC4uanpwAqZ1y2qZPZEZJRUDJ5Pp6LKXO0Dp5pkDvC3mochzAn+h0pJq
	qy8fbDJk6XGhsHcnhMmyAzLNqXf7VBwMBldFVw2SSwO8Rlie6dXyApFlLG3rvajzgZPfrpDhFRW
	7++DIB7+OmwMaVv1+6AwevafPtXY=
X-Received: by 2002:a05:620a:2a13:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f29cc9260mr1746355085a.23.1792502403367;
        Tue, 20 Oct 2026 06:20:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2a13:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f29cc9260mr1746349285a.23.1792502402773;
        Tue, 20 Oct 2026 06:20:02 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8185ddsm6032950f8f.29.2026.10.20.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:20:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: Re: [PATCH] gpio: davinci: Clear interrupt status in every bank on suspend
Date: Tue, 20 Oct 2026 15:19:59 +0200
Message-ID: <179250239619.33509.15591478629051769601.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018170622.3406158-1-sahaj123.sc@gmail.com>
References: <20261018170622.3406158-1-sahaj123.sc@gmail.com>
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
X-Proofpoint-ORIG-GUID: QuMbiZmCYxLZpWVVeVQ1dE_8h5axLnjs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX4K2Dne930wSU
 iIycQc/g38h1fd/LCZUu2MK/7jp96m7FdwV6iZbGHL/KqLNBH8/Ol1VaYj6KYCVGU/wLRiP28wj
 Hq3ihi/svp0hjOKv171kgP5GcVc3YOJ91iBu3TOg/7Gl1D1jblO7yyIeHisei0KFr8LJyXDhcJP
 yBJ8mJP1uDcrGWpkAw0uXOjKrHiqWjzoBQdQi7QC6WjnrEwM8DN1qeZVi6qVAbIQiSxLdF0vXEt
 SzfM3w4Kom4XmFYKNkseGKUE3gBe3EvRUn6dxmLCN096df1Q2gqYikD1tyYCcaAGUfe8AGmmm7g
 fp39ZY9Ir5oUjTjX+1bnPf5/MMHQhPLGn/thMrTBOsENjoo1tMDi4uOXsPfGlJ6F3D7hye+A2ki
 EQCT+/n2Ecxg/7iTrhJXR1oGwKKLeHyrpYsrt380dMVoOF1hovUHYj3d4E95pEWM3CT1sB7/9dA
 PI1Lxajji4IkV3eHlDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX4A/MM6lmFe1E
 4+KjJqvDBNi9gL+WTXA8GTwDIdQTZ2wwoIypIxOCldhC/c7oOOSvOGvSSKz6Fn0ttnBG1HyBVIq
 3g2+KUHc1RUvD23UIfB84OlnYgCPO30=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad76a84 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8YrD1dwCgZ9uIqTg1mwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QuMbiZmCYxLZpWVVeVQ1dE_8h5axLnjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200053


On Sun, 18 Oct 2026 22:36:22 +0530, Sahaj Chaudhari wrote:
> davinci_gpio_save_context() saves the registers of each 32-GPIO
> register bank, but clears interrupt status only after the loop. At that
> point g refers to the last bank, so pending status in all preceding
> banks is left uncleared.
> 
> Move the interrupt-status write into the per-bank loop so that the
> existing suspend-time clearing covers every register bank. Single-bank
> controllers retain the same behavior.
> 
> [...]

Applied, thanks!

[1/1] gpio: davinci: Clear interrupt status in every bank on suspend
      https://git.kernel.org/brgl/c/800d7627f552bbf602a1736b638aee0ada3fbf87

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
