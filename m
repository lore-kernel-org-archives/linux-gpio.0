Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFDB41F5D9
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 07:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767805; cv=none; b=DIvelxDEcW3dXBfAkfsOYug8IB/U/japZXzB8uw5/osU+7Su3Hn38oLHt/MnWKUwlSWboMU5U0YSnTjDePQLS/XTvl5g+RDlELhutqn2EFgAf/Pyt++uJAS4/EF7mypPNPXT4Oz8l84XslldCFVuzuGw8fM6fzsxYBgvqD8R5c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767805; c=relaxed/simple;
	bh=t1sRj01fICR9PTKM3e8VF0BZ2GNG+YU4LIOK3q2fTZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Affb/PnenQBKZkO4uIh4syQSyiqyzdBAllKxxWf3dbpAuCSuOPdXPDCILZ6NBSTih6BPI/8XWLA11K4G45MxNRvijQfS2lduoK6wnuTPfIVBCqZSel75/suuCJSlXddxV6mylC2pLZDtPuXneK7nscxDvEG5c7/twGl1bnPeH+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olddQH2u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIeCnNiK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olddQH2u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIeCnNiK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777cZg2146228
	for <linux-gpio@vger.kernel.org>; Mon, 7 Sep 2026 07:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1zEULqD5p5OmpS7F9A/Wf6D4me7rYx1jl5DbOPGYsCk=; b=olddQH2uqwbvwxbZ
	BHxnjnTmLIbz6oPVv2fKB2iebAjj21+P9B0m3RKzXvxgpPDxN+gurQ3AloEmngvq
	svXIyKw9gVnItHdlgPo8r0RtunBu1Xyi3L7vvF/uvDYscjGMaWLiVLGpGHsLWAu3
	eU5UlFqe9BEJoROQFcDjIYUHU0W9jXfjVfhpp/PDg3sa8QTvhmqWRq/ukR2YK8EL
	b/Akb5jx3i804ej+T3teCvcEVuA4cokUJDzr858KFzNKx1jcVJPU29fMG55nr3rL
	fR3iFdA6MudVxKxqjcbZG0wskYQWO/RZ3xQHFXcroMfC3k1K9ffz/h/QhXSloupg
	EyBDZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdptn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 07:56:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9396e0515dcso166161285a.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 00:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788767802; x=1789372602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zEULqD5p5OmpS7F9A/Wf6D4me7rYx1jl5DbOPGYsCk=;
        b=aIeCnNiK+MgITS2xyJ6uI3yNaN/ko/dvznNCGfuv7fwlt9jaNSwCJ5PbgK53Q08C7e
         JOOS3MZalzaV4npIK+AE+cHz1H7XCDm8/192aWuQxcRF/jh85ejsbMvk1scLcmx1PoPJ
         gLDe/L0cfM+a8mmiTVkJ/IJ/l5g0uGVtBPChTfyrx9lpGH/je55k83X/T8yz2AtweSwd
         O1otpfmZaATSSMzv00A4f+1UFWKfEfm4AtXXqyf/pSMAr1Th1uqCJGhxah4j7ED2dlBu
         Hf7lqOsiBwrJiM0BQ/WyMZcHHrxUt2s+Xim0nn7o/047KJGlL0m4RfoIsUOLdcorrYfa
         NzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767802; x=1789372602;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zEULqD5p5OmpS7F9A/Wf6D4me7rYx1jl5DbOPGYsCk=;
        b=J0IGo/DamyBvu+3grT74mgDciShuZqlaq5+PE3yMbTJEFuinhskGudELn79gqoHszK
         4LkHwyet4/oB/2Cr6KOBDkncXkZh3Gz1w1j5DxlfarURC3XZdrYJcMQttnBazIntM0Rm
         +B7NJStmCT6dbvv9pOkQflPYIy5V18dGG6qZecalFWs08KoBBEjqh2gp0Guxr7PzGsC6
         7oV9lgqJSyB4934bnQM8MwhKGjZPaS9Coeylbb8oxFsEUMHpBh7BSAOPGjpnHdSWWpBj
         vRLFl7KlmuwW4IVyZElvSep33cpVp2q39XRGNCwsfQQrf+SGPLM7ctMkSdyVkDKxbM/O
         N8cw==
X-Forwarded-Encrypted: i=1; AKwUvBwGYEOVZzQIuFMBnxlWg+PqaVJUfGCKE742phHju/NpF2J99ak0zAdS5jgHYhmzfYtunutKfMS4pYGA@vger.kernel.org
X-Gm-Message-State: AFuF++kA35HBLX39LtIALHf7fvHdUN415GzI5Pr5FqX3E6e1bF+4lQ+5
	OofqLkCOu3u/m6Kh9NKupKd8T/LFBrNwTHr20CjR49z/RrXZ3pghRgT1IHi1WTuiuwa4ZK566sW
	qBoT+0OH2NkVyY3T+ir7krtYyswL9JYEVF7MokupCjLcCVnJEOUSJm6DRJXhE/me0
X-Gm-Gg: AYBFou17dEgoGYLTeJ5m+dzOlmITDi0fnkJIesiIMo800iC3KTMXQ/O9VSVg6xbvyg5
	q/lcRMi0X/TiwNlKRGK8zqCMr9QWjQvFs5UIHvp2g6oarhj6iwq9lOtkznlMm7IfMAmP9ybof7V
	naUlOBR7lMzmKgBBIwWOOTbeM0qYHWHVB2X63Lrgavn70I1syDTVvpzc/l0vN18GCMQWLUKm1f2
	BdpCTVI+gpNjRyLFWW1mNxhGw86gepuGAlAZa8MMxmBgTsjV5cwGPlg/TzARKEFjEJREKA7bqsm
	i2DjViuuCg0JoUo6d8MMZCvKEj2CWtmzgAD/sr9lW2eqx6wFg8soK+hVDBGKQfqJwZZq/EMX5c1
	FQaP5C33Uu+Vz18XYPrAqf2GpmQ==
X-Received: by 2002:a05:620a:454b:b0:939:93a1:1383 with SMTP id af79cd13be357-93993a115d6mr1276043585a.32.1788767801588;
        Mon, 07 Sep 2026 00:56:41 -0700 (PDT)
X-Received: by 2002:a05:620a:454b:b0:939:93a1:1383 with SMTP id af79cd13be357-93993a115d6mr1276040385a.32.1788767801095;
        Mon, 07 Sep 2026 00:56:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm27297590f8f.29.2026.09.07.00.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:56:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions
Date: Mon,  7 Sep 2026 09:56:37 +0200
Message-ID: <178876776172.5819.17556246625173968095.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830030201.135637-1-shengchao.guo@oss.qualcomm.com>
References: <20260830030201.135637-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0_RTFj7sJTwPymn9sZYKqz0Te-N778m7
X-Proofpoint-ORIG-GUID: 0_RTFj7sJTwPymn9sZYKqz0Te-N778m7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfXx8XN/ftz4C9o
 GXQoy8yTJuyo2tu3+41BDI8YknRS5dFl9kBfRrkW5KhyMVgABYtFXcmys2ejthHWQ2FDtlGXrAe
 E+N1cjjX92DlfqexF6fNLJeyuVmH+wrKzHbEYFuQ+pc+eow2Sh4F1jJ9gkqBC43AjIQADOjkHG5
 49o26K45movlkTLYhHPvhrXK/W08cO70FR8fniyR3gjJHvROtdrgUEH5XOmq/Zs2+2JDlbE6CzE
 8uM3ZEIw0QCNL9I8pIRA27a1xS9E+DNyY8Z/bSKDtcHfPzki3bG0J4eU1EXZ1uAS1UlAo5Fj/Ph
 gx22MvUBdCv6w9TVr1FFwuBSvFrnmVqyNXdmrRvq4UFiM5pYIGgfEzFgB8ehZuWrUGdXOO41xkn
 lUkwFZDrtaicE1+fF/SzTemEV/Tbo3I/nGtQMNAeprov8JYAeUlnRLtwWq5hGuIvU3sP2MLvlBy
 hfB9jdXFz67qgGSeL4A==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e6e3b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2HO_7AbmPCLmE9qJQqQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfX7iCPsMsolo9F
 uu7QVcUhYXZx+NpKRl9xFKDjTbtjdRAx85hy/A5Mh33nJJHk+8uGKuR+NQrz2FxyTnOuBscuSlu
 adHBid7IKZXgeAeSEpvS9PhhVdAaOuQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070085


On Sun, 30 Aug 2026 11:02:01 +0800, Shawn Guo wrote:
> QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
> pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
> TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
> respectively.
> 
> Both mux values were named "qup1_se2" (respectively "qup1_se3"), so the
> two distinct lane pairs became indistinguishable. msm_pinmux_set_mux()
> stops at the first entry matching the requested function, which means
> mux value 1 was always selected and the I2C lanes could never be muxed
> out. In practice i2c9 and i2c10 got the UART lanes and did not work,
> while uart9 and uart10 happened to be muxed correctly.
> 
> [...]

There were no objections from DT maintainers and this is needed to fix QUPv3
on nord so I'm queueing it for v7.3.

[1/1] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions
      https://git.kernel.org/brgl/c/fbfd6d0d3596d072f7546b25228e4eb599f68a95

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
