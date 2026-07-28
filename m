Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600EF41D21A
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229899; cv=none; b=Ygc4r2SPXTFZFHycUjl5CWv3K+LMibT8lSvbE5Rl3jbk67bo8pi/y97SPbuWKGwZiQZW1L779rF74srMbO+klKxgfO+WYJcWgea5ydo3dzDZfHFHrdCKEE8WCSMNQnHTHGm/eHzc7bqorEQeZgCwCg04qLBbDihapd/BZtn0P18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229899; c=relaxed/simple;
	bh=EmMkbudgday6pa+6bZXh40iZJi6gdrgGTsD/lKEGPAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b26KNWdzEtj43cwHY9KHPmfNw31CRaa9cQpXRasmzWVaJbdhP2zwvdeRiBl0ynLY3BWugCtiEXbpM3DxCWtMxu0lRnF7AoROZyCqE3050KlvCjb3ZHOyw7CQX75B+kMjGOZyaxE1sKr+Y61vwZ+i/WOvCClf38t1vLnfNvmM8dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgsW96Kr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/7Yph9U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgsW96Kr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/7Yph9U"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82DgR2480117
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 09:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1DNkTRN5a/54qc37A6bttfGfqf4yxOXlW+KO0rFAF4=; b=WgsW96KrNoqdGqZr
	vmT/N7YGm3MLgKg69DIe4yOT06GllIUPVLW/Km2M4DpoQNywNs9ibdHnJ4B9IJnV
	hG+L+ETDPbwJ8PWY5TYpNodLDfTa1YAoi+v2Edob7qwgsiyKV0n25CET9x8cE2ja
	NCy+eDDQWMle6gfbXqu6k5oVjlkCWEJJGkk/iDGB39YnTItJOk6KtwdGxQDIdk42
	7AqUXWDNqiWo0xS0HcJ68AU56aROr5GUKggqorb+r4BC3Go8mfiPCjE2UowF4lcP
	zg71bbdTN2TG9Ptsw/E4wv0LWGB9c1bLerGxLEVAXbjSVG2XXL3v9hMrBuSH+chU
	ojnfVw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy1158t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 09:11:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso33981261cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785229895; x=1785834695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F1DNkTRN5a/54qc37A6bttfGfqf4yxOXlW+KO0rFAF4=;
        b=D/7Yph9UYmv0HFw4/sFvs0RmDL5IQh0Pl7QSzW9toKbMx+NAko6cAzgGvYdyNIZjf1
         StzFIvz6IjQpjIw/NyYREIdkKA067ZFEexdpGRREr488IgnK7aGxfGgX81FjvGvATxVp
         XEY5pJGz0On37JoGpFa++Lnklcq1OVin3n4ULyMASO0PfrhW81qsD/2ZYKtTRs8vTLFq
         gsMD5JMCDl04gGrRR1pnNqQ8RYCb+is5/oeWr5EckiF4Au14QytC2ws+qKgbZTZE2U70
         1jYy30oijy137unhLYmyhyUtQEo58kotBEeHrHSDbLSG6nOVuDYX+gHdCeNDnX/wetPI
         XW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229895; x=1785834695;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1DNkTRN5a/54qc37A6bttfGfqf4yxOXlW+KO0rFAF4=;
        b=BU81/gHYj4btB9hnpWe+fYBnmwGKIFkXr/YjlXM/xfIWWGimRs7NjWS83X7hMwNzIu
         wYfVgks8zzTdXq3TXaMMaVbcZEwh3Kb0MrnDAmnKWbP6MoN0Bzqvfw1/P41bkECyFFoq
         tctviTnd/fpNiI4pEKk68aH+0w6q3gwr/w2VE8502Bnrh4hdva4W0BZzRb/n3PJgf5q7
         vrnnYT4TesRhBXuaRJRIRszWFinKzckStLqdPaUe6CdcS1/fuGLN8+f8glCqSve3G1m0
         G9Tx2YyFabc+AsKQ7Y3aKEc67XUS3GYtafvqP7KQrAr/KCIaxQlS9Df7uQV0yekL+JQY
         G9wQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAjz8zxXImNbZEM2O4vUeBZ3lPzL7xCi94+P3MTmqy4oc+Ut5+LtopV8TTm8SFDK2E9oBJXocki6gF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ZD5USxdQNPwSVve18Nj5kBqVQhCrtLzv3C4glZ0QNGwPPtpA
	fxOqYfP8i3DGAk5LmB/1+GR0yXlWZFaDxMUb5J1syGAEn2jRp5Hzdp/4jzXTvCd6J5ApH+iT2d0
	5NuLROlyG291T2jelSyktlw5Z0QM/GdsW+KcMT5o3hOdX1hA/pVNAjMgR1akcsgfP
X-Gm-Gg: AR+sD11NibQ24DceKmxL3SWohRm/YEOLffQd7TXq9SOBVfjLYkPpzUEgONA7kr8aZm1
	kt+pyLU3T7LYyK6ZIqYQs9N57fyLAAITQRMHHZczPVp3fW26w2Uc1IS6B6FtAN9EfJamjaAe7qt
	tOswMDYJfHUtpKi0OecGbsJNKLhwapGp9vA+5n87zbxDcy4dgxuRjJi40S6U22ePTtUX/4EbfGd
	Q0ObvMsNgiqqbAK8mMevnJrfHINkUt3KxXglwHEyQZhspEPDjfxpF/QKObQ4nNIVmhabdn5oa+h
	qlzR2vtsVbxBTpZ0IhfPY3ks3t5N6SrWA05dmVQvSa8hWiRWIrEQ/XJvC0zjvY9JTL7mFy8dbnh
	+G9Pk1ESNgg/STZGFLGKTkkI32PVZ
X-Received: by 2002:ac8:5a0a:0:b0:51c:b900:5136 with SMTP id d75a77b69052e-529d6e06aa1mr12257931cf.0.1785229895419;
        Tue, 28 Jul 2026 02:11:35 -0700 (PDT)
X-Received: by 2002:ac8:5a0a:0:b0:51c:b900:5136 with SMTP id d75a77b69052e-529d6e06aa1mr12257581cf.0.1785229894781;
        Tue, 28 Jul 2026 02:11:34 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d2e3:b407:476e:c977])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a659sm58043342f8f.6.2026.07.28.02.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:11:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Hans Ulli Kroll <linux@ulli-kroll.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: ipq806x: mark gpio and pcie-reset as GPIO
Date: Tue, 28 Jul 2026 11:11:32 +0200
Message-ID: <178522988754.9776.4844459868316856051.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719134548.8830-1-linux@ulli-kroll.de>
References: <20260719134548.8830-1-linux@ulli-kroll.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: og5iWlt61k4B89vlTFBVtL73ibhzALyz
X-Proofpoint-ORIG-GUID: og5iWlt61k4B89vlTFBVtL73ibhzALyz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3OSBTYWx0ZWRfX+tYcHFtoSR9J
 IeFwR/XenMX8FfIUmCIzzUSrW6R6ERXU1osXlI3/wZa66mge9JgprU3Fo6AxnJQVmMVl5b+qCnO
 y4uniPkxvcFJ6YG4adeTymQ5UGCDW+fucc30y+eb9yUremr6wKkOrqWMfM8gljbtkAmXdV2ApXH
 JDCUMrMddi7ykRXh/6e+vMlTTkZeJ1tisH4T3slnv4wDMtkN9aguTRu96l+wXsEHPj40ic95eCi
 TncwXQEgUoY8RGtpZ8BgtH/+zcoywlfU5lgvEyLxna1kLlzSETzFkQ0BPQJN5TGrHwynvoWuoJo
 ltV1woB7RJwEMza3rm1WEgW9TS7RkF7eH8u8lP5vCgsoiSXhqQqgsgbz7Tq7qx1quCDiQndGian
 UviS1hZ/FbrF5DK28yh3KWuO7qmCtFui1pYAa3LPU6WiA/HvsPsum1pDWMQ8KbCPY0Vcm7TgH4K
 uFSsuKe1/bwHPMXTlcA==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a687248 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=diqNrFS-WVA_1NOh2bQA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3OSBTYWx0ZWRfX+PEXOnFcxr0x
 LYdtIrBsGBV68KQaQonLaHY1hDhd7pnk76zfVzzY8Eppy0Cwj5TiPxvj/NANUYFcpEQ4XSoZTU8
 qOT93xWWmAbYlm7RgyY829XXySUSY7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280079


On Sun, 19 Jul 2026 15:35:58 +0200, Hans Ulli Kroll wrote:
> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
> 
> ipq806x still describes its gpio function with QCA_PIN_FUNCTION(gpio),
> so it is not treated as a GPIO pin function. As a result, GPIO consumers
> can still conflict with pinctrl states that select the "gpio" function.
> 
> [...]

Applied, thanks!

[1/2] pinctrl: qcom: ipq806x: mark gpio as a GPIO pin function
      https://git.kernel.org/brgl/c/687f39faccba29ab26de965411db37e849af8ec2
[2/2] pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function
      https://git.kernel.org/brgl/c/fd46760956509f580f7d3d25db4de10e7c6f949b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
