Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915B529BD9A
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 04:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064197; cv=none; b=NFHFWkiVeF05WvDh4Xf8Pu3gHRBxdsRtn6Kzk85lrKta3bEXiABuRsZ6yHfkjA0/tSLPPOXTXUFiT4lqTzupwJGgr4arsrY5PED+UntXnRqFp5EXCQeCy3vErURw7MSuuEEojbYuty6Rw8E7m/5WXurzE2GZubPuTdD7hAWy5Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064197; c=relaxed/simple;
	bh=EAI3JOs+JCMxPPkSxM1RxVGsJmOpMhPiMMPtmQnRl1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=htZxJQX5Rt+Ka0kMDG47AzwElO1jLsBoSPCuKa38Gu+PWe44zMn6VD5hk8guDODYKc5kNj/f8+VkwwG2WkNyHInxYpEpxkNEZ1weEW3OshdXs7wHXPrEutwZOW8Q4Tz9bHfGbyxiIxKf15EgbZxhX3kF5GiHWy6VoG25goWytW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJbztE79; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAwWbqpB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJbztE79";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAwWbqpB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2QqE12883285
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 04:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2Ypq+zHzRG9sSeo6mIzzYr87CJ8FSfu9/XY
	H3Uc4xMQ=; b=pJbztE79UsxfwTIV12RgLeCYCBP1KQrT+nKJqhwJHAhBj5ANgy0
	5o1T6O7hJ06QwHTKndOjg/1m2F+rr+qab/DsZP/z4iddQTq9llz/l6uyD6kXPa+y
	48lLLn2Z0+5b/QT3MkrFhKr96n3Tl3UQc6xIKmknQogukXNP++hESB8J4pUJhwgB
	IvZ/NBfcoJsqBOVFK2K5OvC04Op9T344V6EpVKQZ2Z5/8VtCgscM37PKf9r6dRBS
	AeEa+7/Cp5IWGwWulDS1W3sDsp9hBdmi8RL2hQWltOjy6EKjRBrShonNsNGnfzLu
	JUEEqQLjY3ZqOBGit5RCafh+yIva1KjctYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq825qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 04:29:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso57171595ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 29 Aug 2026 21:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788064194; x=1788668994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ypq+zHzRG9sSeo6mIzzYr87CJ8FSfu9/XYH3Uc4xMQ=;
        b=gAwWbqpBD5PHo8u6O90pqk76Hg8b81WK3iGGgORXOIt3399V59s65u7rpMn0sk+D3t
         nq3TeXkVB5vn9UYeea7JAQlbNhjjqqB//kjokEaUAl2MqH1q3PY52q0CubHiErwA/fG6
         opjBZAE4hHhGCEh5j9agNv3pwX9gWyOr9qrFSeQUgK2jxzcFi6q0dGcDcaP+BFGA9+VO
         JUa55/830J2Omjoefsffrg9n63323PcfYO7gb6bZZrr1Pi5KS9jKYV6swZ74PP4m3mb6
         SOlb6o5tiBHjhufxF582OCUi11mjjrbVbAH0Dnfht89GPhEvptda3onccJ41eNo6gkQS
         I3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788064194; x=1788668994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ypq+zHzRG9sSeo6mIzzYr87CJ8FSfu9/XYH3Uc4xMQ=;
        b=YAiDOjEm1p0H4ozmOeC5C18U1a+jbTH+DSEZdEHbz+BDBzvK0mnhJDWNVtZa6PPubm
         oYzf2Bfk4KSwOzPUK5bwspybRi2nGxVoAi/pL7B12muXGJrlZOHLm70PejFLZQIQOKiW
         mfcGifzS3qwnMpt/43/9AsNkaJW/Zq+1DCLbOQSUaz4TaLinndcxgOYe4NrADAN0eugw
         1wcgmEDoAqKP/TKwx2ZfFxhsrlyim5QCE7ZGf9XJcyIKZjqP1AqPBBRpXhabJLNbSEMl
         u5Nii48a6bYKwHp8d7RSdNfn7SnaPjBtDI/rxA11UqVqOWq3HrwYAwy0jGaS1OeIkQdx
         4C/A==
X-Forwarded-Encrypted: i=1; AKwUvBx6RKtUhSVbLqEwVYqX17JcCBbtpLqM0I8D2gCK7O04eZHuYYYYUzAeIUKgIFcS4SvV4yWJMRx5tdVq@vger.kernel.org
X-Gm-Message-State: AFuF++mNwOPUT/rnc6TzuN7GDlxtOscRlGMqkWW+NZXl6lAljhyFNYC/
	+v2bnYW3epfFBDiU5q4WqXjIr5Re+NWE8PmiPMZjswMVaIto1GK+UFUoSLKJpsatmYYIsymE7sG
	kCBqe9aPJXjS/M4i9EyfCmnNTp1l8Gi94WbgMmg20WnDANSPEedkOI6vmNh3KMdsn
X-Gm-Gg: AYBFou3EDWCHDHIWaczAuHfQUD8E0zdW2cGE86jo0vy9879gRwlClBtUDuvVRZbRjwM
	rj7xLFuwwS2ORwbk0RSag+611fBQjqQNHoSiuWkPJDO611xyb5eyhyAMdIDs9aID//ExcjfimIN
	wpudt7qVhaVOtiqkrq+1JWKKCJ7BIRoD/mxlgB06KuCkFEbroT7XsnhPJW7uVcIfyUux5qZEj74
	18vITDVniOdAHPB6NMxKG3lZGbDDXAR3D8rBa8kpHF+sxPrMKwWt3yZ2kC6g/JdpQL+4vDF+9ZY
	on79EzHk5zrHM5uOY8VJn3OexLR5mJs8AQho0zszbsY290En1oqp+nDT+WwJQ/FZpKkmvVktQyc
	UJjYmtMRj2ySMaDPi+8AtOyTjlTM9ZTKYq4IsBvZ087TuK1Eb2WrM/BP9bkn8
X-Received: by 2002:a17:902:cccf:b0:2d8:d4cc:5bb5 with SMTP id d9443c01a7336-2d8d4cc5dc3mr173428115ad.21.1788064194091;
        Sat, 29 Aug 2026 21:29:54 -0700 (PDT)
X-Received: by 2002:a17:902:cccf:b0:2d8:d4cc:5bb5 with SMTP id d9443c01a7336-2d8d4cc5dc3mr173427795ad.21.1788064193688;
        Sat, 29 Aug 2026 21:29:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b4bc05416sm6078941eec.6.2026.08.29.21.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 21:29:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Add PMAU0102 GPIO support
Date: Sun, 30 Aug 2026 12:29:37 +0800
Message-ID: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _H6t0q7lmqnd2uT7s04RakkaccsEWZ0f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX6jsgxCwpsrio
 zc6/tgt27hzD5BSLVgX8McswNr6IJOYpzvRgTVkLBYcyShKgoNULX4Lt7XfN2LgKbioHSQ5LH5V
 bXcQ5FGRi99UuAsW2CqyknMOmhrpNVQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX6JAsCpRTFX00
 HrwTcDvY27ICZjYn2l8/4Qy2liceQu3f7N4+1MGrm1kvfwp/A2HM3aL+yzw73A/2yuZ1jwyLhxW
 rq+3iSMXYVuuucftaQKyv+3Rg04lfqXKF2Z/UAIFTeGoMKKFhMspEH7hW2I3RglJUHZlvS/Ptj3
 4ZcpUb7DMEMSAu6XztKXYjjqeeddRvPOf7hx2D9s9WJzZZoxbhuaHlhadfD7c1GR7reR5Dxmp9q
 szEKnO8T92Pxcb83cRFtZRODX+kke9+bsNbBZsPmUNhbT5GQyldMSjvNKe74r8TeG3MUFPMsqUp
 ZR9gpOVipFSWNfKqjfapI+ctXlJVRN2Xkf3Ucadtm0+qmKtJE0Wdhd4FjLg4YZtyuFfe4rwiYVV
 eo528If3Kyo6Pb3PD9GinA/9JPbwc9v4YqsW7j3AXvaBl37RLvj1OvpC+VCGCG2K5u3BF6qfgG0
 /67ocbd7WeRh+47saOw==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a93b1c2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=hlDLkc408_bz_Y6qeTcA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: _H6t0q7lmqnd2uT7s04RakkaccsEWZ0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300035

PMAU0102 is a new PMIC used on the Qualcomm Nord platform. It exposes
a 12-GPIO block that is compatible with the existing SPMI PMIC GPIO
programming model, so support amounts to documenting and registering
a new compatible string.

Dhruvin Rajpura (2):
  dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
  pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                      | 1 +
 2 files changed, 4 insertions(+)

-- 
2.43.0

