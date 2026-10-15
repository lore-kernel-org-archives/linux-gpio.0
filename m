Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DAC41442F
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074231; cv=none; b=EFvlQCg9NHAtXa6/40Rq1ecoWOlvOHBNMmKPvjLzD8DpFMHvD6Fp8X0/qdDmE0rcuPuXcWs8Vn/GEjYdFO56lTExcLcdSvCfNwKr2w1gvUPAGQGFlhsig1GmYcPJkwsVLfKRGpr+LKou2KR3cc6jCcWw2J4ofhnQRQyraPXqpX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074231; c=relaxed/simple;
	bh=mq9rEF7t+ayaQwPKjrARpnKTkdqnGpDbd/zX7wA7cRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KhDM+WjBkHk+vI/znLFuk7GJYTOxCSM0JRBNZsqQPPDD08b0YMfGFXPaDdd0BeQlpBbzMaZuuEtRkCUMPA1Vdz0mj2s1bpqErzgtWbDwWtwtSbm7SUbCXURHcKtPQpGUEeu3iplf3JMkxMbGbqJx3/wPdtDU8aed33WnXq1PK6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nndw5mpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6THkbIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nndw5mpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6THkbIl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jILF4077483
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 14:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrZXCD3PHsI+MdTKLYNfSCMuzb2ii/BEmeVwGG5BOEg=; b=Nndw5mpDjPBn483Z
	v3nFokO/xnRH01UKlRSK/rM4IsPJHsprulwZDnIoDUyf4pX1cftCXxuTIMs9Qx0H
	OpgUVaz6CAg0YlOgoNItzg4tBkKQVXZk5p0K2ZpvFM5YyYfWgzW3spITH8tE6yen
	wA3X+3MwTV364wduYrhIpCyyF70BAuBDC/eOuaoDpj305iMHPGsZo2j1vfvSEhWU
	0o1AHlCFxrQbR+wwSbWBSD15OVUvZT1UGsTD5J6P87YwgbWbCITmhfeZ4RB3DSLl
	jCtIlJbPAcTYVpW8nNjfhEQ1kpaxq2KQKw7dbziXFjBDN0t8axDHjDl89zNfNaQP
	TFYniQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc15nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 14:23:47 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so3842703c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074227; x=1792679027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrZXCD3PHsI+MdTKLYNfSCMuzb2ii/BEmeVwGG5BOEg=;
        b=Y6THkbIl6f1LCAn8mRNqqz/uH2wfWvGmLIr3XcxQrrJRYkbb6SOV6pGVY/cyqQcy9m
         AWZAWavTrqS0o2BQIh7GESh2k4CQQP0uKyIeFgB+CImWWer9NhcNw+WvAj9U5kZq460e
         /5JCXvhMF6uBwSS6scbze0HtFbp2QOJ32u5JlfTTstswDyb4xB9A52Ky9bj05UZDCcTM
         pXRzEd+PG0UtAgCcMzWmDKFY+yY6+zZDTLu4KO2KKRCDZ5u4Lfgi3+VzPago0+YUlNL1
         wFpvKHXLRHufPKRclSD7zvHaaAVcn032y3qtKNT0mwigkgj59AQ9FRp+griRQcdiR6NU
         qcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074227; x=1792679027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrZXCD3PHsI+MdTKLYNfSCMuzb2ii/BEmeVwGG5BOEg=;
        b=N830XpbBB/WVBCx+JOtTI+uI8bB77da/mOuc1ZLL4lZjb38WxxPOz2gpkcZvoMdRfw
         PB1RSurQBvkUKWeZNTLIGx3FwBqUEpjo/AA5CH0iW4amTRUyWH07EFTfuwVYIbwkMoGo
         f8x2cW5M+E6xZwXYa+JjclWkiZOchsjOIheBNml8LAAYon5W57tlXEptWwCbj8xNCIVI
         f5adVIhFfAcHy7quLrjT28uw0tQG91/41JlebYJoJIEfal7nZLMFU028B3v8UaSAt+01
         hwC2EwSszyzU6AcbZXJ+wgvajX420sQTmSBBW3K37FKRw+BOlhQU8zpVCouoNMNIkGGC
         M52w==
X-Forwarded-Encrypted: i=1; AKwUvBwlmTIt3KB/PxpDRFaULuwIxKW3QI33HKF0RtaIM+2aic7EUSHCNHGe41Wjmh1OBOuylS3I8nNT3pSP@vger.kernel.org
X-Gm-Message-State: AFq9FYKLqbXcCoyWyD0kgN2KXBLvrxr9a6rXdstM+9ZWUHUPH4qVSkO9
	RqRO3L3N6AHU6+4mAVPLTo7VcGz9SzPZWi393gtGvrRTErmQhifljY5HWllWF/INB2XIz01deaC
	X/5inhk+nAkIBP12jEnu8ZaY69JKn46JDWfMyym9GYnobyrt22ogSJa6x7TFf5lAa
X-Gm-Gg: AYBFou386Pl5/RXQB0GzKfppfwuIJTKCiNesUOZJE6jHybUe6nES/bvgmAsFfAiu0Vp
	GI7reXxEtmsmPRN2vgWlA77ppp+7pU5mmqLxFjctIrDMd9+qpNgsEI4lA5lkPUVFUq6iAPNJaE/
	d9Ug6yzhPHDG+5gSU2XLtCBbMjrpLPln9fQ7VLoF5SfEFZXkCu0Bfq8TwAdu42m+9yFNZVR9grS
	qTK1kEdCBVu2osxKpMlNOe0bEQxLmT4PNTm8dGISJJd3bb9zlrAKvFzDVGyv5dfFMLSNX5pOvBV
	Qyj22Rkr46205iXYfkxfZ+fNS9JEMayD2N9i5TeJd3jg0cbKsD+mFf4Yd32FZf79FOn7oDYgQRB
	8BJ8AByokcwuuE63wTIw+N5+H5pVRtvvoUck=
X-Received: by 2002:a05:701b:4211:10b0:14a:a6dc:9cd7 with SMTP id a92af1059eb24-16a57a16ef2mr25814186c88.2.1792074227104;
        Thu, 15 Oct 2026 07:23:47 -0700 (PDT)
X-Received: by 2002:a05:701b:4211:10b0:14a:a6dc:9cd7 with SMTP id a92af1059eb24-16a57a16ef2mr25813448c88.2.1792074211417;
        Thu, 15 Oct 2026 07:23:31 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm22921139c88.6.2026.10.15.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:23:30 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:52:59 +0530
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: qcom,tlmm-common: Add
 wakeup-enable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tlmm_wakeup_gpio_support-v1-1-c6d6f37a7e51@oss.qualcomm.com>
References: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
In-Reply-To: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792074202; l=2259;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=mq9rEF7t+ayaQwPKjrARpnKTkdqnGpDbd/zX7wA7cRw=;
 b=FOBgz70IKuMobP9CO5V242l4NMyi+psI4lueJUV5e32urGCGy5yzg3Bu1le31B40XYGC9lwSI
 To8GoIm/ykBDe1LSWI259wD32z21qPLMDXAPClnL/oAcySc0eF29Xzx
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0e1f3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Q4uxw_U0XqAMYNGLDEUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXzeU7z6HKcbpN
 AL7r1JqzHY3F5d6dyGSfe+EkSvGyBJF9i5syu+g9dFHrbYb1bp52D4fg5J5Yjrylk2Gr9FQxudy
 qCb/2DsmO6PISQ5W+QbwJ0d1Hmt6N3k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX3zSizL6630Nl
 eTIMO6WMMEUJKneVZ9ataK19MI1Nqy8Ig0Nzcw7t174sFyeg+uxu3WjpEC9s3TVDRDGB/WnYNoq
 lIOQAMma0Z/OD3yUTWlkqx9lQamy6GTi9mmeYww+/1zHXX8U5MYHBhfAaVpE6ZkkYpDIN928wk9
 QxtcLmNUXfnCpI0dJPThb9QHHUYk25VvxldPzQIYAT6idg/E+17BS08mUd7/uLz0WLIUFJzFJC/
 5RABZzz9LCeDy8FyzxSkWBfsbxMcVb6jlm33xsmsUDIX8Xdhx3UqTo8wntebTto+Ihc8OWWCF8W
 /H6usnm9+pTvLjhOvmXPe+QfNLZ9zbdnWIWBpM7H+u/YvV6balnFjWHA0ixi5wrkca+QzuqJqRH
 8QnHVZnrDfyErTR2wxF+YV3dZyUHH/GMv0I8vRFiFwp25TXL41ae7vAybwLSBWiNEjedw1WQoSR
 RyS1sYohRL2azT6DwqQ==
X-Proofpoint-ORIG-GUID: y1tWZIGyKrfwomGSnrPDCBP_TVFtPGEW
X-Proofpoint-GUID: y1tWZIGyKrfwomGSnrPDCBP_TVFtPGEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057

The TLMM can gate whether a toggle of a pad is transferred to the wake up
controller (PDC/MPM) while the system is in a low power mode. The pinctrl
driver arms this for pins it requests as GPIO interrupts, but that path
takes over the pin mux, so it cannot be used for a pin that has to stay
muxed to a peripheral function.

Such a pin exists on boards with a SoundWire codec: while the bus is clock
stopped the codec requests a wake up by toggling the SoundWire data line,
which is muxed to the SoundWire function and not to GPIO. Unless the pad is
armed, the toggle never reaches the wake up controller, the controller is
never resumed and the event - a headset insertion, for instance - is lost
until something else happens to wake the bus.

Add a pin configuration property so such a pin can be armed from its own
pin configuration, without being turned into a GPIO.

Assisted-by: Claude Opus 5
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aec72e8c0..95f539611 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -87,6 +87,18 @@ $defs:
       output-high: true
       output-low: true
 
+      wakeup-enable:
+        type: boolean
+        description:
+          Allow a toggle of the specified pins to be transferred to the wake up
+          controller while the system is in a low power mode. The driver arms
+          this on its own for pins requested as GPIO interrupts, so it is only
+          needed for pins that stay muxed to a peripheral function and are
+          toggled by an external device to request a wake up, such as a
+          SoundWire data line driven by a codec while the bus is clock stopped.
+          Only supported on pins that are marked as wakeup capable by the
+          hardware.
+
     allOf:
       - $ref: pincfg-node.yaml#
       - $ref: pinmux-node.yaml#

-- 
2.34.1

