Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747DF4ADD88
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685796; cv=none; b=JEF/xGWZrwtPLlO8BzJhm/IuaEGyJb6BLoTaSi4Vlr76Pv5uQmfiBhDmDndydthrjTUekAHfEnOrzXYw1vp2N/rsrRVFrMrWNbAjOtvfwpzh3k9Vsr61IAxONU6AlvBsWCJiq/EnZe6tRt25+8aHxMw85fPk39QX2NLi1TzzxLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685796; c=relaxed/simple;
	bh=nSbXNq1OJYe51dl5okOjHM4uLmUxr4IZI624Hov2mXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cIkA7e6ONX8Xkid7Vs6maE+hp5RVEz4o08CSENQKLtst8BZapLTuf8pBVm9F5Wpj8FWjUubKOzffyLWDYZT60cS56gad7aEYMOYfJs4Cluqy52nedIwImIxcTaKJdNQMrCie7n5IERZCR4Ajnm862GfSu02IoWNNn3nz+cBOlyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZMepdNn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYiUr0z0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZMepdNn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYiUr0z0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLGEaw3431979
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=; b=jZMepdNnQHPlWfp7
	/eD7VWcoFsNazO/PCdEXpvvI+fDrLQsGWRl8KShHMrFPSaQmQixaCEL26H2lzE5d
	66oOXyzAfD+j3tFBwbhzycez3avWc3wZftAQKhJNLc99fwzjK3nENz1QV4dpI397
	OmrYnN7AOJreJWtbP/aCvFlYgnuVf2w5M3TjAZbExgB7NR+cBXyP8ya5HQLEOI3x
	HO5nrnaCNe1SX3PhsVKaUkZc60DUcSCA4+k7Qa8o8owQVDqoxNMqMUBqTKUkvFjQ
	E3ryxk2NJnsjJu6X00vnpKHZ2kobakOk6OKQbqHisbjeGKchj3y/vCHGxYy4eqxh
	44awaQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6j9bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 22:56:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so261190a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789685792; x=1790290592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=;
        b=aYiUr0z0LUlCOEWFJWkYXwNAAoheOIrP2dwSntECyrOFHhChCfcaQFXDTgmGddQwdz
         KJDQf5Wj1Y8frwuO06lmGev7Jp+AboN1Se7XVHKxC542nTFQAdcWQ6HFNgug0g//hHR/
         6nVXTOf+24mX1X5ZMmdG6AKvuEjpk8lao494yGXQvHPjVY6KQX30EAj7gPI1KwQXaS4Z
         fKh5cUks9bUwuVfEgqknYmBqZ+4VqkQAEW5iQ1AxkpOQrLaZV8dhVJhQ02NdCdinuLix
         7JETid0ZT3rapsQWJ4mOqmT49it9J2X9eZ4V0MQi+bNx2nMAFed5SpcRpD9tQ4EtojZe
         sZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685792; x=1790290592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=;
        b=bxQu8JGqi3GFOoPjibFg8AZvnK9o4RD9wcYttyNaavYJvLaSp65QEuukonTWnKm9nQ
         TWYZg7KTmDqwPeyAsvO76CwrOpy0mRE+03PNHFu6Tii1K1kk46gOunTusmB+Rjvqz8jC
         tyFy9GCxs1KO0voGY+mSt/tph1Xte/Dn6O+ckJMU2kqOIYZsZkBr/RI/Sd1zd7JwrCJC
         knLRGgEGDy8a6JVi3WPEaJa2nVU9NgbovM8aglMUEzV3wu7gDg6KHtlvSjbT2h4iQP1Q
         1w3e1EUO1AFvXSbLObptz3ooROfpoC3ULSATVbYd/wBWLdHzVra5JZPcisYhExkZD4rM
         IAqg==
X-Forwarded-Encrypted: i=1; AKwUvBy09hXKIJVX+NO1pmnr9ib3W+tAOCmxOfkJS8X+0uhMkH7LAmqgBtC1jaQbx8spJ4KqELvshun8I4Y3@vger.kernel.org
X-Gm-Message-State: AFuF++nD3AN3OojSIPg9fTo0ghsbyk7enH/egNulOWlTGxrWk8S2vvIJ
	ITfcc58UHaC0R3zRhPxdvDeISZLiwTbSvODpRY5/MyMYcheZY50CinYO0/r92St4PREvqmj1mi2
	eLYyoMUOEDbNHmoWY/pnYcG4ZeWwS5zWgf3Nj+rLSjwHG6wxBVvjvjkHzOmZgcmfX
X-Gm-Gg: AYBFou2pzJZQ1slCmMWivNifsgzNHzaCZy4LWKRR+vaOtk35JCT5Nke56kTB7tO3APF
	Z6unWRQV/jbpch/MUbG1+/pDXxVGucktk0s1v9Sg5R9Lr1VpRxeY31L65yTefVZ4gKSsvzjaZam
	owT3c+cRGVX6oJ2LC1YBh1g/oC0WtHz6WkPf2dJ+m9xPoNOtlv8Q8qf4322tyRK6/CVOSPt0rf2
	qtXPkb5v5r4Iip3sJEk41636MYply9jymIqZV58ca7q4qwpY4SL5lsT6Ig3kThjXFmteRUt2vWR
	coBGsfCyMngqlTHUBcj5+72wLmTP4BNDF9Z5Co07CxN4qmrIcBdKQVcon2h1jTpxs50F5H/4IWI
	VsUnUBKdxDbqSPKHLQqBgO8Yx3DsvLfwbhGfmN5LFHdisJPsCQA==
X-Received: by 2002:a17:90b:17c1:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39e54c19b62mr1267900a91.15.1789685791790;
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39e54c19b62mr1267874a91.15.1789685791376;
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm15812508eec.19.2026.09.17.15.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:55:57 -0700
Subject: [PATCH v2 3/3] pinctrl: kconfig: Select generic pinctrl helpers
 for scmi pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-scmi-pinctrl-generics-v2-3-3eeee364257f@oss.qualcomm.com>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789685788; l=746;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=nSbXNq1OJYe51dl5okOjHM4uLmUxr4IZI624Hov2mXg=;
 b=qt7oMd5cieO9tBGCHfxsL5Y3SMPcyQewnlHKqaYhCp59AL7QHCz4Kd5e0fL1RsGXRpuU6UHP0
 ksK1xR5Hw9qAFoqa9WBQpYsb+g3biaoLgAEB7r62smDxGFoG6dVpub4
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX3SRn12I3ojNZ
 sX1WxiHO1e7+ZyMHB4Mp9X2F186LhgYNFehM5Wa9HHfgR+6b4KAhhib3mmLYq5i1LD9LtizSG5i
 Tz4RDqTa4+jSRzkfo0RFY8w9zJTongAh8GsBNvIGSYGjGnpOrom1ZDhg2zM0+IIzeFzfWZ/fA27
 kz33YZdDW5lpVQMUXpz4ZxvtVbaXRonsb47clPgfQy95E1Usf2Td+HgDjPpsjUvqbyuhH09Fy/C
 Tr8chqnjbjpcurObdr0GoN8jYsFsrEHZN/CI2avdTGA3Wg/NxHLqjo8H+B1kcivP6vDV2CK9VdM
 bs/rV/UX2IcKGeSBpKPANEeunkRiu9b6uI1cOJm15Wy+gyz9xSoLv7Pf2d8x9ROcoEzAbLbcpDR
 jOu9mnYq0Q+JWh/bfsrs0G+H9/uZD3q0sxM9mDICtzZ4WHvfmvRove+zhQiutJ5AG8uRXzFz8XT
 1NXT+PCPpWjk0tZ/5BQ==
X-Proofpoint-GUID: SenWyZW7hNRCxsa7IGYcLwq2ZHNfVPRP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX79mfuNxZZe1x
 RmU2ObYzd29PUpdjSO2cMRLuRXLpKjAhjd9aMMyD3gP23LMLVR/LOIClOyoUR9gOB3WzUF472im
 P4dJUnv7phUcAQg6o0Wwr2YAP1Sh8LI=
X-Proofpoint-ORIG-GUID: SenWyZW7hNRCxsa7IGYcLwq2ZHNfVPRP
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac7021 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eVtWBnz9pTluID88zzUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170330

Select the corresponding pinctrl and pinmux generic Kconfig symbols
when PINCTRL_SCMI is enabled.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2cdd7b2c49b..c93f0bfcd7e9 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -532,6 +532,8 @@ config PINCTRL_SCMI
 	tristate "Pinctrl driver using SCMI protocol interface"
 	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
 	select PINMUX
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	help
 	  This driver provides support for pinctrl which is controlled

-- 
2.43.0

