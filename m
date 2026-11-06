Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952008;
	b=o65IYqaprI9OztLVbpzH5PcZMb7N2WZVwrr/H9S5sHBoaVEtrkGkuWUEhYeyqoMJl1n2
	 WufWr0FDPMLR6xTN/0tguMvk1eOLrJC8cDDNB8A01t/jUdCG4b7+u5NxWvKezXkaGhYHg
	 KeQYGIpiMH1nv9BIwhPWgZoI1ZuLTYaP4ygq0LhQRpcgEZjwYatoiBeiVmLQAowzAP+kC
	 PIEDmcyE0vf+8d/63b8js2tPp+tvq0j4o3rJv1lPojfW4hdN+XHfTCz5KBx4ATnRJL2WN
	 nHT9ebGuLdgVAQONvJOvjJLJrTvkQg8NVPHslZVP6MYUzovYcXVY97FJuXIXehnPRrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w+gMWz1mqLi3ntza9kU1FJ9p4AdvGdZcMlMdwkcECG4=;
	b=tE7BQWFZu60lng58HTnvHb7VGEiSMVDOyhQKDWpEtajPF9TsywFDVrML+LXYF7dpn8rB
	 nhvaLGVquMKCg+4LP9GGwpGFBojKrOkfD7yaL+8nTWwJTuu759Ynk6yYBNLdKyBEVJcTe
	 m1BmA2L18fg07Te9noUsdMTUnwy5r0UnYC3ayZ6ecH6cciL0DtZd+o33H3RQbf/FvRNs3
	 chHyJ1nJp4ppZ9LhwM2u8hZO5JfDnwuElSXfeu04JeYZpPK79D1WpNIsJdF4HURm37ZaJ
	 8fcxdBo0HeG6gTe+xoppjRMViN+4vcA3wI1/DAWrAj8+0TDVfWU+vr1QNyuBUycduEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pV5ztr5G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="erqLw/D0";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D9160A261A
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 08:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D9160A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pV5ztr5G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erqLw/D0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RQUQ3301565
	for <linux-gpio@vger.kernel.org>; Fri, 6 Nov 2026 08:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w+gMWz1mqLi3ntza9kU1FJ
	9p4AdvGdZcMlMdwkcECG4=; b=pV5ztr5Goq1HaGItyuHqxkh6B6aeKvaseHrcAP
	/Ns4ioFNVqszYBmtEh+CttVFr6kKtkVed7xvZhykpZm/wDwLq6xhXzKInQrt1Den
	oeoUtH1cNku4sjwhns1TwaihK3o9Lm/UqFg7qNuHl/nu7b4a9m2EPMfB7DJGTfmB
	aaESMBNqQQWDNlC5IjhIwVm521xSkQ36B1UecKUSSRAuPZUMBzH5Px7lkDtPwjKI
	NwiNkKulTfry2aRFnvATmFyrO5NDsP10HJqXpvyeyEI1IyFTe0WRqR8bWadWjzTj
	lHtS+COHUBWYdqAxlFqOiEzenAPSPLmhTwnPrW/2hOFjloPA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1sby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 08:00:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso558336b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 00:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952005; x=1794556805; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w+gMWz1mqLi3ntza9kU1FJ9p4AdvGdZcMlMdwkcECG4=;
        b=erqLw/D0O8+c0JPmQosci11yZOxHJYnMDqg1Dw23uzT7Ii3gtDV/2C4VWsToBrGtue
         bna38fAYtxVWpmbqPUm8Y09r4xztp66Ozk8+hfAkWKQ+HRx4abt2QN456m1R5jmzt9DK
         Tns76Cr7hcLWdQi86s3yMu8gfu6ehpBfBreqH+j/RwskD/LYtgtu3LmxeL4aUdEijGtG
         YhvXF2N2Ik/ArQwCQyqVxtAXzZTUx7e9dZ+Av8eEo6BvdBXbnehizUJ7y9aWiIk1Pg6y
         YBZPrKfF+9L/W6bVparyH/RoMcAY/yF/Ti+A9e7g4ou8G6/tEuiQx0ij/mynCytb5xok
         c/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952005; x=1794556805;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w+gMWz1mqLi3ntza9kU1FJ9p4AdvGdZcMlMdwkcECG4=;
        b=ejJ4Jqw+aNTFgTuq9PIskNaK2mkjj0Qfo0lGVP89YpvSP1u7Ku8iyWrP+6gnw+RMgS
         BQXzxmcAmdGa5flPCK/5NwerSpvRdGK+p+1TBltySNq1Uz/JNuNYZbwlriuhfubp9Vkr
         K8iy+eC6Bjo3kj6hO7f4EihFA2bQN/ImnQ2UBj/yKMT6bTebWhJ5dQFj1ZPQFmZkUbTi
         3INyjGOAImHLZHXw7e+Fir18ucpk8gjhuVUCK7SrTcbYIcxTW7WiIHqe29ay1Yh6Op+C
         FvKiTaW/AWwJTWdySKsEb5TsRmxZQkDT+/Ptr7G6jgQ8Shn+7B/NIzQug6YrxXeKBLR1
         FjYg==
X-Forwarded-Encrypted: i=1; AKwUvBxTN+M/5hlnbkgCxqw+mnZQ3WVZ+MeG5QwKq7MByVjJEVMbAqVEjWzWa5zqmqphUOAdRr6I6fLGkUul@vger.kernel.org
X-Gm-Message-State: APuU4Z9xfQnUch9irjrzRvzCWrRqDiiixikRVWpUh08uF0iDkY3G9GnZ
	g+3MdWyX9YPu/vx+aoL0vttcuq2gCxSI/Szoml8V7PbjRI8f0El4vP7SbGMOTqarYWP4I70ODtM
	z1ZsvzMJuCHIWP394Q9exmhDmvzXIjXHNlVZlZeW04IFV1tTj0wl3j+beXSuK3Rlp
X-Gm-Gg: AYBFou28oe+Rs+Y1CqX/CLS7wBj2tGT4A7F1Z2fr4f0SSx5SkbxWF7sUCps91U35q0+
	ML+hjglzvqiyPQ+BwJJ3TH1MJvzolfeSyDa7P/xVmRuhdMUK8bYcnYQCtsZBYLgm+UM+Pb8jkHS
	wMEK/ztoLg/v743xak+qB0frg/mogQrdIyD+lmQYOYMSY5i0nibwizl4dNfuCFDoosjwmHKyzVC
	uTOTYDweQ7Ib739lui1DQdfqjCpHCXH5TmuoAjyTz2z4L8Mjr5Zt2oC+i0pszCSekPqTazaU+Q2
	tmpjgL4wArowyCa3SLvVDAT5LtId5FiLZDs0ib34LjRjZ3U9rvmDJF9KLAafRWZsIcAZASkqphr
	11riey/SYVvB8s+wouLNSan3AAQyOn6bpzHQmGu+ADtIJBRgVj/QX4uN8XYxJKJm8kbEO9PsMRg
	nPGuWplnLbfuF2EEtOPjVt/ipdLcNBnNKoBy5asYNMYMC8ZK5q1Woz94xMx3IjOG0soTLf
X-Received: by 2002:a05:6a00:928f:b0:899:5117:2ac with SMTP id d2e1a72fcca58-8b37c241174mr1517781b3a.46.1793952005097;
        Fri, 06 Nov 2026 00:00:05 -0800 (PST)
X-Received: by 2002:a05:6a00:928f:b0:899:5117:2ac with SMTP id d2e1a72fcca58-8b37c241174mr1517756b3a.46.1793952004593;
        Fri, 06 Nov 2026 00:00:04 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359dd36d3sm354529b3a.37.2026.11.06.00.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:04 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Allow eGPIO ownership independent of
 the mux function
Date: Fri, 06 Nov 2026 13:29:40 +0530
Message-Id: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAOyI7WoC/x2MQQqAIBAAvyJ7TtBFOvSViAhdbS8qChGIf2/pO
 MMwAzo1pg6bGtDo4c4lC9hFgb+vnEhzEAY0uFprUFOqXM7Irw4hOo+Xi+gIpK+NRP+v/ZjzA1Z
 QZS1bAAAA
X-Change-ID: 20261102-egpio_fix-ddf4c2a4f24e
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793952000; l=2153;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=nNSMcejrg1GBEQ1LH+7ONoNsTI1szoHFruhxFh0t14w=;
 b=U5HJKn/ZdQYeXIpwh7w1+GWbTx/e0eIiUph7iWBPt5/Qq2SCzh8OOVtNThluZ3ulKd6jmYKtP
 dsX/rnkurjyA8mBWVC1s5fbH6glWDj9U0Zkf25PbL0EyIMH0oPxGHd1
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX+Ah0McJznvqU
 cBQ1xr1bAEfJzTGS/ZS3t5P8GEGnWUU6GFI+RCWvvs80N0BS9llG/cHC7qeCu0BMCfat1L/N2Mv
 xEBVUxBMorRRY9tzGrVq2F06AWaVcI3N3oK0wYu98i0Fb4LMqDTTtkMmq1cRjOXdaVEevciO/2B
 gUYUfJwoamaXhQ+2kXdVl10IcOapwavDda78VTMyIfT25BCHGAKD7R9FPRZ89NbGPEgAGilELV6
 6k+3ZCQwoD0mmfOknU31RDjXS4HAehdePMl0X/aOskgllStPezIRD4N6vbY/57jF2/hUC5Ft44S
 RVeZzC2Ww1ysWNixFe+PeSAe4zODtlF1KgfOgpivqQGcRnasaAaUUT52KMI+E/7G9CPuOmg3QSh
 WOXpL5FzCij+a+TtDny5kva70YeXlRl06Gj1LXSIle/HKxnO6vcuiIdXTWkrzdfcgNAIqrVgOOH
 4Ie/6CbnpQdYy9c4yxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX62ENpM3ZI7RE
 lQA5a/9OtRMTSg0mgpnGAvQk/CPn/wNADSPpTqlA9QY6sawrEfd8pGu7ijAeaEE5j0N4TMBmNUg
 GSL1R7LuggabP6jn6xpib/ARFrOxWJY=
X-Proofpoint-ORIG-GUID: rzydzOF0VfWYa-fQ_WH8n9zUkoxolH7-
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed8906 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HuJJzTBhwpvvTeHBZjcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: rzydzOF0VfWYa-fQ_WH8n9zUkoxolH7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

eGPIO capable TLMM pins can be handed over to a remote subsystem,
which then drives the pin instead of the application processor. The
eGPIO present bit describes whether a pin is capable of being owned
remotely and the enable bit selects the owner; neither is tied to the
pin's mux function.

The only way to express this today is to select the virtual "egpio"
function which transfers the ownership to remote io whereas the 
single-valued "function" property e.g - gpio, qup0_se0 claim the
ownership for APPS. There is no way to describe both the pin's normal mux
function and enable remote ownership where as the hardware programming
guide(HPG) mentions no such exclusion. Boards that need a pin muxed to
it's real function while the remote subsystem drives it is permitted
behavior according to the HPG.

This series adds a "qcom,remote-owned" boolean flag to the TLMM pin
configuration, describing ownership on its own. Its presence
hands the listed pins to their remote owner, and its absence leaves the
ownership to APPS.

cam_sensor_suspend_rst4: cam-sensor-suspend-rst4 {
		/* RESET REAR */
		config {
			pins = "gpio239";
			bias-pull-down; /* PULL DOWN */
			drive-strength = <12>; /* 12 MA */
			output-low;
			qcom,remote-owned;
		};

		mux {
			pins = "gpio239";
			function = "gpio";
		};
	};

Pinconf-generic emits the mux mapping ahead of the config
mapping, the flag is applied after msm_pinmux_set_mux() has
claimed the pin, so the combination above ends up muxed to gpio and owned
remotely.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Pankaj Patil (2):
      dt-bindings: pinctrl: qcom: Add qcom,remote-owned for ownership update
      pinctrl: qcom: Add qcom,remote-owned pin configuration support

 .../bindings/pinctrl/qcom,tlmm-common.yaml         |  7 ++
 drivers/pinctrl/qcom/pinctrl-msm.c                 | 81 +++++++++++++++++++---
 2 files changed, 80 insertions(+), 8 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261102-egpio_fix-ddf4c2a4f24e

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>

