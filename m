Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228CF3B993F
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147513; cv=none; b=a1UtgNRCbh7ln+MRXYf3ZWp7PsHfVfZKpqr5iJ4v4OncxbycIQjmbAfea1mdUxwN1J5Gu8MW+MRBhHm3DQdmq/c6FqtE8cU1Kh0U69bmj8uT/8UBp8go3SW8z5EX/hqAtSyKJgZpmHY9WFlIKxQtTB7d9IJaaaymDGE9xUw8v/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147513; c=relaxed/simple;
	bh=PL3Y/OGVIddkHfghNwrPveSkZti8Tg9sJA/T7YXXSGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nPqvGJwTfMP0UF+m6MrjIgTmxPUe7zDFWBWiomRQzs0Kb4e5TGYvw6Kwdy6HsgCsZtMPBck2VvrO9IvcdIR7Vb8VUxDV6WgqjaQkaG0obZD9wymn8OQgllnHj7Su8MBdoymtgBxfskwTCElMEuKPEgcUF8rJQvNL9yggq5gWH/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gULjHIjz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLEFWGa8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gULjHIjz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLEFWGa8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N7A0FQ1874608
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cW+ibqBFuMIVxBlmmWUKocuRJOhtUmCAZ5zWJ8R1vY=; b=gULjHIjzzVanapEA
	nnbR/7uLhnJLtpd3LOmhEyGHuqNIBEEVwb8LnWDJVpLDQDAX47oT4kucSVqSks2c
	R0x/tA8YXVg92nBfAWmJeI0Ee4oq7oEQHVrQlaSkH49cCwCo8YsTtM8EcWGgwCu1
	d17Hh2F89zjLx+cK2pH67vmhD9lI9TSlxl17nUVSPlLjMUgbsvcu5au3M1SHaDg8
	f0AWFdO5NqWt4ROEqQlZmCmWDGaTfHa2ZVyDf47rZtMNjvx02cYsWUwK4GfGHOxi
	VNVcN05UtU2JGDY45qFpvx0+fHuMydAfdqt1+ttI712/TjVw7LQNLnUXsXGpb1vf
	+M/1gQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c2qq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:11:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939d6c515deso138130985a.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 00:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790147510; x=1790752310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0cW+ibqBFuMIVxBlmmWUKocuRJOhtUmCAZ5zWJ8R1vY=;
        b=cLEFWGa8Xy2VTTwYJazENciS0EZT08OB3U/Sj8QxKtpnlKJPNws6GKdQ/2nrBBnuOV
         xOGjKd9QqUR2+HkZIrcJECnwsIw9S9+2NgQMLDCY1/NHH5cXqltAAxG9JwjqbR8iV1i0
         YLsEaruXpEZqNAwAN8tc8Y1Dg5oju6Ky0Iv+bCXJEQ+OXDfhWxwjgGBCTgyPY8SbH4/y
         8KGhiCghvDY+Ig2stD7Xen3gjrz5NaIfCgp6jTwSy6Dt1jAq0SKpNTYVc1n4uG+L3gKH
         TBkVn5PmU31VJA48sJuR2RZoV6rM87eDhOah+vKBU0T9OGoenRhtyau3qYxj++Y+i7np
         RavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790147510; x=1790752310;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cW+ibqBFuMIVxBlmmWUKocuRJOhtUmCAZ5zWJ8R1vY=;
        b=tt5p8gLqHfr/A9frUXY0z+u9WhNlIxeyqIOnVDFbfu+3qvLhLynIkdp2G1etG/sS7+
         uKWXYGDN7NfxyhPn0XxdI63wa4KlstaekSNTFAYNA7IfPZUTWJymgcRW8Oy4KhCnXewl
         knWbUZIywhZeyqRKxFx193JNAGv+zaFO1TI0LqtjkzEX7mNG4dfEsiFuHTy3P1538KeF
         kMVpy3kt+rSZ+gqRR9xxVEaAIZJq5foU6R2OhZhotx7GPhnv8cpRSMLOlbeGUF7zoea6
         deLtT1vTGW2b+HPbvbJORn/iUp3TSjz6KtMEKkUAKyoIa0HLu/S6kvekawl3Vp+BfvIJ
         qS6Q==
X-Gm-Message-State: AFuF++mYrFIoWkwINc7NOnK2PdcHddmlewJb3VPQ06flV0K5AK4a5WgY
	8qL2ovUNTNCLm4IN8wHQtfWNQHhXQpNh+IisNqU9+Itb6Nom8Q5LDpGKTCrWPZFx6hKJ9YhTxR+
	ClyjfpLrgmq59pkKLAR8G7l53zOeh+alUVxG6ng+b+Lqy/yaTYCc+1HQEt4Qy3uBF
X-Gm-Gg: AYBFou3gFdcjfmSj0aFUcqDc5s7iS7D2ij28VgJcJ6IxYU5lH03XbmrQH9T1sXqfrfu
	uArPEM8pCAVczzkkaJULSYVvjVtTmgUVdK+BLSgRT/UseuQeuNRxbUKdEg9hsSBjsmDBVKxlG+4
	iF68Zlr/1lOGcmgs/CGFqwoCobGs8ZTxQvkAYdC2/xsb2DGjHWXjPe8B2R+hID705v+hpM46nF8
	NYOJX598W2Qm+EAgTXLfUXVydHPuX4uWraGI3NWfI5vcJEp50JftIzcwpeF8JtWZCGvbbvX21Or
	MdpedRJy0NCUvfoP8zgSEUnukV1LKedN2lIMaIOX3IcNhkkxxDLgBcYJBar3ZMSgkWJQfmlhF5D
	N+3DIIpvPwe2YaFYHZSWpLD0tIo/M2E5pPBUztQ==
X-Received: by 2002:a05:620a:649a:b0:93b:d79e:18f7 with SMTP id af79cd13be357-93c2521b50fmr271386985a.58.1790147510347;
        Wed, 23 Sep 2026 00:11:50 -0700 (PDT)
X-Received: by 2002:a05:620a:649a:b0:93b:d79e:18f7 with SMTP id af79cd13be357-93c2521b50fmr271385385a.58.1790147510004;
        Wed, 23 Sep 2026 00:11:50 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868266822sm5199633f8f.5.2026.09.23.00.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:11:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3] gpio: cdev: fix kernel stack leak to user-space in error path
Date: Wed, 23 Sep 2026 09:11:46 +0200
Message-ID: <179014750449.4502.8575996857218879087.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922-gpio-cdev-stack-leak-fixes-v3-1-7a0c7a4299d5@oss.qualcomm.com>
References: <20260922-gpio-cdev-stack-leak-fixes-v3-1-7a0c7a4299d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fkvsEsxIQ1uCfvhQqUowXyCwKjpe4UE1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyOCBTYWx0ZWRfXx5YFq+hGlytV
 u2QnUKyw0twmVq70AdYXnUQtVpf4TEL7GhGxs0yVM5qRTssQEsFs2oPUX+vFvqu3SQl22aBeqc9
 Nky0iUWrOGf/GffRzPBGUySqf4VoXqM=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab37bb6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oykLyDCHHkduaGUpGZMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fkvsEsxIQ1uCfvhQqUowXyCwKjpe4UE1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyOCBTYWx0ZWRfX8gsL7eWK/pB0
 EAbadRJpbdBglyALPJJ3TFdAPfWSPXLAQE5QJoeImWvjEFUGBjlg5EPgPBNTXcEizZUxlnkDLYp
 WhCDS6HuOSIqxrLBTUfknBmtNnAbb1VkXgG1Mqc09UNHpbT6sNrAWn322nlVU/u/lIMJbpwJ0rH
 uY6MDK/Soonpbl5hGAjMLmRgcQTSc+Csb05Qm5zVdBIYkp/qSdxqOmiagP0x+OjlnPhb8jwp6+t
 ws1tImB2TVoFF3SGXvoeIiDpBdPqFQ5E7NvVTUXS3yORAg6Nu7SVdJyXg4LdQutQR3tEwNNNmYZ
 9rBWoDhiTADWW955/rrNSwP2+vdZt4mGRTaFGUAU/F6aGGlSafqtYoABXPbANdXYXfkFGTnYBQm
 lBq5g8DfKm60Ypau7bJl5qSfd0i9c2CDi1Phrwy/be6erRM2xgfKvSJzUokD/OISBSBjDVQJSUb
 YcApABBXQD+nl+CoOGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230028


On Tue, 22 Sep 2026 10:52:28 +0200, Bartosz Golaszewski wrote:
> If we fail to acquire the GPIO chip guard in gpio_desc_to_lineinfo(), we
> return immediately before zeroing the info struct we'll end up passing
> to the user-space later in lineinfo_get_v1(). This may leak the kernel
> stack contents. Make gpio_desc_to_lineinfo() return int so that the
> -ENODEV returned on failure to acquire the guard can be propagated to
> the callers.
> 
> [...]

Applied, thanks!

[1/1] gpio: cdev: fix kernel stack leak to user-space in error path
      https://git.kernel.org/brgl/c/1feb5d39b05afd902ed9fc902ec5b15be03a4bdb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
