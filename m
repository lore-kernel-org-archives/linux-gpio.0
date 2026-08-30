Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAD92C11DE
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 04:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064201; cv=none; b=hE5xA6MRPo6B6bLF5wDqxLaOJv8UoC4261iC1D+PYHDHXdCPcPMhMo2bHbb9AIiIe2woe9YkSJWlEj7uitLcpuPATxpEFR7UhHNk4MkOh5ZSlMFPUftPa2XkJK8s4GGhx9YIusMuqu6rTuOA5WQKrP/yMNEVjx21c2LFgc2xeZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064201; c=relaxed/simple;
	bh=BWHukXQjKynnopMPlegvsfqp5eow4oLsQIgGce+X4tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7l/xzyl3kAf6LejAE023UO1UBxtd/dyzkv5KS32AhWGIxeKFUVpqp2FDHJRW50l6cXnmezkHBDwdr+tcM7LjHTvyBE2hbrkGKifaiME6FUD38aZO1DeKJ19biiDNb4HKNRmWtaVjS7EtI4f/XGKEahgba672AKT96L24hLmYXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oI9FtEll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fcr7l2bj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oI9FtEll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fcr7l2bj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2S9tx414279
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 04:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P+4mGrJHOJd
	Bku7fOdSzsvStS94jL+X9eo5Q2CiezAk=; b=oI9FtEllYvo0kn9cLMVtMBxWLMT
	Z+MpH+lWUThTpUgTYCtrlH15j/lHE3B82quoCthj9Hjy8PZEFDFZwmdDY5xOeRgR
	O4eCSl80L9k7vMoocrjpUGe1uopBKUJmYbGQe0wWXL4SS8gMKvO9f2Y/vGaYm2Cd
	eYvWVKnSMQiBPxzGIRDlWT/9yZbdgp2EXx/+CyuaehbMC2s28hLnyjmK91OsQ/0A
	G7TnUWLggOUDq6kteenXc/A5ciQCB4ryux+JYWabxaKsqAtcgIMgQt1eJB32ZnoW
	IsvH2UQLwTRoMwW5c9F9VkE3+O+R7f5N/j37pT+d6O/2lwKN/LZHH/rIgYg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmtb08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 04:29:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so5723540a91.3
        for <linux-gpio@vger.kernel.org>; Sat, 29 Aug 2026 21:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788064198; x=1788668998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+4mGrJHOJdBku7fOdSzsvStS94jL+X9eo5Q2CiezAk=;
        b=Fcr7l2bjQaBnJUjJ3J2Gho6BanpXCP9XXrwT/O59KZ2ZX/Q5GOPGJvoAvF/wg1IfcM
         OUUCBtIxveQiBcWXCkMjQ+7iKUul49H98ivH7XbX7pDTAudnmGYuzBJkJhAdwechaZMU
         dSYiLZRChxKOIIyomgMtLOr5Cq61HUFkKp8zkoU9LAopUDKEy5+CxrQx6U3foo8sYTjK
         ToT456irVFPMdLB6aa+/+/oeObNO8bzxMpynJpiX4OPHRGCQUMNj24LEcl/cPVtB+sPw
         TjdzOyaJY8GqMoWUkX+rA9GC0JrT+hVxsrX3/m1o33s5g5xoJlVyNSi9OzZkpvRaDBVJ
         Wvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788064198; x=1788668998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+4mGrJHOJdBku7fOdSzsvStS94jL+X9eo5Q2CiezAk=;
        b=KTogTzbuwu1KozgCw/U3Ufbbq35Yu7Jw6WHB9ERN7AR1F3QSnMsu9xod67uDZObhlW
         J7dSyGEjaHsNUK3NNgbzSEBrMLamfEcgV+Er3JYa6zHU2ob3xnLA2LCl5cm8sw3jO2P1
         liSjQKMHqOUaxaZsp4cDD9y7ifPAUnl8MA3OUVGIQszDeFuFeX84hbW9iU36DiSLeYvc
         vHMZClMe4r/Ac+bGnLddNm/fVymO2nWbvuFKfdca1gLxXmMa4ZNA4OuC/13AX3HwwUfB
         bJD1Ii2CPwQ8jJanllzIWdNGl5MxQ2gqBKNnqSFcgb8vFukeVhPGIE6Nen6XzUJ7/mxP
         S5QA==
X-Forwarded-Encrypted: i=1; AKwUvBzqoCWXhU/7MVOTiNU0eLzT+QVaw5iywvaXEG2mVaVnQJ+X8yoYSlTi3YnyoczpTP7OI3u7CrsoC2fW@vger.kernel.org
X-Gm-Message-State: AFuF++mxIX1fg2EvjZqd1wDqW+LeQHj71/f5erOB5dHjtcjccsHKbv34
	+afU2/A1C3NORzXfDIF0Soe0vagoXiSHy4Z2x/PiIPhL9oUmgwSGY3oUfcxt3Zm1EpzfYcgbcet
	QZhMpRQtsT5ZD9OrUECRmvhPhjwhOidhLkvzW3E/TlMcLHosjXlw6jfn+7bSAexJ5
X-Gm-Gg: AYBFou3A/IQmrz2Fsf8dP2hVktb2dASEU3uLGppKHxQ95BeAByDWYXcAo0lzQ/iRwbE
	1Rtn6luu6xaHadP/2IrsiBq+m6uOFgrhqBFrgSYGyBrk8BhdNrUgdN3p+p2PoiXJ9EBoPhCDocs
	mCGZhAln5TxHFliVutbp8mXuTtWFRdKO+6kS/oxK8ia8NsE07EslGHPf/3XJxkt7qMSuGsXZhsg
	uZpRri+wNAAKRTl4AEayVKkkNqfWSL95hBpH7wZY8isgECxm3ZrjoaMSvTiWQInFGML3kjZHH5Y
	aDSFFhsh/bG/mjm2W6bWrUDapMS/jwhlJEC7T8sMVEsS0xmzNDRUblmeaudD5EofF53HYjZbLLt
	pkeIwSjAqg96p1w4abYfVm+vuQF1vC02E789aQwzLhzLpC+arI/oQv6xoKcPP
X-Received: by 2002:a17:90b:5410:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-398bdb0ae0bmr8439694a91.16.1788064198220;
        Sat, 29 Aug 2026 21:29:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5410:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-398bdb0ae0bmr8439634a91.16.1788064197751;
        Sat, 29 Aug 2026 21:29:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b4bc05416sm6078941eec.6.2026.08.29.21.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 21:29:57 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
Date: Sun, 30 Aug 2026 12:29:38 +0800
Message-ID: <20260830042939.144376-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
References: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX4ly9LuE6Mhzi
 dyp+kgqZ/DmbuMlxFrK+qsqRnHqvluZH+gB+210VKEahpz1ATlJPuzHvNP1loTCNzgK7OVW8pze
 DURuQSDqlvLkoLoyMBEVr3T7G/9PEDgOnWkkpXJQBHLwhiHmYRi+sZ8ztT0MvfJpX22bsiIBNA8
 52OQWF2Qtb21xpmMxP5f2yM/e1Koy7V1myMMHWSFudUYdtLlhFFErKeMfqq4Z1agBzB2v+gfVg6
 bX1hxMsBGYZR5g3Hl7sm08yZQlvYykP9I1nssZKi1oAaKmuTG6OFEjpLtXbiVJo/oNRrJGq+RMn
 GjuP6E18Xm3y3ioV9kpRdQ7hGccEgvwbxdtvUBhI24Mfl8LNNjztHjEpdC1u0z5CP7JP/OdfX+8
 N/bKubdrdJjfQ+6Q2yhLv4Bzq/MgG3J1kxVClTpKFNpCtaJVxB6aQUCxrtg5n0lJs0Ewil9078i
 EjhfdSSn5HrD5PYracQ==
X-Proofpoint-ORIG-GUID: 3kJWb0H2M3VTLKl5gC5MHtkbOmqN1BYd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX95iCmQehMpRX
 u3pddZo6KdKUyPTzbwiYm8Fcut4yVmqahw14BhY8ztCJwcZ5DUZNUl1Smg/birkK/zQtdMmsvsv
 H8isK+2TnsBPNC3FeqvvvEflhjI9ebk=
X-Proofpoint-GUID: 3kJWb0H2M3VTLKl5gC5MHtkbOmqN1BYd
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a93b1c6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VvPZ0_ZCf5A27y1iVX0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300035

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Add compatible string for the PMAU0102 PMIC GPIO block, which has 12
GPIOs, used on Nord platform.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index c27e24cb206f..77be0690c751 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -57,6 +57,7 @@ properties:
           - qcom,pm8994-gpio
           - qcom,pm8998-gpio
           - qcom,pma8084-gpio
+          - qcom,pmau0102-gpio
           - qcom,pmc8180-gpio
           - qcom,pmc8180c-gpio
           - qcom,pmc8380-gpio
@@ -281,6 +282,7 @@ allOf:
               - qcom,pm8150l-gpio
               - qcom,pm8550-gpio
               - qcom,pm8550b-gpio
+              - qcom,pmau0102-gpio
               - qcom,pmc8180c-gpio
               - qcom,pmp8074-gpio
               - qcom,pms405-gpio
@@ -496,6 +498,7 @@ $defs:
                  - gpio1-gpio22 for pm8994
                  - gpio1-gpio26 for pm8998
                  - gpio1-gpio22 for pma8084
+                 - gpio1-gpio12 for pmau0102
                  - gpio1-gpio14 for pmcx0102
                  - gpio1-gpio4 for pmd8028
                  - gpio1-gpio4 for pmg1110
-- 
2.43.0

