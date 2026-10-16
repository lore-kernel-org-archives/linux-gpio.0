Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD013E92A5
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140731; cv=none; b=m9rLF36vmrUZUhAnCM4o8d3NMWOvrceS9b6EJNd2kWGHJPEdsyRKIKsugk1r/w4MK8pfG0nMn+udSHJ7MgYUSyHBHta6GsmbeVnXuHNX48UCRBXPTFU6EILNwOagcLC1pTjMatt84h4XHs5RiYcwgegXSZBMX+K6JQeIek6W+zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140731; c=relaxed/simple;
	bh=c5Q6iKkDmFbV+2yyd1vXV0ZOV3wkIrlOQ8jFE8fc7Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b5l/Z7tqYgXrRvneJIBLtmARhMxKCeAudCvV0nKdwVp4SP6mVSAftNn7/Lg7wyLhR5K+RUGznvXGE1oALuTreYJM3B5mGgij/aLfN5BsA+y1dOUqRWk5pEhlC8DMMbnZJdNutNx2TXaI8WvR8ntQB7IPevbWuYQQbxpB04zYoyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EaFyT/yG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0h0b3Cb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaFyT/yG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0h0b3Cb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lfqV1218651
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2C4dYBo+gF6G9Tper5KVUXePqoWOYmzOlJ0
	YU5mfgok=; b=EaFyT/yGKCS/4GwIonOQN14ZfsbCda+ksf+blv1A4mJ6E1w18gq
	my9eilg3ddNJv9dC/tTzyDBnAAKaYs5McYqR80ZvcgbV6AVKKe+N/fAM0DI3HD63
	SWbL7etDPm297YR7+G1JXhd2ctt5DeG7wrZEtLLhItgh5IWfxljNpwgOV4e9Ghft
	Xxhvkg3CNhg6SM+0xNB94bnccLrhM/Pn5mU5LLkmVi7HSW8gMcBIcytz/cjNcJQe
	RIereKivikupJ7yHIAsS3S2CEZsh+XEXwjF7rZaiMWdhRmbQAUI47T8KCb1VK76O
	EB/JE3n4tcyHQLfybt00zNb5POjLr9rrmWA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5seadsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:52:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so247503885a.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 01:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140727; x=1792745527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2C4dYBo+gF6G9Tper5KVUXePqoWOYmzOlJ0YU5mfgok=;
        b=b0h0b3CbkDdkTcixVJuoANwkPEgxu5D3EwGSYmaDLPZj6d/4tt3hNUea1rzbLOEZDj
         aS/ByCvkmrHusPorEGY+BK/48PPw49eXU9qsau0rWuZ4J6ybcyorYcNvRHBkMfU8DRv+
         ffWQde/qgP4ZdIE6feaPZv/P2MOh6zPOzi07Vlc1WTrdXxQMGFMI6QOHbkcSaw9VXPHk
         Mm11SupZWjvBMgkmD5+8lE+G5AzniAeThuSuv/vbCaCB5x3WSi52Cj/XC8EavigIpjyP
         m+tik4O8rM+5N7fO6gM+2TEHm34mCsKke8TAlwYLZ+ngaykTX8OiEWYUC6Udht2vkjQP
         aWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140727; x=1792745527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2C4dYBo+gF6G9Tper5KVUXePqoWOYmzOlJ0YU5mfgok=;
        b=BEoi6IiFZQirjTa/Rrwqogbps5rOCDOT1Jk6zgC6mcP/e+nM8ygcmovssNiuVsCoC2
         pt0HgHlWw/ZYnLkDAxCU7hACUFeOaaDfsLfvYlmQt2ZD1vSJSpybprGYzmfdig1BspjQ
         xmINSFVft/5Tu9qOCYtH1MqY4u0FN6Za0TdmOE3cD2Gfm8UM3a8zKdwEi/a1y0WsR5qy
         vLQLQEevIdRCVe+qThUdXrjbSEohLVSkDjkTV1BmAkPJoq9O4tbuXtadAwpjO87CsxQf
         ra7L917T4FW02qDE7etDOGuj6QR+qeAVOKFT4ccfTDFlafZArIfsYb6dafCdAeT7q6Qi
         zInw==
X-Forwarded-Encrypted: i=1; AKwUvByhTuLc/gRAhRG7esvbYs81PmguJe+KNRSjB2FEaKixKpwe4APdUAAJ2RaOofm9ICa0RvA/WHnwd+8Q@vger.kernel.org
X-Gm-Message-State: AFq9FYLn1ccXCW1MGKjsdZmpH//DM5Ql8UwwO3ZlBRD+jV2MT38wIgKw
	3lsOthT4d1yx1qpRaDd0WtRQF3yEB8p2EXMUX3zjwsWWcnSTSBKN64w2D4WSkSff2inax0b0O9a
	tKLzpg91wkgMhPyq/EJfMjmaSZna6qi1FxN33iW32XEFOxkbSUovIbVORp7Rd+hT6
X-Gm-Gg: AYBFou33RkwqogLjnIE3H+zm1EOGylkp3y5sICqaBgb2CvTnGfVUNP/KKcJrnDwskgW
	xuSFkehaT0Eb65fX1xIQkDvw+qGTI2SbS6kZUjM5t0ifUSChUE4n/D+n+tLGxq4ocIedB4uaRbX
	lsmOxE8pVZm6KTU7R9pi2G3RZQgEHh5232EODtZRn3GLzfoSCnLlo+1S9UfgT/FDEfvf8rHz/VD
	Cep+wAJ44dd/Ok+2S9KK+jls6dvp7XxooylglTGVIMr9PZB8CezasbOfIwOdJAlKyHFeRxxOmhm
	P/+tEIBbhV5ueRSvLDi+nfmrYFHwXMhj8RlwmgfN6POOBfVcydTIbeZ2gjNTKLGQaQgq5hlB2Zl
	j8Xsa6R7HUNuIgSXhPZSMgh9CeqU=
X-Received: by 2002:a05:620a:260a:b0:93c:be5f:b807 with SMTP id af79cd13be357-93ebd224f84mr3659462085a.13.1792140727063;
        Fri, 16 Oct 2026 01:52:07 -0700 (PDT)
X-Received: by 2002:a05:620a:260a:b0:93c:be5f:b807 with SMTP id af79cd13be357-93ebd224f84mr3659459785a.13.1792140726638;
        Fri, 16 Oct 2026 01:52:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5957sm3667762f8f.9.2026.10.16.01.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:52:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control fixes for v7.3
Date: Fri, 16 Oct 2026 10:52:02 +0200
Message-ID: <20261016085202.40187-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX9RTjX5icub2z
 e+JIpG3neb9RWv0yGDu7SdpwBdSDUeuaekS8H4dbV/bEN1arokyUFkOURQD3DD5DCv6k6sIKcpI
 jdeRJyhbY1pRS0UytMyoks+/VxofONM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXwHCjGJRIuwfV
 trWFdJMMIOrjJ6ka7TGtxr/BnxR3xs34foKh6SQt7+dcA9lkEcf5aYkn0GX7pwPHLJYLtkF5aIe
 D3DXKDGX1sEIh8BxKHkcl3+kdQa7RQpnG5tynw2Q9kPRMhL1vEpWPg8uI33I7VNE6cZjb5p18of
 KsNyIboNzMVW/y8Fkg+ZgC6DJ7mLUvqF5YTKyyhOztdlBix+nVn4d2NiycaanE/4ei0QRHNt7Ns
 mwB8ynYhM9uPdLV7BtihN6EC3qYyrpRZCAMjFJXsxoPSmKTdlQzeEjYz85G8vN7Luf6e1rCj2QC
 NTinWFmf7LCK/BftX78l99lvCTD+WgbRI/jPZZWG1N4+HYbtPu5sP3jwEp+6YfvU1cnyZHm8waB
 whjBKIWqxmNzyV+1mgP0UdUIdXIkzYYPkj0+VrpvZu5Kbkvt9myahAScYnQUXOGJdrg++uXP5Qi
 ZCxaAtpinicVtytWDGQ==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad1e5b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EllheS9fpYLeMF_EZvcA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KRE5EAVORmPRCHjf7l8vkE1au6Xa8XUj
X-Proofpoint-GUID: KRE5EAVORmPRCHjf7l8vkE1au6Xa8XUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

Linus,

Please pull one final fix for Qualcomm pinctrl drivers for this cycle.

Thanks,
Bartosz

The following changes since commit 709ba1c547eaf37da36ded2ecf3ea4e304cdfa9a:

  pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12 (2026-10-06 10:05:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.3

for you to fetch changes up to 1df7f369075d7e8f7794981995a5103f1963bab7:

  pinctrl: qcom: kaanapali: add the I2C strong pull-up bit (2026-10-10 14:56:32 +0200)

----------------------------------------------------------------
Qualcomm pinctrl fixes for v7.3

- add the I2C strong pull-up bit in pinctrl-kaanapali

----------------------------------------------------------------
Joonhoe Kim (1):
      pinctrl: qcom: kaanapali: add the I2C strong pull-up bit

 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)
