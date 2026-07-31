Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4ED449B3C
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 17:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520190; cv=none; b=FgwLGhzFsAySrMG1Bj6ctTrlWjLXOlyQwMQbJBD2AVU4pR0LlknNnQmxShWCUB1fE4NtQgRWWEb09YLSG+6eh1Q5891vSWDnB7I9FVnvGAEIUhEgCcagyGtl669RguZrUHAuisYbLWI6CcJsdJT6vxdOJDBB1Rs3co6OL8ba0zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520190; c=relaxed/simple;
	bh=kLRTAu/k6TvKUP5frxqmRIy+X+s4tGe7Bhw8g5iWvKE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KwqeKPVUtSRYpUXXtqVbkUhwYgn5/0WFm43UT+mcDNhVU85TZh1Q4gY/nqW9QLRCXi7cDPUcAQ7gofJX+Qm2PUnLaj2J15cvAdwqMd3o2TMaVJ802BWhLaY2NkLhF4J7YsHOFCXnE+hz4JRcn2BYlRWScNaHaev5IUHJFUJ6+Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b993d4/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HH3ka9X7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b993d4/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HH3ka9X7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFO5ok070856
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 17:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IZ7wIET9+cqj/SQgvihtve
	MHAe4vfB83eDliegEyhsY=; b=b993d4/aZJpuvvVA6efnhCvWzpxkQ7/uLfWry6
	H7T2G383OaSZiF1UdcZdAriLf4gHKXDC0HX14ULRkFfgGnIGZo1hJyyZCgUVxxEI
	/RjliK1KyIvuoRiLt6uRf1QG7IpKSnrtJiNiUox6gHQABO5DhBoUs01jnZzFUp05
	Y+lYI0xNGfo+xR8gpD2xzqP1rzYEdK2PpUbkUhVcw8+AdpBcclh5PXoqhFQPKttc
	zJZNXkdMdUbRpnCwvMX+H3zULq9kUJjshWmw6eL5P46Jg435D0u/3MXcRlZHik6T
	gUwy00Gl3vNrjZa/lUTNjJ7vVYoj8PhwIUJ5tisMZ0jVhaJQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqhqqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 17:49:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so2583218b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 10:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785520182; x=1786124982; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IZ7wIET9+cqj/SQgvihtveMHAe4vfB83eDliegEyhsY=;
        b=HH3ka9X7zAZxhoSaqegp5lj9ylfZRHhbwhwIiBIBTwokK3PvXZFo3W995SrFP6+C2E
         yMdLIERsH296FCEGayEhoeL4ScnVK1MlDx9q9QE62i0MKcRlXYA/xuWLIm8GbflfDP0I
         D6w+bjqmSs4u8m672gFZ94O+D3bDHdofsSVMae7yZifTulVng/EhSmIurnub/ugkZ6wi
         lxcD3nSrp8sWzXYNvH4viB4+BCJdj4MVyqsn4yzCvnmHTkETe3QvJZuTZqjL9VF04RLz
         mpjVOt8wdugBci1nyahz14dCLK9CtR67f+PcB2xE1vHUodY9ITQoTbEXBYboNiEPyViz
         n71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520182; x=1786124982;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IZ7wIET9+cqj/SQgvihtveMHAe4vfB83eDliegEyhsY=;
        b=DpSbCzdOEG+BmFZt0UBuHJhsAQPYD2kjKDUdpy3S6K9e8TqtD9On1Kqjftaio/Z7WZ
         DNlzbtMHYzzD0rk311YbvlwvHB0DoMT52MroInFu9caKqoRB8O7KWCflfGuN/2EmHS54
         T5b2Wyr3Ed7SVzuan8jErmtjdRTyc3z1tBzZt2euL8s1JUci0BWRPdnBQ9prnrQqpMep
         ZEtVl1Mro1gJdlR1BTJ21H1zjP7tgFitzaQJLnd5ZvShdeW8V9o6HgxCs40/0KLxFGfI
         a22dj3jMpkEy8GFIS90AREbEoFhej0NBoUjoz7j7iZZsYMqHJObD2MfSQmvC4Hq1FnzT
         01wA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/6JOS4YZIQA9sfYo4f2S1nChwlchjsq3uN2Sz50+zSckpUQh5lOCYDLqUP4T6hwBaXhynQ4G7dQ3b@vger.kernel.org
X-Gm-Message-State: AOJu0YwgBfaPgzfKU4tnlm+GQA1mJQLiO56PqjJQxFq50zeMIR/WaRJL
	rdYWFcS2bdsZyv/JPORSkn8m5dc5jb+W/csVeEatz11hzkopTtDmBupDcTWq77yaVjC4W1F4LFo
	sEgYL3K2szeqhmXsTuIBKTiEul0ciQGOlW5vPObMPRvjPy1wY5Axd0RautdAA+cfm
X-Gm-Gg: AR+sD12rWAd8E2w4zUf9BEoGngBuLL2egIr0xsSTTA0K49CHcWfyr7UjH50bysCimYr
	27jsUf2mgHDJ/PxGTXnNFgHR5jpFNbsmMXKYNbBC5F0e4j8BtiY7zwTWezqbMOGWkFXIFFClyMQ
	Uzrgy8opYtCP4E10xyNcvOiJF6FX226HoiAqUTm3+pn1PzNebyekL6V+cb4YihiX3UMyxzj3jde
	993D9rEDcOkRLXksvEjS6qZF8fo60Guu5+fgseugIc/mBRwHP1HJesFww9cEyNPPy9a+9heNO1i
	UAsLEOBhPVo+mXbCO8oR9KoZip18mw38/QO+Rke6BnOoQutflIJNzC1T1o9buBbp03HUbZ/EA2H
	j/yOYlE5kWm0gim/Lp0ei+3V/8teL0hUYmOneKV80RTwkRvlUJA==
X-Received: by 2002:a05:6300:6186:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c91a7131eemr3358357637.2.1785520181857;
        Fri, 31 Jul 2026 10:49:41 -0700 (PDT)
X-Received: by 2002:a05:6300:6186:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c91a7131eemr3358333637.2.1785520181425;
        Fri, 31 Jul 2026 10:49:41 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm15115660eec.28.2026.07.31.10.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:49:37 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: scmi: Replace get function and group info
 with generic callbacks
Date: Fri, 31 Jul 2026 10:49:31 -0700
Message-Id: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACvgbGoC/yXMQQqDMBBA0avIrB3QEKL1KuJCp6NOaaNkogji3
 U3b5Vv8f4JyEFZoshMC76Ky+IQyz4Dm3k+M8kwGUxhXVMai0kdwFU8xvHFin3JSrKyztaVHPTg
 HqV0Dj3L8vm33t27Diyl+Z3BdNy5X3hF5AAAA
X-Change-ID: 20260724-scmi-pinctrl-generics-746484c98b66
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785520175; l=1273;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=kLRTAu/k6TvKUP5frxqmRIy+X+s4tGe7Bhw8g5iWvKE=;
 b=ndPkf23CG7sENbqtvlA6PegWcpgr0px+DtxwLf0FEzSdOP1cO/TW0h3LC6k0Fgp0jWq4QoVcK
 H+Vh9Scbj8nDI10jDkN+HO8zIqd8s+vzDeZMj8hmOXUWL0jsEL5iWHY
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfX2lG5ytZcG8LC
 YguPqynhzOoooHwby03oMkXInUI28Rn0SCfJzdSKVDTyJyBHWrR0TGXlCBZt3DcW3uy8gfpTKlE
 kuc/kXFt7KQ1IjhL/Oc+527EHHGzxXBEMbx6dji16KJX4YPVEz/0hQYujm1mWRyZGe4Iu6uBS+y
 1bphIbVO69LU+xtZLv/0Kty1Kunz+z5kWiwvl6JYuy+2/iYoRYKJ4MBL8wscBpZlA7Wc+0lnwvT
 63ffqEMi2WCXRgLpPpPyuMQyZC+vZiCdRqDitnuJGZR4tFZ66UCB6UwSkMijoiXrTA8bJ+Rqe4p
 J2fslSTPIDa2PAFUPpNgeOfdg5bv3+wlXQpfTvsbtjzW+NEBWlKfsDRpUwXJNt/SztrWUZhhy4u
 RlJbtcdQcifksbPdXMGLimCui6N+MseBe74VOKVs/JicpS5FaXkx0wDAn1VhQ2t+wmoIpKwEDYN
 7gh4RAy+RfO7UdIo58g==
X-Proofpoint-ORIG-GUID: w8eEe5Z1nxvwMYIMTTtMVijg-f89W5FZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfX6RFkQwVAPA04
 B0M0EuvCJcQnTh0fVTdr4dIkaD/L2udcXRGAlsp60sYUWNn71RZKZ3olB53ZeydfIxnRYPbESGQ
 FJlh/NJ2tS73u+xrkngBg4DS0MRBaXs=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6ce03b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_OgG2H8xwSJ4vVLhebYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: w8eEe5Z1nxvwMYIMTTtMVijg-f89W5FZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310136

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
Alex Tran (2):
      pinctrl: scmi: Replace pinmux ops get function info with generics
      pinctrl: scmi: Replace pinctrl ops get group info with generics

 drivers/pinctrl/pinctrl-scmi.c | 223 ++++++++++++++++++-----------------------
 1 file changed, 97 insertions(+), 126 deletions(-)
---
base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
change-id: 20260724-scmi-pinctrl-generics-746484c98b66

Best regards,
--  
Alex Tran <alex.tran@oss.qualcomm.com>

