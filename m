Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178453;
	b=byO0R6d11bTZBBjjXsl2aktbaFdNyVHrZquQT3ipi2lkStpgyBc/+dCSnU+hNInQ+Or3
	 AfKBUmYeWYopncH49grH7X/My8NU1hNquha7oNADq09mVpic+KxmUmlYSD0Ml2/AOwnNj
	 G1i3Uyzv2euO6l34I4V6aMr7xvdt79/EHF+C0cWSUgNxPx/IbIIbnMcvFyt63n3vzRJEd
	 P9Q/dA3on+8RQ2cdbuokCDu9J2rgIM5Mz4R7Kw0Bt/mHjvrj6qilTDF/sxpVHDnhotLcn
	 dnoge5681opbm6xeH8AM8OA4ED5U3p27cHk2KuZzk5XSAcg2N05Y3kkxIer850akyQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=;
	b=xcydsKXjGLJf73/qcbQ8Kizmzzr/tQoTag2fhbKf6iH18WVz1+Yc4NycmYJaTXENyxEe
	 CaSeoMzM+CBwxWvTL7ctMJfpsV2tW8gB0VbaTm1xdSVUyNkUC/NqkjrxgMIp+lVtEW5Ft
	 j3NhOwH7GEKlbEpSg5iMKjbgVnSj4FrQ01VrGQm0PpVddh1MHamI28ubBxSZehe+x5H/9
	 riDUZtQ7S6vDS0sDGzqGahA5QrJKCrej1jOZZLu/UML+FIWyfJxf04Wg/XD1SWXW9Yc8i
	 /pIDC6oYU7MwpTlx8bnkO+AdxQdwoQfFDsXngxuKOLKDr30xWaZzThwLsnsV9U7SEOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XBxjmaAK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJnKocLV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CA7606A332
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52CA7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XBxjmaAK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJnKocLV
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk8lk2155558
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=; b=XBxjmaAKzcY5UscK
	5YD4LSx69w+xCTAdSAr9bYg5ti7fg6Ha3cav6oQeGTaO5APW1wq050lAb7FTHKgf
	snUBdfsNTGm6DzcGkpLNyi/Lwd4qebVXpIO/9HSr4MaWiCNN+nT5ffOL/x+rCTXs
	p2K2zJdr83g7BC+TYJfP2mshHR11GaZaCF63LMu/A7MUCyE6i4SEQYByH30XEAqg
	BpwRh8K/ZHF1wjx/mBvX+2sacp3L9DV2lJmmtGwpElOAW5gt0+uaZQHZ0gzHo+3v
	YEXgRJF8L+t3xB2G9wHpG+T4J5gsL02XPaY0tTwAl4SR7wG/HJ7qKjHJk1PrrbRa
	INUEJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhxtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:40:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9496ff065bcso127562685a.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 04:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178451; x=1795783251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=;
        b=TJnKocLVeU+LkqTAJDdSmp7HlO6ZrVVOSy9A9YjHbhGw7smjKhmtijpNMtCQw4yQv2
         D+04BVf40w8JNzisPisc+qX3DJtF5kaHOYK7A6l+JrupeEp7RJrc9g6skPi4L1f+M6Kk
         gLwMjEPyd0Xsdg4pP6yu8z1xsj1QzJbpx97IyYLiDlmVLqEasAAa1hqTpmg89W57OAXi
         YYDEt2a+GGGZtgENeYTgVtSXhFYmp0jBeI4qSGArtK8xYt8FYVqdt/KDIJFe5BD+bQjE
         nHruhlL+GH77Y22cHzCSKv9woo1qcp5kXftP/uzfEHL4Yq+vAJxjMYsJSmt1Aaa0idDp
         nimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178451; x=1795783251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=;
        b=cs+SwgzcOOr+KUVYaIJCrUhMA0Oy7mmX0hN2aBcI6R6OQdxcSnl2vmiksm7UzdV8W2
         Gel80MRsp2qP3wG0AbLYN5QoKEb0Xe/jgHUS4WdANXPBBIweWiJGlMWsivgcipRDF+5Q
         Yq/K0IBmd2IWnyK/FYgE1NpOT/jwhTPY6mV/v3MteavSMTXGMr/fsk0+adXarkT6GgKm
         zvXta+XQMXMLSQbN7l9m/PtVksTQ5vFBULrLOHVLwRVLY5w4SNwv81qkhQ9bJJxOeAnk
         f7amfTAgXcjqJ50j0wWXDLe/5QsR+3yk5b1jpjxAeeyGlifmcscnT4psljy5paoJpRbA
         926w==
X-Forwarded-Encrypted: i=1; AL+hErGfucmR8lftTtqBH8xLL8vdDe5Z56Y+P3akhMVKBwY3/BKzw26aFbjh1c/i4lG8Tp0o6fhgabOX0skv@vger.kernel.org
X-Gm-Message-State: APuU4Z/vxmxyWU7Ildm75hpDQWbKuouOFqcHwbVWjwovEKboiYhX0g9A
	xVL6RB0qI9eVtJv5Ly6jk3IzfCQutelINSIza20826PBNYjxMBV/JiNspunav8LVYl34Ch7v8Q7
	cWjR/WogO239isDA81JxRFVGTrZfe4XcUfZ6k9k1IhVWqJTnHPR45LnvmXPJKHzCq
X-Gm-Gg: AYBFou2ewr937AEabcKDRo71b0mpCykhlDL3LF9ig0WT1zKzT3y0y1rwE/pnzypBEJN
	/ILg6St1WWHftAMjNWjTy0ZnSsZi3zwUj7URjaV7YW4sb8xDHcZi3KvOYVrCO2givAAHrLGV1fN
	w797sLT1cGNZPW9gHz5oLJCXAtQ+Xawa6bOKwJa+M+q8BUCWbbVnh+qXmZReO6He6vqQ8IAoHmr
	C4gYYKajvZqTXXWoP2xDEzYiynNKSNU1zInh00i/jdhxNaW53DVzT4KhvmbWJY+qoyoPAsqjTrj
	/fWtbCms4KMZ+XAFnz4xLAJaaCuX+nwhk1snCVkogSvWZQQa/rCKxqOlc5qQedbR9qlVyJc6PWc
	YHxiTV62/fPW+oG0zDxqy4vjLxXTtNSh232MGu1Fpx6xP3Mfyvr2G6E7ViCTLhaPLRsPtcm8NeL
	0=
X-Received: by 2002:a05:620a:1992:b0:949:743e:9149 with SMTP id af79cd13be357-949ba8239bdmr475452585a.6.1795178451475;
        Fri, 20 Nov 2026 04:40:51 -0800 (PST)
X-Received: by 2002:a05:620a:1992:b0:949:743e:9149 with SMTP id af79cd13be357-949ba8239bdmr475449185a.6.1795178451020;
        Fri, 20 Nov 2026 04:40:51 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm4234481f8f.35.2026.11.20.04.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:40:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: fix incorrect pull-up reporting
Date: Fri, 20 Nov 2026 13:40:46 +0100
Message-ID: <179517844379.14049.11659157399777710304.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113-qcom-pinctrl-msm-i2c-pull-up-v1-1-0eaf5c154441@oss.qualcomm.com>
References: <20261113-qcom-pinctrl-msm-i2c-pull-up-v1-1-0eaf5c154441@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b003fd4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4VXmX0JWTMGhj3x2HrsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX7pUtneVSrWwp
 BxkHHbuKjLFTnoP6UrONz8dK9wzIm45s4VkoFV4gWUSp56Cc5EhDBGYLwuyO2tpn5VM2MgT1z/h
 rf++1vAkWg2sFeejvykTDyWZcTyPHHFaNuhv29M3i69r+Sjl8Rum7QoQka87zJJoKC4yOFin5Cd
 ohCaq8dPreIwcqaIdg0r4gx21+1kbtRfReHQcOwFY1vW5Wh8bZw2DyXObyb2MDeREIPfAYzGaeK
 IbOkER1SwyuGgYiNGZR5ykOr4mvswiruubaYwHvPiHKNy/nJ+9OSAniMnsRmGairDzK1rC2ThRx
 O/RGJ1z/129f4fIWJ44Gkrr9EwxOsHxcNu1JQ7B/IkGq1RL04lt7BaRA+ydn2esAEh/hrVc9UMy
 pQVQtI6HHkB0CjdjI5iJz9O7imypOVgOmusMtHWsn1tuiftdlX3iDU+7OeXJIUzR07eApQeAbCI
 Wk1xWkv8OUGQhQqto7A==
X-Proofpoint-GUID: _2RkRkn4RQro4ak2ebI9R89WZdgaXSRA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX45FJfQHwr6Z2
 PDlc+YdjSpsvbJxAhOJ+qGbO2NVmVNRlFi3JvYm3D3SbOVZuGxvAHZEWkkLru4jSHmPP2yfM7HF
 xF9OTbCzpH+PdM0QyeZDihouFeA7xko=
X-Proofpoint-ORIG-GUID: _2RkRkn4RQro4ak2ebI9R89WZdgaXSRA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050


On Fri, 13 Nov 2026 17:11:27 +0100, Bartosz Golaszewski wrote:
> In msm_config_group_get(), querying the PIN_CONFIG_BIAS_PULL_UP parameter
> on non-I2C pins incorrectly reports a strong I2C pull-up bias when the
> hardware is configured as PULL_UP or PULL_DOWN. For non-i2c pins,
> g->i2c_pull_bit is 0 and the condition is always true because BIT(0) is
> 1.
> 
> Check if the pull bit is non-zero before comparing it against arg and
> match exactly what's written in msm_config_group_set().
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: fix incorrect pull-up reporting
      https://git.kernel.org/brgl/c/590058e6f640a79ea0ad114cd4213a4e4df27d07

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
