Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69BC44C65F
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117784; cv=none; b=mmUhZpxtViQn/sM+0RjNj7YXh9DY6jdc1VBH3wbCrUFl1A0TGFEVWwnHQDREfJhMVw3AU4JCejKT3VV+Ty+fQg1JB0WsgGKjthTUx16NsW9hGA9QSIj6gagWwyrhCpGrvaQ9FEUBKqzImcI/auW4t1WNJcGuWsmf0dJmxaVywYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117784; c=relaxed/simple;
	bh=ZgQliYmVE1lBTHE0bj1zPBkcxEn4Bdvmrj3fE184mjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CXUrayrWS87ikNi18bG6/v4J4vge1jUU/uiS+r6ShZaBKldgdhmlvjHupnJyMZER9UEFRCjDdzGtfwZJQZ5e7dL4r9jk4Uu3dcC+xGHm8X8AhHDURBJEouJpYiDpcaV0bv9BSOr5OwEYGDwBRYbo3qJ1hNrlHEhNQc3nRNFj6iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmZ7BBxW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGCyIrqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmZ7BBxW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGCyIrqP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBca1Q3766603
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xAzEXbpzsfN0W9pJf/x1CRXBQ/6tp9oQ7JRTKhYAFk=; b=CmZ7BBxWHNVIiE7b
	9K5FHG5xi11tYAg6Pz3uhz4my7oUvjcWXl4PmgKDnAXWxzL2YxIuDxV/ReM+bbKa
	2cydCZkDYBl9ZiWSNAvRG7wToFurk3xmONkySWWIy0zyQZ2r6VNZXt29gk8/XRs0
	oY3Zgd/VcHam5DI4T7YD96kxET6QvI2SqvW0ilWo38MOj0mfJIUPGPNlMSbW5ebx
	RgmD4T2oqIx7gZALqFl5wl6aXQEhIc31ND/r8iKfO/HyF2ZfDRJS00zNfLEBLyjA
	uiAB6m+ZvnbUijQ6g0CSZ83AX+vW+RFPgh8+Gv/8kCFNnhUbtKqjelEhe4GLtJhz
	9RUN6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558j1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:16:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ebdfceddcso6831181cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784117779; x=1784722579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4xAzEXbpzsfN0W9pJf/x1CRXBQ/6tp9oQ7JRTKhYAFk=;
        b=kGCyIrqPIc5hf1Lxje5ozJk+s7G6AwSg0ofJBBoMXuptDH02GLwfANBHOPrDfL6M6/
         Xbi1n5omT+f0BdFinbaU4q2MH0coxe1/ANEFXMnCD+Jjby2tuaGel5Wb2BzGVnkBY5q8
         m5XUKkdcQgb8quwNnQrogEeXl0Qigg22+ftT4hOf0PLZ1U2yA1hiU6Ca7s6eGeDY5ZsS
         rXrewlDo7ENS1hwAhEXN+6sGFeRx0mP2faPCgj/tQelWKTjPoXugwVA0+CdLy14sxQoF
         o0aVTMsyViF2+B/cSY6dUJMUpdveSvDd7pHghM0iZ6BhxpzzJe340doC2gMUcTeactM5
         AvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117779; x=1784722579;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xAzEXbpzsfN0W9pJf/x1CRXBQ/6tp9oQ7JRTKhYAFk=;
        b=PURtT33ADY7PznE0Ni9pSDyixbpfiPS4NVkz2fRGshStlaZmA3P9CEyi0CUSgAKGVC
         F06UD6wMeWei2oG28pL8OyTyxb+MM35UCoDhvjBTrdCcLiOexyEQZNRBWoVQkut3DxpX
         PtvBiZvqSO/gs/pVL3GliwedN38Cy0FeVENVBF/V/j+VEoLWucpoUSJgtesHFmT1dgUy
         jC8RPCflY41h4k+JEFq3gpSEEI+yEIPcweGNKK0J6uy04V8pGBBYkUllxnSpyyLNHsJL
         5sTGHwBGBSslz/2YSvGrs7rDYiF3Dhrtsql39oJxDnMtGibdkX7NHW/6UAJ4g/MAZIkS
         l5wA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8RHJd3dVpgUgVj1d3Hv1ohrBLHswpnij3KKemtYBiuu2M0WJUIsaidPbIt5C6LGGSdV1ceD/3jCX6@vger.kernel.org
X-Gm-Message-State: AOJu0YxGgU52RwxVCOo9LDlf6odqmoDJuwuFqvPvOslbMPO/q3/7CVtK
	twarPFQanr+jQv8Zm+54z5Dyl17OyzhyFSGLudj1qUMgOjyQQW+I2caKI5dB0uqaTR1R4H32JsU
	HqhQTimaE580gljUSjBlDCGsQgyI6S9GVFfyOCdkw6XT1j53nzcK6PS0MwDUWhWli
X-Gm-Gg: AfdE7cn3as37Xwq9qKIytpXEJd2idH9HU7MwJWGClZzIHDANH9PGnb6lQQxDrt3Rt5Y
	TGjlg5gagQdnAR8vKnFfKeMthtQErKpa6DG45PUmT1pWqxTcG5qTXZzlEzNiTB74Jy1jefBCUcQ
	ZUMSpjz+Zcaq4GvyFEdaLVjz1wFhwv9V9mSWabfGCTwOyZg5FtIu2WoF6n4QxR3L3XaCIf/1CVt
	t1fuDcn5uLUUJU46+6xWaGfwoRzzOk26SsIDoO07slO2uEZ6wyeS/7nLSYW0/UbTorG/E/88A9S
	Z54PdHpZhqKVEuluaL2vo77EXidLva7Qju3vfTOQC8dd6W8wVnSIYGRDcKEGCWQ47TiFT/7TNtr
	w9iKTkFkWkfDDMaUVPIrsP3i7cz7YrmhS7ih/5sU=
X-Received: by 2002:ac8:7e84:0:b0:51a:8c97:9391 with SMTP id d75a77b69052e-51e4f12e7admr23055241cf.72.1784117778354;
        Wed, 15 Jul 2026 05:16:18 -0700 (PDT)
X-Received: by 2002:ac8:7e84:0:b0:51a:8c97:9391 with SMTP id d75a77b69052e-51e4f12e7admr23054651cf.72.1784117777741;
        Wed, 15 Jul 2026 05:16:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1716:4a80:ed58:2ab3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464caeffsm14947235f8f.36.2026.07.15.05.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:16:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Daniel Golle <daniel@makrotopia.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpiolib: tolerate gpio-hogs lacking a hogging state
Date: Wed, 15 Jul 2026 14:16:15 +0200
Message-ID: <178411777251.18877.15051361128846466144.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
References: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EylSTT09hZ6LU2b9FyS1uyySeRA1Dcl9
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a577a13 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LCXYudziaqtIdDzv8-QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMCBTYWx0ZWRfX30i9dNHFrtEv
 SgXWTYX+59PWoH5PHLOp3xUrFKoRjr7Yso+K1/8UgCOpnrQg2+t5Ruvo3eBXp3gyaa0Nxh8ECrV
 fOcW7z0Q3+fg4x7F/nTWKu6veMGJ/pdCMixv88sLmx1GB7kOCWepB8wl5gv6pTYtJnHK1q4K1rz
 7jAo4VTFWr/dTBUZjyzhVotTRbAfzMRr/wfSPK3oxNV4XrU7cObRK6v0WY8tVYXgxMF2+iPEXw8
 tVALwuRNDv3v2fmRQeKPFJFa/c6SAgk/f5hbIF3ya02MXUBnTIzylp1+IWKruFqIlvhbYhR9Tag
 6QZH5GwYE/GyP/3sx1JAlVO8rPwHpR+1rz3L7Ilo6nuxn35Xx8Y4Lgfl75ZqnJ+ksuu4kfYBifL
 LKxVKeKv/RxBcSxTMwNoajWg1ZtHCEogSI08jXvvBUdnfSbykopav75rLJyzxvV/5uiw6obl1mb
 vadbRlVLaBOz4PI8/mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMCBTYWx0ZWRfX2jnGyWWIx+Jz
 oxwYnYxtnZrJve7mwJxEnSp6oX2BV6lVVY7y6BTxONH8RmKAjOSwosSrqBexGqUtxDm7S3w2ga1
 CSKY7PtWiPQR1TylvExqLt3i3Ra+r3g=
X-Proofpoint-ORIG-GUID: EylSTT09hZ6LU2b9FyS1uyySeRA1Dcl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150120


On Tue, 14 Jul 2026 00:30:53 +0100, Daniel Golle wrote:
> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") made
> gpiochip_add_hog() return -EINVAL for hog nodes lacking any of the
> 'input', 'output-low' or 'output-high' properties. The error is
> propagated by gpiochip_hog_lines() and fails registration of the
> whole GPIO chip.
> 
> The previous OF-specific implementation tolerated such nodes:
> of_parse_own_gpio() warned "no hogging state specified, bailing out"
> and of_gpiochip_add_hog() stopped processing the node without failing
> chip registration.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: tolerate gpio-hogs lacking a hogging state
      https://git.kernel.org/brgl/c/e1cc8fa0fb9e5112d15f2c310b68ac316981c06c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
