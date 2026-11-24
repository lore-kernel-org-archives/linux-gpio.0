Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530568;
	b=P1OgRBQKRAsQUxoHhR9B+zwWeUJ4SQeuG2LAj/lautPfJ7Lf1GAZDvbnK3yPmRLEh2PZ
	 LXyV/n2w/Hh2wvQaiJfQU1OvZE8kRD7VklT6BfdAZfr4YXB33151An8LsFpFTlAX6Cb2R
	 EmEDkXB/nKUOAMt6ag21VHdz5iOMOehzWQOTjpwlzPIUZDPyjq1OGIG+P2xojvkLJHbBd
	 go12qBlN5uOuTKtI+NZV4L90brWBQH5BcXgdSrO3v/2LFHWneiyefRTvlPgwNlZrAbv9A
	 mPwd4vbw2ebL0hhVoE+V75BZWRrVs5JYgVDJErBmbLcrPNjYS8UBr3WAUgog4FZNSzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yiy/WaDs3gz6eQtQh9hA4jXuq8WgE5G3P8UWvfIjP6k=;
	b=Rij19IDpX6aCkQz0vuYz3xK+e2TSeYTTTF72vhrR8ka+g2iyRbQe+usgVDIQkTKtnscn
	 1EPRwgIUEkn142oypDXI6zSHCZn59bayKjbgWbql58r3cXTfvj6SIOWaAbL5wCpZ9MfTx
	 /YS7ttCTHdXiTXwAF3ehxDBeX+kXDYemk4VyQ+g31fIvbZ7rsIgSWlSoBfX6i5fp8SnE/
	 2wSVnXMvxb++jRIMEUJQU1E3VA5PFetfyfnR9hA3fs81xyI9aX4KzVYmg0xBUwabvPzu6
	 fCW3LvmXI1AaXsz8a9MReAgnMheCjJutgAyU9wV0DF9Bz6eBhS+xJ4JaF9+c6vl21aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxerPgiU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K+O/7zrj";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE2606A326
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5EE2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxerPgiU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K+O/7zrj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOCDVqS2849096
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yiy/WaDs3gz6eQtQh9hA4j
	Xuq8WgE5G3P8UWvfIjP6k=; b=MxerPgiUv2vJcfnPV6RpzERzpVAFOeKcBg4+vH
	zy+BLJK3RgFGfo0DetwTd1/37cBIcvaE7JzLwNpJvg39aMs5MFZI/Jj5BwKcD2+/
	16D2n9cR4d4NhldUtV/5p1xSwJqjbOscS6uAiEx/Ceutqwo9qni38E0tuwsr57YR
	Ogg7fIKLefjqc3pyeU0WpYlHzDuU/uJzcKZUMeAzvJrwovcHp+IPItWGWfDGYUbb
	jLNBpSMpGjC2dliirz4POOG4PaxZBb5YQbqM5Kf9XNbaxNFM+uaNMLkQ+xoaPhIp
	MV5RULv3SO4jAMuXRiTnvDpSgPacML5GsmzG0DQY8kzuM7hA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7rmkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:26 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67dc4e966b5so4497274d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530566; x=1796135366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yiy/WaDs3gz6eQtQh9hA4jXuq8WgE5G3P8UWvfIjP6k=;
        b=K+O/7zrj+Z6Av4/outce0xba5nFbpTqVBzckCkV8zjuouM+oCJaFUHvE6WQqt4D+Lv
         t+Ep2tBGxQ7PJww87F/LBbNvyDYuOXpvWGky+EwruHMLIt2QigitdXoTMVFTOlnxUvK1
         3WvSHDtrvmvrVrf/fz1Oj4tRp+a2RpTB6aUDWNLFbmG2KjMhtUM8DRyxlFAwMm1WD2K+
         s9L7H9VRCZMInhKNyx6+ym792Fpj/aKDhWOeD1WW/GWtolhncdbzW4F+9obj7S3jX+BO
         NiJwsUByC67zV+f52SHiRFzXecmVz7j/r9LvEJn6Iy7V7S7P6tA75JlJXn7rwVb4WH1m
         WeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530566; x=1796135366;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yiy/WaDs3gz6eQtQh9hA4jXuq8WgE5G3P8UWvfIjP6k=;
        b=BdkMkkDZFFIZP9kiBZDMa0cZAOesuZXG9lP/A+LQt/OpmPEdMh9YhQk8mV5xoLd2ZI
         WYYpZ7mOCAVkWu9mop/MGCQWqNwugn+CCTw7LJA3XYUiXp6+wZdvIbb+ItrD70+4lygX
         I1nkiipFptSbsFsdbp91hEFN6axvU/TSAgzrrQW1szbiSJCPDbUF6uWQ14I3nHmapZcl
         WZOV3///a9/zBqAL22VDY94k423jefkS1oAFMhkTV5HXTW+iwaE6Z+D1dU1x17WY5n0C
         RrSNnrStE/Y+Yv0ASog3UAddUi7ZmkAoCc2oAvk1qkXCEWmJdwKS/fS6KejTl191lnnS
         VzrQ==
X-Forwarded-Encrypted: i=1; AL+hErHjmbv60Y2MyptzRS+xJ3ELgZMQEDv9zjTosKHLowAJg0o0ts49/AjwhO9ujtF4ekM9b80uLiBDA/M9@vger.kernel.org
X-Gm-Message-State: APuU4Z8hD8fAcBgyGYg0bFKsY0LTo7d0ACftYVj3wQNjJBlgAQ7zI3t7
	/NzILVBfYwCo05OllgwSbvoO4H3PYycQD6spjtFp7jhSkzKZg9HqW73hhbyHyThF2uK2bqeqNEl
	MNn9beIgK0aE+MeISpdUWiVyqk10HhedugsxhaFA+67r0IQWCBkpaP5/VDXZmVKgU
X-Gm-Gg: AZFdTZfJvbz0dPWTextq6T45DEhNJLEY9+Fts0W+AP2CPi10jSWgzIMSB/mFAFtdxev
	VxKklo/2CYuz7XzVF5Jl7YSu0jT5Z0eCMpByOQUKZihsB0Eb5k1BMFcyKEMI7zT37dcMGrFdaur
	KOlLsetMuZgwZbLiVd26Q9FrS61gJxiaPw2JsDxQjfIONtNABTnMYhvdDFVZ5volcqvC/J5sJIx
	w1utXnE95ylLjNKU/rPwqi6RP48HbjX/0FaLTnLNdc3svIPiMumEJhKg0l8taSgqo7c7zqTuPo3
	adGc8PdJoB/Gaxn2pDqK4wSI/74sIOjvqSINdcmcn9Ye8xVYEXK9mFvxNoOxkIioeK/2QIvS46D
	8Gss8c2nNv7deCbC9GmXwUI2kvUO7RKfUIUkyJX4ezHKhvMO5ijlwtD8KjYcHHyIQgCVMrGnhRS
	UPZn2hF3VncLal/K7BXQN5PbnPKNZofRKbx6pVz6H6505vc6yimH9e6OJydUiiML8=
X-Received: by 2002:a05:690e:1247:b0:67d:ebad:8ca2 with SMTP id 956f58d0204a3-67df4410cabmr5624861d50.53.1795530566252;
        Tue, 24 Nov 2026 06:29:26 -0800 (PST)
X-Received: by 2002:a05:690e:1247:b0:67d:ebad:8ca2 with SMTP id 956f58d0204a3-67df4410cabmr5624839d50.53.1795530565786;
        Tue, 24 Nov 2026 06:29:25 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/11] pinctrl: qcom: fix and extend egpio support
Date: Tue, 24 Nov 2026 15:29:17 +0100
Message-Id: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD2fBWsC/x3MTQ5AMBBA4avIrE2i4zeuIhbUYBLaakUk4u4ay
 2/x3gOBvXCANnnA8yVBrIlQaQJ6HczCKFM0UEaVUlTgoe2OTow+/Ya8OLFI+UT10Iz5WDLE0Hm
 e5f6nXf++HxZvebhkAAAA
X-Change-ID: 20261124-qcom-pinctrl-egpio-23d27a8b3b5e
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2186;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sc8AxEUwP42CPiyObhCzg/LCQo6jQ+Cd9/fbROhui8Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9B83O7N0tAOu9ZkxXiA3qKPtDSnB4efI6Wy
 o5/gBxXCAqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQQAKCRAFnS7L/zaE
 wxQmD/4sYcb01RGN1WZDk5r2BTjUnKMseHbpMtERyEbeb3Icx5ZvS9B4J1QHqkQO75GmKf5e5pU
 XSf5ZVrqoYpn/752kQUM5IsbWN7VWVODc0WqroMc2wG6OTeWDKN6SMa0OingMgZBKHQa91BecHF
 dyPWHYoOQ35SGDxwYD8pq/LmY+EGzE8aOmjXgXE+eq1l8VteCE4a+M5A/Zmgq/nkZRx/vGELEwj
 bJpY4kvs716q/riCS2X+8Ndd6S1TFouQyvGNjZtlXnfa5Kgtd/RGru86GrtBREr2f//f6AKXbgS
 gc2q9utuQtnqJqUnwUibMj1QBdLfEd1l+W+FxjFZ52HlZmKwBc1BSNXSirnxOGzN7tgsNGDrWTR
 yiLIYRSLal0W1JyjDQ5BR5oYU1n/2tUsfg9jc/3cvb7YRJ5LZf2mPiuSCjXoKe0g6qa/HOB1E4X
 l3HOsGqJNNSSyvKEe0tM+bZC6hUhoomBf8rDJCFXwHt6W9TxfWgSwngZgDcA/HXiiBPr71f0M4S
 O9sV8O8YqOu5X1Cuz6a0lSNJSI3DnSPhy4eFj5FCLhwUZ9uIYrMc87QfLu7FlS4ut+H0WIc2ZkI
 WnlNWuEp37Y3F7tqX7CqQ4MWSbFvXZtjDRg8/fmPJt+dd4oXUtsIeX74lEKLsytzNktQmVRmQBA
 bfaC/4CB/jMfkyA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX3xEYKvuNxxaK
 OZBaaPLLF9zrWgp1pOru6OpG+20Rlj8BiF+Yno9fqg11DUADNkRirPut/UMqloq/vHosiTg0Ylt
 L/xBMk7V0IwfTgwxaBr3CWwVg4rcC7E=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b059f46 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Q4R59cM0UI1Gu6HzFF0A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX0NINRxjzPFk7
 ScjbyYog4wNKyn0zJaM4QnP2laM1Nv5xXcipwxPS7q0ql6iTAF5mdI+9uqn8LQeNW0Stc11YRd3
 o+rYFWrXF0YWVh89x7zn+TSM75cR+H2Ucq7L5mzD5Pkwnj4DuBIvmvLp1tl6XBuJxFv7pd+EBjn
 ButUDB5i5zja2ZCcEUCZMBHw2D2Rq9RUrvPIR3WzrtaFBh2CajKz6gCYha23txIb743tBn4q9Gg
 UDgITkvzESB/GEbym1qdM0KuQUAB7Xyk8ZN6FCs5Qex8DvBMLM9d7cgM/4GLl/Wzh60Nt3DTuUc
 eSvGQ67/+6LlnZtmg3C8mTsKchwGlzmtKJ311s/adBNoGzaWOV8D4ntTE/IkaOTLExGVvmYpvi7
 Q5VbREnmc9fnrg9CZqrcpWand9L4SLYDk9CajQS7TbDYHUZU20XYuSnvBabASTge1i36utD6dtW
 lrt3R66m7cqPuPs8EhQ==
X-Proofpoint-ORIG-GUID: kJn98aV6adsTaQPmO-adWoRIQU4bDZWo
X-Proofpoint-GUID: kJn98aV6adsTaQPmO-adWoRIQU4bDZWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240056

Several Qualcomm TLMM drivers still register egpio as a strict function.
On those SoCs, a pin muxed to egpio can't be requested as a GPIO. This
series converts them to using MSM_GPIO_PIN_FUNCTION().

While at it: document egpio in the sm8250 and sm6115 bindings, and add
the missing egpio function to sm8550 together with its binding.

Patches 1-7 are fixes and should be backported. The rest is targeting
v7.5.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (11):
      pinctrl: qcom: sm8250: mark egpio as a GPIO pin function
      pinctrl: qcom: sm6115: mark egpio as a GPIO pin function
      pinctrl: qcom: milos: mark egpio as a GPIO pin function
      pinctrl: qcom: eliza: mark egpio as a GPIO pin function
      pinctrl: qcom: hawi: mark egpio as a GPIO pin function
      pinctrl: qcom: kaanapali: mark egpio as a GPIO pin function
      pinctrl: qcom: maili: mark egpio as a GPIO pin function
      dt-bindings: pinctrl: qcom,sm8250: add the egpio function
      dt-bindings: pinctrl: qcom,sm6115-tlmm: add the egpio function
      dt-bindings: pinctrl: qcom,sm8550-tlmm: add the egpio function
      pinctrl: qcom: sm8550: add the egpio function

 .../bindings/pinctrl/qcom,sm6115-tlmm.yaml         |   4 +-
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml      |   4 +-
 .../bindings/pinctrl/qcom,sm8550-tlmm.yaml         |   2 +-
 drivers/pinctrl/qcom/pinctrl-eliza.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-hawi.c                |   2 +-
 drivers/pinctrl/qcom/pinctrl-kaanapali.c           |   2 +-
 drivers/pinctrl/qcom/pinctrl-maili.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-milos.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c              |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c              |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c              | 105 ++++++++++++---------
 11 files changed, 71 insertions(+), 58 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261124-qcom-pinctrl-egpio-23d27a8b3b5e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

