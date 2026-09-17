Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52BC4ABBD2
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685794; cv=none; b=XQKZBwhUfzgf826JFEgsO1qmC9tf0rNKqa/balO7qO+wALy9dGOFYwVy+UP580FVh8hMlRS3fccZOXkmAO3LAtdVy58Q0VGrC7hTGtrwh70tmFUDUq60sjk6YmlCK4vhufNGC7aIcKmDB8UpkDzdtYrYVnQvl1uLfLtOhlVLEb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685794; c=relaxed/simple;
	bh=F7WocV7DuaKABLMSLxd+y8B1sodZx6pHNsQFtV+4VuA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q8ppC4Usg05lElQnVaCR8M1qy1jzfd+W1rfBpTdu1ThKAM0QVo4FyNwMHLf+NaCyQ/4TdRMLGE2HUVXOvIFMmcI2DJERq8aZ5SDwAqb7i0x/f0uFfHtkCKU3raMzogXJPI/3rJ3JBVXRoS9KN6ytFOFF4LRHcDf5zWHM4EGddTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOOTaZ2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKmByR4t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOOTaZ2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKmByR4t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLG9k33271979
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VbNdLbD7tr+jmxCOhngfhF
	KBi7RxEhhS1Y6zQpNFs1A=; b=mOOTaZ2GOTTDXcrsYMzwb3gQfC2HTNT1Pf5pc7
	0PnhDh0MZKFuvz8gvvlNahMnqW8hy0CMQd259Ja1SxlwOE5jhDTibFtAneSq5IJe
	wSxoeNdDmvgxETOxKMUkDOU8cl7jGU3GS9uGrp68bkmQWZQbLBZwvZYFVTU+gYFs
	45gmoUmVttqd4hfSBUZxZoIH9rm3bHlr9OcuOZjpHx8GZmlNqDZWjlwXeWIq718p
	d4MPvFcCav+rHW2GynxbouVqkdODNiHEE/sDbo4i0hCGSLM/0le0lAsXsNqUcjI2
	bEsLdlPCuwgtnPro/rSV5C2Ds4fcPJEKTu8BJt3y9eIPgzNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppjx9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3b126c9fso2045905ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789685790; x=1790290590; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VbNdLbD7tr+jmxCOhngfhFKBi7RxEhhS1Y6zQpNFs1A=;
        b=aKmByR4tV5FaWOxNFfGSMTq04mqGjtanbqIFAvnpr0/e8Jtwc7JNXtni2V/OM7LMPI
         nfaF9E8Ozv3fG0oNVT5VWZT9KMhI2hqJWbQTsl4HGwUyfZmhwhfIg9wyw+GaVO39XWHi
         WvDGQp6zVvAV6O11RGnFbIaR8yqhoyKR/Aelu+8x/5q9/87oL5Rcv6UKzwjLjgM6UFj0
         jxPDx14OMLQ53tP2jmfMUqQ5GuQ5FeJUrF6zCZlt1kA9tkYg2glFYofbpzfgWF7Y0R+2
         576FVdF+hwiXH+pjx8kFRoC3+A/R/UfNrVGqo2lGK8L7MEvtQSvCOuLESChqxUSyFOwl
         qkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685790; x=1790290590;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VbNdLbD7tr+jmxCOhngfhFKBi7RxEhhS1Y6zQpNFs1A=;
        b=Lebg86OryqI43hf4f9yjnfEM95PvZQEkH0rKRdZ6QENhY3VXiqHIVtDCUvyLJpcpo3
         5pepeT4KAK6epRt9hCo8FAMOcJEZnJ/86cZ6blrzjXu9QLBmQ1Ub1HKumknOzGFpoc9r
         kaKc8M4VvpezcfLKfKMkdOstTBMDroXrFpWTG3l9H0ZhbOoZiaoj+Weih4qi+8BzCg1x
         eM+yMzGmKCUaUjN4QDuLW9bMQAjf6L2mnMd+SkWf8SONG4pvd1x2UIC1QOyAC4oQ6/US
         0ISfiU6tcb10w2MH3Aq3KGo5/3m1MwzAe8fj/RLnfv5xirU2kNNPArCKlA/VS7mEKZ73
         IcjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ3BGimNkZjhDxD+LJ3rxDfyzP5Fe8nHordSW6g4OVPFcSxQd9c6QHHIAla5z8Y/WooKwe1DkJ0w3Y@vger.kernel.org
X-Gm-Message-State: AFuF++mt4y51hNXs6CcKHCKNNDrP1OBLp29cqjSU7kylXdE2959096nF
	bUP/E0nRW6p/7l3U3H3JII1j+LWNXjVXawToAQT+Zxsl3Vk71w6ALBD9EJRlZQIya23mt9pGkLr
	sRCOQffCbwd3j/V2tc4d+uf0jP2DYU0PP/KwW+zEUjNr1gUALm6V4OZQrvyOSkcIC
X-Gm-Gg: AYBFou0Bh+t5Mk69tc2rZSaThc65VcgAbJq8Rkic413YEOXZ3NUl48JM28MSdO55fJY
	BWa3NzDclD78wxIwsUBDaijub123SDFiSI1sdvxF3Ag0EfrXwjmF+GXo/X9wc8gbztDxFe0RasP
	Hg8THdir9s5qlf8Zs6kwRD1VPhR4EruNxED28lp2rgvmjnlml4/vowfUJKUIrcJA+D885JVv5WQ
	DZGMxV0EDqXFZpHjRjk4ZuYsdwQ9OPvzU+GUIn69ESPqU0PK+GqXlrIv3voUoJSeYmPkBhazC03
	FfRkMLo99tt3kUzY86tGMW3JV9HubMUp8KZxvhUlVCYlQpMcrD4PTykmdG8OCADW5KJfv9AyR4c
	qr4uy70CQ1u/gsA2Xf2XGs3SwXm/eNp5w/1Kg8QEBpM1ehYrgdg==
X-Received: by 2002:a17:903:2f8f:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2ddb1baf0a0mr12615745ad.27.1789685789755;
        Thu, 17 Sep 2026 15:56:29 -0700 (PDT)
X-Received: by 2002:a17:903:2f8f:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2ddb1baf0a0mr12615435ad.27.1789685789359;
        Thu, 17 Sep 2026 15:56:29 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm15812508eec.19.2026.09.17.15.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:28 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH v2 0/3] pinctrl: scmi: Replace get function and group info
 with generic callbacks
Date: Thu, 17 Sep 2026 15:55:54 -0700
Message-Id: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPpvrGoC/3WNQQ6CMBREr2K6tgRqU8CV9zAs2vKBb6DFfiAaw
 t0t6NbNJC+ZmbcygoBA7HpaWYAFCb2LIM4nZjvtWuBYR2YiFSrNheRkB+QjOjuFnrfg4twSz6W
 ShbRlYZRicTsGaPB1/N6rL9NsHmCn/WxvdEiTD+9DvGR77+e4ZH8cS8ZTXuimqYXJS63MzRMlz
 1n31g9DEoNV27Z9AIsJdn3TAAAA
X-Change-ID: 20260724-scmi-pinctrl-generics-746484c98b66
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789685788; l=2134;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=F7WocV7DuaKABLMSLxd+y8B1sodZx6pHNsQFtV+4VuA=;
 b=BgJpLj7z1mrSx41erlyl/MtJ2q23h5Q53fBYqxP3n3Mp/Q6rRUJLb9agea2fyzGx2AEsQa/qL
 106cr8fmljmC+a1kzw0e1rI5/ta9ji/QSlD7Bk4c8WtS4MmROV66YqU
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: ODZ5Vwbna634W0oT2UavLSlwUQbrC7Ue
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac701f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=JfrnYn6hAAAA:8 a=BgRH2eVm0xmwmakAeEgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: ODZ5Vwbna634W0oT2UavLSlwUQbrC7Ue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX5G9XlIUiOVX7
 KcbUPDKA1dYBXbH9fZ129KHFURMO2Yjcmz5UDyfi6W1CmsOhgCQgdvpT3WeoTkfxo56R0hGrHCl
 zN7ZfExZdr4FwuXNEXr4J+FFIODM7JAfNdq0SpNPTh76gMAu/+lm5OdeBTwfB6hvOIRZDfrtKA1
 Tio1PtRN5RGk+3Gqn+nql9TT4p8GB8SrxbYp3MXKWxdPizJo8DeInz9F6VvwpQfmXEKRZHmkXK8
 L0wr0EY2xiqWsV4bTm1lMFEr7ixAoOQxcSNu3KlXMdTnnblR+Bu7/uZYulaeoI4uax6L3UnvxWb
 yrhul0YhbCdBksUV7FCjHc/qdrpGOTc3qfBGrLZRVM/pS1bpQ+DyIRep4/s5/67T8nqN/RqAWc3
 30PwP2sfRNAlAsfBKGAVIJIBpO4OpfdTiffDkMDddea7eWkvHY1+2PwkxbsNRx3yUILEcwDFuuY
 hMkU/nCBVjUjegh2ibw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX5VEhTRhbakrU
 SiBv6lptJAqPaMu/8wJq8MnDCas7uXMvBJ3wV0/EkRtT7dYm6cAsyv90Y0gjUmV/uEoeE5cel+i
 wxvgBAsl/2oKJIqnWXKkXn1NEAYuXtQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170330

This series refactors the SCMI pinctrl driver to eliminate metadata
getter callbacks to be replaced with pinctrl and pinmux generics
provided by the pinctrl core.

Previously, the driver implemented its own get_functions_count,
get_function_name, get_function_groups, get_groups_count,
get_group_name, and get_group_pins callbacks, which required
maintaining driver metadata like the functions and count.

The pinctrl core already has support to store and manage this
topology in the pinctrl_dev via its own internal radix trees.
By registering functions and groups at probe time using
pinmux_generic_add_function and pinctrl_generic_add_group, the
driver can delegate group and function metadata management to
the core.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
Changes in v2:
- Add patch to select generic pinmux and pinctrl Kconfig symbols when PINCTRL_SCMI is selected
- Remove duplication of pins array while registering generic groups
- Check for duplicate function and group name during generic registration
- Allow functions with 0 groups and groups with 0 pins to be registered during probe but issue warning
- Link to v1: https://patch.msgid.link/20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com

To: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Alex Tran (3):
      pinctrl: scmi: Replace pinmux ops get function info with generics
      pinctrl: scmi: Replace pinctrl ops get group info with generics
      pinctrl: kconfig: Select generic pinctrl helpers for scmi pinctrl

 drivers/pinctrl/Kconfig        |   2 +
 drivers/pinctrl/pinctrl-scmi.c | 232 +++++++++++++++++++----------------------
 2 files changed, 108 insertions(+), 126 deletions(-)
---
base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
change-id: 20260724-scmi-pinctrl-generics-746484c98b66

Best regards,
--  
Alex Tran <alex.tran@oss.qualcomm.com>

