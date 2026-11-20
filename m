Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178455;
	b=k0ebsSmw1fLMTQt0OyFvLDYL8/+I93ZmDvf8iqajdLRNTioa8qiLACr7RqXjylfG+y/L
	 McVPpDp2ehp29Q/4G4siXw59fkseQE51GOL+9IPRzhZRno2zAsPtlajzOSrnagH0O83pM
	 aXfR6ZeCDCLF92iNHRM4cmgHK2TVwB5jrYbfI7lJU4qc6dwrEQcdBmHvGfRGRm7Mj3n8u
	 VenwxX2MxIq8Nxo9OEGuaszh3KeLZn51T4dLozPpIkLzAjroZoXjSNqaXfkJmc5YqCWIQ
	 6Wx3P5rp+9yGFc0x2rv0HoOUcsXwPz8iqXAeIgx0GXBimtmPPyXtoI7HpOkNt93tXCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=;
	b=YbivdHy/F5EJHRNbmiSq4RZODArj6O3U1F9dGq+6cGGHo2/sC9dMG8hwJysG1wSGEpIB
	 tmIFFzoveh6Qeu7BbNWJ0PTisrNQRcOVwJL8ILJiePMj9HiqwCzmZG3IXBMXHb6mugjBc
	 uw1OB1TRa4Y/hLXvgZxLUea8dQspqAFsijgPYhMBojOqo/LRVNp03cq/yODvBEjeB7jPf
	 pA3nddnrFgePv/Qe7n+AwHU1Lepi8Uos/hqjz+Q6W39umuSM9orhns9Bv73zchQ9PeT59
	 WBM/W32QohWEZOr/ldpPKjh3ekPRCAqzE1CNyQpTwC162yEW0WQf/fF/8IFx3eBLOHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3LWWR8c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQOW1BeR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D07606A336
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D07606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3LWWR8c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQOW1BeR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtAk3731152
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=; b=F3LWWR8cu3PlTHc7
	BfuLKFWULnraZ+j+RnzaIxbEMXWguU6M5pZ7p6Gujwg2lMz4cQJ+iPRfILoBaZ14
	F8Ps89wxZC3877ad5we5IR1CqLG5u+ofVvh8JaJKCsyKrAPQo1VEdDO72eZODq7A
	IRqRtNI+d+w6M/tY8RjgBSgUTGFIrfFqpJg54XQmL9VVL1wekFgdY4rQgtBZp9x5
	akB53RPNEb+4uyMubB7e2H+SyveVewXkd2KeHG+YhCQlwt4o3F4rklG3QQ9+ylhk
	dZeM5u4EzgPfo0ua9ts95sF/KHN6vjFwMgI0mZj7ajzV0IUvDD+ytiyYWr8iC69V
	5QfGDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4gf89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:40:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495c71055bso197936885a.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 04:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178453; x=1795783253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=;
        b=cQOW1BeRVDBHZIZOq60fQfgl3aOx374Tb/gAZC4y7sOgA2q9R7RCGMJM6cE+UbHUPb
         5ylKMiP9g7JRcYlNqCGx8a5ev/+Ua0UMxRilI6nUJQAC8jtU2zB+3jIVvP3gd+VtPK7t
         y+bu47GYgy5Uarz/7sSDu7p0WM7StXj9CUQjHODDeBGqduBCIUqw897XoD3kyzOlsKqe
         s887tqfv/Oh4pB/INPSMOcMOg8Kc2DH+dp1vjgaADL7zK0INBsXPjhgRjTZnvkrMR7yY
         QkiXdi+wcU9k47jfS0DSlNTiMPv+7G7iLQaaKdegvR8lcntF4kmC7avsY0tH5oDeC6Kd
         QOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178453; x=1795783253;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=;
        b=i8oJsJDqHTMotQER+Vl/AHsutrnjpw33JINQFJ4WToMycnzzr64Z6Gj1duAl5kKIK7
         CspdyvhNBTgQXDOwh0DFB4cZVpiKzp6FGTDWdyo1xQu5vOLLwlDINi3a4yY1Kv2IUXzZ
         ey6Vg23Z/LT2P9iTXOFvSIukLhgFQ2qLrLsqESHFCuXws6BVSoP6Ms/+vaoIXDAWZg6C
         YzuaUwu8aCRB1lDgDmVa2NK72J6gL9hTagqJ6XLZRXlE7om80Lqk8oOJ6wACliKhyMRD
         0e/vn/6MYxvBWUVJBhZeDTuF5Y7J5tc6E0b5ku4Uo7QziJPAVJ6xESkLDgmeGFHfj3Gb
         nVtQ==
X-Forwarded-Encrypted: i=1; AL+hErHxfVfq4pC8qs3UheQZW9tW9EA/pK4qcFD0sQLkzU/dyyfYZ5fWeKhimQok+0bpkQv7Y4ZUylvfGd9y@vger.kernel.org
X-Gm-Message-State: APuU4Z++ApbTTgLhEyNdXOeLnfxpi+9yL1mrgcXaiTaVGIyu6tvG2z5K
	JzFk8ailD6hz/g1AoUfE6xWjylH76kep8YEgIiVY806GHdgvfh2wYtntGNvckAMoJC/zS7OrFs/
	s5kwRLQOxZuZ0vg0NGuRfejuGOi7f0hBjTY9m2S+OX+t9nmTBWAYYw3J4mslS38yq
X-Gm-Gg: AYBFou0310tn7hzZSTK57kB0SprFj5vf+rE+ED/O32xst6yv3u3ujO275Rp+LhTvE/b
	zD3KwhkygLth3P8v6RF3MQMlIWZ2vnFM1FxFpk1Zvq/DxV69G1XkqRrYN7ldAfMGVPlEkQg1rCG
	BAna+4FdRobFDQLECWarw69SqekmtQpLVqFBvqQEOefvhQxmnBAOjH4pKfXcJ7IV83N+cxmY6tU
	xA9fMtFF3FGxADQzh1TZbqXW40e+U2Pv1Cqmh7x4W4bJUmIWazw4mMf/KgaZQQlE9UlD3SZk7w9
	aLVqD0/qXgkXfsr3sxC/sXe2IrnCTxwPAK168eYLAe51WLTU1ftcqxadnSQo1jI1CURsEpJ6256
	qvZFa4r9MbDkhmN6QKeYX8CsU+HBjB1lY6tfgazO0FAuFAlYEqvOUy2WlEEt+eNBce5iTM1iOg/
	k=
X-Received: by 2002:a05:620a:444f:b0:947:8344:17a7 with SMTP id af79cd13be357-949ba827c5fmr440599885a.11.1795178453052;
        Fri, 20 Nov 2026 04:40:53 -0800 (PST)
X-Received: by 2002:a05:620a:444f:b0:947:8344:17a7 with SMTP id af79cd13be357-949ba827c5fmr440596985a.11.1795178452661;
        Fri, 20 Nov 2026 04:40:52 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm4234481f8f.35.2026.11.20.04.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:40:51 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        "Ivan T. Ivanov" <iivanov@mm-sol.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied
Date: Fri, 20 Nov 2026 13:40:47 +0100
Message-ID: <179517844380.14049.7516898628067992811.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-qcom-spmi-gpio-cache-sync-v1-1-190440d0ef3e@oss.qualcomm.com>
References: <20261110-qcom-spmi-gpio-cache-sync-v1-1-190440d0ef3e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: WWO4RfS4ilodTFXlTL6c99nZaYcA837i
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b003fd5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HdM17cJtqKwICtWzaswA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXzDq+K7cL3CXQ
 24YWZwy4GpZltv14ci5bIkiji8JEE53EF0Ct5TKtsYf+8TX5ic+qF2252GIbZL/RSlmKSjWZvyF
 30206XW1pBLu3gF9Rp8itiG6Myeswrc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX8XCadqqXHmKO
 4R85FiAUy1+T9i8/9PwOIguyRhd3tFYBwgCheDThbW6WTx+1MXzNCz6/Jh0M8RERpFr+/UqxJ7A
 8vz6BQNNxBbvw5M7GDKhcIlyQ5K8pPSSkC8ncaO4lncqTXf0I+sxpHeCVn6YcfIKTkVHxdULKg4
 G4p6exZBRSpQFt1N/dKtfwCfMnmBd7+qiOju8dvbZ5M9YP1uzONfk3wU6jJ+ieOG6zwyuFTODkb
 JuU/fj0gTx4xLwzQyDW2aMXEQEeH23NrOF8xli2hoF8+6CMjTtlNoIQE8ydUxgL9/bAFCI1Lmsm
 g053+wQe39HJ/I7bgu3e8B9XEFm1SgcTMCbWsEI8HYyPvIPUdUzQr79mHo7z2me5d2H5G3wIDNU
 EpAqOPbzWMjXLY/JPztnPtsgZcHm8TMKCqqnfPw6D4E8Sq9Debix1rYJdpa3DCz1TJ6NPn5p47r
 84rdtXCxvnBoYVViWLg==
X-Proofpoint-GUID: WWO4RfS4ilodTFXlTL6c99nZaYcA837i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050


On Tue, 10 Nov 2026 16:14:19 +0100, Bartosz Golaszewski wrote:
> pmic_gpio_config_set() modifies the in-memory settings cache before
> performing any register writes. If any of the calls to pmic_gpio_write()
> fails, the modifications are never reverted and the real state diverges
> from what linux stores in memory.
> 
> Work on a local copy of the relevant pad and only modify the cache after
> all writes succeeded.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied
      https://git.kernel.org/brgl/c/21d7ff7d6531b3420727539f04470ddae499592b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
