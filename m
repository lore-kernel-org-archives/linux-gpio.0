Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904395;
	b=e1aeTtJlqgIaDPLddGW23ByJpgbAjgSVwVy6gg8YJHQEBxmq2KwcuAnt49wIO5a46vx0
	 dfErJVmHn63GMhljlD4Q3idpaiGdbf5l5w/BAzUrUNi9MHAGVAMOBMbdEvWveg6BXdjtZ
	 fHT9C6ZPsKHQLaLu3GfJNMCFBqFz8FH5kYkl85YNiKNuQFVF7I3n3UuJc6GqhlhLJqcZT
	 ouBBwJlIyBh4zivw263E1bXEBV7HPmKLMzKdzIlvNw0vLmNdUOH9EtlOV2BOQK8tGaAGo
	 q5dGGaRIyk+UbMJdiC1mefp1ecMvLTRjIUfc+vFhmVWiMQzMTnRjMtSjIPc7IGwTe0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qTaPbmNErXBwiuOezragKKQVbgX59r+D/qqn57oH2Ak=;
	b=XUoxYj4Vrti4dldwJbwkPm7P4rI/1903G3SUlxkxeL+ZmEqpk01CrLDQsA3o8wH9v5dH
	 1eDFGE/POx9rup/1IxgVsf/uCSWaACIF6EIIYs0oIjmBwO+gR+NLTrMyQX3EnX7RC+TDF
	 2CChB4omiSJEsEG8mMBvmFx/QAwuQjbNPF93/mOnNsOQZxOebvE/+qR3v3KspL2cOelEB
	 +6/+z/zudeSd/AS3CK18a4sPQ4tnvdyOEBvGc4Ey7r4wJyEGtBNSmAFp+4QPWffcjs8Zb
	 No1mu1nbxNkep7fCro2VXF9Oi+g/bHkJilJ/+hywa8goErRN0BL+1Ptkq2ufF6pCLdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlcKKq8s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMHntUea;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB2C606A896
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB2C606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlcKKq8s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMHntUea
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8QVJA199950
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qTaPbmNErXBwiuOezragKKQVbgX59r+D/qqn57oH2Ak=; b=JlcKKq8sGs60RAQo
	yoWKJ/Mh7qfqqXU0Hw3Mersbr/hZLvG8eTW+duvHiA0cPb9qpcaPIt7dkPwLVqsN
	/lAMNtPd1RAIwDQalhBTEk3BefKtWfequ+oihB4lBXpK/MYFp3euoYQhNki1sulM
	JXb1OR/l86Jo/yozADRutrfStKrkdBy5ZZKfPFoTEJ8JT7UHsjjzIOIjs/+4MOmE
	psDApJkJMtjZE1SYWM1Ji96M/SPI9eGUMfOg9fS12auqD7U/AlbxfsDwakatC8w6
	Jg7Jtm0NUbhcvCs5HcQ8vTt8jh+ssuY7H77JLcLJRV35NDtQ/uIc42ldqHaER7PY
	Y6Vv7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbtnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:33:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495dd0f07eso758957585a.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 00:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794904392; x=1795509192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qTaPbmNErXBwiuOezragKKQVbgX59r+D/qqn57oH2Ak=;
        b=OMHntUeaNhpVYlWuzU5G2GuPCSHURdW/7DR8u2UUXC9VbUvu01Vd70ZVIvhizGWp+p
         Pd3Uikfvl6ITMkmxbCKHR/e63MMGjD43PjMqkC/BwgnmFeQApFxKoR9Bg4f4Jgo76r4s
         gRB/8JcCwbPwet4g/TcusqmnIivtRjLQk6/MQrxe0Ul+f/LyG9nIOQmp+O4z4It1CP2z
         yzbs6W/TguPZ0rNb3OQ009ViehRDylIpDj3NdKkTod+mPx8b8xllxe70FGFWttjAa3M/
         OGTXfB5qUj53UVOYWnp6w9J3mFMi+UfH5hPTKsGc35PJpspBiVuG0+4ExM97FAb2fLfv
         BEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904392; x=1795509192;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qTaPbmNErXBwiuOezragKKQVbgX59r+D/qqn57oH2Ak=;
        b=NErmXSEGSghOkfESUdhxhKSYCnoDtrjK0Bja/3Y5/71of6TWBh73+wpi8oNVo/CMzD
         XIAmjboIt2nugesm5Igqmwsj5ska04YNPZCDT27oL3KH51nxqutDUNVppujfwzU0Rb/n
         8VVi9X1iO0LLAzYdDA962wHqOZNXve2gHFDb23GHE6lTBDmt6k0Ny90Y0YOA7NWSgqCL
         xJfmr1xmTyuyW7IGPy2oslhI9D/ypVm3B3CfFt2K1CU7qujX7Y/gg0SEKyJdlZfXRkU2
         DbI1sOFzRFMlpKa+7wJOGHQpoFoUCv75q98AMziR9OTgFBOeZaqs91co446IfqDbCNkb
         paQw==
X-Gm-Message-State: APuU4Z/oXlE16hJI0+ytr2RwwaDsB5+R3dy+WnwGTG9qIJx5wrZgXaJT
	2hP9DpviCJN1MRlzA88o089Or4jJqRon0NiobnO12mwx9B0ATXeiJbtPiz7qIC7K1zo3p+Pv0/y
	cKK4g8nn2XQpc7ehW/a/S7yvjBR4PsBHXVKCpGWuHABTpf16wZ9bCtRQl1JY+2/Nc
X-Gm-Gg: AYBFou3GNKLHRNePgfRxG7o1cQtB66FOIIeFN8t8C4l3uchprllhKcvKT76MjnfdYi+
	31iQecO4/R8lXPa9QlksDJ7GdyS9ugVd05RjGMlnCLqQ/mqnEKhYsGFCgIhvzSoiW98R2eY3rBl
	ddpqt4mJ96aYVEbIPW7jcb1Z+Zvd1XVDGRDPs3wuwS+TLNXuhbZPTXTAzgHIhXGD0gYZwmaNN9i
	CauJ2SBnvC/CM8VI/EKa/3WR0fQ1+VRiN8/030ABQ0UzAJhGjwekDd74uuUwmqkBIM6+wxQX5gT
	z8j+5mPOL0whvj/ok7slvQJgoAscKXKbazJTRcImupQgivKHsO61PgbdwH3LDNvWrZsvRVxCauQ
	JT3CxFv9VrDnqN52XHSRLd84gIPKHIkTOFtGhtWybgDPtyKbB4HUtoEU3xmmNpL7oMe1rryrbAf
	0=
X-Received: by 2002:a05:620a:4693:b0:949:6e15:e1db with SMTP id af79cd13be357-9498b875f48mr363270185a.73.1794904392552;
        Tue, 17 Nov 2026 00:33:12 -0800 (PST)
X-Received: by 2002:a05:620a:4693:b0:949:6e15:e1db with SMTP id af79cd13be357-9498b875f48mr363266385a.73.1794904391831;
        Tue, 17 Nov 2026 00:33:11 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm246783055e9.3.2026.11.17.00.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:33:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: keep the line state workqueue alive until device release
Date: Tue, 17 Nov 2026 09:33:08 +0100
Message-ID: <179490438637.15815.8754565205390800066.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-gpio-line-state-wq-uaf-v2-1-ce6d8266656e@oss.qualcomm.com>
References: <20261110-gpio-line-state-wq-uaf-v2-1-ce6d8266656e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX2XxNymp9LBFq
 pdrs+4tSH0RLU9hrPODtucg7QCD+uDqyqDtjO5ZFuG+xy2nldODlHJIq0zwZV+UyP2MW/Wt9yed
 bghC78g+4Xapl8Aw12Ewgp80CuGRHDkz99Bq6Q/07EEyMBwE5bCwG+kAqfUKgGpSO2/1YTF84vP
 JuF/Qs685N2gSsuI/sBd3+3ytTk72xIO/6CIthJYrRzxNnWC9bQO+IbgRGfy8axatfHqgiSOaJN
 paSzHVd6uZrPycUjQ0Ei9PtLhUKjJXPNgG3r9KMaGpDbPQmnHjxrB9tWxlJwqGA6tQZl8jmDYnP
 KKcmY73lmniJDOU7f49kcAQ2Hfpi0wD/jj2luPV65ihslPJUcs909opmiAT3KMbB2/COeyUqScT
 VLP9mfQUVlCD4qGztKEJfoZw9kyen2+NK+JvjjNLE3U7bPEBXynpSbskyGodGTGHRPrdWS6NrnB
 dwkt0JBi3hWcPPlxjOg==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc1149 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IXciJTxnJKSDCwE9BYQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 6LjOhhWw8zhMlWmsw9nxrtU67x5c21t5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfXzh7JaL56CbkD
 KLwKFf/M4C8DtJxVoe0ggKSR01vDMpMhF1/OcLQGzjT8J3WTwdqj8Jwr4tIo/e2oJ1EmpjivfSO
 2dMn0oQ9UqclzlEend8SV9zhlbRhMJE=
X-Proofpoint-GUID: 6LjOhhWw8zhMlWmsw9nxrtU67x5c21t5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170033


On Tue, 10 Nov 2026 10:29:34 +0100, Bartosz Golaszewski wrote:
> gpiod_line_state_notify() races with a concurrent gpiochip_remove() which
> unconditionally destroys the line state workqueue causing
> a use-after-free situation where queue_work() can schedule a work on a
> freed workqueue.
> 
> Keep the line state workqueue alive until GPIO device release.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: keep the line state workqueue alive until device release
      https://git.kernel.org/brgl/c/2e002a1d05b1979006f3c46eb6cb5cc36e5630ac

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
