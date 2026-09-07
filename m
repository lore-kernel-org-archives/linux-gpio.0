Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30176400969
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 08:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770945; cv=none; b=uxpCl3NFzCgbm2IPdSCHOI+xY8QNpBSXbhx2MACRbowmGTA0XE2bjWs2rLjCnaqrFEhiO/yX7ngrs3AsPSDoDL+e+7Q3+NWQ43xhDdCa2v+ix+iE3q1h/fNdyqa81nFNK3Yljqp18Px8y353fkkunwgI3iigTljVN7y9yV/lp14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770945; c=relaxed/simple;
	bh=KNbGQKtxz8KcCXd2VzZErD0YC+USpVaTQvnS4gqOR5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XaSXxyMthlz/5OPTg/f5A4ixUg5nRS6wdgl0fd4yOr1S+7FVqsmwJnN7b8kJOBDuOV9si0neat9/pgJZm0Mk0dRLd03irAR60vgHgouMYQPQes+8ZgvUWgZuDJr1FYKaxBzhHSvBOzhszktWFqi8mxVnSDays9Imu7GYwmYTehI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZL3zZ0a/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYBjyyd6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZL3zZ0a/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYBjyyd6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Ovt3352539
	for <linux-gpio@vger.kernel.org>; Mon, 7 Sep 2026 08:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d/0hMYtV0AUTvKgdIzntIko+FkAJyCqkPlgmbhqUNjk=; b=ZL3zZ0a//OqFRTiZ
	BVksRn9MpDegor2kl8y1SmU9no2vhNptk8la6MFQedNLeBqIYkyG1uCzcXQviN22
	gsEJbb+gBeD9MmHMDC2yAjsCc+GhbGGSfm8AeFNpp8+XUvDfZsi7OvRjOnUvNvef
	srOyl0NrPrPIXm9p+zwuuXR4kaQU9SUm4ksGe3VSmAJXee3dl9JqxCIH/LX6/UOW
	ZuLIV9Vyqdl0M9vMDfpGaWcnvCjfRgN3jB4/lEq9O2rlZDEkO6iQ/LlTAnSipfjW
	P2WEXTl/W4/gmz1gE5xf0Zu27H85vKRj6oPXRkawQlMXXK82+agOwQYVnK1zppws
	Vr59Aw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gw89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 08:49:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ec3146553so832272485a.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770942; x=1789375742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d/0hMYtV0AUTvKgdIzntIko+FkAJyCqkPlgmbhqUNjk=;
        b=SYBjyyd6uDxJSnAhqs6V/mnMR0shsF7OTXxRZ+v/3H5R35zxjd8ItEjfCqz4bby5aA
         CgBzcymTxbJK34zLTh0JIYWSvIwGO/d/JxLClq4+S9BvmvUq47Qji23kUjumUO5+ioMZ
         ZuMBo51D+GMGl8kZFGG7+HcR2GaYAbEmwjSnt6IdOIftHog1KoHsOtTaRhWVVK4CL9VM
         +mFjaEbNKcHEfMxTvi05+sLL700XBS/BVQY0iR5S2k+ruUQbWi7fLJThXkb9SZLvVOkg
         0iuBraGKDhsqqLDjO4R0ZanG2YtelyfrH6RyOXGr1wsB2Qxg9KhiSMfFhJpulBverKjY
         DWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770942; x=1789375742;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/0hMYtV0AUTvKgdIzntIko+FkAJyCqkPlgmbhqUNjk=;
        b=IiQoZd1ScRb6ZxzwNJ0/WnbUUqw6zsj8MBButJ4Ia9un2g7+02cVEknM7CUWR7ij48
         IuOdXIrVmzxl8WaitgPhbDODXsl5JDSbUkerv46fNnXzxJL2d6Im2cIT1/mhir+xzN+0
         +/DZcLJ7KvIIrnONqPA4z2f/6Lo5kl0XnYMvabz82DFUda9y5IuDozrgBS1++Ygc1Ifh
         HaruGNnFc/3nKEm4LPF7HPPQU4tADlfaaV3/CQ6D/rV9txVzz00EQlfJcTaY8WjVmqeN
         BpIL9zAQGyanGsWiIQPA4oN/r10M1zR4MRsLhoGZnqWCvrSnhwlZOazP38/sMpydFvwP
         m+gg==
X-Forwarded-Encrypted: i=1; AKwUvBxWM8aVjvy7l+cFz3Cy6MOtMTWotJh4/nhBDHS1RMjM+drKyXQfQRtkz3RtjbX6u09pxCiiKRR21pN7@vger.kernel.org
X-Gm-Message-State: AFuF++lXSQkzI/7OXf/RebUfUyHj/rhIPmY1qhCLAg27ATKu/RncOqrh
	9Car97WBlYYkDaHFjxdK5wsGQ+QP6GHx4NGm8FC9zdIlapc9T9SpwXPrfSKX9JUAOqROTY60jF7
	LcpIFlimA7j233sAWj8jr6RiGRjgvYj46WDwkZccI+5vXa5i5NrF7gjr246ZsXqNR
X-Gm-Gg: AYBFou3+xYazUr1mERU6dEGFEnwPgNHxzmHJJ6sLQKQXi1bGmGfzEchLjsZC8Wzibr8
	IRIX5TSKaSrFQOkk/8hlTTT+P3lwDbns8/P64kWdSV5jYgwDnTniuB0aFtvlX1WMpJDXh5pWEn+
	anE3OSyjonfWNGzUTKsNEnXPOh5/cVjYg6ytbwMXq+va6H9P5zU5Xxho1Ffsjk6OTJzaednaEJS
	+3gXcl0eSjnCh1dQEu5yvrg3Uc9sRPsTgG2fFuIY/OBisrE5v1+pTHqB6QZPQtscM/1nUw6bfNo
	+jBz887lI9lkf3A6seTC1f2g8srgiZQHqv4wMPbZo+Uf4V2g9jsaELB+CV0tznYrGqv0VUMtPF9
	O/YdXIysJcSjQuxVqaNpoPm5b4Q==
X-Received: by 2002:a05:620a:43a4:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9398072e3ecmr38294485a.44.1788770942146;
        Mon, 07 Sep 2026 01:49:02 -0700 (PDT)
X-Received: by 2002:a05:620a:43a4:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9398072e3ecmr38291785a.44.1788770941737;
        Mon, 07 Sep 2026 01:49:01 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07b371afsm191513345e9.9.2026.09.07.01.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:49:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Xilin Wu <sophon@radxa.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
Subject: Re: (subset) [PATCH 0/6] arm64: dts: qcom: Add support for Radxa Dragon Q8B
Date: Mon,  7 Sep 2026 10:48:58 +0200
Message-ID: <178877092324.9461.18090953151782895380.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e7a7e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RT5i7AouTkpRziyCYWYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2k79Jarwc_osZkRmsVhGRUVV9-q96_sW
X-Proofpoint-ORIG-GUID: 2k79Jarwc_osZkRmsVhGRUVV9-q96_sW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX4cyRR9yHcpi1
 EswBViOxZECHdU/TQVCAaDdx7Pd1Cq/BwEWoV8m6mCyWQCo8she9K16whvP2SO3C8j5LcK84WnO
 Ri0Qi+wRR3XV+ecgIYnWcJdLiDyJ7xU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfXwlEml/MW4s/W
 ot9X4JcNIJoe46l12TAu0/oUz+C3iorrGPvukpM/NSIFGR6sD463WckKXtasjPYnSd1CqrgsaWw
 EKb9wod82iOCGm+4zgNLabQTOHvcA8UsbRo2SxAbo5CNWZtyH4PiO9LB5V8FWI5Gt55PMrteHz8
 e6o9ECsURCF1qiwWTI9U3W91LWv/ixZ4JG4JGe09UTzpjiokQuIVvzd+4j7piM3sQ8QDrpC65T4
 EfmlgFmEDEL1u+wHfC3Tiu635jaROmspteOFp6t5xtURCVpywk1CkEZeahZz+qePs7Jh2FWeXvK
 3vz+k+WbTWk601HX+dhnWhHzOjkz056oC4btkeE+XcVPqna01LnmrHt2lqugdJl26NM1bZG54cT
 UfRZgqsunknS/AZGyEx4E6ZrPhT/Or75gq4slyqN+LUZlgulu4NVS5qCBNng8xnpZsNsk2ZrmtD
 hTZCjtE3SlwgADvQDDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070095


On Tue, 01 Sep 2026 16:47:53 +0800, Xilin Wu wrote:
> The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> Snapdragon 8cx Gen 3 (SC8280XP) platform.
> 
> The board provides UFS and microSD storage, two M.2 M-key slots, an M.2
> E-key slot, a QPS615/TC9563 PCIe switch, USB Type-C ports with DisplayPort
> alternate mode, USB Type-A ports, HDMI 2.1 output, headset audio and
> a 40-pin expansion header.
> 
> [...]

Applied, thanks!

[5/6] dt-bindings: pinctrl: qcom,sc8280xp-tlmm: allow gpio-line-names
      https://git.kernel.org/brgl/c/d4f74023be11eb9aea9a8c0b0582f20aa2c2640b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
