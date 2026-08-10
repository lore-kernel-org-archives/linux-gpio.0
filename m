Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7677279CD
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361894; cv=none; b=skmtTYtbt5JiuR1DvAyuO/BKrDTI2FCt1L88ODx0Ne6tgvo+uZ7ncxDr8nySA467yeuJOtfZHjXdMzkLU5tajhWXFCA6DUHvgW8keELP9tiSfjH9ybsFfakyh6h+CTr7NS16Go3tavnISjOVbYWi0ruXAoWhWe2xl/HAr2n5KcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361894; c=relaxed/simple;
	bh=OzXzl+lD99epasl0YSqsHoDtOCmD5hegMMxFKY0OcF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWFmqpdnwg7myi6EZu5Cu8OUSzu1BhnbcXkLcP76sgYTF7ajQiH4aJyWCRw/bKHnQZMnG080VWPF+qgeTJp8aLCOnk+W6eUetjPjTS/FZMdOe4+h1mgi+ewaJmvlkCEsCfDLCE4iSrh+/ezf3VuW3CambmpBZNtBFU/pM1V2MRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbg3AcPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAnBa5M9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbg3AcPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAnBa5M9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S86s1189656
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lHwK4kYGat+g1OrVhqOYmlqdCXRt3E1v5I86m6bCA60=; b=mbg3AcPAiU5wmwtz
	hpVcMcuEpoUK6DDQftsWwzPCSfhxLYIGNyJnIl9PZHKBuRf0NR/nI4T7khqn9P45
	Uj4jhIOQuN8NkKAUOwk6e1fk3aUWJsLKGcuNRaA3dHFV3QTHBLEAOJD/Vkh6KJXG
	PB9ZPaanYvvEB6xenjN3f0dEC0EKgH45XQgE5wvBPFGpMpQW3vttFr7okaQ8lnr0
	fYIQRN4e/0WjKMkREPUWncca/wyJ6tZf0tJudcEl1uo1Z9vvzGTe43B7Wa/kROJK
	X5bA5/dUtKpTo93iZN1urCy/g+2P2esN3K1wjIoOjv8MPhEvgoyLr05NDCWtJCYZ
	OhLZvg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v29b71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:38:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-529ae8e96e8so15823901cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786361889; x=1786966689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lHwK4kYGat+g1OrVhqOYmlqdCXRt3E1v5I86m6bCA60=;
        b=TAnBa5M93UY7ws6HYVxlRhcNMuLVoAa568HOU0HqnslkfJfWG4SAcAULz/cC1hZTGP
         syy2FXR++ea0Vcbvgp208j7KPxlojL4sPTsJcax/it7Qpafb9TW6olno8fRONGRhpg+T
         kCe83gcGRVCCK4avUizuOZtaGiVjqsetYQXx9tG1GYRXiz5ALByBOkrbw4WcP5v0+Ewd
         XfZR6d6Vta2rU6VPPdb3tBi0AShPmdx64WUBdIgwWMpbwEnydNNKIVsMsW3xQQANGwd8
         OUt9s3TtLpHqVQswekwa6o7HAhgNDqZ5n3S+8LWvkywj2ZC5DNWfL8WmnsmECMMe8+oo
         JyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786361889; x=1786966689;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHwK4kYGat+g1OrVhqOYmlqdCXRt3E1v5I86m6bCA60=;
        b=IbC5Ji/S8JkZ+5whLzCl4HMYP5e57fpb7zM1S6V6st5fkROsIQHKG7pf6Nthpe76Vr
         qICyOILj3pUagKEIsK9JlzqRNELPHI7RUasoRjUI7QcBmx6vpR4+xGDbqG1edZ1UvfKz
         wWzgeMpylcRqhOvBcIewgGUa/C4WsSmVxTwt9R2ihEqv45cwsjYthjypwrquQsQonn9i
         Krg0j0q+wGhDY0+2ucrNliyMY7ZUb3IeGMSdso3dybfRkM1yZx/tnwQhV8t7QvEbqah7
         fj4viF0VwhRNXUWDpbODt8ybsJIoY+CbSt+uDNMBonFOIue3QzVKlBy1q9k1mQDBkWSy
         wHwA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5zntZGgVlK/xVTO/1qEwqqqBwioWO4zIz8Gayk3FdtVJQUUiAcl0tQEbkXzHJg6y4P7y0yP4KDwE3@vger.kernel.org
X-Gm-Message-State: AOJu0YxhNbKY85KSkdCAimQCn7Mu9IG26zOlXd8eUMuuPCpTrq7f6mHh
	BllrMRFosFB3jb9CRlgZQhdN4jzw+5ufQXzHkCdkdM7CylsBXm59gRNlg7vQyJ1FF5zMEyplkSJ
	nkV2IARnx6DCT1Lt17/Kr8eDzT1l2ndgum+QDybsdBOMmIyRURk213o9CdghwK3GH
X-Gm-Gg: AR+sD135zFsPzVSig76ZgGy1Nk6UMR9uItZcl30Wzlute8XLjcsHvDTGAJSkHW8UFV4
	xkzv6EVAq452qqsA+nTA0dmG603Ut1Gh5qRqSpH0ffyUEu37rGEoiTD1KLhidqEKFNSqoo1sB9b
	LfsUk/DFUmyHDBhvrBkD69lwyP14yTt+VBguL9/4BRPBxxPq7hjArq9tul9zTDSzsjGTkNm+Dkb
	FoVYXDsyKRzvB9JRFHFfbPZataSNZWDEw/WP82bRX/rd28XSQUDApklHgccbLTHdPKz/rUOtGIN
	HIvEHC3GB/D53pFHFOt9U/IuracxmO0LaCt+Nx1TpFXaKOC2GbD5XmIlOvucCNQ67ivDNscHcUI
	hrbdzvd33cOqpt6mYLcJnrysPFu1k
X-Received: by 2002:a05:622a:5811:b0:51a:89c1:1eef with SMTP id d75a77b69052e-52d4bb7c7c6mr11211181cf.14.1786361889604;
        Mon, 10 Aug 2026 04:38:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5811:b0:51a:89c1:1eef with SMTP id d75a77b69052e-52d4bb7c7c6mr11210361cf.14.1786361889104;
        Mon, 10 Aug 2026 04:38:09 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfa2:33ac:2282:82ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145589sm36117311f8f.1.2026.08.10.04.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:38:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Ye Zhang <ye.zhang@rock-chips.com>, huang lin <hl@rock-chips.com>,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/4] pinctrl: Add support for the Rockchip RV1106
Date: Mon, 10 Aug 2026 13:38:05 +0200
Message-ID: <178636188265.27644.8818691655755329598.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729132736.3807082-1-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79b822 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6BMtE0E8ImWS15-xy3gA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: JlNSY0ABOMOfB0RYXaLuhzonfF40a2Ct
X-Proofpoint-GUID: JlNSY0ABOMOfB0RYXaLuhzonfF40a2Ct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX+Ge+7jINkAGY
 l+j2Z1YoCfG8IG9vq9UC00qOsuOPwVL2JTRetR/4ubq76qXSbQDZG589KlOjakl7ejQk1LdQpow
 3t8uHR8Uha1xKhbr/UaheK2Tt6b90AI3C+tt8wQmNhXECe/4dnOuy6cnYVwJCcWiVPywWLtOTrW
 Y6LDOiaMLNDaCW65rhC9T4EA4PNqhlK7DsKTK2RK257u300sOhA/xbKV/eXKS0jTihQhir17zW0
 1s0G/88fi48kOvj2S73XXv+zmsDJs5Ldfqz0Bt6rFCPFgqjM6KlfNkbi03iX1O+XzV5LDGkGjWI
 xD9zu3lBozVSUqsGCfbwqHABulINylTiOhTiAFQshftEet21TMRDImIMZ9fYX8m72Z1VHWTWAvL
 PqElWmpa0zuaKN1DnU8K8M/HfqPCSDEiNlmsMJH7vK6ApXYwwFozq+QbNHS2wiK5Nz33zJ7BTIO
 6gNa9ResDEPqDdgDFNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX2cLQ1LVN8pvH
 otHldWFirshffcfar8kp6GKO0BhSi83B5Dsti806Ak7P97QzlBU9JsxMy5O1ehlWArrWw7g0sCn
 a2Drx+2hcI5bwgw6K52IJQDOEAKho90=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102


On Wed, 29 Jul 2026 07:27:24 -0600, Simon Glass wrote:
> This series adds pinctrl support for the Rockchip RV1106 and its
> RV1103 package variant, split out from the initial RV1106 enablement
> series [1] following feedback to submit per subsystem.
> 
> On this SoC each GPIO bank has a dedicated IO control (IOC) register
> block, unlike earlier Rockchip designs where the registers of all
> banks share a GRF region. Following Jonas's review of v1, each bank
> node now references the syscon for its own IOC block through a
> rockchip,grf phandle and the driver uses a separate regmap per bank,
> so no regmap crosses a block boundary.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
      https://git.kernel.org/brgl/c/2f2b1a84fc141575eeabfacbd7c35af0b5dbb0b9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
