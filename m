Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702333;
	b=N/Frkd+Im4FUY9+YcuYOEoc4fe3GK3jUovaqOnCPRts3zqTIfDdoU4aAbxD0RYLtwd0a
	 tb+QCk7DF54s4yqq45lVhsWxTu8Klu7FUu9Ka50863RjXXDYRR4SMKHK4dM/CN/6nAJgx
	 eE+EgXtWzNhvB9jrisVDoCZ5WVuHszEihhjdTh5j2HPbsl0B//y/pJSlzHkG1HIhLZuih
	 2Y3luZccMXf7iNH2xXPBqejCsCCvIkFeEW6u2owkytkjf+bLXI9Xs4mjbE9j1XYewWVC4
	 7ZaX4EC4tB7AERrtyhyjVguNcmPmtTIFFQPndc7D5zMj3YeyKEDQtWwyj0Gh3WzjqBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=;
	b=Zx7grUG2BpR62EziDsgV3BJhRYIGM7nWg3xunt15D2HReapjK8A3F4eY6Aia7MuqE1DH
	 XtrX3kk/lQi/IyrRuYFVnak5sdaum8nidLdQXKqEN2bE28yAgK1E9tfaZQN1ja+5+UUrA
	 q1WVv5Yj5ZiImywutOOs4jTWZ9VzrJtmxQEJur+57C8igA8E9NHfEjsDTDuK1EwMZKmEm
	 1SVdi5KP3rx4ugNdz92wvH2d0kM4xSADLrzizPFVJyjUrPJGn6pSRYssBHRwH9Xch75Ge
	 RD0D8Vi0vGixymdxKlmtG+rn4m52xyVhDDueRT5ycWooKyuw6m61cDM9jujAfEBp0vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUxIfvFk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qpbn1JuX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B28606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B28606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUxIfvFk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qpbn1JuX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVX1X2911964
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=; b=CUxIfvFk9k5u6z6R
	dHV9V1FZe02GWgcAY/NmHXhWQ2/3sIDv1dgDpw2F2GGxsmrRS6ijKWloR/I2Ud1G
	Uvgq0OXIKsVN1WCzcJz++CubteZBPLV6i/51Qlg2/hnQv7v1KlhzbpZrAsc5YFwF
	ZNGHhd5oO1kdXJ2d5lX9nK7HEN+1eYViKcFBvuYmBuJTLOIjC+EcuSJXq1zHQeav
	wgA+oDWC2SGeXva1pCY3xLcyQPgA8tX2CPevuRR1BGnrTZS+WD6O12pvR+PvC6WB
	RuQWjk37fwHDW4EUfQXH4UWAQmuosgjYXzHjcIdtishLGE85+mXf47qa0v0R9bim
	vLBKog==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak02k1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:12:12 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eabb3a1bb8so2480329e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 06:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702332; x=1796307132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=;
        b=Qpbn1JuXjm/5SWTaXyZ8lk3irnfRuj8PwL4Q26SMnqFLV2QTJgiN4ducCz1dy35F5G
         n39F9C2lfmqKJ/cG7ru0Iehiw/tB6S/52FHybIfTfQf23GcdHmnFm486VaOKSnGUI8Lp
         1uYNqVcY7+Cx7ei3BVomC8uMyt7R0sKAcvzrurZZExIE//frUIvoHnhvgWp0SuVx/L7l
         pL9zrhRB5hWT3OQI8jRbjK1aKnA6farDkYdISSl3yZMTtZtxKPcpgtlHIVaqzoCVz1qP
         TzaT09ow6HGv9XUmRb4yQePjIjlhLL81LG39CNCYYAxNOky0gzZHv2rvswJn5TORc71u
         nj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702332; x=1796307132;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=;
        b=rKXFvHHSjoRuGTAERmrp+ry9ccH6ivROJ4WmxMXFjuYq0O+rVCYFrXyZ+Ubh6Kr64E
         nEuwbJbOxrOofPBsw5JvhWl0OqKitFV0LWWQDf0hDm81CGSKH/r1b10QI32qiC+TX0J7
         R+cIWUiZ5p7jiXCOGXaqUzCfKAaMBoQDkV7GjKEnVtIqku/EAGeZLJh5lbQJL9oj5Ire
         pw7YlXEGKC21tX0dn0P6U7m/dbsXB66MKnHYQORoZr0Cd1bdVGeb2sne7ZElb9wB3zJ0
         fsbhDnXZ0NJVVY0AvDbrdcxtsnZaKRVKA4n1nkekEyzApftBEUh91V6xqSkrnPsdyTkd
         Kjlg==
X-Forwarded-Encrypted: i=1; AL+hErHl+BfleQ32OUZJAWxXcO5w+vCaiUtIlFFXp6/LE/omCGpIhVwmRWQhZHaP09q1u0BmI7pIxDOvCMTt@vger.kernel.org
X-Gm-Message-State: APuU4Z+PNq6v/fuLzZ0KpsC18HyQlIZi4mwpJiFG9uoldBsRhr6U9/Ob
	CSlKCvH8+eiFzF+ToZ2M5k91cOi5rTIBSyFCn7nMYhIid21Lwy/tcdEDbAsUTIcah2Dhnn53lxi
	YANRkft4dxvWVXRLHPyjRo6oO5fTkxYamtcS+l6xbUzROh94qLvspV6YYBtTyPWoj
X-Gm-Gg: AZFdTZfCJsGHVqfpYEVOHHMGRojw6wlzSmIaoTvqdz45pimvfp1GrxOumE9JULOfJlA
	3o2U9EweFUjGAyh7bQBuPQv6aQAhFHyVTbiKOo4o9opqRwZ8epHRwwlowlvymhGusqNq+wUUdpe
	vaDst4yGwBj3bLQAWKh8esskQ3vrsPCEm3Idk0J83tFHYT6z6mKLBV/MY6fdOQDn2iIW1j6vf7k
	hlUS29W6NXzIe1VFXEqtCPYJt9In+ZLtyJND4LxmW5MAaB3MUYL1YAZB8D2yK2pP7/OxckirnsC
	w26oNxGTNj8NhvdK/h9U/5HG6wY7d7GojPjedWk72FK47Feztr8BAjoY1ivXIAGRfCI5tjVQpse
	skccqwYdqpVBIg5Z9WV1Hv+hJIDkVQJ6wxmB68WHwnk7cAYGHWuIpagYMO5v7OO1G3iYEnP4BCL
	UqBDf+aZskI6nbu2oRqXr0geAMdDUX7rtfV/PPyU5UJ0rNmkSkW087im8zl1BIbA==
X-Received: by 2002:a05:6122:1d0f:b0:5ea:d649:d1bc with SMTP id 71dfb90a1353d-5ee8af45319mr13834062e0c.18.1795702331192;
        Thu, 26 Nov 2026 06:12:11 -0800 (PST)
X-Received: by 2002:a05:6122:1d0f:b0:5ea:d649:d1bc with SMTP id 71dfb90a1353d-5ee8af45319mr13833997e0c.18.1795702330684;
        Thu, 26 Nov 2026 06:12:10 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm583807675e9.8.2026.11.26.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:12:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Thu, 26 Nov 2026 15:12:07 +0100
Message-ID: <179570231658.22277.5231642752159310607.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b083e3c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IckF0Qp3E-YNKf1sYy4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: cTOEaR7oMjCmv1Hx3YvIH1SuzbGYCkZd
X-Proofpoint-GUID: cTOEaR7oMjCmv1Hx3YvIH1SuzbGYCkZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX3Qgu3eBoF/Nf
 VWeDnqjhR7A/dCXqQ+c7UoK8jYOXhuBa0BZHOfRBNHyKxutELk/uJZuPii5ZR3h2igHDazzZtkv
 YacyNIwUi46XIJpWskrQfqMcNSjC4jo2wXCnlfDjXP6XQuh13KBhy5VsKrY2U1UvjehYY9qukp2
 DZMkZKsVlKmv8YQ+u+8ZXbs8Me+crUC1sqtzbgO2IIDeufc3hpte+XNLrGGd+NwsgHpXJDdJVHk
 i2+mOtHlUpNLN7WUfyMoINmb+tqnp3R/bzrvrCB5HX4Dw9RNO3JapVIubKK9xJsOeXhItdkuICi
 1Ln0uogtYS4kENEDwR6tl5+l9ZysGuXzxam3G6qDdPtIK11EFia/9fzyBE+y/jl0mATfwFZaRgq
 LR0OOb/+TpilrNbtBo3LCijmU2G1uIQff/snobqSeOzyPvaNS4w39C2QHHFBxg8/ojLWNTjIoYy
 Gp3gjriQEAhjKnqzbHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX4MJGSpR8JHw9
 ZkfgDoWK6sNFKmWsZ9ya/dtT8thNzdR6HX4LTcKI5xmkLFWeytqwkeU1UMeXQP7kOcDq5cNw6gW
 bnibOmfQQOBXb3W0cOiU9ST7iniSPj4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055


On Tue, 24 Nov 2026 15:29:16 +0000, Stanislav Aleksandrov wrote:
> This series adds the devicetree bindings and pinctrl/GPIO driver for the
> Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
> Snapdragon XR2+ Gen 2) SoC.
> 
> This is part of the initial bring-up effort for Qualcomm Halliday
> and Samsung Galaxy XR.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      https://git.kernel.org/brgl/c/c6c2fea2238e232740243d09e2d397221f5c622f
[2/2] pinctrl: qcom: Add Halliday pinctrl driver
      https://git.kernel.org/brgl/c/aaea5cc6735dc7744aff4cc02ea5b6db9db05c17

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
