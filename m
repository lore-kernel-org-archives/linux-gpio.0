Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612649;
	b=pnuN/vevUa7JAUlCBg3vFDifN/cJrdCVXrNusv72fMCRWbXINEedMASCAxl0O4JbB7So
	 WnZrv1EuPtX8EgpBTOI+YgpQAMfE+eTM9PxMD25iCWMbHWmZw7x9DR5IlI5liMHPSmguo
	 F7Ofj2fhLrElkmSXF9LOFmM2xrVrAiS99FaqU98hTG8X2ixFBi/kGtJigrYgnudErMSrb
	 yB/dKOoP+206j0o07u9uAM8PcW1ocI5111dy+4ykyC5lhvditszAIsQAAVH5pP/NFK8K+
	 8cx9Dap6BMK/0jkrsibwwXuiRmptbxIHBOEbQYl/u10HvIasthKoYOhacT+j6gxf8cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=;
	b=TZ3Tv5GSlh34Q0K7D15L/pdKdau82TFNqd5rVHnOgwGfcqompVsYtL3xc2rkxJPCrs5S
	 zI7CVbEeggrth8SAE99XuK0F7p+kYHBrqgvm8Op7JXBpErFnvM4Zxkh//F+4ajv1/pkub
	 bDKLCrs56W6vAjPzzuPJFESEc08Y4lGMMfl53diIF6olKkGunRmC4Xa0tzLHxm3Ek4YRC
	 w/wpjM1xNZYH4/sfDcUJPBrQc51PdglzQCoK2T8EJ4p8g1AJYNS9MDX3Mpgi6gyqa554L
	 Lxaji9ppM7y3Ya1us9ZCkRjuZX7X3DS0CGcfuR39p6vaODqaUjj/9kbMWxdTwEFChfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GrixEPlB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MG03/ugG";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1438E606A329
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 09:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1438E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GrixEPlB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MG03/ugG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ALEi2880833
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 09:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=; b=GrixEPlBQm1t6GaK
	LXHj/Zc2LYgw0pXEoPcH5XNfwF5fmWGE2STpSiy/yyGB9VX+55ZeUocjBayZr8WV
	Yv04fQOzpZvd360fKsauPBiU40cg/Hssc55ksZH3lAIArdUWbab/YxLxiMZNvLKB
	pJp6OuoxnsJkvBPwsDG3YYs0GNCTIm5OHuOm6T5bGD7a1k7m9OKeuEPAxcizb2Ax
	YBur8THyfU0JIRxrJogbljhPeqI2swftDUpzURnmjeH9cVQ3BN9OBx5Gx0oFvGc1
	9FELICUqdrR8xD1Brr0dGD6m9yEcLIGRCXhXppa3VxKC+/+bhKajjtX7QECQ/74s
	+i3VGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrg6f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 09:44:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so560482985a.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 01:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612647; x=1794217447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=;
        b=MG03/ugGhGkytqsi5TyyL0zbQ8uLVgJh9lOBWp6Q+nXsmUZ2y4UXNqAV3CHkTjEcA9
         1DGPM4FUGF8K9AQVUR+gyR77MtHjYiWu/WOcuAGXEJriZ5OlcrJYD+qMYGerZGLaMZ43
         HjJofSTKte0X7Vuu6DxP5z2UHRNysxJwggw2RaVk19E0KP8ZmqX/tR0f79QH0qus9W3y
         BII14JjasZRiaqcN0JFxblZgiR8bvMxxv1Xygobi7/1DklO+ywVyhcztzIMhvw0pBwrs
         o4m5dk/3SHEx6OlUDYhoP6znSN9w5iDHtJ0/vNMgD55J7zTBrWbSFcQKqXbagbGjlgb1
         IPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612647; x=1794217447;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=;
        b=iAgMvzrccwIZVNN+YreA4KDPq+ZGZqpQnuS5RQiNLMI5rf+GoXJihxrrqJEn74Gz99
         g17IP+PjX9bp1iYxAcPbZuOBaBaad9PlXMfYH+pC9y/QIce7NJvL5nLPPlPSizrI17RJ
         gOZmYq/m4ELzD6PLJtL7TRf5mZqMU48uYSQcOUAz9sVbHi7vBqEqNsUInsrRzSrUcWqi
         NRDPdwAmDXFOv5A9d36ApIkrhFOakFrwtVBnQupaopFtC34NBjvjHkKFP3h6gOadUkKr
         EhcbSwkhggOIqS11s7Exlh52cPz5NIoWI6kbmzaC9iUscz2wrTVGK+Mgrgv0fVIyKVTK
         ABhg==
X-Forwarded-Encrypted: i=1; AKwUvBxjxe4oJoGl/mkWzDuYmIIZkZ1phkP2/O0ISLNAchHWlueUr9s3rEw6ztH1EvSgVLWbD/i2WsFVPzox@vger.kernel.org
X-Gm-Message-State: AFq9FYIT8PICaoO8tj76YRO6AY4Ld5xE9S/ZsglmxwIUgP6Gjze5vkLK
	WUg0SRznEvaZ6pNQxbcEoENIF57YZs7gah4gkgEG5c+0b6ef7klpPxjNkTjYbX8d+4ZmLyc9wHp
	wfnZIZkkfLUd7q0EL94AWhf38A/9DEQHRnlaWtVJG557OZQG6hURbAGFJ/pTjI9aQ
X-Gm-Gg: AYBFou111OS/CYsCl2BnqFQVTKVaeHmK6byEJPkXXm6rrOQGmrynHB//foJe13zkmLk
	zO0rblygdhMPwVZS+dUqtdxHJbAAhpR1zaCJia3BSpAojEl53DsHHf1KIZAeg1GDPCquInYXwQ1
	JmqG8b2W/2B/kRGfbt4c76BWG/S5KZ2dGMjNE7zbMM56zjcnJIKZFdr5TO7K4T+J1VfCkeBIMOw
	karNKJRjQKRfioXKr5katgpiSlSrWl4UvCXxyM9uEbD9+nsBl+HhjPkeTqUNRYxFV4azt12eUgJ
	tL/q0zp+5IRjqL5kUmseNc1IUa2GG0ZqpZNkMc3CsDCl2ikE3TZ+Itj43eVbgal0l7lf7NfVKUQ
	3WTSKGvI69igDz95umAW/Vb2P3unPiNgr5i3DPx5ONK9PzMGYKHZmzO8mLhwj12CLHTShPsSZrE
	Tl
X-Received: by 2002:a05:620a:bd3:b0:93c:6ded:4665 with SMTP id af79cd13be357-944214cb617mr1433940285a.1.1793612647070;
        Mon, 02 Nov 2026 01:44:07 -0800 (PST)
X-Received: by 2002:a05:620a:bd3:b0:93c:6ded:4665 with SMTP id af79cd13be357-944214cb617mr1433937085a.1.1793612646497;
        Mon, 02 Nov 2026 01:44:06 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm334708655e9.4.2026.11.02.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:44:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: fairchild,74hc595: add support for nxp,74lv164
Date: Mon,  2 Nov 2026 10:44:03 +0100
Message-ID: <179361262502.50074.14545801533564831953.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023115652.700765-1-ansuelsmth@gmail.com>
References: <20261023115652.700765-1-ansuelsmth@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae85b68 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cqVv7LrdKylAoqtr-78A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: SCinwSFu1dnS20YFmAhQKbxBgauyW3qD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXyJacTF3ceT6h
 U0SZ3gu7haWLaHYOXcEgIWgkWWxkm0R34+Av/ESnkMk634gFCckbPtHtiaBB08tHkC7sGCSPOTh
 Q0TPOE/M5yWR8o2jwoe6WciEW+RM0vg=
X-Proofpoint-ORIG-GUID: SCinwSFu1dnS20YFmAhQKbxBgauyW3qD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX5zBBDz8oMI2M
 fyHJ8vuqdJ54AF+0H2HBYCPGAfdhgR+UuOcr950v6qaM4AFjAvP2n3UF2CfeEUIE/rhbtreCkUf
 vCWU5RPDKMWYsmsZsVJnT1O++9HRVsxmE2GlMhH/8mB8F2W2RELNoF/JzOmHWnGQRCHrEy5M4DQ
 8uODjzH4w3TQPPS30JKtKHGY4wjQv7ew2H4bfkN7EqDudc+iyUtskzny5iaOw8h8utrvHZXTCeW
 QLUFe89wLIwROQzODNHcBpKS6wjpfWV1FvlVN7sj4QAsJl9IFuz5ZbM2mKyfAV9jve3txTQRMJU
 Gw+cgX6dlbcaRw+xiybvazTOr9O5aFatGyWyXyyRbkmEJe7iHRfgngkqV9eF2QB6CqvL3jwNLkX
 FE9sJ2gITscMHONjI/dsHp4rwBWu2NgM9NfevB7jctxyRRNoD+CfQ3HQ+VfqZ9b1qTqnn9s0n6F
 /VI1LpJP6wMtyzBhQ/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038


On Fri, 23 Oct 2026 13:56:48 +0200, Christian Marangi wrote:
> Document support for nxp,74lv164 as a variant of the currently supported
> 8-bit shift register with the only difference of not having an Output
> Enable pin and a simulated Chip Select pin.
> 
> These basic 8-bit shift register chips directly change the outputs as bits
> are shifted in. Particularly used to handle multiple LED for basic state
> feedback.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: fairchild,74hc595: add support for nxp,74lv164
      https://git.kernel.org/brgl/c/861f010bf9b9daad85536d838257cdb690d94a30
[2/2] gpio: 74x164: add support for 74lv164 shift register variant
      https://git.kernel.org/brgl/c/d66b6b86d5a6278ca930112c634d03725beb7d9a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
