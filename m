Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FBC4457C2
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344671; cv=none; b=ZxNeVgYUcjFlyfne87YiLzF0+FaeklC4Gq6aGKXjzrGvxF9EV7xg0zZMV9d64Xv6u1tZHGr3tI8nZ0iE98juR6cxfwzjFkukaqD7FwnqXJj3jn4LzFFC4M0E5N7WU/Zxd1WS6v6bKOfOzR+UwYtURk96JUrYOHRciYcr+jGtN6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344671; c=relaxed/simple;
	bh=iCb8yX7RPhl+yn5F/5/P8HVWlsw7cIAmXa/n6DkPaD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aemnIh91m2OyUptPeDUHzPdms08Fjv8ilJeRW+gBddPxHMh5KuY597QenqXEeqR7cRkiWhDNtpyofJqvsrjrMcsRLrc1ykgXOO37LenSq/tePzNUdKvcDxFGLbkiT/CzhvQTwyfoCgIX6zO0rQCrozPWQJAIA92av6Fr2/unO3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDnQO6IP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEUuAyG+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDnQO6IP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEUuAyG+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682A5gas688538
	for <linux-gpio@vger.kernel.org>; Wed, 2 Sep 2026 10:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXTLbvkaIocNmvnJYqZPtiPMWVNU4SP5kdw8z+YoAD0=; b=EDnQO6IP+tQp0z5Q
	zGMt5ErvlK2OPTNxWQUUox9ndmqg1TC+JrCBHxfla8b2h+CzcOmlpN7RuV2KneL7
	sCbV1L4w4W9TSQgSdHgqXUEiuzNXhxrqbwxzaovDZwe3e/zm+d+jwWHExJLEPX+1
	eqyIhKpVrcEMDarlbZaFPNRn0YAUbPwdz7MUb5FJV60WnPoVEARYX0h6XdE0lZYP
	5gEiuffia1E8E679nTgTKxiLMVxhdAPHPiV1ln0is8DV5PTQXjn6wMb886cXSs6r
	xzupbu2LX3c1LBXjRkmI9BrYy/I528B8GOfZz4pn/r3uKkwpzFcOvW//U4ak7GvF
	fWoLKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gehrd82hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 10:24:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so195994085a.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 03:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344664; x=1788949464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EXTLbvkaIocNmvnJYqZPtiPMWVNU4SP5kdw8z+YoAD0=;
        b=SEUuAyG+FCP4HcoUqqX6SC1QviUTn4b0+nzhHkphugL+HY4706iy7jQkHizXAtzlr3
         vJnWt20bESRBwaORBhM3qKIvUGwuJGia1O2rmygDvw1xEaRucynTVw5q8k3OMt9Oa3yX
         1n5r0ewdHGduAbVFLMt/79Di7Exh2E6ugv9wyqv2LZCsc6igakpBG7NcqEsHtnGHN/yj
         fvZSu7DUD0e0H1bbPWDVX+hkSyGSFVqvG7C2VzrI0QZlkRUKDmG0w+TfvwaPN6PijGrG
         2Q+bKBtJoZ+/s/HKj3Ab/oSskYaDLNEqsb0yoC8gvEtHOk4HtDLqJxDvgcCMq81LyZin
         LG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344664; x=1788949464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXTLbvkaIocNmvnJYqZPtiPMWVNU4SP5kdw8z+YoAD0=;
        b=DsDw9jp7DREK6uuRdNtgCkurs0Wf7zqJak0EbzEyQPnTa0Z4AGdUb2h8Z26HfQeF7/
         eJp1i9KZYkUYrJ5YgC4DnYam50Yry3WYJILzD0XrfjPPp8RSHvRNOaFIKzjEa8ctZdkg
         kFHBBUBDhIAo5NOobdBsN5h8Zlc6UUVkcYrEi/dxv8qW/zzjvbPsDWZ1X5J5+y73ubhS
         cdEPnmzc+tmcC6HlYlloyf0U9srg+NnbFh/b0AQDNjLIwhjBZ0lfQf5AXsntjm8IuKWF
         JMG7RBsI7zYO6RQf952TwOgTdb5m1lnYbbe3T+BM+zUPkvmLCYwSVlnK+Y4oPoiqsLak
         OkNQ==
X-Forwarded-Encrypted: i=1; AHgh+Roa0QlznXVL3O7sETYNLsIQG4JTlB34ulm14pzvwS0r3ZVRYEro4lOSlFL+EwdIdSsi5VRh98yXeOP3@vger.kernel.org
X-Gm-Message-State: AFuF++mb8BgAHa6TbXz5WJ6NqO+khZngThrSxaSnNQpgAWITiiK/a6kf
	sUeZpOnAtl4gMpZWxppVYmVo1PyCGntpMGgc2DsmrllADjbZiVCNAol2WScdE8MFkKvdqchANAj
	fRm47Et0UgveLSLniFn8qQO8XXoNrsU+jUz+vuTH+xGrDOQ/NJA62ujxjHr87qOke
X-Gm-Gg: AR+sD12KFY/QZs89vYvbG2FWoXvW/3j7lr037f0ezHnouiOWOGYY+3fxeTm70L4IKbs
	K2+6nnMRbJFWWOmT6SSabqd/esKj2hStWo5zeFYpoPOfuRX5GLNGeS4l33XdGXcUbbeBcwCrCUM
	477mAbuPkAn4445uRq0qyMTdZL8iY11nE3OKmRAwqWhnv85mRBxY0s1qDBcSNu034G27cZH7t/3
	mMc7bX/JSzrI/zeFvLKjUV92d0Ov8l8Nl7sHCogeKtC5Ji3PF029x3EP3NDQvdwRFgkAJrKeCuP
	2k/4RFdVWPFa5yHe25l9c0G3iSjzBkea/Zl8AzIatdyrrzaJlMr+8o9CEXTyxu4kyc0wZYb1MTG
	THAdAWpqUaq8mEyecvY74jBExwW4=
X-Received: by 2002:a05:620a:a0cd:20b0:934:aa56:45df with SMTP id af79cd13be357-93960df450fmr373922285a.11.1788344663540;
        Wed, 02 Sep 2026 03:24:23 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cd:20b0:934:aa56:45df with SMTP id af79cd13be357-93960df450fmr373916685a.11.1788344663027;
        Wed, 02 Sep 2026 03:24:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e04csm132554105e9.10.2026.09.02.03.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:24:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add PMAU0102 GPIO support
Date: Wed,  2 Sep 2026 12:24:20 +0200
Message-ID: <178834465640.12889.17588552466171610581.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
References: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Rr0ggRCI2VegGLVSJwq7ms_qXTaeUKxd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX5xT4A9zzMc1X
 IKWcDSfICbNbg+FUfWJ3Y1PjHNTC+h7yNt/p0RW6LHUE1P+hCR8kjRYiI3+YtlZg/vC7QF+tJh8
 8MDFBxpDjHAL+XAiC3iTfXf3u0XS1zs0iNWIx7Aqd9hEoJgyz8CBQojefoMDDNjdOqMVQop33oA
 3CfNshjuHNOkWEPXp578FYnYQPtGYnXvFwv131ZeYQbaqru3Y9MUeNrfxoPfrmqcerr2zqkwIFQ
 u7vyy/hEIy9K1xziWIQmj1IZcvklihx3LCZDJGUNkF9jJYyBlVMPyfH7JeuVqpObmS+8HOAl1yu
 Tp27NB5a4VoKanXKmANsvWuwtWmdUPlzQiLnAxUurWme39LWF4XU7fsTjN18BmLy7RRliZII6QP
 julKTobc7Nif6phJl/YL7n3EwMIkQvqKjojltZDuRIGj7ZDael5B39yccbg85xntRbve47m/S8n
 TM8lBOylu32/m1+888Q==
X-Authority-Analysis: v=2.4 cv=NLflPU6g c=1 sm=1 tr=0 ts=6a97f958 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WFjrMyYTNELkhRd79CkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX7z+hq45gUHbc
 wYYfz9KejqscAfoblBMGLA62UD5Zyr+WI2k/BxIkmpY9gF57TGVDRfbsFGNqq7aiE6LFN73FFqw
 E68oCSR9kuTHXpfCiACbVro/b6tLFHs=
X-Proofpoint-ORIG-GUID: Rr0ggRCI2VegGLVSJwq7ms_qXTaeUKxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091


On Sun, 30 Aug 2026 12:29:37 +0800, Shawn Guo wrote:
> PMAU0102 is a new PMIC used on the Qualcomm Nord platform. It exposes
> a 12-GPIO block that is compatible with the existing SPMI PMIC GPIO
> programming model, so support amounts to documenting and registering
> a new compatible string.
> 
> Dhruvin Rajpura (2):
>   dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
>   pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
      https://git.kernel.org/brgl/c/25f42a33ecf914e6d8da6eed2cdf7ad86c9a904b
[2/2] pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support
      https://git.kernel.org/brgl/c/1cc8b87bd9719f5c496d27a1b4d2892947ba70d5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
