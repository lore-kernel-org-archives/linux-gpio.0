Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2078041442F
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074211; cv=none; b=Mb4lxFkNHOIf+4I/3dlCsZosf9Ytg+uXxefxzEkQyYlnWtvTN0IaT1u2Gs+TX+xFsPOF4TJotgnnFJCT8Zo9YQen/8W8twvSXwxetjh2mk4WRRCfBGRMd9I7oc7+Ag7wj+wSaxjOUdpRyoqU6u9IyrsQ3d2t3u7xUJavrxnuPOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074211; c=relaxed/simple;
	bh=7dj08UaEF+uVRHox/KqNQDFcUyy0+3y5svIojtdje3w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lF/LKbSro35MADK+cNgo2TU/mZhYPfQCp8dHmQUIyYjdEdOzX+4QjL20rIUXDm99NaDLt7/RAYd/SzYx4JMnBKefwW0N+xYajRWif4qfjuAV6od00HLBveB6+vFwbmjWDfci3D0+Y33C0xygqh7Yl2I49fQq3RdhKweTB9quhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0Ulo0D/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DegpS4ek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0Ulo0D/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DegpS4ek"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTRC2809294
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 14:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R3hmrufZEG3bdOwlfCPty+
	Gw0DZl6uJhxP3h4THqxJY=; b=p0Ulo0D/ck1RR2NMvtX6GQXehcnndVr3xqQgpg
	i5Ef0purUBG1ibdKKMl/mo7ngNFOvAZLBas/6TmY1awOHSulhWnmf6k5R0n/T2dj
	tkTY7Dj7hsoK1EwtJSq600MFe7xuaSI2K9FqLs8+f4jkDadGHw24f3LrryJRCFBM
	OolwwHlxkbqQDipFRqoEj/hBEeck/gDd/Q4IyU08J+GeMVXVsldA3IkS6+o4mMey
	1U6nUHeE2tRqgGDV4G/ZKakRHH1HXRhnakjS6i3+yVrdo2Ml82xANAaTxUKaGJi4
	rEhzTJl2umE5eSc3o5cZQ6cVKOLDZXRi4+adT3IR7PbVJsJg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54u18c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 14:23:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso7776165eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074208; x=1792679008; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R3hmrufZEG3bdOwlfCPty+Gw0DZl6uJhxP3h4THqxJY=;
        b=DegpS4ekhMaMvarOUd1Zo+v9pS3bWYYXWABcDzo7HqtxrOUSFTbaOm+5q2pY61X2ls
         +5HebmU09yKnfgKrWVUAnCW7BobNQGzP5NAQO4QRYIozeNFkjRG/EirkqT4WWD53hVAX
         CpJEWOp1LdqYZjPelTPw27BfOh2CP+2npzVX7RLVYjmc4eEa6GIU2jQS0hR37v3ElGK2
         hgyk9YMNVO5B1OC4B9RQvUTC5Tuw5Y9qomgAnn/Pbxg9dhmhY5sFYZnewnebWpE4Z1UI
         bdsmilHBmenuxGQDqolKF51xb4QucJIoYc4hDakRB699nZtOKK4xStEh2gfE7AGYXpBe
         Zf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074208; x=1792679008;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R3hmrufZEG3bdOwlfCPty+Gw0DZl6uJhxP3h4THqxJY=;
        b=Am5+edUSosUDVu97yZWncQSjquwXvnBFHVmx99eDdt8B6UikjwDVKsTBPTjzkYthGO
         i1/iKBo6b5H4CAEJUvhdYDBQxwVOuK3tFNEbjnl+HKd4i3aw5J+XB0NrcwizrxFGhc5v
         WetiVmXUdF3agoHFIG7G5FSkUcnepiBzbQQGnMnbtC0oxfDPmIfh67BcT4a+4hxjqKQp
         Os/VNfqRyObgLKrA/JR9JZIStOoic6TqkHRjniB/kX4Wk4DXuBF/FHdN4c604KpK0hJX
         ei+wnVzbD4ymHTuOV0SAw+u3Rr5cub8lyzcVELAuYfASgvQmimdjtg/xn4l8HUsKSj+s
         4hTw==
X-Forwarded-Encrypted: i=1; AKwUvByFWB1ja0V//ZZGV4Jsqga/QGiyB7Caod9D9/Jh6Z6+N2QEOWGKkT8Z9FK7PnFUgkbLtaJ/15/ud9H2@vger.kernel.org
X-Gm-Message-State: AFq9FYINvk0pKFC+6YKrOiJf6MqG7q2rAKJ9BCdae/WVMeH4m0baE+TS
	m/ATaM/4cigM8fBPtfoybQucUP4cGP/n5nA6rtD7Rwk0G8bqyV+9v0KmVrX17K7T+Jy7Cd5iodx
	txuOv+qpQPIlm1jrZhyMG552uHXpH5HX7BfQWhlNvY9rgvSN/byZiwdPrh3xvwQ5s
X-Gm-Gg: AYBFou36Tkzn8gu6rM2o2D4GRLCanKOAbFPl7thRejU395jGb7AM1uduHGdz8/rzmOt
	4QI2dGHerC+XzNYt2gI51TFBcENWPG7MxjsOBJ9h5yJVxotq7C5U0YCdfaoOOrt5chpQrQr/r2b
	V9ptxR02FqoKPRwt2fDexLmvI1LJ9g5HKij+5IrnBxjoJqyHckOfgmQSoq/YmPVS9Q/AK6+LTZs
	Tspce3mdaeKwLj6a4YtZtcudefhlhHUkrWMYsgMNdunXZ7K/RMhhpEX90LtRqeGZvI95mTfzqRc
	aZxqIpFolMzF408YwVMaVLvqkHcoVvz2bJC7Ul+wNwycvsxFC727w9D3SA1jTGKf/GhIyxxfWQ6
	o5LJei83qZ0rU8w7sMvr7aaV5tYiYAdH6+Ew=
X-Received: by 2002:a05:7022:7f10:b0:144:c128:4c4d with SMTP id a92af1059eb24-16a5e49fa41mr25619140c88.38.1792074207838;
        Thu, 15 Oct 2026 07:23:27 -0700 (PDT)
X-Received: by 2002:a05:7022:7f10:b0:144:c128:4c4d with SMTP id a92af1059eb24-16a5e49fa41mr25619096c88.38.1792074206782;
        Thu, 15 Oct 2026 07:23:26 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm22921139c88.6.2026.10.15.07.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:23:26 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Allow arming the wakeup_enable bit from
 pin config
Date: Thu, 15 Oct 2026 19:52:58 +0530
Message-Id: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMLh0GoC/yWMQQrCMBAAv1L2bCAJVNSviIQ0buqqbZZsUoXSv
 xv1OAMzKwhmQoFTt0LGhYTS3MDsOgg3P4+o6NoYrLZ7o02vynOa3Ms/sLIbmZKTypxyUccQbdA
 HH3sToeWcMdL7tz7DYuDyd1KHO4byfcK2fQA5DI6bgAAAAA==
X-Change-ID: 20261015-tlmm_wakeup_gpio_support-9cf2c08af51f
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792074202; l=2452;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=7dj08UaEF+uVRHox/KqNQDFcUyy0+3y5svIojtdje3w=;
 b=caTBPoNHnRkX426+ZKQGS39H0gx/45jcC1U5FGIyY5cxFbmOzep9gYhU+c/QmuyfVKNoeRXL9
 s4kZH8OwphiCTzwjxKqXdEd5MRJ2zgOHwg8jsad8k/fc2oci0FhJ7jk
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0e1e0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6rBjBSuKeGo2F8ZnovAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX/mg6lvtTevta
 saCIo9Vpjs0UEkKzMIWCBDVDQOFl9sIkbkoZvu8KNt3vbzaNaXiSpy7N2BodqaExPiEusadT8Aw
 1q4ADfMX9zgGyL4Cxk5YdaDTx781w23NG7i5H2YAyqTDbm7ZpCNMH7TPR8FSZeYjU/Tfr+2SvQb
 AfYsARBfgWbsIv+s89foTc83LzYhscOIso58UhlXm7OAacRj3IUdd0XTKR2bZudiCGwxt6l+dkg
 PuaHhiKchQfk/wEmyInSHCVbH0nQAbVzsBq46RZp6Og04W3PfJIV3RmllCpwmrvUYRk02nS7xHI
 C1s85MpDqdmmEVSLQvRV+n1JGri6EWsgNtNtDBql01n2guycatzKjMeR8h11WdKPoLSD/rhWaN5
 2/VIIVraBzaPQTztXHWdY4jOtfoDHoyomwbOvCNotp3QOcJIOSrzz1PghxIoiR6GwbogzDelg/z
 O5gDPGUC7f4L9d5gcIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX4K2AtA4wmGRj
 Ax/U4RNHh3pBIA4A/hjliuP0umRtl0ugX7mcXKGGXr8/l5klHXD4WzL4qeaCDRh6A6JfgKK+9k8
 yfAh0J0Lhlzl+ZKDIINQSS1EEZay6mo=
X-Proofpoint-GUID: 8lzKAwq2VqOT-Q05F9raMyYpwmZt573P
X-Proofpoint-ORIG-GUID: 8lzKAwq2VqOT-Q05F9raMyYpwmZt573P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

The TLMM keeps a per-pin wakeup_enable bit that gates whether a toggle of
the pad is transferred to the wake up controller (PDC/MPM). Despite the
name, that transfer is what delivers the interrupt event as well as what
wakes the system from a low power mode, as the comment in
msm_gpio_irq_reqres() already notes.

Today the bit can only be armed by requesting the pin as a GPIO interrupt:
msm_gpio_irq_reqres() sets it and msm_gpio_irq_relres() clears it. That
path calls msm_pinmux_request_gpio() and so takes over the pin mux, which
makes it unusable for a pin that has to keep a peripheral function and is
still toggled by an external device to request a wake up.

Such a pin exists on boards with a SoundWire codec. While the bus is clock
stopped, the codec asks to be read out by toggling the SoundWire data line,
which stays muxed to the SoundWire function and is never requested as a
GPIO. With the pad not armed the toggle is dropped, the controller is not
resumed, and the codec's interrupt - a headset insertion, for example - is
only seen if something else happens to wake the bus first.

This series adds a "wakeup-enable" pin configuration parameter so the bit
can be armed from the pin's own configuration, without turning the pin into
a GPIO.

A pin the SoC data does not describe as wakeup capable - no
intr_wakeup_present_bit, or the present bit not set in the live register -
is rejected with -EOPNOTSUPP and an error message, rather than silently
accepting a configuration that cannot take effect. The GPIO interrupt path
keeps its existing best effort behaviour and ignores that return value, so
its behaviour is unchanged.

There is no functional change for any existing device tree: the new
parameter only does something where a board asks for it.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

---
Mohammad Rafi Shaik (2):
      dt-bindings: pinctrl: qcom,tlmm-common: Add wakeup-enable
      pinctrl: qcom: Allow arming the wakeup_enable bit from pin config

 .../bindings/pinctrl/qcom,tlmm-common.yaml         |  12 +++
 drivers/pinctrl/qcom/pinctrl-msm.c                 | 101 +++++++++++++++------
 2 files changed, 85 insertions(+), 28 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261015-tlmm_wakeup_gpio_support-9cf2c08af51f

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

