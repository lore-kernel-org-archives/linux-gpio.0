Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704807;
	b=3xlIE5OA3QRFma8N6Syb+0HJKFjmi95L+oiFjuqVHFULxkAiMjXEmlVbKSAoGOOqrw0K
	 Cess3qFsdLOD1FdhH/DEQe0JQpElcjCUGjvnuO73vY8vXQ5eINHX1RKnFun4ayzdMiyQY
	 M4X4gnrbn37t7XWhV7LoI8jb/7AKCNjXC2qaV6YtsUsO5RWNiBnWtB+rnKEW2A8rdqYyR
	 a2PHoteqlbBYlEIJ3p0T0k94zVIpcfwH0NP7EFVHZjvaz4yU83VRph7xwm7WDU5j6cDMy
	 nDojqyD2rS1o1IZt37GMqr8Ve7mI/1sE2b8UgJEFJLhdn44cMAVkvVA+gRe6h0hZ9qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7ctrNvTGsaRnjBq2xvRNbodb5O+KHyWolWQaahcXcRs=;
	b=KxbXxId9XCE6tbjUtoR9Wd96YnwrrFA7R9yEsJk4U0kWi/XeBAHyRYuZ1xrlbtfmdMNR
	 aRQeVEFOdI0NfHgWPcg9jkIFY1VOLhjMgC/gJ4ZT0Cl78EQnHY5IMw2Izmx07JE4EES0W
	 QefBZWYGe3rT/th2f4EBi0e4B6u7CNyNbU/JPMFLiM8THmdT0fgMB7YeCalQ0Kvef8n+I
	 r05mNa1KZ7kOnk0fjiwCy1WRCZEDpHJECQWG02mvszbWseKW5+Sl425FHnv2XL+FLJGJN
	 0Ts5jeCBv1GaNZl+YLIavGKqA7/TzOMeAfi6eJ9SIW0kmo9os2ZKjunMctcGUxOPJng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPM71iav;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UioxZ26z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAAE606A336
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AAAE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPM71iav;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UioxZ26z
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV9VT3664933
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ctrNvTGsaRnjBq2xvRNbodb5O+KHyWolWQaahcXcRs=; b=ZPM71iavXihbqeod
	evdU3ZvEJZ1hYWxgAYcKklBkwzLILvlpsuUWSrR9n2bzhgHWdTGNzZKrcpuL3hhC
	3JLF7/V7sG9OU1LRlnJSUob3+s+UV4Ch1SF7tLsssmmsG9yyQjlJtZtWxEej7NQR
	hNmAEAuOmni7TzBTlHRCbPLastrwPkW36dVMJEu/ElTZDQUTo8niYz6e1+dNUvHt
	xZRTZkFDxGHoWSjaHwMGkHhJ60U8/tesTnJFp+iOOl7YKdCTQJsIY2QMg66QBRIE
	pBKRSfJXA24cgE7FBkc8GmM0271SlGe+9yPY8cqaeu9rtwNOlscRFsWDs35rYap+
	5HuURQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g9cjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:53:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94961ed97d6so1188437985a.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 06:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704805; x=1796309605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ctrNvTGsaRnjBq2xvRNbodb5O+KHyWolWQaahcXcRs=;
        b=UioxZ26za7SgxYcfK9PjofHjfGIGGuQhuMD/BZC2noslxCAoI/3zccSqFOuU2+H2M5
         CutOjA6Tdgu92SGQimpNrd/0UY4xCNpx1SiA1ZBst8RehP+/tOgoAoDcFTNFFKSUOtdr
         oNLd77jgvUdH20XDKC/Ue9+XoDktYxcjgh/6wFfKHt//WpYjyCUFYEyQOjYv8oLNyiu+
         n3QvJNyWWfaDvfXrQGjM+edhhSioSO+xf98laphjcTq5DMt6TRKC7QSjMcXdDRUDAKPV
         4SGH43QZLuz1t4IabOf+uMfjHo+pPBhjHt6FDNwncWnbQkUJQOT6M6lI606HruO+5EUq
         XXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704805; x=1796309605;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ctrNvTGsaRnjBq2xvRNbodb5O+KHyWolWQaahcXcRs=;
        b=QjFgzdy+Gznlm8ra9e2VE58jWkSt4AF6IIayIUfvOIWDl4779ZTEqrw2+E0nUTqOOM
         ViYpPGAYMRvO6KH6UjpSnRNSj6H8PuVF0zPZUUoA2joMpOudRtWhiRg80LvPg2L6W08b
         OyCZDorQ07/AMeA2nAVbB3dZPrxO/wmbvg5HaNPs9JSLnMHdkD6BG9voP9t47CIqh+Jw
         C23slVsnH6ww8p04eoKBlqnSbr9R6CeLZCximM7VpJiPWjxXRcceF7qHjUAvh0r5tXHZ
         jtHNdzFX7yugweOjuAXvij8myB+LqjyZ1sbqk0rW5lYB4H81yTL5evFGafSLTTtTILyk
         6Z8A==
X-Gm-Message-State: APuU4Z8bM1PY9+3ATrSzjqA34u8u2Yob/zqeD5meOLfOofWA4FJTYVUz
	gwXJCKPh+q5FPY0V74TBzszZoZBFhvufFzszQA1/VFqDpE0JXGVJNbbNGcMJQQbRlz5wIhG0c+2
	mJc3Zbaly1zeb7dkLU1ruWLpgSsN3VjTUfpa2KojROus55Er4baGztS2xHU2QDn3K5ff0V4VM
X-Gm-Gg: AZFdTZcRPsF+zzMZAcHA0nGGbZ4Mg8kYrcHPZyHy2TjiecM3D8LCBHXFtMhQLHzIcFt
	R1HUYxvKpuxEOGNh1ILK0xGOH+B5hz8i0RM6x8DjgEiCt7upzCbb68K9jCMH+Geu4G3Lr1JzXzB
	m/1cohdAiZyQsInIyAiKVGDOugC+2TXEhinif0Qkw4kTJJtEzVmUbsFwKoEWQ6tAXgW7zX4rJbg
	axlxClLmDqH64BMjLiTPNGdlB/uhzBekvIMaSlYwveWqLY/UrwWDRkw1/0BTIPd5B16fPqOR/Q7
	z9/1TEDx2PXKQ9BKsdAq8o6mBNQzTs6x4tWWm0p6sMfXKpY6tsfHoolXAVK0klDl2XCto4lOa5O
	0Zbpl7H401gY5SR6icxR2tZOUOn9JM3gsX5t6YI+GI2e4MxYSXTXR5RXA8cizbDHAd/exQvWH23
	JM5mHgmhLga3OD+QBCUV4vVsPGu7XCfHg2GDCrvimoQkvRKZlyy+Z3124U7z72Dw==
X-Received: by 2002:a05:620a:1a20:b0:944:4e6:85d8 with SMTP id af79cd13be357-949b3402288mr3900489685a.5.1795704805594;
        Thu, 26 Nov 2026 06:53:25 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:944:4e6:85d8 with SMTP id af79cd13be357-949b3402288mr3900483285a.5.1795704804842;
        Thu, 26 Nov 2026 06:53:24 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm499334135e9.0.2026.11.26.06.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:53:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Khem Raj <khem.raj@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH libgpiod v2] dbus: client: tests: wait for each event in the gpiocli monitor tests
Date: Thu, 26 Nov 2026 15:53:22 +0100
Message-ID: <179570479973.42687.4295707234882690237.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125234308.4052324-1-raj.khem@gmail.com>
References: <20261125234308.4052324-1-raj.khem@gmail.com>
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
X-Proofpoint-ORIG-GUID: 1EDMCiDR1FX4hm_57vK4Tu17xYQg7BKu
X-Proofpoint-GUID: 1EDMCiDR1FX4hm_57vK4Tu17xYQg7BKu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX/8Xyq/4zTdH2
 Zxl1HnNUd0XRF0SNH2IkoKYDfCyEajnOxM9/9gnArB/hXZlxKOkjv9oC+FEnrI5Hvybawu2YwFW
 xbC43CnnDzDt2vplvghjW6m94606wnPqk69gdze4QXnN+RgR+kuHXxj8CXQbM8I+TEvTFgQWR81
 kPwgBAMtDZ1PQoT+7BVZ/8U1Jk8AOuPV4MTZFExJkMAkWWkB5fHJ/R2ey5KbVzugmzPh3bfU36Q
 n+TaJpQOf5lkQuIQNjbSCl/kXs45d71+mchArnhCQEXAHINAjJXcUftMIJOyLo5wXrE/C4n3L2T
 aXaMiypjnkNA+kuCv48D7skYeRJbSTTNu1lEke2YhQZFdGzzChuS398azjStplwRetWwcLyJLte
 O4ZUxlbUOWqhMXSjZ1oz83dH67Zx6XeibWTRozfDLkbQvVQZwcvmzyCfi4rJYSfAy6j8Xh+uzFf
 AEG4IR8gHQufcTng0FA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfXwQ0y/NogVZQt
 O4JGHgcbcTDaNPyy6VCZ203J7OM/WIVVPtdDR31taelH4Mj8Nw1BhCUcNGaata4h1Rnh0sFx8d+
 QokYHjvhEaNN+GeSNXr9TMCEc2cpYco=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b0847e6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RBT3-3itk4DdoyWQBUYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058


On Wed, 25 Nov 2026 15:43:08 -0800, Khem Raj wrote:
> test_monitor_all_lines_on_request and test_monitor_multiple_lines_by_name
> pull one line up, a second line up and the first line down again in
> quick succession and only then read the monitor output. gpio-sim raises
> the line interrupts through irq_sim, so two changes of the same line
> that happen before the interrupt is handled are delivered as one
> interrupt, and as edge detection is set to both edges the kernel derives
> the edge type from the line value read in the handler. The rising edge
> on the first line is then lost and only a falling edge is reported,
> timestamped after the rising edge on the second line:
> 
> [...]

Applied, thanks!

[1/1] dbus: client: tests: wait for each event in the gpiocli monitor tests
      https://git.kernel.org/brgl/c/b1071a55288d595a80709204a73932eb19a0a400

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
