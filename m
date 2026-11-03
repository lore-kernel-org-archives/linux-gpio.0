Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712859;
	b=RWbdZspyZ2PDqmlb3pJ3N49z/tXbdHEpPCoFgaFNmJ7CCeVYkRV/u2k9EINKTCQoycZF
	 T3yINd2I8GQQV2NHVYyJUCSJTKUAD1Q5ls20eClp8wu7JRshxvQUu5Hs8anC6O3uyM4Uw
	 HXXqqwZbEmP5ezJm6jk51RihQeZ7rR+6ub0vDDlZ1DaexBQ7+FJh2UDsGfBhysiak/6BZ
	 FGR4Q/LJ5IN8LSmM5FuoTq8B/1TJW88GSfSBZvlL147iDr6cCOHekr92HvVJ5kk5jjHE8
	 7+wyn8g9bgS7gtarSQezbfBD1avckflulM9PBaQENK4CzIgdyF88Yj+Qdnf5TqtTNeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=;
	b=uhE5VV/xVQ+Dlo2QVW16VDnMOX0xGTc9Dzcbm4oqrpX9ljFOSpowfxIYVvc8PK7gCY/9
	 paJiPqe0elL/jeX0CR/JHLq03qZWEcsPsxjFEwsmZyAoshYFz/EP4z7keOv2buPEEbPnr
	 G5LukwcRleeBD7xKfDqhIYNHlLZ9SsPVSmtBQE17bQ7cthSc80n/1HlRwl+7lHKYXbStU
	 h3lO0YipG6klMKFZ3uoBYpFENmk8pG3Pj7Uqw9GFMP1jZiZFtD5lEtj/4wQ1RrKRZ4KAH
	 98p/99k2kYNv/XrfKBVs25qI5SDZ8nq8wx93kpTrwe26V6dByfGAvti2dq6w62bpQgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QmbkTUT9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yjuoh8J2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030F8606A326
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 13:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 030F8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QmbkTUT9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yjuoh8J2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClfnW2547527
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 13:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=; b=QmbkTUT9EgzLQBTd
	DwbS5LW8ukNsULr+oDxFwYnWgiBPXw3dEogpNru3TPt4l2RQMK/YbXTyxbgQvxtp
	25KeFLv4HAUw9jIoRRfOfgpUSJ+nSYeH8WZ3pVHJCKKmyG+gUkaxtcGaYwQtNu7z
	thD4iYNqoWWEbPZgu7X9/AoSyNOFB0aaMpEplshRjGOQFmgpBM5s88x0hhZAKiIP
	o8eRJeGjCCTksdklSC+cKahTNWalNlHkpw2s+C3R5MVlPOp85pgbZoLXzAaW4mXh
	U+OCFkQ+6qG6tvpY4rvZLH8gUlWChW8CuTVLkd5qqkWknKpEPpL0j/EYHbmGBM21
	K1RXeQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3y1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 13:34:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9987bffdecdso14905241.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 05:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712857; x=1794317657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=;
        b=Yjuoh8J2RQLzQGV+hkx+2lXyJfyPwnZFNlW2hE5Bevo1HPu7b4yREuDQsudGWDZKag
         i3KWUTdQJUIHK3ztUzeryJrW8zvTWgyKwIOgI10o1qElB59R/Bmjmroa31K5grH/q3m/
         H/FoI8yYUhhh4UPMU8JDqR/hiVnj7Q9n3dnx9DoxkXoe6mRvI2L/yC4BCfP734/sNOkN
         nTAcCOrxk2CLvLEOzmLzvSOSY+VUfkVI9C2YY5CZz6x3648Zy2nxEQ+WpyvNnDm4QdQI
         L/H4nxf9bn6XCIuiO4BTcJ0mWGure8A9RJe6qJVScc1VdBU09FN7CzeqavoQzx4K1gDf
         wQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712857; x=1794317657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=;
        b=Vsl3bQqCTeO4p8Ud7y0CQKzlSAgLjC5lIl17mdlXFQjrWMZSTin752jP03iKNSfKqh
         MX/FjLlysZ6Poc+BfcUqQtP1VMJ6hPTmFt/iPWo8ltk3P19ByeLLFJLdXzYfNG/gI9b2
         /fLRd6vuDuT9vMUgKR3HT4FgzS7qkJJ6lXN9/Jt+TnYISWpo5GvPwBnAeEi3eDuT1vBb
         XV9HsJVsj3ilGNHMsGzkPPp/U2dtCAv6DVQjNQShjPEJDw4UVC3ZJSWAoM5Q59SL+SoE
         eo2Xabj8858IxiEWngMQ2LePhMDKCxIzjgkMgpHNbx3X22gHoBBX9LIFFv8WKglkg97f
         /mwg==
X-Forwarded-Encrypted: i=1; AKwUvByyAN+mWZcua2PIKEKoz+UtNuqkq6ttXFIhcKe3C3sXyXiudQ/td6Q2bhkX7ki9bSKlnwfiMgPhIdH6@vger.kernel.org
X-Gm-Message-State: APuU4Z/qpz2JcFvZtG8q+dIYfYCHgwhWL1ZQgKPiGXFLTepITeEX8Vuy
	OvUIJTj7DKyd6X272vgcF3TgIFDhWCHbe0aXUkoPPMu/JWt+uKhyraGN5uiJbM2qgh0+ik6WTQb
	xnSIPPf+O7Kh8RzjAAT11MlkBik5u/Rcw769+nZDKJCJvWNK/dii1GOURKj9jqjRL
X-Gm-Gg: AYBFou1/4TCUoZD0tDuJ4jywfRHmOi/BMUqWZTH9BQio/peMWnd97uC2ODq3QLBqaqc
	EomQpJ3zPq3GI2SHqtyrpTENpHVcRuR1DdGprW8JqP4t5J6zoELTvc67nHA8GR8JctiD6H+joij
	h5VbuHe52Zu5WDIggN7c9sJLnVbIBjCzjyo5RnIGDulu1p5pNz7qc63v3/zDvqZ5JweIT4rtYgN
	2yBec1+N2C+3r0fBLHU2UcqDOVCr9hIVWikhMXNFjCxpUfLIDwV6tzXTmT01rDIbPi6M3TaxZBD
	sxTN71rAE3Z1KOrO/Z/luDYijFTXOHF0vOEnqNmfPY/B7fypHhknn5ek+MHsp/GdDZt/VQYth2s
	l4XFD25EPJVsZoKKl+d2GwqcB0DIBVKMaLZHGyKjvVjAaR/xvnGz386y/JlgAhJQOYAnA8h85Jr
	RTBA==
X-Received: by 2002:a05:6102:370e:b0:7c3:2168:d603 with SMTP id ada2fe7eead31-7d071f40bc7mr5046267137.0.1793712857316;
        Tue, 03 Nov 2026 05:34:17 -0800 (PST)
X-Received: by 2002:a05:6102:370e:b0:7c3:2168:d603 with SMTP id ada2fe7eead31-7d071f40bc7mr5046256137.0.1793712856891;
        Tue, 03 Nov 2026 05:34:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:53 +0100
Subject: [PATCH 2/3] ARM: sunxi: select HAVE_SHARED_GPIOS
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-2-aa862c1d71e3@oss.qualcomm.com>
References: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
In-Reply-To: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
To: Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=715;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/AFcbMcZblHubDxf794SVqjhIpAl11By9m4gfG7n6zY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSrAQvg5vxhqBArsuQUFlydgNSbeoyY/b4+
 Dy4eH/ORcmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 wwCqD/904Uu5wvPIs2SDwjL5QN91sAwhgbcm1t+Qgn/BiD2d4ab61Ev+vE81zGYobw9S9j/z8Or
 Vy/17jrUknJfanVDqVnL+RRNJm/WgqmaiWcjSjSFY3quypJPXqbFyriwzSEmhskOF4u+2lY+Ro1
 Nx2IqrKHi0xwY8ljDETtM7qA1uDQ4mIpNSvol4gysTa9PdFmLjEy3dVjNOYhWWIFfvQ3NPV37tr
 LxD+wjUN4QZRs4uYJLbaGbg46Dy8/mH5a9ZAUNoY/RPsvLC3zSCV0My0pxNRYi/xwYz+yvneaNA
 ozana2AyAeMNKlUAU0HDlpo3KYaLiuB6WHlM4x8b+k7eW18qu6kshYVv1nRhq+uU0mRPzuFKJaE
 10rqsKleMVnr+Z02+Ab/eEiGud09h+JpV8mMTTbExeL+TPMOhoULvd9d32r6boIjouqA7LD8DQ9
 oZsa9h4ytzL/jDdISTbVqxB8xPiPug/S7MDj2lJp6Y080Ze55l8q72oAooI2vS2XiFq90z8OL/6
 TUrcCKy5ypAjg8UMr9ipDDdMB9J5qU85VqhQadmJ3PRDPXtGCOqqm4C+L4xgUXzjy3MwiVflOIS
 Y2gXpDTZzMsb1qBfeHIGzzMDXn5ewPKLVavffLJok/ZIsKxZ8Ao43gXvd5YjX7cyCUs67vt8NQp
 fttVjqjLLdb+t6g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ZhH4T0wdhG9rhKmkFr83DKxBeIh6PO3Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX6RDgIC5etvYU
 9cFaUvEEFk/HdTXcTvnj23HSLOwtwwS5pKdUS/Z/6ThMDF6EIhpVxVMwjSxoUodbb985xmjXJW2
 A4/FZB9E/BV+2gezaxyGWbIuvmayYk0LPdQomkIjK89t/DR732Cx8hpOkbGwKvQxIZyz08GzhMQ
 8clCrQr3ksIzn2RnJEOZ6YIhY381f6NlCckFXFbI+kfckVUDcNWGM0/l96zgENTBVjZH2sFx7wq
 0+oYK/LTLnOxnpF2dgO1Z3YUCTsBbtJIPIN3sMke0/O2vrGCuypY/ROqBirb+qpjbLaWBnujtB8
 7i84T4B0UiR6Vh9E8aPceBnqDYtHwp6aSvts08bTi+MHQsL+q3PlTybc8eFFaJbaIY+343hRkQq
 amGMALZ293v3QCvFcJD1G2xRsYXy2GGXN28ZXpfnVnRTDKw0R5sGGrMSfCEHTAIytXiBd8LK3vk
 AAUZddeFgOswu0iV3xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX/aHSFKgYxy/n
 rLbZPWM1+mgUIf/HhRIusa1L88tOqY6/wkqZzi/161A10CxqMQ0b51N49waReJXlevubBEloz8E
 6ARCUMV1DYFpZjklEO16TJg1NEyYTUA=
X-Proofpoint-GUID: ZhH4T0wdhG9rhKmkFr83DKxBeIh6PO3Q
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9e2d9 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=eCt6F14imeMwFY3J13AA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

Enable automated management of shared GPIOs provided by the GPIO shared
proxy module for sunxi platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-sunxi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index e015f2497111a42133ddd4e7ddd172eda06d90ba..b62e8518e270459444e7d4ee382ef753c368dd51 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -5,6 +5,7 @@ menuconfig ARCH_SUNXI
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_MMIO
 	select GPIOLIB
+	select HAVE_SHARED_GPIOS
 	select PINCTRL
 	select PM_OPP
 	select SUN4I_TIMER

-- 
2.47.3

