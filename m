Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897EC3AE706
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358368; cv=none; b=RXESG0JF65xr5YbN2AsHhKIlqYMlIgIyKKRWVv8uxJRoOK0dJIwUyZjIFZSGFYYMpJWBV3hsLkpVEDlr71VQ33lYnZgz297KdZLupPrlFrfeUYpBoqVbiakAOfFHo6+sStyjtRvgt+s8y72yG2WYlavKq+8OgOl+gCNRS+2IoT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358368; c=relaxed/simple;
	bh=MIaD9u/FyqAx481M9oGITZCdlJubT9fxtimqMmPs3LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YkPk4JP1e6cP2Ak8vHQY9G7Wfy65urtoIlqXaJrNPgzwULdohmv/LWDwN0CU0uSsgRIZqjQKmDTAOp5kpYRYLOIx45xOzAOaFBZZsvcNLcl3jSy2ilfhqimr+V0cBhjVpOYhWyHksgYElF0n8YC1F/0FJmU0UveWq1LHaXPMi80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKtmteTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOTSccYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKtmteTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOTSccYu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SCHI446663
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0jOjMvM6k4d5k5fOvE6aikfLai4OHADt0EAzXaYhzM=; b=GKtmteTRzA2YjoKW
	9dPGTh1qeXym5u30RA7Rfq/Qp02KjAT1YME5rnMA/T+JSVEYgLpl3a4ML+8QzIw4
	6FVy8hxJz5qhA4R1asArSC0/aRNGEFJbkA1xK4XKChpEncySBn+AcxSiUM8QRQ9D
	3OqCNksoLKQYI7ZfB9F2fE1IPde/GZod2FWT85o/h9Ohc4lX+Q9N0RKbDlR4Q1tk
	sCS3s7dfrciUsJ5oh7+TM+gs1v+sGeDl5EU6W/yA6u9o6VDGNjUpfzBy4XDgW7ov
	duNGF8qjKc9ryZCE5gGYyTgOvhlrEnKEez3p5Oia78ArDjYbvyNtlOtth4D8LwMJ
	l0GWrg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v910xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:39:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930f5da3467so134837785a.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786358366; x=1786963166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0jOjMvM6k4d5k5fOvE6aikfLai4OHADt0EAzXaYhzM=;
        b=eOTSccYuVTXcpYFKKoBTH0bJ8trvd31kDMd+YPtHbV7bYUElSfRHjl8aAp06yuV2S1
         eh90g8+96ItiNlWTpOgsBWKvFkxwC+IUm1bUzUsXki2hLvCCDq1GphYO1sfI5EPyMvYs
         hl6Z6sHdJngmEUrdXzlaxeYlx60TZAcJndhqbZlWCtqpY74GnM6Jic+SzhRofxnOhF1G
         sPiY3aXMlW4MzxR7pn81BcY1tbMClY50pK82cDtBNSY7t78lMXv3wyUQZ/JsR8WuWgpD
         8aOoV6b/HG6FBoAgMkt9hbsibqh6ui8/nvy+hoSuo1ZIfTSrIxIZyKaW85k+X5VPQKHC
         u70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786358366; x=1786963166;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0jOjMvM6k4d5k5fOvE6aikfLai4OHADt0EAzXaYhzM=;
        b=kppqOMzMzHnekqxA4UQtp8Cu6KFvlKJlVU6PpJLHtLQ+Hmm4vx9qbVRRQndalpY+ze
         RC0MF3i92AXDl8ylAoh1J2dTDCFP+CmGnNCiWc8uq39zsecO0vijFA3PYzdcdTtGEWQ6
         DR9VUau7nYliLvQ7QVZA0Rh4gclqiCyJPpSMZWxNGnJG9CxpbmOEm1FKSAN3xt8R6M7P
         4WZnxzxe0PYCxgGkxp9gOAnMDw+NlqlHDn4n6ZMxKRQEjUgTdtJw5MEWW2ugKWTzTPvh
         3s1WLFcFA+De3GSEokx91sKyGJgnPsk+XR3l9D6l+EV+xLWub3MqvhvuJ2VhWCC+kz0U
         +TCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGHeyXcLRF6U1FP+N9wo5eH3CDHiM/kI8qBbWZPl//Tu4jz/VdGEnfm259Q4GqPG653NjURLMm+EQQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzU4lCKu6tCSUDHJU3AStnYFaWDjFVDt6SCwbnLJDpt5YSQ6+Uv
	WAXhGwEcUCI/BEknaZ0QOeNMKJ8xts9fQD8oPKSQP3kRWKZZurE3DhWI+3k/se4mnlKy8Sh86ma
	QkYre+vhjz5vRZNNy2uQEhvE/7hCG2T7HVkmXX3bNap0124u1QKhEZ+v/bMRlUCak
X-Gm-Gg: AR+sD110T4N8HcEyy17n6Bd4Vvo/0WnYuNozUD1LDFM6X5ul0Nof9mfCMQL6CODfjDf
	waTKWuJjvj2NukLJAHt9d4t1v0gDXL5ZLDiGGMQA1aq+g1Z2on3shu2VTstCkNI4RlYrW3BdmM6
	rMWQkPRkh4tICHaH7HR3GDPfXZzF7/9X0Q5lEGADijs3GmFTl8HlI1K1nt8ToNbXyHCyz6BL1dt
	bUTfU7hm0hIqPYyUIFlYqivfD0wu4zrY9Te5yBefvRa+Qj7xOYenN2Xj8SW7SrUeYrV6XUOH0Zi
	knaDPaBAVTZpJLqIFl+mnQWXBwumPZeGTh3R+HttXXOz3E2ynV1WIOFzSWQDH49hiWF/TSm8bu5
	ajMNQ9naT8gmJJTxtS9bwSop2o/ci
X-Received: by 2002:a05:622a:148e:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-52d20a16164mr201133951cf.25.1786358365799;
        Mon, 10 Aug 2026 03:39:25 -0700 (PDT)
X-Received: by 2002:a05:622a:148e:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-52d20a16164mr201133561cf.25.1786358365392;
        Mon, 10 Aug 2026 03:39:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfa2:33ac:2282:82ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145a2bsm33792385f8f.4.2026.08.10.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:39:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Junjie Cao <junjie.cao@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
        Grant Likely <grant.likely@secretlab.ca>,
        sashiko-reviews@lists.linux.dev, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpio: ml-ioh: share the register lock across channels
Date: Mon, 10 Aug 2026 12:39:21 +0200
Message-ID: <178635834342.23392.7784493925517390705.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260804095935.2132215-1-junjie.cao@intel.com>
References: <CAD++jLkAjQG7hFsdX+dy8wZUoKKDCaOzMD0EJ0nn3gYmaEOJDw@mail.gmail.com> <20260804095935.2132215-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfX3AlM0ehWCpF4
 w0C7oyIwEUvI800nW4fouT4utQ6rYhmtjPbfWx9WPH1lI+4N3FIyY0ouR2GY9U5puy9HhosZsAm
 7ty1+n512W9kxOCkALxGBJvFB3jeZ+8=
X-Proofpoint-ORIG-GUID: Pw3mq7uBpLSgsDSH-ROLSqBUAyWbJOhB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfXw4nCMWrCjJii
 IC8bxe3tBocpoRMmrhqRBRFwVwZ8McrWq9hDObvFmAEd43ktws6nnY7ib2qehkXbFSOPBpLJsI8
 FNmeHALlSJ8mGr6W5HCXeT3pin272JRYKVB9ZBVsggu1mXIOzmjFPZ/12uwzjOWEfcUklQKQtuj
 VrfRmWpiHe9aWjoDcjurz5XPO0IgPPoWLRIyWLKv/aao8pqtkCx49/urhhYxYJASk4axxoMlGio
 ogyxFLV67eDBb0PsE9JpNzo+q92W7o+vDd0EHTgeOMFgxDWo9r2RCKL2dAK8ZxXPrS5masK9LxZ
 EwwBUwmZw5ZfWsftqh/0bt/tcEJYqm+N3pF8rAI+OGgVeCCkWKVWfmRojpheoZc5R4mV+iZbAPs
 Wf5bQi4h0O9HNx2Tn7heBoYU/omq1W0ILM5aZy7uR6Z9C2RsnRh84dHWkq6GNRKYmubcWvZxCq8
 l0ppBi6vt+fsuYkMkKA==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a79aa5e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EQEPRNam_Ll-aolYYp4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Pw3mq7uBpLSgsDSH-ROLSqBUAyWbJOhB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100092


On Tue, 04 Aug 2026 17:59:35 +0800, Junjie Cao wrote:
> Suspend and resume hold channel 0's lock while saving and restoring
> registers for all eight channels. Code paths using the other seven locks
> can therefore run concurrently with PM.
> 
> Use one controller-wide lock shared by all channels.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: ml-ioh: share the register lock across channels
      https://git.kernel.org/brgl/c/a9253ee6771c8ab3c6de07ea75d9e2c1cef3cd97

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
