Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AE73AA4F1
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638605; cv=none; b=LHvx6IeOwW0vHP9uXpVEcueXTSEkGx/Jy4SOMtfwmWsnZprJMTS+7UKWAw0OJfFevTEwSRM31bYikZ78NMOG291UJwi/fTpc8kbXxAvzAJJnJaTjHDCdRgurqNuOn85NFxh6ARACsoPlL5gLoRI2kXBtiAMwKScbvD+FJ9EUy+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638605; c=relaxed/simple;
	bh=VKtvCqmaFwakDh3dPdx59QHwtYLAF0CeW9u+HP99fIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bN28lCMof/Irn2moqygb5DF3HEjV/p3jkPyup4qcN0UJ3no+pQPnQ6Q3ttePkI+r3uheWh21y3t7yxJOeBaxB4KPtOy1JZSbALCxC3N8QJ3LHd8RYShSKy0rnGTtd+JQgqmjlzB6MdAd4asKy36kpqxPeWaHIprBqCu6GVE6t/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWNFDDrL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+JLi0iI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWNFDDrL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+JLi0iI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZrIs2211011
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXfjpYF/qRx5R7vw/ngOXgeAsq7XaRfsZ2rZhaAn2Fo=; b=ZWNFDDrLmTQxDCuQ
	HFDQlHMYRRCo+rH2wLP6KJcXoMJ8HI+z1pxwgOXSBrbhfMiC7OjhqJkMx4i5kIJP
	AwJaTN2D6t3ambX6BPl/8pR9v0pmvtwDa32vIbW1mrUzIMb5qrXaO6bbugZMRZsn
	+VXJ8X3YFMjpnizlN8t8hGnwKJ+yYpFGJgBL5AyJb27KW9XgaAuG6d53uPGvPzMm
	lqMNnSS1Ik1zfwape1U3jAVGp4Gn7ZESpuKhHd+6Jw0cQVesTbS5nyjtU8AXCryu
	XaWpXmwJh3S0yS5zirrCu8D30NDPMcpnQsqfnJv+EYJvZSdtlmB0I5n43w71rZwb
	eeIIvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m1mup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:49:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530ef845909so11554001cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638588; x=1790243388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EXfjpYF/qRx5R7vw/ngOXgeAsq7XaRfsZ2rZhaAn2Fo=;
        b=A+JLi0iIHDgS0Bu1bURyjN6/60Jjer/vAKZTrdHs8D6ePGQ8d0UkM9Fz1HhlOiV7eu
         amuG/WN2xRHuIC+7ZqzmfPwCe2liOgHIimGRznU0Gf77OXuqXqEfB+LcCQkQIHDtdNk/
         32nft0vBjZD7E05nIiMNm47T/VKlbrXM7b6HQ0fYWsXhvGyDdUu+X3K4z/8H5Z4190BF
         kIp2HbF0CFuXDz54HTR4r7DrTJNBVGYy9JzaqR3WbCiselAiagHWWWsWaA5XTDWHgHU7
         5jjGFOl5ns5YqqanErhecr7SUuMgiHMqAdQIkZ1RQ/DKTNduKlPUxKAO4bKKf+omiy9u
         p9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638588; x=1790243388;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXfjpYF/qRx5R7vw/ngOXgeAsq7XaRfsZ2rZhaAn2Fo=;
        b=skdEpzIh/nfv15WaocDozl8sfAfNDKOuywa3bHYOwVS6wL3EMDUFpXZxw66pcFMg4N
         GrfS19AmraDOVYtEXIE9EdUzxxO2N50fs6AxC6dfd5z0jhFSX071PtpVndlRQ/tMlH97
         +UQj6ou4JIAP+wuWH8xiWgQwqRuU1iDWtsjrYMOoj9RQITgfYC2ulikT9D1C1QiZQeID
         Xax4ioCd/YZpqzeKvg8Cc3Of7ptoxVPH7nJOdDH07qs7H4u9J+VBoXs3OIPQNuCGa13H
         84wh1IVfnEg0CGASd4/FkjSxf25LflUs3Npl5s9E4T3V9J7pfyzhTu1JuaBQdCa0Nu0y
         aWJQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2q66cXk0cjeMW3jf1zI3it0UVhrMLttAVEuCb6VJ/LiPz6M6r63RJlAmxDwrzxn6yAIx870/fgq7F@vger.kernel.org
X-Gm-Message-State: AFuF++l4SS1pP+Ec3go1HDyNy0iMfyCYc/ubt1fHU7Bta4ZsBacgvH5r
	BUAb9QzO29wXUVLwrHS6arAs2MizHxhIsZ7BtPDSmpo8JPsVmNsVnZr+iSr8OTAfsxFPaF3wpOU
	1OUr//oTJ1QMTaPS6H8EMfpMOWgckV2IMAar8kaAqBhEx7Eru9Be8uACJ/kikpC+U
X-Gm-Gg: AYBFou039Q4PTpxX1hUKj5jwru5oSWKaE5IqC+2CXaboRPcoUg7BapCvPBlKFDmPN4X
	0y7lb1Dw6U8H2tc9wojf+7Ei6JwQqAg9gdtBxiJr1a3T5F3jHzmp3EmehLIzipyLzgqgSSJ52BH
	euQImpc1koH9nhAikrYcRyb4QSbYYtHrkS5Ae/dc+y+KsP8lk61eR6c1YgdqztfFLnHbOSHXXqj
	NqPgBweSHFrVLmdpHzx4ZURQS989lN1Taa1HLpwhP7ZGLVRFbWewKdXBb0D0IaKkpz+rnRxDhjY
	DMMUEaMxFy0iMXHH7z5Y8611Q+IzoA55ckgW6j1NdjxLOQ6qBrY8DJS1eR/6LLjBxVYBdJHoiZj
	mKZoWiCQwbQHgNvGXyvFTU2EfuBA=
X-Received: by 2002:a05:620a:bd3:b0:939:6de6:9516 with SMTP id af79cd13be357-93bb79367b2mr1090265085a.45.1789638587718;
        Thu, 17 Sep 2026 02:49:47 -0700 (PDT)
X-Received: by 2002:a05:620a:bd3:b0:939:6de6:9516 with SMTP id af79cd13be357-93bb79367b2mr1090251685a.45.1789638584950;
        Thu, 17 Sep 2026 02:49:44 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm15736333f8f.1.2026.09.17.02.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:49:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, andersson@kernel.org, brgl@kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        pankaj.patil@oss.qualcomm.com, maulik.shah@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: nord: fix GPIO interrupt target width
Date: Thu, 17 Sep 2026 11:49:40 +0200
Message-ID: <178963857686.7532.12774109057722051769.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
References: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabb7c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UQ-mpCxKgesnfiZAKPwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: h1rZK2zmfxWgz_iZIHzYHDW0FdA9FasY
X-Proofpoint-ORIG-GUID: h1rZK2zmfxWgz_iZIHzYHDW0FdA9FasY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX6/QRt7Ic8AVK
 ZHCv9Wa+iV8ZeXKrN/A7SHQJ2SVIJb/F6rdyjOBBGEc4hepcTUCa0FfYM/xOeiRj0zdSgdgh/Qp
 w+zQsg5SpDiZtpIJ1u0+ZkhF3l0KJWndQ4ybtOIJpMKBvqz6TB2dVOpErgOdwd4kEKtaoFU/LjV
 vts/eu9Kuhv1jMnGMHoCkFEA06UlzlU2fu8jK30+YtOuSc5r5V9NsO0e01jdW8fw6NhIwDKuwF1
 EaHTb06+RiU0Jub5uAXDa1/I6wWxj3bpYLcQ6pjbeL8ao9zg8FTKlSnV6nos/m8yQsfnML2RHNr
 ev0luzTjtiWvxvlkBPVynr/HWsv//9ZtFAAdnbPZKpgrIbJ5TQJTNpmlxTdFOqZTHpX0aPlkciQ
 HZxpDty2NDLS7X79tO8lgy6DjZKgvPHnT6Qg+Bq0qNDvNBnzSXfitMLWUwQL/FajbPINorr9aEQ
 0HvUcjpCejuFCMck5uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX7Phf89uFIwtV
 pricxzTOsv0j/H5fSCpx2O7ynVLoPjinmWepD7IuDJ110M7MQQsF+xPJEispTCQFlIACzu/QgxJ
 QjyNMxvtHETHXcCZ292cPpaXvUSFh9c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170135


On Wed, 16 Sep 2026 16:57:20 +0800, Zhangfei Gao wrote:
> The TARGET_PROC field in the Nord GPIO_INTR_CFG registers occupies bits
> 11:8. Describe it as four bits wide so the common Qualcomm pinctrl code
> clears the complete field before routing an interrupt to the application
> processor.
> 
> Without intr_target_width, the common code uses its three-bit default
> mask. Since GPIO_INTR_CFG resets with TARGET_PROC set to 0xf (NONE), bit
> 11 remains set when the driver programs HMSS target 3. The resulting
> target is 0xb (HPASS_DSP_1), observed as an interrupt configuration value
> of 0xb1b instead of 0x31b.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: nord: fix GPIO interrupt target width
      https://git.kernel.org/brgl/c/68ab4a6a84b92f52650508acb60317eb76454250

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
