Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C5A46AA99
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982188; cv=none; b=QWPmPy26ZRIEjflmnRolvpDiMOZkz+FCIjfEFVUR07pep6La4EGMdqCXZj2Z9Go+8SxAn43D17oDWDPn7/h+Zy75DXIlzc6Qrk3f20ShExIVaPFoK6Dq/xvIggLnWipAI2Z5Qm2ejA9FgHBQBjOlD6LR0rJEJ1mm5/NpLoOm5vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982188; c=relaxed/simple;
	bh=gARbVD09EARrYQ4UKtDL6tThF4d9UKCxBmg0cLWL/2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FU5/i5OrlgidrB1TjvGPzGzZvS+CH5wGgvyuLabk1szUx5sQH6ONewV7VD9oGBf9m0st+qEJl3FN/ZKTiYaeg6TIXNDK+rTxbYceqXmnJQzSfIu5bLpZwGpHMf4w9pQ6xK5YnsoJZd0qcwkXu/KGIv9nIKW50RQoHYUYB/ngpno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGRvcwqC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgTrApDH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGRvcwqC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgTrApDH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7ARdn3351661
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=; b=fGRvcwqCJZhEzECr
	FMHMTJce9NFzwUvxWQ9gGKTW3DUJEGaQ1KF0J8jMmimCE9ZT/u/lAmXKztrw+ffc
	/lIaNgUuReSay/rwbgpEy7V/gt76GmmTMWBd10wd1HKxcCz7L5EAfrf9Py7qvNck
	Pb+fYUcZnBKC++yTEitn5OptTABxkyNDs0CVaw8mqAxJ7osuvCr6lHf+H5wL2OQw
	ko38k0RtZUDBQSwnnLEyLV0wBWSssLZdIKeMF6Ht/IQJVH8TJQHYywFLsEIG6LNE
	gj/L9EeSmpDg0iFknUlOqPj0UWZ2aB0S6j019gNx4sJqhaaQWhX+HnsXHVGHP7PA
	g0CYXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq799wd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:16:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a3f673221so451910185a.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982185; x=1790586985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=;
        b=UgTrApDHxMDR8sbVKGaYA1zcWznfkaT47Ym2Pu/LTOOdaZj90+qUg/rqlW5UqYuXAb
         NP16kBrVS3C38m7ZWATLqMF9WnzIsY+3mbNHMsPfnaMi91Y6Pe0LApWvJaeCKkb6Rqyy
         YaVU+eCNYfgejKtnyLT3zj8LhMuySjP/CgU/Utw5M6mLyAfZ5g1F27dbcRHVKWjQUQek
         eLuPBzgaZXLbD70AM/sn3zSOcjUBYCtWuDvqSvVIP65qWD1peIRrT/ibvAp9NlEyPF1h
         4OK9PRPIc7ZDsaf/oJzHYxmcn5BG2R3ye7EJIEXOAv7hLyyftuALwGUS6DRnoq7sUINC
         JZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982185; x=1790586985;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=;
        b=d5P1UBMyYzNtcJQCRDZqRcXflKNiGHBR/ZgLcrD+jtAsBC63/c4tBy6l9DZTrSlhW+
         6TV9acZWKirhoDbPJ0r0iAs155Zm+STFzlMmr6eLJbYDs+cmglD7FX3xQZ+JFqN1pp3K
         VkRelPOTYS5EIk6YQjgXmn4/fu16tB3/Lp3eB01r4JB4MMLs1ehBY8rMWxpGNTenJiDe
         ch7CqBufiH7Id3dLJurPXrvZBjUULZIrNUYakNCr/qMMdkll4o/Z30qIpd6JWx+/VFkV
         yxAWTZIfYv6k5F6QJOJ40TFfLk0X5EIovrQ3dlKp6PD0vQ+R6knz9VVCb9abfGpaFrzP
         bSkA==
X-Forwarded-Encrypted: i=1; AKwUvBwaJ39w+gp5Q5bxL6QDqfEb1KITeVRSBFKeKykV0MFE1Lg7vbAU7Uj+p5D/WEVPS0/cgOgslgzp7Y5x@vger.kernel.org
X-Gm-Message-State: AFuF++kl0hLgcLEWTzYLufHQ26MaCJtZii36oDolFf/ZDph1EL2DxR++
	cdkxQNAl3h0iosbwtnTir2azpV10TnIDvSia8LzuJXuGAo9dKUVbfQgMlUlyEFfeOOT5SccjvtH
	QQ+2ZduuumG9lENF9rkUThRoukblA9rix7XCOrq+OUUzKsjJGM1hrRBy6uhbIgAG5
X-Gm-Gg: AYBFou3FT0XOoav/Rcihkxt5pP75qBeJRoixQXpxbktdDHbBkk03Nxnt5qb7BTRQ9zk
	HDjeBW9E3ioxRnkVQRtjfb/wxFaeQlTQo2TWZDvCjOVksUPx810UPiSqp2CLMQTwX0xEqBdrrKE
	CrGJqnI2VG2f/tgUSm1b4aIM7S+07RgGHXWESeRZHWlj9L1vWXC2stuP0KI9gnUFJ68K4uMB148
	2GHCmrlT/jNMXY+Z3fZGeN3t0VnI791+BVyNn/Y3QLccI20cMOXUOib1mi2V5CLzMxrDzOsiDou
	QTQ5is3Y6lv+y5oGOsMuxaBxLpfXie4FVbXUqTA+GmqrA+SiuvyiLextPmQUTB7krE5Jld1wS41
	c8OlyQYm4NkZMZ846cMeugVf/og==
X-Received: by 2002:a05:620a:2810:b0:939:5ba5:28c5 with SMTP id af79cd13be357-93bf5564a5fmr817540585a.17.1789982185263;
        Mon, 21 Sep 2026 02:16:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2810:b0:939:5ba5:28c5 with SMTP id af79cd13be357-93bf5564a5fmr817538385a.17.1789982184876;
        Mon, 21 Sep 2026 02:16:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487243cede9sm23544040f8f.0.2026.09.21.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:16:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Haibo Chen <haibo.chen@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: (subset) [PATCH v6 0/4] gpio: mmio: report the line direction on chips without direction registers
Date: Mon, 21 Sep 2026 11:16:21 +0200
Message-ID: <178998209530.39208.11869939955617063502.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab0f5ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=anw-P6zLAAAA:8 a=EUspDBNiAAAA:8 a=niCvQgg7AacVuODDKsUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=7_zPmhNiJtJTypZd5sO0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX2tRcbdmFNUk8
 5py5Ly0AvANmpA71Ezwaq6vkspozQRf6vpyBx73QVjJbXuYkF1aXulRJiJXjKzQjm0QJEn3HGlu
 0NuKCliu6+jXOG1qt2LKUNJR8hQag4I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX/wNeYDkhruIW
 lWoOLbcYihpWvGZmH1HJ4cQ788rQabzHLsGjfb6SczRdyR1OoJjmAuxdYy9l5ZSOSMU+lyKrAQR
 QbYz104kB8unCZxvMdxOMV6jNAhEotroCG2cd0guhgi1H4yTXRhJVI1s+vEz9Qdm2CZiiE7Wqa8
 Ujg1e9aEKmmlcSi7x+MtvecttwWJD1S+DvRtJmJXXOH4wTwqA1fEz481QSFdKETmbkAhEQRWhb3
 4Ih9DI3keHFWVUe7vYdaRmuK8hRHVYIWiLKt625VrloCbu2WBOXgwgp7xt5blMeJQJIjPeiJI9b
 zA7Bun369LSbrcQS0CgHQ33arKf7pstxBkAjqGSOV5WYPRAn9sIt34vvT/N7Jw1nrfXCx5sdFGM
 O24mf+1ZLi/kLm3d/5mvOUiFggoZRVTM8QQjvlbsg+TQagwWmrTvT1sbPVDBd+FhvvdcSa3bFFB
 7p1wIKf2o6xgTe8h17Q==
X-Proofpoint-ORIG-GUID: sBwNpOLfg_5IFXd5byZx6KCpRwEC1U6J
X-Proofpoint-GUID: sBwNpOLfg_5IFXd5byZx6KCpRwEC1U6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210131


On Tue, 15 Sep 2026 10:04:57 +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> Hi Bartosz, Linus,
> 
> this replaces the gpiolib guard patch [1], along the lines Bartosz
> suggested there: instead of teaching gpiod_get_direction() to stay quiet
> when a chip has no get_direction(), give gpio-mmio one and let the pin
> controller tell it what the pad does.
> 
> [...]

Applied, thanks!

[3/4] gpiolib: add get_config() and gpiochip_generic_get_config()
      https://git.kernel.org/brgl/c/fc291104d01a4e42b44132925c46655d4be5ed13
[4/4] gpio: mmio: track the direction of chips without direction registers
      https://git.kernel.org/brgl/c/b5c26686305e070ecb8a4af3acbc4aa92266029e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
