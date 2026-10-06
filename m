Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF653CBE97
	for <linux-gpio@vger.kernel.org>; Tue,  6 Oct 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273934; cv=none; b=GaurJFWbFzK1Nql6p4Ue4uvIbhhvW6iYysFzvQPmaAXSvgJ82sx5ioxSzaeffipAt/TXmVkVa0x2n/BH4reX6TMpnepTRx/6OOJJm/K92aqRjE2V+GKAPMqKZokyTZjgf9T9FjuwP/7rwiTgpwkfM05WWk1/KEDtErLMRL5S+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273934; c=relaxed/simple;
	bh=an7AD84YEqSWy0+GaKfNOntzEi/eymuo4+6S8jm/oYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SbdWkoF02PYJVHvEAq0LF6swq/kNQ3uszM4kXzaHmyq9cdg8OpLE5Yijw07E1Dae4nfF3nBZxuAhk68W9tv96cwfqGBOXwZBBI+F1QWftITL3FXzK+Os5BbiZML2L4m7u9Gyf36oa3eJSg+z4eRCG9KBhQImbVHnDxFqmvjmiQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBhM/mnK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlU26tBp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBhM/mnK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlU26tBp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966gTHd1045208
	for <linux-gpio@vger.kernel.org>; Tue, 6 Oct 2026 08:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niUOktxfv6lCEuldcUQGp27a7uDOXnZEa5jZNiVgcHc=; b=cBhM/mnKr7Jl1cfn
	SEoU1cpHwy9i97HxZoDoyVjH2fFvFoaOFkXOU+QhOCo6MrbKOU20YhaxTAlxjbZc
	9xWxfyIvRiLhqKAEZc/CVH3gCVEs7ltDzzTe+Ek/Eha1EdnKdNwcNn7TdsGqtSoo
	oyD7tWvsiU7TupXFpS7KNYomMsNKTRDyLfodz068IYRH7vaXdE8WlKqtpB+AQPfr
	ehHhCqEGK9LpVaFAo96GcEP39MH7PkAnMqZ/xkP+r+o/3AJoAcZPMZM/+YoRVjFq
	1oMiYN3gfQAOjAGcirOToxzuTvraoXmtDx8m2S2hLHZ50i69YcrdCCQv4R/CyhrO
	7tgGkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4g9gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2026 08:05:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e46c120dfso255151385a.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2026 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273932; x=1791878732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=niUOktxfv6lCEuldcUQGp27a7uDOXnZEa5jZNiVgcHc=;
        b=MlU26tBpRGI9/P47yYbO4NG/oM/vPBp6bKhbK/bTW+e9GmFebL0sPlVmd5HJrWfm4d
         oVQJEYYv2ZfB5c3r3rVtQ4ehGROe5FVS/qXGVoWyaDd/OvGzsMeMZDMtzgnFkMFetIB3
         bIqKgY3HckIzA9LaVzalU6Yf5a0AFa6dzbMx0YuaQ3dONTAWpL6S5K4EKvAG9SfU8EEL
         fMzgg6h7UcyARoB6sN2IfYjmUw8wXMoN7OpWz1st088gfE2vn16RDOZ/6kjFgZaRn5Qk
         L0QtUy6HtjULKSaaXxtG7bvnNGZr7xlYNEn5Go2iJueZ8Cw+5YxPyfDh1f3k8mqQXMcG
         he3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273932; x=1791878732;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niUOktxfv6lCEuldcUQGp27a7uDOXnZEa5jZNiVgcHc=;
        b=CbrtWA3nzVg6sGmkpieQ2xr/RN86OKtZRuc9X81FNxMNXV5XuJAXyUbzxK/igseYP/
         AuNgoa8kH0zDGxcAajZmX68U2+HILOm1bS2gYDPu6Ab3cf6hMz0KsHWTR5Lsl9JOo2aa
         BCT10AIAKs6ehQhpaCYe2YLS5ab4FaIdEfOsMX4nx4W1LdQ/PGnRqIqvWYsufTCmKLKh
         24uOqHF0CgczsNbVzjo06JvQJEyq9huZ0JsYShEIXiUqsClFgBfjuBZ3C9TSkSksgESc
         uCladiTAT3FLlgPN9yG7RW7oB89pm4AGVjcFTwwT7rFnUFcwBkNWJrzSesgpmcTU+jCk
         4y+A==
X-Forwarded-Encrypted: i=1; AKwUvBwg/DFMipxs8Ai4yAC1dYL6Tj25yyWtS+Jgn1h8/H5o/HU1qr0IEOo+cj8UuCUmrJ2v/n4ZIK81C0yq@vger.kernel.org
X-Gm-Message-State: AFuF++keFpp3/x+58BQF2jiG0tU0nke5DKNHlyMuBrby9izcl7l0JY2K
	RTN8ohyVer8UtwmOA2KM5T+oNgGZ8iOwzvTNZoleVqmEkFZBJ4HFwAO/nyph8U9b9kFQ4go3SY8
	R5hyhvwhK9uR+Jmlln4DkKCK0GSYPald0AclkrG/LmKKDnkLJH6Gx13nNQ3cOH7t6
X-Gm-Gg: AYBFou2GoI2wWibh1deg7Pz/YBcRhtsJyFxNiURz1XMh+sg2LSibGsGaK1LuEmt601k
	6cWINbUCgIjAFkQMaos6mcjpbTk+t8YWmMbxOwQAQs7AyWm5dF4jB92Xqu8KjLuMy8IUHbP8R6e
	wk6SXD8WAehFCdNTWEIV+2VQj0GVuvAxlU8QBqfs3KVBrEY+UccoCo1x4YKOiDXbYTECVRSQpU3
	6PriHfXW254qsHGFxNwRHMjmE+WmLOPNKJQEoMSaUn44Ro2mqodK1yDELxMYQYOpxNSLi04w3nu
	SGQNMoEe+0QP0mjH1OyBVLjnwy2BWFETgGTZw+p11ux3j/Iy00d47mfvjq8xxM6zP2ZXLcCs6Ih
	4BOdxIomPWFu1Di3F+uKLg+YGgp2lSPYOKXLQsAS/9THf4g==
X-Received: by 2002:a05:620a:1722:b0:93c:7211:beee with SMTP id af79cd13be357-93e51024db5mr1593422785a.28.1791273927849;
        Tue, 06 Oct 2026 01:05:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1722:b0:93c:7211:beee with SMTP id af79cd13be357-93e51024db5mr1593404485a.28.1791273924346;
        Tue, 06 Oct 2026 01:05:24 -0700 (PDT)
Received: from brgl-qcom.local (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd717ebsm1644791f8f.49.2026.10.06.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:05:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Adriel Santos <adriel@adriel.eu>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gilberto Conde <gilbertorconde@gmail.com>,
        George Moussalem <george.moussalem@outlook.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12
Date: Tue,  6 Oct 2026 10:05:21 +0200
Message-ID: <179127391265.4024.2812187587879993938.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002160958.908424-1-adriel@adriel.eu>
References: <20261002160958.908424-1-adriel@adriel.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfX+GCiN4KXSu/L
 5uyhUDuHKSMbJT1DZQCJGtbeUHlOzbskxPV26+7V67AbMotprwIkX/8lEhHS1C9Re7NXU0gf4TU
 139kDqycnky9n1fhZLlIDnQEH8ybzvI+L9tVPCYAGhsJg4GZIUxY4iRPn9B9mOxVd+fyZYvd0Hl
 VAMIVbCRjDsFKhs4Wum9SfeEbStP4q/7v4UrrWNoyFKM0HlayV+GbahMt83lJDccttdIN30yGk3
 LmIltofEPmQZQANljxrGEOC+SPIDj3ND4zAPxJ82AQdvcXGpa8YhikyNBYqSE0wuEkR8efEdVdI
 Bg3h/CHnIEndbFGPteD7A9HjL8Q3hDX6prSl7/w/6irNApVgP9RCFZG8KdoBocgUxd0jTwkK+8v
 wocp3LbiT3c2GDhzRLFc2kJjJ8lRF2lhGGcFteNM9C43CU6mz6GijiMOdyFS3AgTWQCxu9l6u0K
 B5WQ4F017cDyC3aM+OQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfX4PyqkpMTBV7s
 B/WyGbmgbxX6Nr1lVzwV1FDIgB0wSBbQQPy9rc0EhrIta8wt4QuUHZG9ULQjfzTgP1lA0///9hf
 mCSVaPdSZ1dJss0V22hiZs6V9/jMuQQ=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac4abcc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4QlCE6GJoO_CLA5tWxQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: dHxyXk1Md_H_YYVylGBiaMJHWsolMrfx
X-Proofpoint-GUID: dHxyXk1Md_H_YYVylGBiaMJHWsolMrfx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060032


On Fri, 02 Oct 2026 13:09:58 -0300, Adriel Santos wrote:
> The pingroup table has gcc_plltest at function 5 of gpio12 and does not
> offer pwm2 on that pin, so the pinmux core rejects a request for pwm2 on
> gpio12 as an invalid group. On the hardware, function 5 of gpio12
> carries the PWM2 output: the Xiaomi AX3000T v2 drives its blue status
> LED from PWM2 on gpio12.
> 
> The vendor kernel shipped on that router (Linux 4.4, stock firmware
> 2.0.28) has pwm2 in this slot. Its pingroup table, as read from the
> firmware image, lists these functions for gpio12:
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12
      https://git.kernel.org/brgl/c/709ba1c547eaf37da36ded2ecf3ea4e304cdfa9a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
