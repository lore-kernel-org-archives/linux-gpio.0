Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9594C37F723
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584554; cv=none; b=GAxFXA5JEeLBjcJzB/hsJy3JdD/RO8hxVxLuIp4cbIQG6y7z9ktoedpFe6+cznh9JvdXf2xjM3EXU/RRfz8OEXrWLJbqBIYon/ju6CwwPQRSwUylJpFPQaeVq5TGsrfQXKHlEcJ84uFu+ozTiUmVj6O1Ect7Bpmv2iaRoI/65Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584554; c=relaxed/simple;
	bh=v7CiBOA8CHdycT0JLNHiNya6IPx7eS3Y3iq0Fpcko5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YgLoM2uTmzhmOs6IZ34EqPq6V+MubDYA/96XzH78ftSfkEJwkojAOUkv2LR0zvcMgIU1P8sCcN9YvwusMU295m8fzg6HLAy1E8eqLyNw6wrPZdmwXgQAEr/7KkLh1Pf+VzIIP9XLMWe4xmGviPFgUGCwyqvxxqu1SqMBWwrULVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AT+I/C23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fni8VNkS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AT+I/C23";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fni8VNkS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xrNv361407
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 08:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgTkcWBuKdI2G+CM174I8QzMT6qUrNOJ8fH5XMp7brk=; b=AT+I/C232ss2o529
	FQeDGzoH6UQJK9vlkeJoul69r+93vP/FBl0/VzcPFR+zf1o0FmJ3U7D4KUj+pSGA
	agv5L3X2qMnGowJVG+BJlX8bKz0zxbaq4/vEoLVV9IdIWWWLPfThOtJem1yvtu2+
	Ro1668EWC2l9lQBDKLxeOuIJD4QlJgGSetU1uShgrg9AjYmz+5cVxX0L+u6XVW3y
	FYm+qSDzBY6IVoLS3qq59pmt8+MRXUSklvVHsGE5HdjhnOdEgAuFHe75qPDKM+kn
	+vvKcKbRtJzSaSB3dJSvUmlWSLIUZQCpc1ymzDs7DPQyB9f+EIh2XODf58/2IK99
	Yn8e8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49jfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 08:35:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so719208885a.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790584545; x=1791189345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wgTkcWBuKdI2G+CM174I8QzMT6qUrNOJ8fH5XMp7brk=;
        b=Fni8VNkSes7bqzzxFcwt8wRhC18ZLsGIYYyizUJZiItLQCfAHHYQjf5OHOR8LKTmLG
         HRDYLEV41JC1CzuEa91zKtd2CeMpkzkT+p7dMz83790nDxupLVw8cC9G18EkfduYB7YR
         1odgA2lIZU8fT2oElqO60qXa+hmYtSgPGLt2dmr+aMV2hWTC247XNAjZNQI/8WBjKwgF
         vHDQvg2XEDTAXChXxV3FcqWVwh7mX2qOZpQdNZggPqo3EdAzf66mev8xyRSYi12dgO0Z
         YVF20v98SzUUQx1DErzhUh4A95gO95wYVL/a5fguDmGUPJj8y3qybnLFECvWnRwhNCrH
         iEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584545; x=1791189345;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgTkcWBuKdI2G+CM174I8QzMT6qUrNOJ8fH5XMp7brk=;
        b=ajyeHjf9Dwc56W26eTQ0A/2LIq4dhi9U7bt+ni3rUGQ+rGplZnZiwM6z90il5DLhrq
         4/1Sq78cEAtIff9bzQ6M4lq04JNBHvcj93BzdjirbKBABhWLP6OFrJhTO3e+Di64xw/S
         5+7lWlEETXDF+efOOLgt8d9DHbzzaWKYXUd1wak1fARYrMPe/a8RV8EXTjE/vl2SuWv4
         ze1Dj6yHgXYJQjd3swI+I3Mf8GI840Dk6QtO7H+P1M6pt1QqSyp+jweMo9Fqik9cAYo1
         K9Tm4Z7HRP67GpNSXHbrI2q3xOL1lvfa5Blhxvs4+56rd44twXiWIC81a34e5OAu+hwo
         Fb2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzo0v9VWySRzMWDMu5KcS040VKizDVFC3+0EUaJi+Om8hQmnBk9GN15M4z+c6fmh8QSBGT+DYQnrlXc@vger.kernel.org
X-Gm-Message-State: AFuF++nsd/HvlP2JUszAx4LkEiwD7hmWLBReK/AzABfcgCrYaxNTgT7J
	CXFP8X9/RPqmSJbbKz+lhSh6LkXX/bd766wiCDAVpM2WX2wZz6a/Ux00S52ASuYXISRcSTCmXlB
	YXQ2FZz5MB08jVFJ/s14varivfFsY6JSLprncLOoJlMhZp6fZ5BL1F3w+BMAwmecI
X-Gm-Gg: AYBFou1gMHx1cGQtcfT4AdfkeupHUz/6HjpeyjQvWlPlkyl5+9ugNJdTgyR/GjU07IA
	FDHMmTaftlFed3pV+42S0BEDtQParYT+gw3+mDDOM1E9L7yXA7XkZ9Z4hdl0qq0W0i3Oc9LbAFN
	9phN7W+A6bKds8oCOEWjWbnn3B2EcuTqkaAaYFR2cHssEFoWSxgyTrGIsTWd/F8wrbPRSV+TPrb
	ovIuwCo25olrLfUQxpcuuNCTLrLd+qAWJUDUBANITP63lE3Kt9sNJWYpaiuwxxyUmzLV+CxxjOb
	wYhVWvAMtPq9FijJhyFGKcqYcIiTrf0a0cAeUp21IBeSNRc1aX73DiRAUhOGOnd/VTsurhi9xrL
	BsrH4f8BobjXjewonS77K5dWEdp8=
X-Received: by 2002:a05:620a:2953:b0:939:a45b:76ee with SMTP id af79cd13be357-93c43c8b51cmr1871365485a.23.1790584545438;
        Mon, 28 Sep 2026 01:35:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2953:b0:939:a45b:76ee with SMTP id af79cd13be357-93c43c8b51cmr1871362485a.23.1790584544923;
        Mon, 28 Sep 2026 01:35:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d5f4:8a0a:ffd4:396a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1847sm36343235e9.1.2026.09.28.01.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:35:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Areeb Ul Haq Mirza <auhmirza02@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pxa: stop reading gpio_chip::base in direction callbacks
Date: Mon, 28 Sep 2026 10:35:41 +0200
Message-ID: <179058453795.16676.3348413064558617829.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924140242.126159-1-auhmirza02@gmail.com>
References: <20260924140242.126159-1-auhmirza02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eFipQIszgT2WWIPhi0ysHhwHr7t4bIZh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX08COjHouvCNg
 vfiswUHlXUtFN1PQpWOcNCI/EFnT1M0e0V7MQ3CnBxG/gsHEHKfmxNquNnkwvO4LAzi6T9Pb/Q2
 ZdnJMcorIQq3Y6e73tMLbd2e1uojYZEy8GO7Tt3I2uThtQNahwdKN+VYebIyUPm8nvcjX715dx6
 wXn5C+lOVqXxZrAfdCdnDO5cIGUjsyOs8zU3v7YBCYa8fkrp7FoWahDEohz4Pp0tX9p9GHJgbh4
 b6AEO2JM26vHgPUS8Ubm32l+VpN3gUlU1yLukDqoXD1VZsJ4CULoBi4BrIEEcoAZabMkC3CoQGN
 ZoONnmChgGpilJCp7c346gXnwxtWIiOv/Pus6vHyeWOCZhpWsmw/EZsdfcm0WXGOuN+I+hbw8GP
 7JqdD6Ub+HxlO+SL09WkPJOhmXGJhJjTrd6odAcC1EjAbLpA9Ki6AxlKcbShuUdPdHU+H9i1C6Z
 g5na+9t91LpCeEF5EDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfXzlpN5vMhzcC1
 ir00QhkFyAtH575CD8GJoOF6sYHA1TUVBbO1/KHk/RJuHCSGzco5YWNoxThXiJvQAkvJ0JP+gSg
 4eWQq9kWK+Ugp0Jsu7i0noz/GlVIWcM=
X-Proofpoint-ORIG-GUID: eFipQIszgT2WWIPhi0ysHhwHr7t4bIZh
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba26e2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5KF4HZeer-FmC3Oeya0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280034


On Thu, 24 Sep 2026 15:02:42 +0100, Areeb Ul Haq Mirza wrote:
> __gpio_is_inverted() identifies GPIO86-89 on PXA26x by comparing its
> argument against hardware line numbers, and its other callers pass the
> hardware index from irqd_to_hwirq(). The direction_input() and
> direction_output() callbacks instead pass chip->base + offset.
> 
> Pass the offset directly, which is the same conversion that commit
> 566e684e70cb ("gpio: pxa: use new pinctrl GPIO helpers") made for the
> pinctrl calls in these functions.
> 
> [...]

Applied, thanks!

[1/1] gpio: pxa: stop reading gpio_chip::base in direction callbacks
      https://git.kernel.org/brgl/c/c4e74a7058b573617f142e07b4b5bc9eee04f4c8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
