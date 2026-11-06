Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942497;
	b=c0QoaLNdMfc3U9rrf8evoygqGuGutCe2dzdOOhRUfzssAbCHRMjrDWbbKLdXVSTCfeZt
	 vEZwTq3R9KaVhOyjZp4nif9mgqwzphNMloZrkEc+dnfRvOgDmFThe/6aJ9Hj/thANLJ6/
	 c/dhswEZ79vdS89fD7dfleIwBUS2UZXhkZ43kuKQA3jneHVm1eVNZhh+kDfJg/lqWnEI7
	 ZImH179CEWq/V9ZIlvimZgKosnJOg3edaM4Tm6oGDiSjljWdqEXj9KY/S9UlWsSZNWUs5
	 nbTP/n0/tPSjZAycnN1d+hMCDG4A2XUj4Z7wuC+iXiHID+u7u/3CoDPmhU1HYMZ1oZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SOjuskPi5ZrZu2taZwM+sodjQgtfCQ3CXvG3+RI9jko=;
	b=1b5/NOYUbJ1KQlPhZ+1o/T3lpPVZsSQBd96xrcEWTro2/+Yurp5+vAQWcl4rTA4p2ZEW
	 1Jm3g8Vz3NVACjPf5q6w8WGzShanrZJw5c4CjW5aWm6KfFOmRSBHWZn4eNossGLnV57A3
	 FE76GppympYOclK82jJognx0nrqgbdPprObch8D1wmJyMHnrKdd51OsZZQeoB75xpVbjN
	 OYHdDxoHnmAcj61d7wiVmnf/GWvqhz5DUbQkhZkN1TDdDGUrPoKn73gmsKdglqjY3KHgR
	 gqeDplIHHUWas+O8IOSsKlZpv9NEXa4ZfpFhJLMlnK9Hp+Z0DXnOovD3EG1JBWdxUHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=citrFcyw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qvcnh9Ek;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25A606A333
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 05:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE25A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=citrFcyw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qvcnh9Ek
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xx4h2833000
	for <linux-gpio@vger.kernel.org>; Fri, 6 Nov 2026 05:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOjuskPi5ZrZu2taZwM+sodjQgtfCQ3CXvG3+RI9jko=; b=citrFcywTfTIOSzi
	nAR9btW9doITBUZbTfbjcjCapOZ0b/R+zxc56klgC/xM4Q5dV9opHwiFamleCX5D
	ltXMAFvQbX+laKaTNt8jXqfCoLMyKBpcN2/TViOOTLTMv6Auh9GZYtfVJPNjhfxj
	Atsklt9hMOT8iEsQ+Yf4jcnQfGdjyggqBu1Zk+m/p0qyBxlPttImXXxCS9fByZHI
	YE63dWjmRZKEm1Bmcv0pgZ10jWsduBujhW0O2b3/86kDdVbbvU4dS+Z6fwjzqDoM
	ap35eJm9rIuPHY4rO+ZrieAOL6I90DGKgdX+JkomE4kgZZNg9wqN2kopDDFo2X5f
	23TO5A==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa12v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 05:21:35 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-869553205a7so4972907b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 21:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942495; x=1794547295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SOjuskPi5ZrZu2taZwM+sodjQgtfCQ3CXvG3+RI9jko=;
        b=Qvcnh9EkhCp+l3bkkgpj1RMkz5ZrnEIW+Y7vdRi/9oDz0HHg7/BYiEN5XpjNZCCbDe
         O01D6yaglfPadD/KfMC6KcaM0niD/OAqqGxxpLGJtcSzw8gDRYt4lNqvhT2HO4oMDyh7
         ILeELRO9EyrOROnYfzozwT969xIKw7LhxqERjLQ7N8lgJuUuz+UvG+mTmZ4/Uzzd6gRu
         eCWUdtbwbFIJKq2f8VRi6wR5G8tWRApLCcVADux80Zs0SPFLCSmghC55nR1jhKpRqzWz
         SsZrj4MTfZHmSnbTu8d8l/eBe+At8r/MsRo8ZUUTOTqBFqP95PbwsoOZRu+w+QiSQyIM
         4NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942495; x=1794547295;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOjuskPi5ZrZu2taZwM+sodjQgtfCQ3CXvG3+RI9jko=;
        b=N+H/cS9ZIKTk4wYCPXaJDitvR9bSLNVfgfS+dOheEejl3chZWP+UZ8tC8miNoJEPAW
         iXbN+3Nkbv1K5In6VmhoJDnhWpON0TYwrn0rTX76Mt9GmrAoUSiQf72X0FRK6r1g/cbY
         wlj35CDVYUEZPMmMNFU+/pXUkHLuSoDbE+lR8r5Gy8979/zBu7vD9Kp78KylLugVdy7s
         v6lh6ndozRH80+A4EeZOgz+5lxjhfMM0sLy5IKnzE0yx92M0+F8G0U2SUG0wMES/qd7e
         fdM2zryvLyK2p7/9ttqG1hb2Gb4DK5Y7iQnkFNZtg9ZMmbykpw7eG4Arg1iBIBe5Huiq
         MUDA==
X-Forwarded-Encrypted: i=1; AL+hErE8ZP/QSIBIymCexkLTkN8AjQBjeGrIeYlQiOAVK/HIFAn5wQPXPLn2FdfoLxrlxazDXZ5IjvaQNgQ7@vger.kernel.org
X-Gm-Message-State: APuU4Z9PIiXAM+PGojxAPuOwnHfzv13Vlkbkrz8g43+QZnx9HSwST43s
	RMx/IhppL/Qpw6bzMA7eLlMUeAd4YvjZPqKd9s9ItujO/QnrIDFhHdV+3IOCRzFXS+8vKiVtoHQ
	UT5lBnowoV1+++qTnuZKWg2ddMsLpZLl/hugBrdbMjRS/INKFRwCB4ieVgTZjoObk
X-Gm-Gg: AYBFou04lBUpB0mGYQBYoqhqJL0LvEcJNXuZpvLtlQINzx0v6afBZt4CrRfM7mUCTUF
	ifYQsFBaCflpFabtlYBgoG/UjVQjx7u+hh2P0iDzE9wztVApXUrg25tTYVlgVHScIp8BRfWpDLF
	WMQjwHKFBc0rLPIfCRXbKCJfFB8IftaxaXo0TtIz04wzmz7BEaU8Dzs5tIUh/mdQ4Jp9VzzLbCw
	a/h/o8hwho4tTp9Pzx9ihtJwQFe4S8zUQVQJDhClvhyLhrz1QneyhDjZcem6fWeviAnDkqxd4qs
	olvhy75uvEBmmA0LHUVMX8HGHcjoUVcGWlmG3MWJMzbqZo6/hYK4xRCB3hHB4X8J9mjV/poDNzd
	fF4I3CJSumEXvqffI/+T/VCzqHQqaZN0Dqc8tlf6VRPRUTfJFPkXR/qagADnUVG7tsbOrOHU4q0
	fLfMBIZ73aTBLFoWzcsRaLw66PJlAawc7OEg==
X-Received: by 2002:a05:690c:e3ea:b0:891:c494:1a99 with SMTP id 00721157ae682-8b341960138mr9033007b3.24.1793942495184;
        Thu, 05 Nov 2026 21:21:35 -0800 (PST)
X-Received: by 2002:a05:690c:e3ea:b0:891:c494:1a99 with SMTP id 00721157ae682-8b341960138mr9032907b3.24.1793942494720;
        Thu, 05 Nov 2026 21:21:34 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f770cc6sm11584617b3.9.2026.11.05.21.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:21:33 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reset: gpio: Parent the reset-gpio device to the GPIO controller
Date: Fri,  6 Nov 2026 00:21:31 -0500
Message-ID: <20261106052132.2737352-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com>
References: <20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX/2N1gTmJBVMo
 3hyFx+orlt+LqFlqVcfBGRx7gbjXiLk8zrysXr/RESm68+22FLFhjHlttM5YmVRUQB1ycmtcziF
 84OyVae+4FW2neNJiDhc/wSSeousqJFlT6coFMoKtosB+8rjQ0ihr8p+gOI1HNjhsNS5+lQYK0/
 GIrG/AwdnJiVhcnTrLAJhlmu8C2dsLGZFQhcWtBcDsTlb4l2Vdi1DZdhM3Fq8C+2IKSCRl/BqAh
 kw6MUMZOXciaqkgvusNhOriYaZytMMVGoHn2yiIFt1wzcsrjcAjBKUGx7S77yWVP+pHbKDlZe1K
 26r0Ou5/bU9RgUdDqx4YYA8824SK0Q6OXho0OTqjXB2iX8+REZPyodaFTJJvL2BYq33CyMz+Qei
 8YIRMehdFi0FnrOamc72xbRlUd7zu4D6ywGa8Qe0CBIOxcGDTwMEPEeILJ4KUyTU7Yw6BRcg7Ei
 vNPrQYkM9jY9Geib6LQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX+pMRCaP5Y3Ud
 fQo8uo82GcUd6xU6ugZxGU2N5yN1TBJPAOV/Q5dROlLcHrz3nX1lKUz8Vw72h8jhhgc8dSujwcz
 5e5NNBYdshqj/+girzdKp8rPTu70zGI=
X-Proofpoint-ORIG-GUID: luPp984lnIdr6Tpmcas_AYgbZC_8WmFf
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed63df cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AC0Wvfx5D2MqvrS3mtQA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: luPp984lnIdr6Tpmcas_AYgbZC_8WmFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060020

On Mon, 26 Oct 2026 at 14:21, Abel Vesa wrote:
> Make the controller the parent instead, which stays registered while it
> is unbound and gets a new GPIO device when it is bound again. Keep using
> the GPIO device if it has no parent.

Fixes: 46dae84a90f9 ("reset: make the provider of reset-gpios the parent of the reset device")

> +	aux_parent = parent->parent ?: parent;

On banked controllers (a gpio_chip and fwnode per bank)
gpio_shared_dev_is_reset_gpio() stops matching, since it compares the
parent's fwnode. I'll send a small fix for that on top of this.

Adding Bartosz and linux-gpio.

Tested-by: Tyler Baker <tyler.baker@oss.qualcomm.com> # Hamoa IoT EVK
