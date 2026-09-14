Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4676940F72E
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375102; cv=none; b=D3PAkGV5ndPukd2fO7a2CI94XuvLabBtDfcS9SHoxzdr1uW/k03zMxMRHXVLP8F2kLl+Roow9VZQbp4Y2wPDBvDN7P/REPui2zVkchPgEQqvoUIpwEeWeKCIgMNc6kCAjr47bGDx5owEdqLizK+9Z30i9UHAtDAOG+V5bsf2eds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375102; c=relaxed/simple;
	bh=gHKHSOLSzp3WyOusQFfkD5ITajAvimdGQIbANCYNGQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YdEIEZqvWPBvGTvfIbFTfyBlWE/Y9+b8TUJC5WDR3ny/PwUIXMYhYOBYLWnCZpFLn0X6CFvoTuxYiXc/F1nad2HdeGvO6jiTRkHrtE/7slGrApEih4T7zJTlbUtJHbVXejchiWiPsxG9OvkjLV8LTMfKUFvZMdjgXOSx5cdU9ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+Vl5ae/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gi9OszNh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+Vl5ae/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gi9OszNh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7SRV33352167
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSoOIOvtikrIT/ETbxvsBkHTAv2xbQod1Y0j2PHnyM8=; b=V+Vl5ae/XfXG1uxI
	GSoAD8q1+fyk9uGG9BQWaCJnAs1MFZdd40SKwbTSsK6D49aBU7YEl7idCB79Nqtc
	Waj0A+wlp8fCzdiKsJPQevRijL4OOFS87MuF8jzvxSrqC74Q6xF7xC3POZ3AmvI3
	5dEq0zaQTng82S4+rCyI/AdjQFfaT6A1fGIDCJtOmPlmI6Cp0kSSrqe63WHGnFn2
	m82Cj244OANgRelnNPHe0tyA3u6SfcFY0V9llSj72R3enK/tWYUeVgSPtumcM8kT
	2qW2YHsZkoJNrJIaDFoxvPsHjkxBaFMYfmrLn1cUImNyjkfORnYPmrCqDlSyiDsU
	J24MpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg082h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:38:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so577781185a.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375093; x=1789979893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSoOIOvtikrIT/ETbxvsBkHTAv2xbQod1Y0j2PHnyM8=;
        b=Gi9OszNhpqSoOXwdX203sybTt461XS5kmAhbk5g2aDWzs3+4VzYsQ9nKUb4TAC3yY9
         DMYKE/ilVj4GDEr0hpr8GLGDxTqVxbPMxGdasWh4/SxwGCFDMP9y1B2CaN4gp54J6yFK
         QFls75WRf6IajxT3c9fgn9BghWaFEsHoUitRmCO/95zMl3r8PCbFYTZ+6fSptr1oc+LO
         5NvxXwRYIFqpnztlWHxjSIFR4h/t24W/X2c5FNf2M346Cg/du6OdY38EHWf/RX8L6x9w
         FSCkl888mLGqgw6BQUcc8vZOrb0bl3uXLIAfhkANjYW6pK0LLiKVfN8ulpqDOL19lY9G
         dGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375093; x=1789979893;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSoOIOvtikrIT/ETbxvsBkHTAv2xbQod1Y0j2PHnyM8=;
        b=i67isIhkC+J0bSNm7TFDVn2FxGZAoLHD8I+KwvBReh8RARDSGHxqtZI/wNKZV5ZPte
         /IClv9e0RXqs/bYJNIEyYgqK0kC9q1rgXj+DZojXiicB0pfTuIhUFpGXR7wGtp/j6xny
         G1xWXViDGiY5CJGBTeGfRPrIGnF+QobmOxFm/3rdGz3sHbpdq4oSMtkvt0opkZESe2Ix
         fIndi9TdiiEmTeSPVrAUwbeK2jYkCSGmVLPWwb8EgkQXHawR5/sbq16RqLiToX4qi7qZ
         ACnsoN9mQkbd4W0jejIBVE0fZw0V/kttLoy0Uv77fRxMGI18pFqkIubjc2MHoF8kyaGC
         we7g==
X-Gm-Message-State: AFuF++lXzN830aRqiLkfEpyJIEAu8j5ke+AmuA2menI4WpG6Uo7/oQsQ
	oDZ1Nf8Iag1Uvx0owF23f/HkgJna7e3cEiepnyPVwg35Z+tGSjkq3v6wnzCqyR1ixrkCvdn3gM+
	VGdDS6PSool9Klo7ABqTBlLbb+NTLa+pqYsD2pRJmysmQJsmCJ/eJXDZXfExk6SRuMhLtvCrM
X-Gm-Gg: AYBFou0KGsFeRBZEJt7ih6jNmGllBhuAQQTaakVFp+l4FGydb9M3FBALrk2SzF0wm99
	ttoPO3a0dCSisCNBGZkJle5IPS1vbACGDgBjlg6+ZtgmLRxoENzjRsuAumB1o96upQvEJw6iyMc
	exayuxG2gRR3hcaDZZx/teBfyib6Zalg2m43emv9oaYbldaNjO1mFR2F2Lz4zMXxJG9Er8lYN2y
	hMyg7gH0GotFJfRDWwiIe71T2AI0mPtE4cNbXm8huQ7mNIWNK/MMZL4Xh4/TK1yuokO6/2nK63t
	c56jP0UDYwVKQCJZ5pRPcvD6DlfUD31RSwNxA7fFzy3qElOhq+uU0NJoWbcmv4BrB3K0E84q6bs
	Enn4fqgMTc4z+AIoiRZb5YKfMzsk=
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr205657685a.31.1789375092821;
        Mon, 14 Sep 2026 01:38:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr205655685a.31.1789375092381;
        Mon, 14 Sep 2026 01:38:12 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:e83a:fc27:4d39:43d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb359f38sm23425466f8f.30.2026.09.14.01.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:38:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Michael Zavertkin <misha.zavertkin@mail.ru>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] gpio: realtek-otto: add pinctrl support
Date: Mon, 14 Sep 2026 10:38:08 +0200
Message-ID: <178937508534.32495.18371049241365585630.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787830440.git.misha.zavertkin@mail.ru>
References: <cover.1787830440.git.misha.zavertkin@mail.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7b27a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zBn-OFdvgJRZKxyvXKsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5wY6Q8AeA8g_9_dJA6cgczxOVCONPyg9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX+TmVYiBlLX6E
 6QEG68drp3uSA0UTepjwix1+l1Vh6h95JuovVdtwlOkqZ5mh01fVOfoqqPOXUlUW169gmBcOxs9
 3EgAPRmnMHRfyNQpb+jwMwrCnv6izEc=
X-Proofpoint-GUID: 5wY6Q8AeA8g_9_dJA6cgczxOVCONPyg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfXy+etrdlEdeQL
 EMSTpMgTyNzrVX4sgXcim1v67dCn+6mY6m74V/+/WVcGklrUuFo3GIHKxY6L4NUAVT4/98+N2ai
 iYm9aLl4DYY7moeehpP3GyduK7AMhHvy0eghtzU/jpgEz60Pc2btdftyvDsuLsppns3Cv3p24Xg
 IfoRL1wW96Pxu9tOYlup0mKy/Sfj/yfMWM0ff2Tsezxx2l3GO/xCGqzLvLGPzlJnALMKN093N+4
 tn5SKY8vJKRE/iIjcP/yz+Pb4ELev34MPc5kMacX3f40C8jjen/lymNoOy36o+8YpHVRl+vpWxD
 id7xQc6viVqRHhSxuvHE3I8jd94cAYaPr55o3iHMXInqqOXdrrnhkEdxF/8HsaOyqwvLJ7WMEKU
 JnzKBF/HFTFykE0N1Cf0FJw9UoWd/rKMX9FESsAy11oLLQPyIFMQTKcskzK64xosX1cvBc8G5M5
 BsKu3R5bmjb8WHrcjFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140121


On Thu, 27 Aug 2026 21:29:29 +0700, Michael Zavertkin wrote:
> This series adds pinctrl support for RTL9607C and referes it
> in documentation.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges
      https://git.kernel.org/brgl/c/3f860d25f7be981d78c1b85a8d4fafcd914d4df9
[2/2] gpio: realtek-otto: add pinctrl support
      https://git.kernel.org/brgl/c/7257c35db0fdb4fb02d857a8197a16afa84d92c0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
