Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D631C44E042
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760014; cv=none; b=H5/VWG7X9eMTM3dlToHv/8nc6bcsvoXAAUIdc4dvb1nGcGZ+jvjvQ/JtgJB0Pr2Fx7LarHbLNIexy3oVkVFsBqAoC1BB+lb2LgwDalFq+vIgW/CPx7hq8NccLQZbYhkwXYxmCPyS3pMDelVYXcetjrMKUoaa626YldMLIc75WpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760014; c=relaxed/simple;
	bh=hBrb+NyvPj9CM+RF2lTBAHr6VBSADiu/isAxEySL+cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aRPY32gLxfuvZy5TcLAicOgYzJkxA1rkBsFkCbTUtNAkWLfDoJ7ibPcyW3ikEthoNv+XVUF5edqxC8OMvfOSc0rRR9ydZXkJx5Wb+XHAgeFoQTvhYZ5scYmErCx0dqzKR2JY8xhr9FEtwJUpfoGlL0PSUt+QfkVcLtndrocSCjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwWnpr99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBKT20xq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwWnpr99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBKT20xq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDv4F2911231
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 16:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ycV5lg2naMiHanoVjb+u1u4qUet5nY7n29mWqjlsxtU=; b=JwWnpr99OAfzLOcn
	G0ng1cLkzBngaZOvgaej9/E54usQ7CAW197h7/QqzodN3Lw1HsnPbZ+oFIALImEh
	fz1ZlBAzOx5UF6X+5HI1UkT/1rfQ1Hzv6Q9Uv31IL1FNbNLA01mO61ZyOsD+TukB
	zbf4WCV+Un1s7tmgbfktFZPHG7EIRPZJx0IaBywl8WIIs1BHJJFbKEk446yCWYct
	1K0bcGQzy3kVPEphgFASHNhwtFPOz+H5LwgGRY8kVWPH9wtsk0PAGRlCuuoT2gkN
	GBtc+3iHq41TihbUHPYMUXBm75oPRwXCMo/GIyY3PwYq0ZgkpB/y+jYkacr2Loo+
	1In/qQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a8vrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 16:00:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec3314f65fso11745526d6.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787760009; x=1788364809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ycV5lg2naMiHanoVjb+u1u4qUet5nY7n29mWqjlsxtU=;
        b=KBKT20xqAsZMXJsPn435mbk+K6H2zJugRwsLphN7nQ2XEywNWKuGOQyaHPvfXA73tH
         8FZHpIH+GJy1WUrvzzP+A8VA6mjOgvcu7b/TMfeuWUCv2Ba3dq4XGQFGA8pIEWDdmsoy
         3nyGefwfM2ruNYghpm6nIuIUQ41sbDISsYsgq6TzrlCSw61btXpPPYuf0O99e00PuH62
         ExYZ2Fnoq2HhPPPasFxOsWFbQQYIZX3q+o/d2QIwOQ676TG/ZDMVZCPVjDPMXyk+bAdT
         ugeQQRLFABx6nJAM9BObOLnDHb5hYNHmyiMLjY45FWi5vHmvkxM1W0fAkUQi4zXvKZUl
         j/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760009; x=1788364809;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycV5lg2naMiHanoVjb+u1u4qUet5nY7n29mWqjlsxtU=;
        b=BHhCz5HnIpwDJ6PWpJmBAaNoIroYpL7PtGewS83bI2SjqyhEoPqRCvY/Rt2rX9/4pw
         bAbSRXT+NlidCqDAW1TZeLT1h4nbVY8zXZbqDjIc6Z2pE3FpBnVrirYX63HL5mmAhlqL
         yHgxeAchHKz8jmQ2rXKb7/3O3t4SkCTT0e/PZd4Gq8/7E/JEcPWhYcuwWQnCyJFPAoDJ
         Jw12kFuBKlasVV9d0VTu9kTKkJ5o0MCEnACKwkBjMKfHsnJ/iDtgz5HrK3MQVW/nOBWB
         5BOrWhXf1e0YRHin/FkKfqtcBBmqD5drCjM1/OWGOQ1NLpj5mb2glTBNEUne2Odvln2J
         DPHw==
X-Forwarded-Encrypted: i=1; AHgh+RonoGLXDp9hQ/TsJf8Q6dnEi70QeUP4kq+q0aObg/xJNWkPjcTylv/KwzOXLJp3qE79PmY1hzsMHHZO@vger.kernel.org
X-Gm-Message-State: AFuF++mfaKosgkRreHV35yrfyG1FeAnJ9FHjbTILGIdzh5O7FwKRNQlN
	QXBVqTMLoxxWdnf/Lqd7yFU1+9E+JxIWalafVcGCVNqSEIv/5IeGnibIm3kl0aEaPjd9WYWa0Vk
	1W3uLnuKXNr//vwLBfNkzi1/S81ueIpfvgOqOhqvInUpYHnZuEUlDebK8vL4NGoez
X-Gm-Gg: AR+sD12ennrzcmr2XaenBN8kCuOHwci2bloUEEAX69yyr01qBG3wIxXnxyzCWWWXXCx
	1PO0SO3uANojuqd8EI+2ciIULfPT4NpRw/uxQew7fJjaWaUosNo4Gy5b+vQsjkarf4mhYgR1BH6
	lzBdbGF5w5V6mUpjDSOmkfyU93WcaUtccaGW4xPLXsTmqfyTRg4HJ50DejV8rok2hS4J8Ejrfn/
	6KHyt7ShlhEIjt4T7vH7QZQFOm9pdcyEEZXdRFeu8fYKjh0+LhjdH/wh3QVDjEgLiLlAb7IASTa
	mws1FZ2do6EApsM6efkRHOrhWKdkeOcIJQ0RQBnWSVxHppiSIj2SeW858nYiUybTwO0uaIhawgJ
	HpfH/Lw74KalcWVdx/rwETpufilQ=
X-Received: by 2002:a05:622a:5918:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52e423b067emr85551111cf.37.1787760009196;
        Wed, 26 Aug 2026 09:00:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5918:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52e423b067emr85548841cf.37.1787760008309;
        Wed, 26 Aug 2026 09:00:08 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56acedsm20593875e9.3.2026.08.26.09.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:00:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org,
        Michail Tatas <michail.tatas@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: Put fwnode reference on failure
Date: Wed, 26 Aug 2026 18:00:05 +0200
Message-ID: <178776000251.70874.9622772763233595457.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <an4Asr4tx3D2QvLD@michalis-linux>
References: <an4Asr4tx3D2QvLD@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HuJsrT3Lcbxr8AH-3REIFyq5E4HwvYSv
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8f0d8a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ugtsdxiNPf_PuXVdW5kA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: HuJsrT3Lcbxr8AH-3REIFyq5E4HwvYSv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEzMyBTYWx0ZWRfXzSGwEWObsrha
 36BxtmgydliJQrKUJx021W7XNHPVZTRovXRCheRq0LLBzpZ0WsIrwPSMs3tXPKqBgXXdD4j9ZSn
 EafKy20BtRkNh2GRTIxi/FpZhrGYqw3iEbqIY5qVMuifLz6KJlfKy11JbnRagWUNEKC4mkXcv8F
 uPdZPukH5yHbh6FNqYQdAjjN+af+NBhOD9DbxpWQ0L7dQ4uK+gYMjXDxHkyOtt+UeLSt532NCZ3
 WGpqeBihTLJmsB97zOmw49lXlfYRQaRp2BddpOvm9po2izvCL+hIpNI9a2dYrcproCH2uuG9cY4
 TKetKGzRzkDJ7Rhz1aKVdgdu0EG9n5FL5oy70e9gi5udR5qhUQAKE9MR/A0od3aVtw0qCudMjAO
 fX4Ld1P8RceyYQPkiMafrJEMq7rkaDByvMYdzm/ir19bHm3E6EaPDxdjMnhdsdCz5FzBPuUOKhs
 AYYi5ogXsvbDYo0UdMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEzMyBTYWx0ZWRfX16p/kpPJXuhP
 x8J4zDUlnUXd2eIXdRGihJqw9+ZwnifuKtyArTbGoPAKukzBAXOIWXcO5zYvymXz5isFt7zVGy6
 wUV92NC5iaYTh56UwCvOvPQbHDvft08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260133


On Thu, 13 Aug 2026 20:36:50 +0300, Michail Tatas wrote:
> We get a reference to the fwnode handle which we pass to
> gpio_shared_make_ref. In case it fails we do not put the reference.
> Fix by putting the reference in the failure case
> 
> 

Applied, thanks!

[1/1] gpiolib: Put fwnode reference on failure
      https://git.kernel.org/brgl/c/16b10f64c63f78220c3b4035f1ed6cd3bdcb0b02

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
