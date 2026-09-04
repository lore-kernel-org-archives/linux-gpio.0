Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C274A2A55
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 13:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529873; cv=none; b=d+r9bEFYYMYZzLjkKDvUMU+cQrnX0ZBOCh9B0THab6+JTGvwixb1S8YafCvKmb9tBAOMcgS3dKKsQ0my4RIL0awifIOpCGzrg3DDGdYR1k1ASa7HQICVfPYmUcuslkjVsrEKTuTpi/m4/Nt/jnoYHm684aDAJNzF3IrozCMQLEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529873; c=relaxed/simple;
	bh=z2esHt+ejmv7OQKxSE8vdxsoJaGIju5rEtZi2+jIiqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsTisT+FbCcTBbk35oPjFUgEbIW4YgNbb+2duzHK77vJ+UHnsQnpiughh0cAUEs5d9+GP/eIaYMGu+tkMLQkscR79dpn0BfbSOuf4ndJF1wwoFXNo2uhy1AGwb/XyrJwP2BNix1MNCUcU/LxzrJ88LfJWAkmv/05h7lhch6LCKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+uxlH62; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xtl7R6p4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+uxlH62";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xtl7R6p4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684DguCp3121409
	for <linux-gpio@vger.kernel.org>; Fri, 4 Sep 2026 13:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vz2jp8UAvQVC0hixBLaMAu6N
	bc13o3wiA7v7hXxixzI=; b=F+uxlH620Zn2HECmGPW1OIbHYSjiHPyMxqjOuLC5
	FN6YSOubq4VyBqDAXNcrJVeNLNkGFS7dC8jzgE3aiEXnGbA2Nwy8Th2WAk2Otv8y
	nlBWVWJLejPoHjs5EJgmzgvF195gUlC1sHojuguG8tP8FDa0gWdVOjMJbjXXksnA
	isndiEMVLv+4od8mDkDAnBXsY/hLrmckzIwUW7KYePANDHt7UGB0VG9wg8TQerP2
	hCnIg7dfayZDwu9zRzWmp654snjYsdVECMYoHA+7CHpxMYvWNXgNkW1gItJt/35q
	2h7IZWDl6Yy8IV3vb+vhQCSrITOBq4tIMIqYlNm47W3nZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fj4qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 13:51:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93771aa0379so260756785a.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788529870; x=1789134670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vz2jp8UAvQVC0hixBLaMAu6Nbc13o3wiA7v7hXxixzI=;
        b=Xtl7R6p4V3f0L9ZSi4PHjsm0IQU8hIsBirXNKtKh+jCSFSUyXGCV37x2GS+lB9ceLj
         9O1Xeb/NV+0e3PRQnmBm/n5paB1XAKp41swDFENPvw4HcjUmIReUByfVkVF4bte9+MgC
         5e8uRMPdYbfvs5J0uCf/d6TzypiqgS2x0nKRYscbcpnQhleVpslDC2F+mwQ60SdqJb1Q
         qB5jLqjZANtvyW+7YpfuHqx7Gu60SkJ2E71ubcoQWYKRjP6nHNG5pauJhQSIyu7kJNVa
         K6uR35f3+2Rivc2BpNbVIQakHP1gGhMDShMAFVJfa9uKL+rMu/APov5/WA4NzOHwwpNf
         Qm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529870; x=1789134670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz2jp8UAvQVC0hixBLaMAu6Nbc13o3wiA7v7hXxixzI=;
        b=iuH9fP6xX2+sEAkCDt30Y2L47kB5TjIQpSrec38fShe5zpzm3MYdNZY75PjqtyXlGI
         82XfgKg1DCD3e7UuU09oTTzuLLUlz5bwcp2XcJiIhC97jCqsa3e2kKVx++lbHxVt4C7V
         9NQ6f2reml+XpJsWe6ZRgVPVtETT4KViTAn9cJA5dNlrE2DVkL9pfSfacAwS9yvxIQ1z
         j1StMzFWGNSSukOWgrbgkmnpvx5pEOFP2nvWWWza+32USO0XSaRm6dw2uCkcXl4arcdg
         s40/KCrukPCsjEzW5s54ETu/MFrUnuQb//oVnWG8zuBgLPj/4tzuVRrRLmyttzv2SlP+
         srew==
X-Forwarded-Encrypted: i=1; AKwUvBwRy5Ww9OF/b6sYawdKux/ldl3INaxlmP+n/DL9VtA+172XQpAPnsMyuRprNUy8QARPoNxMEKlL86c7@vger.kernel.org
X-Gm-Message-State: AFuF++lLoJdgP0BXHOAE5DCvPt6kzTWHg4UrtOj2j5CUIrCkTM7AD/Wj
	Xb9uf+c7QwIE0bMCIMupSDEqQCyV2hjX6lCrIfkdqLs7tNCnAfcjYBngI590Si+ZbLz/aPYF1Xf
	gpD6SXXi7Y7yFAU0UpI8LQbFr3haFYxgP3vt+N2+zcYN9ZDOVXKODRREKZApFoOgY
X-Gm-Gg: AYBFou1Y3E/+IORb5m9tm50ZAobE6+dvl9eF9OHDVytj5w+Izi9yE+WFTXR7xguBA7c
	6wOpKujqf+Y1I6Zg7mFi23mDbhhQF5MbKcICqtNfh6qG5pPcqiYaJG35MGkMiBr1YaNpWUbxIcq
	Bg+13jCS4K5IQ5Q5gvDOY/BKuEafdzqDxBJP+7ubSZ/Y/n4H7zP9ygg06hOm0ES9Z4Y1v2LRE0y
	9ykZwdP1gBjkuHaxVHOdznzlqDnHZUadAAbPGH/0xAFAbQm+U87rDdO52RpU+Mroc6yJ49Uru/v
	oXzzihQpiM6Qs5mKSJQ/8xDR3kSB5nbX1IqZJQNmRvdtyvPDjLQAOE3Y2slod1qZ88IZaJ+2sUM
	d0oQGELcI8YGSdw==
X-Received: by 2002:a05:620a:4493:b0:939:31b5:4e08 with SMTP id af79cd13be357-939800fc582mr562396385a.0.1788529869686;
        Fri, 04 Sep 2026 06:51:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:939:31b5:4e08 with SMTP id af79cd13be357-939800fc582mr562389585a.0.1788529869081;
        Fri, 04 Sep 2026 06:51:09 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm6437481f8f.18.2026.09.04.06.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:51:07 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:51:06 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, Alex Elder <elder@riscstar.com>,
        Daniel Thompson <daniel@riscstar.com>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/5] PCI/pwrctrl: tc9563: add GPIO auxiliary device
 support
Message-ID: <aprMyjZs3Re9UCQS@lore-desk>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
 <20260903-pci-tc9563-aux-v2-3-34c625b542c1@oss.qualcomm.com>
 <3nlsilckqt673fs2qikpnniius7gxwxfit2xbwldp5ac74objo@yr5yhp267f3r>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vgq1jszOkLu1v/d0"
Content-Disposition: inline
In-Reply-To: <3nlsilckqt673fs2qikpnniius7gxwxfit2xbwldp5ac74objo@yr5yhp267f3r>
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9accce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Pk19pllHZqhTeWfk69IA:9 a=QEXdDO2ut3YA:10 a=p8WpEMGEU3HvF4N80_gA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5Zri-OARzdiFRt7ELUL7xzz9AGplSSlg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEyNiBTYWx0ZWRfX7P8Pz9xB17FH
 Q3+5gJFUvFrH3wrOWOY/yAAFsZdiAt51OkqeWe8wWZ+uiyElwHVuva7F1H/WE86vt8gZ1uJxaRc
 YDGJ1xX7OKkL1r34+DhgU8yJPUzOmN8=
X-Proofpoint-GUID: 5Zri-OARzdiFRt7ELUL7xzz9AGplSSlg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEyNiBTYWx0ZWRfX65RoD6JLazB6
 BQOATeIwwy7X2Qn058vO0elxXEyEpNnvWjWvQ/qj2Rri4ek8Is/pQz76EJ/VAUYVY996eOcXsqR
 IYMLIFONVyR4Y804hHsRlzDQNXiI9Dsdx7Tt1y+Ec1R7DOlqzI9sSkcm8GoKKMVkKnSEZA4WVjs
 XkBfQeygQK4/49nZ6c1kD1WOUkcr8p7nb8C66p8kE6IxYPVHvnZq7xVU5EX1euPoqmsI7VvgJlD
 Hxo39EVgRwcINVkuG7Shnbd2GCczkDeByz5vOPXF3Sgld5mqE48LDRreBci/Afbgnsk6LQakTXH
 yPBaC+1L+z5wELGQVaDQUKbaAKWY5OcmcNT/lWM4CbHqWT9eL1qNgWWOXTkxImg3OAd+jbP/4w3
 pnYD/mcO13MBFGarUI1arEjn1F3VJy6UcK20/e5j83Q/5J/nkrxfArQCycBZ0tvH7XfjjzPmjfN
 HjZNb/rQSQvZfNkY+Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040126

--vgq1jszOkLu1v/d0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Sep 03, 2026 at 09:52:59AM +0200, Lorenzo Bianconi wrote:
> > The TC9563 embeds a GPIO controller used for per-port reset signals.
> > Create an auxiliary device for it so the gpio-tc9563 driver can
> > register the GPIO chip and enable DT-based GPIO lookups. Pass the
> > tc9563 regmap to the auxiliary device as its platform data.
> >=20
> > The downstream port DT parsing loop gains an of_node_is_type() filter
> > to skip non-PCI child nodes such as the GPIO controller node.
> >=20
> > The pwrctrl driver does not wait for the GPIO chip to be probed. The
> > per-port reset GPIO lookup, returning -EPROBE_DEFER until the chip is
> > registered, is added in the next patch.
> >=20
> > Select AUXILIARY_BUS and GPIO_TC9563 in Kconfig.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> One comment below. With that addressed,
>=20
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.co=
m>
>=20
> > ---
> >  drivers/pci/pwrctrl/Kconfig              |  1 +
> >  drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 80 ++++++++++++++++++++++++=
++++++--
> >  2 files changed, 78 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> > index 1952ab4f29b6..38aab596aa04 100644
> > --- a/drivers/pci/pwrctrl/Kconfig
> > +++ b/drivers/pci/pwrctrl/Kconfig
> > @@ -29,6 +29,7 @@ config PCI_PWRCTRL_TC9563
> >  	select PCI_PWRCTRL
> >  	default m if ARCH_QCOM
> >  	depends on I2C
> > +	depends on GPIO_TC9563
> >  	select REGMAP_I2C
> >  	help
> >  	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwr=
ctrl/pci-pwrctrl-tc9563.c
> > index b0d8912690a2..6df512d78b54 100644
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > @@ -4,11 +4,13 @@
> >   */
> > =20
> >  #include <linux/array_size.h>
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/bits.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/gpio/consumer.h>
> > +#include <linux/gpio/driver.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -20,12 +22,10 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/string.h>
> >  #include <linux/types.h>
> > +#include <linux/soc/qcom/tc9563.h>
> > =20
> >  #include "../pci.h"
> > =20
> > -#define TC9563_GPIO_CONFIG		0x801208
> > -#define TC9563_RESET_GPIO		0x801210
>=20
> These definitions are still used in this patch and only removed in 4/5.

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> - Mani
>=20
> --=20
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

--vgq1jszOkLu1v/d0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaprMygAKCRA6cBh0uS2t
rIcGAP9zc3Ril3L9NF5G0q0LUKY8UyK71zNC8Zp1ulXf2XCNHwEAule4t5jrNiNI
0qW3qeVwe8KvQMl3ZvwIJZSfsBr5nAM=
=5qQo
-----END PGP SIGNATURE-----

--vgq1jszOkLu1v/d0--
