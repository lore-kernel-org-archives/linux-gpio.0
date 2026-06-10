Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7482640863A
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098170; cv=none; b=MydW8Aon6gVNcbv9GsnsoWZM9wzyurRN9u2Oe3yp+w2J0w/miK2l666B2t6pTPCfdVIA6aAZz5zb5yppmS/uB4mphVHZ2pAc8rHYXjexfCX4P8pQeC2YgltHLH+maht6sSSrssPI825J5i7DrK2MKo9vkV+Q997y4zkevQ6Twfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098170; c=relaxed/simple;
	bh=eLgLCkXJH4rsfH8EMshcJQm18PLXeTW3MoaH2YFsp3U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sr2yITvkFd+4QGFxSO/oj32eK/SO9YesKReLWzZXVIRchz30X7RdK7i50JXAasmtsUX00kKJ906RdwK1FjK+m7lnnzFvsyUBNw0Reu0vEg8qflVppBMg0/NWZAr5m2qGnykYiFtdWn1XgT4yskHbt2PzTbENkD9VRjtf1zIUUIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIpdN16J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4yMuF84; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIpdN16J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4yMuF84"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBxDP1073141
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0KwcgCsvsV/u2gE8U+BEel
	HXnVk9VE4dj74a0vw/hAk=; b=NIpdN16J23aXriBqUWCvW4rPgEamHfGI5/yTIu
	nJt//x0yMU/IrHeN6tckjw5Mk9NNISXvvT1UGnFec1R7sj5D1D9/iiSraUsEgoFJ
	2OS0aN6+q0oYomjhvsbt0Cl6CWoxPMXWbkjJnif08UmOn5X9zWJ4E3oQ5Dd/1SyI
	gnb0vUfRp3lXAsBXg/LNsjmAa4Ksc7eUVr+4jA9qibM5go22lukpEuR8gqiUga5M
	5xobU1xb+YMVBfHNCj6Uq1CJnTpQCLPpqAxrJMWvlkH3iqwNZRgLOygSpWBC85nf
	x5S1nJAjFiiaEApekhk3pTDflT12S47W6wXzi1iXg2LyeQVQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvjbyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:29:28 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96396658728so2049014241.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 06:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098168; x=1781702968; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0KwcgCsvsV/u2gE8U+BEelHXnVk9VE4dj74a0vw/hAk=;
        b=L4yMuF84+7nLmBBa9CwJw1QqQ0bBqLrOJBQhrV7PTzxEv7//6+56IoP2KPCnCCh/J0
         ynJ2biFAXMmwcbux9u0wNKPI7K2RUQMd4rEhIWG4BA4IilutaVmfFzqlvEk0GPKJwNOC
         m7AgJispRAc1LQtGdMMFZrld3TreoPUZBXtC/3MMw/YNu/9aUntw2qX0sYookWqrtmuf
         8M06PrY8Zso2V27y/CM44DZlAe28G6DeOArYnefNZ9qw21g4kllt50uxbLcufjdepN22
         1O9QfKc/QktbFsHTttRWbKUlhywYM4ouNc1Da22XBc1Wwz1fmNEz/IN8vXX5Xt32VAwj
         pdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098168; x=1781702968;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KwcgCsvsV/u2gE8U+BEelHXnVk9VE4dj74a0vw/hAk=;
        b=bV9ja91BIR7pnXlF4ZgkIdiqwQn4FpjNC4ru7Jb+/lvKyf1aq6eUKAPAApm8lhSYsB
         kNrVBKtM2UVlk5hwwZ7sLYYwnr6giH2mYzHWE9jfHw96muRbogN7Etifk734y2xBK3co
         8PgukubMvb4luq/Z7cG+jrYBhABItGBbxhej5o7nVgZObjc5PgsPYW3rAkQOlsyziRYb
         FXIEB+zYg9E9wTHRfz4EdpPmdIkAngZhaNJbswiqCPpd7G5bXPBh6hwLC32B6BX34136
         3Fy8Y18FoTuUCRs/Ro6tLOhFMgB/t1wJZYOh9L2093Mqz74YEuYxJL1p5Gpr4QWusBq3
         /pZA==
X-Gm-Message-State: AOJu0YwnuW38h2VZAZjIkPktRFFfS9XHtQ5KHzM/4fKIh7lYCJGmkuyx
	RuRq/3Qj4hlUVq4LV/sgDjyLYi5ZJWMdH3be2s8lQewQoSp/uxatR+0b50sdHk0hJmewgpra3pH
	5mXx7CqtglEig39QT7QmCJwPvCR+XGgEf3O9aPVWNXUXQsWivDLKXet2dwldWKN6R
X-Gm-Gg: Acq92OGLBz9K1LHufSsZUWlGlTvRxGdZVrqUzwhu/dGrGZhnje/Px4PWddwe8WNQcRO
	U0BiUL15ntSEGXISAufvihb5A/6x8MDToSfRmLKVs8xZ5hBPsT504wyLyzzuqQKzzxRA8OrKMvM
	LgysF04Utg9O/Jyf/hv72kO73Chg2vRIxr3keTxv1B6AZMfQ8rU3gvn1xbpoT8y7+w8ATxuBPJr
	nswUwUSp1kDeK5yKdZV9lxgWVUA+dUDN2r/LyyiGnUaExgV5SgM098VqJh3sRmMcocsJm2V3HAf
	p0pT65sSrAkgLoXvipauHM2ipSDHvWkFnjk4+DxrFg9e+C+7FRgGaKKMGGpypzkCU8yMVWc5InX
	79ShZI/wELQpkp/NZB8OLu38JW0iOUkrIeTG0jsWO6upK6Bm6c3sX892hr0JRxQ==
X-Received: by 2002:a05:6102:511e:b0:639:3b08:d64c with SMTP id ada2fe7eead31-719361e4657mr4175416137.13.1781098167707;
        Wed, 10 Jun 2026 06:29:27 -0700 (PDT)
X-Received: by 2002:a05:6102:511e:b0:639:3b08:d64c with SMTP id ada2fe7eead31-719361e4657mr4175399137.13.1781098167239;
        Wed, 10 Jun 2026 06:29:27 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:528e:d8e3:7d1b:c55f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm72895423f8f.2.2026.06.10.06.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:29:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] gpio: kunit: add test cases for software node hogs
Date: Wed, 10 Jun 2026 15:29:16 +0200
Message-Id: <20260610-gpio-kunit-swnode-hog-v1-0-37b3bf37096c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK1mKWoC/x3MTQqAIBBA4avErBswI6muEi3MJhsCDe0PwrsnL
 b/Fey9ECkwR+uKFQBdH9i6jKgswq3aWkOdskEIqoSqBdmeP2+n4wHg7PxOu3qIWupWma+pJE+R
 2D7Tw83+HMaUPO0s5V2cAAAA=
X-Change-ID: 20260610-gpio-kunit-swnode-hog-a0a82c953bae
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=668;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eLgLCkXJH4rsfH8EMshcJQm18PLXeTW3MoaH2YFsp3U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqKWavQtpfm6h01Yak37TcRCAi+Ay8rmRoGQOx5
 sfLy/iqVWeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCailmrwAKCRAFnS7L/zaE
 w75OEACf/SrprehqrJJImlx+PkxQPwMnYEl3FqCSkIw7znuFk0trsOAkVU111Sm0SvRynxNzdNm
 wjb5eTSZLaE3upnIQ9afeD7+JKp55HATR1WPYhgvtglvnRnDMcL9ZbvVZkYy/X42DMmwb5wGQiS
 6aP7kmKGBX2Quj3NKywAHuR9HJ68SEg5rYg/UTBQjRiY9B13qeK9kAo8q/5SwvlaID1MQIFenIL
 vgJUrmOQosyEW0Xl/uWvO10B4Eby6Y7aHmeafd5JgKumdNLwCOoSjbyQuWbK1oOjJ/NWxyPfE24
 sihbsouKtr43y1fIKLPKZyTKUMHL01feYEffOVZVWwseFaJZTyd7gmmOhf3/8rY9FzxL0d8JGHY
 ed0zDe72XE2Dx9ddyBweLwZ43Vo3ZVYbFae5dUpRrvnzJHyU7X/KPjSNqegd9AIIym9A4GRJU8b
 +nVTVK4KYk3h8A7YLQyTnSQ6+COXLsksLr0FNBMMKKOF8C9wTPIjXrncVXEg/+6lW0CWzULFZuP
 3q7M4eVUK8STugMbZvPCMHUxrtnVhRssyXybu8f1wK+psO5EIlXk8I25PHFWtzZ0wMMzwbKKjSJ
 U7QGkM7mjkpkZSJRNxfq2sO+vsKeP3B4BPixjT3VDDsd9eIPP+Kl7UPxaxRm1S9JqaCMKjJWpfE
 vSrrLL9X02J8qlQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: -lhsSLLVz65EJ3ZQlVengt53W3YoPP_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfXxjwcHxlCe82n
 1kM5EYeYyA1CcrZVUAszOARn7P5jYzJ8gt6ono8awePNOwHYOE60kFu28QjFP265osDU/ddegaI
 ngvSjyz5E5kjF+f0LIqtc2pvKiwTYMmXfR5L1fyUA0E6iVBcUGxqWfN6iEDlv25MosewQk/c35B
 qlxB38lVj0b20eA5RPLThCWmsCTBBba995hi0K2hoiptJ0QoAgOLRFvxA0QHTlVEQC5iGr/eR3k
 c8SshCX0ZzcZkE4Mixsi5No1unUBlkNHA7mXNHGwn/ShOGFWWFm4Imo+VmIOy6BKZJKP136+IK2
 NMy8Wu6suidsIORXcNekF96F4vkUE4x8OOKrRB462tw+/gCoA0ktyfh0Ecyk4OHb4WSTimkwPF6
 YdLm0jloZ3V3GS/KE0IQ2rWGt4WiLGqZ9S0MDO3J89nqnWwzg/oXEykvLMQDC5nBvjBW+Pvlo6e
 j3PLvuSiVrz4YxKbqcQ==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a2966b8 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=uV2QM_sGPFoSac5H5zgA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: -lhsSLLVz65EJ3ZQlVengt53W3YoPP_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100129

This series adds test cases for software node based GPIO hogs and also
contains a small code shrink in existing tests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      gpio: kunit: shrink initialization code
      gpio: kunit: add test cases for software node hogs

 drivers/gpio/gpiolib-kunit.c | 280 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 262 insertions(+), 18 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260610-gpio-kunit-swnode-hog-a0a82c953bae

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

