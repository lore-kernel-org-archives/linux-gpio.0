Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499654;
	b=5kfOdEedfjvRKkteZ/obVmmrsgdYA21hnqXwWVYqIXh2Vni/UtVi3uUcors7NtcH7u6I
	 g9FwJ/QaXsLgKNMeyyoS4Iiwzc76JJLDirRKZs5wi5GCKiVQQF3fCPm2OlkcfylrAemKo
	 f3cU8KgH/jRRg8uIyF8SX2K0shCBSSpzCa4l5UFY1bG6zPeEwyLkuTFKUC486IhL8uK9k
	 08WnumWFYLeeuU4NfNtFb8V9ko0XQOD0SfUu3OmRyuNb7dGuxrhZkx/pFPJY1qR78rRQi
	 8wPuYqE+me/0Z9fJpVr3sm16V5+ThkDTudNIUjg/jpllYjNq6I2nrdsYn7jNKwtEl1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MU1u62UtHo2x3eUDB2HSAZYuPjeC3R3BGYTq7irJeQw=;
	b=hWLDOZfrNwazqETxDs7FuwhpkFiwaC+7X+d8ozKGBOBBJgfyNsMpT3kslRKeB0/T9lal
	 MFWBZe3augrnLisHjyFkl/cd8aB9Sv+gKdVMsqYbBubju9Lt9+lt7Eef6PZLkdNAYPjWc
	 fx9QjFG91vIWlaardtteVYRuMtYxxNxC7UKKdRL/3cm2NM6/obUpzv5j6smKnNOoMKbst
	 9alT322ltAP+lyTK6lF4Cjm9GXD6b8EIWpnIPuGTEAZE5ZamG9WQUJ3Y33mdOT2oEDte/
	 kHGaI29P7WlREbiPS8MEEX1tn7OotiNxizO93hkgxb5LMfIFdFTet8n9OoUx497a2Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtOh8PWK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PX4art37;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F105606A320
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F105606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtOh8PWK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PX4art37
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBQ4Sq1506538
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MU1u62UtHo2x3eUDB2HSAZYuPjeC3R3BGYTq7irJeQw=; b=NtOh8PWK8ZD+7sp5
	UzdHnH/G9WosHzeVSNwa6YWl5KXxMM9YTZtw4pP2aWyYR75vZtec9NraXPALg3It
	XrulDDEef9CMk1k+bKLtu1gEBoHilU43pf5Xsb8arqo3ugTIPCZ1xZRxP4aU9uDV
	/WfEczARVIDCgdFvox6EmUq8/3lFuT4KbA4CK9OvK3aWtnA2W6iR0TGOPaDS17n7
	LVxGl+fH2TA314K4hloCpfuK4QdzIZhNXeeFhAA/8Mrs+kw+B28gh213Db5mZhG2
	XvlvOtWW601LBG8lEI0LjPMOcXSaOXxVsUHK1dRWrItl4ZXSJHv4ToiJ6SSteKkn
	5Hju2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2f1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:34:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so705098285a.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 05:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499652; x=1793104452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MU1u62UtHo2x3eUDB2HSAZYuPjeC3R3BGYTq7irJeQw=;
        b=PX4art37mJVhp9Fkh6kaBFmMQ5pQrDjGXMmZGPsMgQwsQoaJS+hKZ56hxMHI3fRMxX
         vawe9IaOcDFgYYPDfz8y5Nxk2+VoopU/jG2HATRwr8iAnP0LwklJSsrGC3vjwDRmEVPv
         duUEucelW1hf7VFzvWp0bapZnSDNdp7zz0qSy4rhxertfqQjpHpD0c1ObPHz3Nd+7xth
         eIdcS5t52/yId0THFsfO3YZk7O5sTx6OV79MAIWe9k25UYvmP/d8yZOwGEdQJusc+Zm4
         J6IVmKiZJLC9tNDtO19tJfGgRQOUONNP9LoonVmuP+VoCwtZTPs0qndjIfD2zjjmK8nt
         QIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499652; x=1793104452;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MU1u62UtHo2x3eUDB2HSAZYuPjeC3R3BGYTq7irJeQw=;
        b=jWmkq+AVjTBXhDuS6JvAnyE5CkylzHaB9vtPmbSJg5poufTMIE0kLC8Iz2KHqvpVkS
         cNpgeir4555TgdmaJanJcFXp0A80B+oplbMJWB6MKUOHwr/pjg/2erK6AMFvdOhmPfn1
         HYTP4fN70/3K6csipRwSzz1UgHwuKhB0DIKTuGx8tJawqC7MBVuzboGLWVIPsBe6FdCT
         MDppSaDqtrsOKXjeyAuxIGgid+JMO+mNoy2BdDKYuxBqPwhkAVx/stRPQ2Yk9JIuC8/F
         YdL6iSz9LLhdA/pFu9yUhxMqc8o4F+c4Q6M1Sd3zMXPk90AV0R8k34G4w/ry6bH3tLdW
         vQUQ==
X-Gm-Message-State: AFq9FYIsQ7OCmsg415k2CAOv8IJ1LSogZSWChsha1gjdcie1ip3K1hVW
	K2TGSQW9AF9QFU4g+3NMZR/2vcjTEQ9nE8TDIjiRkXnODtUSQmwTRwascZRMjqNRC5D+vFnsi2g
	74vygO3JJz3ABCcCEnlk18FdH56cr96XVfHzo4GW/Xhyo+ckwuOKXebkezsuHFh9c
X-Gm-Gg: AYBFou1dMK72WhFYI9yX/cgzHczJWC0EavbXvs+OgWT2CnQN1rJIiqZm8ovNLUvsMAk
	McvkIuG7dnzJvPsq/1yWnylT40q8Bqtc3fhC5pjJbxjQVJdxIWGQfIMCWVGpKbnXX61Ut3255IL
	1wTZLdQAUltWoBuDCZZ/ei6OdZbz9dAq/PQH8OUl/RrsJGBsKffgFX+f2V12uZYAmGG4NWVm1v9
	PE8132G28Zxko9jvDKPX8BJM24pYXQ0uJrplnGBJ5mTVJ938UwOyo8wNHOmMS9Z99y4BfIzsmUb
	yspWDAsMDqXTut7pPDbbxzBKLiU/XU94taCVzwiSz6LphPZPftJSCT2drBYecx7YsmXT5RQ0ex6
	fcOA377JizB73LoHw0tfXtehFIMg=
X-Received: by 2002:a05:620a:608a:b0:93f:3978:481a with SMTP id af79cd13be357-93f39784a18mr1165543485a.51.1792499652190;
        Tue, 20 Oct 2026 05:34:12 -0700 (PDT)
X-Received: by 2002:a05:620a:608a:b0:93f:3978:481a with SMTP id af79cd13be357-93f39784a18mr1165539385a.51.1792499651678;
        Tue, 20 Oct 2026 05:34:11 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820822sm6401311f8f.34.2026.10.20.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:34:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: sim: access sysfs attributes as const
Date: Tue, 20 Oct 2026 14:34:09 +0200
Message-ID: <179249964697.23160.1848529852960880968.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019-gpio-sim-const-sysfs-attr-v2-1-9ae103b8a680@oss.qualcomm.com>
References: <20261019-gpio-sim-const-sysfs-attr-v2-1-9ae103b8a680@oss.qualcomm.com>
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
X-Proofpoint-GUID: cZoQbAh6vcxzl3z83X1yqT6UMZ3eoMTo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX7IzafR3SBTVO
 7lzC6Hb9msgZU1E6jwcXteeKH78e1012XNS5/tIHcWZ37JTSM44UX1Z6lTC0HAQYDaiQgyEmrde
 PHqB7NP5B7GdaaTpXUxHj67BXkqvEzw=
X-Proofpoint-ORIG-GUID: cZoQbAh6vcxzl3z83X1yqT6UMZ3eoMTo
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad75fc4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5lPpzTouJ3OUUglbYbAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX4LDPSbjEcw+f
 tloxcjn06AHQL3OuDUwpYoA9EiD7qkpOMMcyPdt97c/6/XKCc2FyfMWag3huqCPNQs4GAEItXQ7
 Iekr1ulUl5eAP6xHqvbULVipWSeG+WCTHDaxX1fh3NwP9RCG9Fy81cZiaGuj3UMxe9C8SOU5VMs
 jC5yh59TsC4dunPobqIapU9b/Ufx/cKBhnCi+o0YB6qOPrta8hOlZjAOCfmMPeiS7DGYHF5sv1k
 aLNUtBt1lj1ZSnupjRd5Ic8YIqlX2XXuNykvnycTp74jqbGI9ORda0+nEsOWxT4fBpLSfHrLNCy
 tBhy061/UFOKKl3GWpD9pgjLT3E1K7YfGVsVIM3TdY+qvylszrioXGzKFkuvAvEJdma8+Zmslqn
 F22lEYabTzBewA69mkS1LqwpDBUWsMSKn6pxSTu8uMRf/Rm4eJpkEC5CIhxkQefsD61tQj1dB44
 kl0xNFLDz5EfKovUm5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200049


On Mon, 19 Oct 2026 12:45:48 +0200, Bartosz Golaszewski wrote:
> Use the const variant of constainer_of() to access struct
> gpio_sim_attribute which wraps the dynamically allocated sysfs
> attributes for value and pull of simulated GPIO lines in line with the
> currently preferred approach.
> 
> 

Applied, thanks!

[1/1] gpio: sim: access sysfs attributes as const
      https://git.kernel.org/brgl/c/8dffd86d0221e87ff8374ca5b8bb1352b6d94468

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
