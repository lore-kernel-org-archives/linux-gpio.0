Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882205;
	b=JeD2n13u3/mZKpF5Z7kPTBMxU4YymHcahPS0RJ8m2YA1wxHsFYdNJccl5cyMrRduq1ph
	 NDvAkU4cw/xe4IFq+dZJYBsJGKPL9KjWctqMsL+NLADVQrfOX66cG5XonLwGX/AmQAuNm
	 LwNNVp1poLTCxFvZIeODge7u1TiwUmapqhA0bXcI2ruyyFChqNq759HLFrHx6DqMuRHAn
	 LVqz+Gb9e6BRvYWByyz7Ye9AvUrnT69U4xHtRZXWjZ7DsP+TrVqX+W8GZVOdhSp3lRRw/
	 iP+Y5l02bqCjWou1xQeGQugmLEN6O/07NI1rA8o+2GrAunTGCQZ0rKM88uZQOuC9Q0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882205;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GTPAf82XbzTv3AgPyASPrFUUMDRXmO+J2VN34zu+tzc=;
	b=p5nQUuA8uQ3xzrFTEReD+92oqTOtzRWyKXub3RkBkHxq2/PGtn36OUfjoXOjrMgsERe0
	 yAyPzI7bwNrmR9BPOXL3f5jki82BL0uINGlR6D8Ho2zwxJz4cVBWSSWI1PV90HX0Ghdbk
	 6IMTVXvwHCnGOgNYN/hfjwZ1g8RAoBb/W8IMeXBHGfPVRbELBpMs+OGNhzbrbQtoFyLK1
	 MCoHkl9sOs6wM30Ii4fMt+Co2sjqBDYrT7zzxL4Wt3T3Zu+rxCybSVOtRIdzMNgNcoeFG
	 yCziLY/JL/bojBZIVB4HwkP7psmoF5At+2Nd/9Fzu6qx5JjTBhrcNe/aniBuGOyczRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cLl1VUfL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DInKYc33;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A10606A332
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 12:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A10606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cLl1VUfL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DInKYc33
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tJRv1053136
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 12:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GTPAf82XbzTv3AgPyASPrFUUMDRXmO+J2VN34zu+tzc=; b=cLl1VUfLxt+RYCuh
	NjVGw3Jk4torKMDDy+GvlAgYAxTj+wlQ/MSoY/IZV2Y4wyjD0xXtiZw5jbxpGDIk
	wZ/V0P0/395w8aTNPa09tjbqziSCZBeQnGghCEz0s+LgUHnrmC/ALdR8cGJz3/gw
	E7RgZzA0phIOmx+PG/Tygx5fHAAYz21/uQoAUo1toeA6pulD1rqRkKnaSfg+p3GL
	LCUvFziEnimV1r3vQIkEIp/yDyIJ7WJ1jPPEqg39l1AMpC/trprty2Y6Uwh7EUBM
	09bEWy4btN2lPMInpANILexs1Fa36UEun0LVjfJC0J03HlenaOA4Pux35oEXBFPN
	ShudKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f8q3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 12:36:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so558478085a.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793882202; x=1794487002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTPAf82XbzTv3AgPyASPrFUUMDRXmO+J2VN34zu+tzc=;
        b=DInKYc33Oe/fMgpC+DhIBWq5PAgxrWNfJDjesncrYcI5JcrQWBKD1gkZp/XOBBrNtK
         sBzN6cRC3oNKGWJFEbQ/Z2765gReoG/B6h7OsTziDWGmfurArs7WS7MyrHOpSfe82+Lt
         G4Qm/xqJkoEKDeOeJjRAALVvLxuqbDrHsKwaYBpRfqc7OlRRWnMr3MHQ0iWOPt8Qyix1
         yy9Dm/Ew39jViNsWvvioZVVzgWUBwAmnCTDAMiYYEIwNdBaasdqYBYaw2QaBn6i6Ebx7
         RBSnRNCJKkzChFa9zVlJ3/ssLE3PU2rSWuKbKhTB4e68Ap4O9sYtwyUXzZXZ4BSPPUp9
         0f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882202; x=1794487002;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTPAf82XbzTv3AgPyASPrFUUMDRXmO+J2VN34zu+tzc=;
        b=W/ufE8ExfcM2csbOhugJhpRuXVgyGLz7jjJKdVt8H1hM2Lz0kImCfVOcTJgBKnfTu1
         4bTACYHvHTqS4F9hJaIVr3Ybz9ytsyG5JfrNX5qmIOM2PY50naiOmVBxFw3wJA6EWY8E
         tckPGyLBcXdlSelvGXvg4fHhF2okfgcOaGvs2WE9bPR2fMp6ZYbwrv8HeAZBKOnNN7eO
         h0dKfghviWjcJzwJhsOvfyxhwvV0LY1nWhvmwGLVuhLkT2rEjuMD68OLEN8ES9sSFNtO
         PimhfChD9dG7y60Wmpn1OdABpxdxF5pwO4qbwp+JKdrw7aBkxSJnTLotxkysHcMUhoTJ
         jZmg==
X-Forwarded-Encrypted: i=1; AKwUvByq4ro4DfPu+/kdbV3bI/Vxugf7oosaaY5GrRBW0ZktBmCdP9qr3jMZWwj0ePK8TmlzalPgSLSe4pLe@vger.kernel.org
X-Gm-Message-State: APuU4Z8zNNnlU3t2nE2voLwG65VqahwIWQKvGKdr3n7QB7awP2bN3s5K
	Nts6ATTAoFD2KszrhbVUCNzXou5sqSgghQmCgDlHs8OTw/CsKL3dwF5HJK0xDCwvEsXNlCFJJHE
	THCZdgaTZWXG5yb9IrhqosFy2sKcn9nqon3vefv5F7pImM0xc7aRoqagX2DCb8GoSVCzjvI/q
X-Gm-Gg: AYBFou18zRKmyM37PEpXwldOdT60xe0B63t3DJiTX8IFXn1PBh28I5d0o6m76B8m5iL
	yeKmxA4dgd3YIEg2vA0plqkY+e/JHMwj9mSJ8HA9YhAx7Gj1ENwfKwYGn5dffmfbFKMdKUiyp7f
	cFQobLNvKmlLNLS81IxFTD/xsTkU6cENKAMnpDjN2l5vpX/eLMqPjDXTbd9jVWLcC/m5UylSF62
	vO2Jd7HanhhOvYNRKojOHvxDgjzhS9ZDbcPdizGTtvHZ2QkRBWKRYg8GRYuz/0VOXjsyU0No/CE
	8TEg8iyXyeyWrjjmNVR8GJeJtkK1RlRpd5kL7DUDnyXAXfZKH2Ike1cpTnZ27tcThCH9yjmegTt
	p7KCPjeIwsLRqlvpVrifh4hh76iTMAStgqntn5mTzZBljzZ/u7ffFHv9UwPx94UveG1blor0EMX
	pB
X-Received: by 2002:a05:620a:2709:b0:93f:571b:c72c with SMTP id af79cd13be357-944216b818bmr3129381385a.46.1793882202119;
        Thu, 05 Nov 2026 04:36:42 -0800 (PST)
X-Received: by 2002:a05:620a:2709:b0:93f:571b:c72c with SMTP id af79cd13be357-944216b818bmr3129379085a.46.1793882201643;
        Thu, 05 Nov 2026 04:36:41 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46489sm62613485e9.3.2026.11.05.04.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:36:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Long Zhao <longzhao@ambarella.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>,
        linux-gpio@vger.kernel.org, Long Zhao <zl020895@163.com>
Subject: Re: [PATCH] gpio: regmap: free the irqchip if adding the irq domain fails
Date: Thu,  5 Nov 2026 13:36:38 +0100
Message-ID: <179388219589.23033.9852784613956697044.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103-gpio-regmap-irqchip-leak-v1-1-d038a20840f7@ambarella.com>
References: <20261103-gpio-regmap-irqchip-leak-v1-1-d038a20840f7@ambarella.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MCBTYWx0ZWRfXzNAf8Yr5oXuJ
 Bucp9fW6yQYeTAz5hRS6P3Tg1hZqN/4yra2TLSlMe690OIFrUX9wtFOD5yA1NX8fWBFHoeHyQwL
 jfCSRYY284GFEefx/YPQaanoXzofKHBdvG3xBaztH/FNnyuwyrZRBAoB8UgtkXA6pgEm7sbgDRZ
 HuJcEHDUBKJNb7NTqren/u0TWnay8GyugXI3yEDLcWi0uyjsNCAPEnz3vFdsMBwQS1c/C+O2RiH
 OcpdQhlCjZmY6VQByMSR/dNN//3doipPA2xO0XaWjGrrUMyiIuq+3FS/x6v35SLLXIEY0XPJ4+Y
 MUhODHdbtIBiRc2bT+sQRPKk8LqZFGWnNlMyoRxk7ADclhvgdGrKJ6c69c8HUCZsTTAn6IUGUvV
 VFieHCyRuo/nVknU2ZUY1Y3BIxWiPbGjbvShEjqL/hVVw6oGxuGDDw3MwoVyUuf3iSUdaPywHTc
 SCZbfTuEvG0cX9K/mIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MCBTYWx0ZWRfX3+43AsrfCtmU
 tueW2DFYosN+ITIz3EIM3kryLU6JLwZMhY34enOHjvFEeMQpjW9DIoyJTsBs5Cj9OhiuxRQS6lr
 WJ8OiQszLgv29qbnFh92rn3KIcnxXSg=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec785b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=X8lN-MAdOADUBVg88isA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ReesavjFWCk-6AAry-jiNWuj-d0LJ0bC
X-Proofpoint-GUID: ReesavjFWCk-6AAry-jiNWuj-d0LJ0bC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050050


On Tue, 03 Nov 2026 12:47:17 +0800, Long Zhao wrote:
> gpio_regmap_register() creates a regmap irqchip and then calls
> gpiochip_irqchip_add_domain(). If that call fails, the error path
> only removes the gpiochip, so the irqchip and its domain leak.
> 
> Free the irqchip there when this function allocated it. An external
> irq domain is not affected: irq_chip_data stays NULL and the caller
> owns that domain.
> 
> [...]

Applied, thanks!

[1/1] gpio: regmap: free the irqchip if adding the irq domain fails
      https://git.kernel.org/brgl/c/80415a6ff295b03dab98ef55598c72be66945d82

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
