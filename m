Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195433E1686
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486719; cv=none; b=OgfIGaBq844rF+9ahtLDrdV5ZMOml6ElPMo9YuGdFkiE1Zl+lxJf0uma32BS/TSj2ek/BXMLYuwyox7/J5QYBoOyIvRE5m8/y917rV1GFOk/F2rM69fCCMq/q1pJP7JFfC9VU1nXl0vZDgy8ySnKz6H8cM4LGCoC7LfFDPri/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486719; c=relaxed/simple;
	bh=TDkQHceDrQu9o5vaO+QVXAKUr98zldP4VbnNS+KmXXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4DmkjGQBpqKGZObbnkeWv3LZYt8NOm2qk6qiuRTIK6Au5DWrJi3Xp8D79Yiy9DJnWq2JkEz0NE4aQYUYuMlDBiPMpiB8isGXifQ+PZ6O5CziuMVKucJLm8GVGiJDzpcKkRhW4G7uPz+x0xxsKWDDAsbkfOYUwN1iZTGIBLdYLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oB62beYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHICZ7P/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oB62beYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHICZ7P/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8UItA2956180
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 08:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nRcLhnU8RvHMiOpCapizL+8MGiRW3OtTxZzTT0OFe/M=; b=oB62beYz53A6OZRe
	urMY1FE5X2/pLQz9xzb0+fi/EubDPGLHakPTHI+uDCxY7WgtlFFNPQnd8/bxFT+j
	j5MmFwgpn3wiX2mw8W0oMv2lHDEAJcUPm6i6un4z6JOln9+L7rf87xRaIl1n08GW
	yJT4t1g0RnIU25ffm7BXsI484wrgUl0TCKh43rvl3rg0s18jOZjBZeBGtGzskCUH
	JOBm2t8G8YtiTS/0kviQoqETsvvYY+dCEUGriK0BmheMe7G4TMLHQxoFYhc77N54
	MKpXqSOEaYtoKXwlwb7tbEiwtv4UP53oc6q8WAfsGTi/ZN8WaHZ18Dr/isw5G6pG
	OF9mYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frr8jg05v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 08:31:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so6230821cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785486716; x=1786091516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nRcLhnU8RvHMiOpCapizL+8MGiRW3OtTxZzTT0OFe/M=;
        b=bHICZ7P//pOkiGFtT9ggqYQNtE7LX+oP7f+vXrKBt0F/IzhLxDaMYbf+l1q9bGOLQg
         x+Z8sK9LGV0VWk/OeIqwS/j4yfSbKOzEMRIKZ+u/zBDcKIOps7HWE79Md2hjZwp18YIq
         k69fKDJxW1cWPyPoT0m5bRc/7TgtfmzkKWDvMwuGjlebVoAHHXANbfLyKo4vzo3VsXLt
         vnjjeYMxB3SII8wCzdp4Wr3NWeEjfAnDNpZKaqTeU/QAk01/fn9J7rUBH97DyBYSLznG
         uWpj3y1Cm4+NEyU915Kn4NmvVOTNVLKyxdRYWItkTc2JfENmHw3gQddN/10sIRKa9jWV
         +RPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486716; x=1786091516;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRcLhnU8RvHMiOpCapizL+8MGiRW3OtTxZzTT0OFe/M=;
        b=I8U5FSBJBF8BP2+V3aETTAiRlnbcD1BMrZyZNTF4M8SAALhlxLXqp41fzNb2Znac5l
         rAR1xh8fsdYPJSjHXRDR1Yi0rtoOAZr+aPnB2Ein2Fms8FgUyqbBMLMxCPygL8bZEVM7
         EONVRzDVI4NddiLxbgnvF/+kSjuixrZQpDim1tFO2Tx9+I5FgtyIXsiEp1fwiOaWqX0Q
         IWzBjjI3w+NYSztqFehY50h26k2Hrh7afWseKX8rk5CLddG9+QQpWLC56ZHdX/mu8anY
         y+/ymXeJ+cialvhpNtl/AeoHHMbzXkebrLT2iKqNIgZOeDFhd12MftViaTi7rMJdTZki
         bSPA==
X-Forwarded-Encrypted: i=1; AHgh+RrLDKShOfpaKoW7RGBcwi3pNjAlkgmho9Hg9InP/ct686dEF4+uamt08WRHN9IypzZLkOKLiawYe9+z@vger.kernel.org
X-Gm-Message-State: AOJu0YzoQ3vHbVFU+funJzBsfnjDuaqpqKdz+zNdJfo0I+VIMoKtGPuf
	JcV9xnGe7AlZT7T/3AlEBb5pbl0i9RuRWwpl0SF9GpDgBbV1K2nyYM2O5jD/XEodt/LvGhgmEt1
	rPWbIIwHfmcsJBzR1zWKXa0Zx4xcViwJebvNAUXQlBOuOOWtH5p3dwUhM0PKanuIg
X-Gm-Gg: AR+sD10yNIf4O5Z+bLfQczM3WbUH/9lATUKkvl9CkeQk5sNhEjbKcSB/RijOJz94bAR
	DSH21VIB20BWsPG362PxUfMjGovlNe4sYEBOv7vbh8OjzffvdcD+7FLhaKikuUoeA+aHFGVctMV
	VSt4GIc5CdDQruV/JEKi09tB9a3UQ9XzJjoFgAh/wDBan/NkqdHhH1+UiRDohDjw8G1kwvZ8RN+
	MFBlJk6WYbuLGgFsiWdG43LKSBT9eqos7fL+EtPy/x30X6Pw2kq3LBhOlSmwEvlSsyAhvlmIIE1
	eBULBqjIHQ5hQlciAPCkjGACKQosgUeqt9IEMg54oWXBSRJSsGD03iJ3hltkIZhyAGb9jbWJTrP
	UoRgQ9acOGE69XnHNtPjxYrMSDFtX
X-Received: by 2002:a05:622a:4d98:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-52b4aeb645bmr13804261cf.7.1785486715950;
        Fri, 31 Jul 2026 01:31:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4d98:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-52b4aeb645bmr13804121cf.7.1785486715593;
        Fri, 31 Jul 2026 01:31:55 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:40fa:e8e6:4785:ce70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4454321sm61184766b.31.2026.07.31.01.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:31:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: shikra: Fix intr_target_width for summary interrupt routing
Date: Fri, 31 Jul 2026 10:31:52 +0200
Message-ID: <178548671021.77694.3475041309715789489.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728-shikra-pinctrl-intr-width-v1-1-46583734d808@oss.qualcomm.com>
References: <20260728-shikra-pinctrl-intr-width-v1-1-46583734d808@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Bd7oFLt2 c=1 sm=1 tr=0 ts=6a6c5d7d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=z-2MmutFRShFpDa9hlsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: pghAWjhNrEPMO1iFjNjPdgSExP3QxoQF
X-Proofpoint-ORIG-GUID: pghAWjhNrEPMO1iFjNjPdgSExP3QxoQF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MCBTYWx0ZWRfX+nYqdM2Xw8o4
 wNVi85Cpnq0J4UrC92Fm+yXiE8QdfLiFX0NwfMUGpHBOkrtXgJs++f8O6FWU8uAFso71lweoJBY
 vmz+wawpmE8UqDgCJLRIXadd9UhrGINZzIA99aSBGYuKjzTRVYETSQnxvgSCDW1o7cNvqgEQ7j5
 j1LaX4mPaf3qp6R1e7X+t9K+M9iXqiIY+gjMB6RBVBoINaHpU6k0GVEnaNHGcRiUTbhyM1jPZQc
 wPmWy7kbLHyepLSEMRoFxpb7twhyYq7uQOFqXONToyqXlOGhjzEYqy0HJ47uUYmtkoV5hx5ApCv
 3i1MrbH32WNrhDh8o0mqvUJolkiZY7ztAoP2//Z8VeH7hQplDVVJzjDChaqCWhMdmmz4NakGXPx
 dJGUTfpukq6j6v7ouidSH9TOQNFyI5facY71FFIgx8d6d+qg0DeLpiKeCrwOqD6mSWBTFnLUvIZ
 iL9trO1VGVONN+2IZxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MCBTYWx0ZWRfX8gOHiuARATea
 c1t1UYzlDQx5tl7/F/oTAoDD9xupJqRwDmGiM5GZZMoA68eHB8wUuStyc7J4Vo9dTVnSNgATxK6
 9hQ5mfvyELBT88Ci8xc7k3dPgqHwWgE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310060


On Tue, 28 Jul 2026 16:33:08 +0530, Komal Bajaj wrote:
> The intr_target_width field sets the mask width used when writing
> target processor into interrupt config register and deciding which
> processor receives summary interrupt for a given GPIO.
> 
> Without it, pinctrl driver defaults to a 3-bit mask. On Shikra, this
> field is 4 bits wide, which could corrupt adjacent bits and mis-route
> interrupts. Set intr_target_width = 4 to match the hardware.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: shikra: Fix intr_target_width for summary interrupt routing
      https://git.kernel.org/brgl/c/1e7b04c12c077e8829991833a9aa2cb3bdacab61

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
