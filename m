Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30C138F951
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421930; cv=none; b=oqFlqn2wnr7KjUvedWXfODLPvLgotWkKfnploni5OrvgLDc640XRDFfCnLs4Tx8OyRIT8lDjTWJBN1CMqAKrZ6GHIDD3aZBwr9mxRq1UKUD3++OyyWz5vEyfJEDOd7jvR9WHIRrrm4ErfD3oFLcUfZppfkrt6fVWP48/P3huhtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421930; c=relaxed/simple;
	bh=t170ltihgWozrYlmnpLttCFqB4dGx5JN49WSdQ3OKlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+L1iNgEh/o6DP/eHIne4v59Itlhb1we+1RmCc/Go5hvkohWhT8r927w8aSXsu9fFdHg8FwnpsDCIBkO7Kc+Qd8bAURQOUapR9OmkP6uCsklWMu4QdfZqd/T5/18j9DgjjldP7nblkWXIir3ma+gGDyAMwDksZzi6QwAfEGjV+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkIeBjWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XytUCmCN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lkIeBjWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XytUCmCN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lMFK3113957
	for <linux-gpio@vger.kernel.org>; Thu, 3 Sep 2026 07:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6ndV979LCaTZLV3edZQ1vDIn
	qqgtTr2HK8ig0FCKydU=; b=lkIeBjWnDxpHBFQtqZprxFYNhBWOQPP3P0KEcu01
	ZI8dGtgtY6W3L92L8AAkSg3JA2j7ENlMTB3sjKonFPofr60HG2DPmhHsI/fGUWTj
	TchxEoexNmQ3AuYGK0xANboMJrqBy8ztD/anwbZySXcFG9DfaHT8uNnvRaT1CeqO
	wuPw3mnicZ1YnEsTjgVPz5qfde5bihIRffd3XALwX8ygkLOffRL1oA97aCRThZ+0
	IgjgCM40ZFzmu2WxR84uwmRxB62cGG1d6L7kbTcBZiYfA+lDToaEllaqIZPkP1UL
	822IxYAsSJ4wTqDIucpRub7MgIqNg7ZGhLS6vSZNzPQbDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjs0hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 07:52:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so417930485a.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 00:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421927; x=1789026727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ndV979LCaTZLV3edZQ1vDInqqgtTr2HK8ig0FCKydU=;
        b=XytUCmCN0lOrl/251J1VyJ9bxtzFj4OyBy657i43Y4V0KA/Fjy1x87xJaTPrnIdKot
         Gu1MMfrMB+Z1lrxywP38/7EUf8dF3urSr5/ZfXS9rDOPY403C6F1J5nlQtqImUcqMfQG
         slwn4q99ycA4FEeRN5thvCHhlXIyTlpw/tCUgEPUHxU+NfFyA7cc3yt8m8jdAiES7r1o
         cTw21XKXrZwWM0MCHAmWQx8x6r/hBNrrNRTs48HjXZnlY6t3nGaCAqG6e1kbj/13Kd9s
         JUqf1FtPU+CT5Z7Hvc5fpkHK7DezSG6Dny7iNlKZtlnZjAILNojZ3Fo9g+T2xC6UD9Jn
         ziCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421927; x=1789026727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ndV979LCaTZLV3edZQ1vDInqqgtTr2HK8ig0FCKydU=;
        b=DYz59oR2MBKep6McQJmim1E7PWvta78Ce6K2+tVOoNMH6AePJ3ECmk+OBebREwdsS5
         KpkKm390QI5LNqu/0ErpazXUPQ9+tbgp7uWrV//rU3CTIos+ENa3B1CK5hE+bEf7aykP
         P3UJJvagJhJuLvXdDIwGknWZfp3wk8GJK/baxRaoF/r/pVd52mSXRHixgOfhp3QjAJT1
         kCcKAo2PAFmX57UNQZstkK6RpEE0YXQNUyd1fRj9r5LJdIwUeX7rkMiGD/Msa5BjTDmw
         pgEbaF+L5jHOyza/Y48yC2bZeJV2nUU01uyjzNLk/yKKweyuXAo4TgIS/3g9Bq/YWFxR
         LtzA==
X-Forwarded-Encrypted: i=1; AKwUvBzumkuvSo3LzLEkzKjxAqcM36hYoyOzlFgRn2u00bas0qRN9i7EoEMibVH/u8TFx6W7KFHs+hQ3GCJZ@vger.kernel.org
X-Gm-Message-State: AFuF++nArzjziT80t/TNu4dvnQt3DiIxenrTuWrMMEK44/+GkgzY+dJ5
	nRqomcX7fQvQRsZ4ZXRcoLau77XvRItCk+PxUYKF1zxBWgc4j6Hd+TcAyH3s/URYXt8lINfWo95
	Et4oKIuqHcTuC45B6FW2aN6QNfoxQbWb0Bz34YDE6dCZZJz2k+UgehpWfCdlfVFP/xGoL9+l8
X-Gm-Gg: AYBFou1527apG5uU1TzHQubCnif69ZbidM+ekgvlnNLVjB8OupcuAYQj0Z5W7vQ3uDP
	o2vd5ArL0BvTdCIIohK5S8wg/39hq3lD8HE8vGbQzELS/EIXwEGMy+BFBoP8omKRnqqNEhymOYJ
	ya8J4av/3oHhJkELgZfBdt2UWtKIwlXsSmwpPOobqQR4O7sV3B+wbhUbgpIDzhN5ykAqkGp9Jnd
	grpRdRXzqNcEa0hL0tvzpkSUElKYNDjC7JXMSABHS1Ev58ZZV+uEpZYu6tHLE8MxLrVdq4KB2Gs
	zigjctX9NVKsz2k7yhurAq3hOjCf9kFty4C98UbSeiyYTAFa+T5cZWYA23vX13vTuYB8olQdbNI
	unw+BxTtDSNTKtg==
X-Received: by 2002:a05:620a:7002:b0:933:aa0:bb83 with SMTP id af79cd13be357-93960f69d21mr1174346285a.34.1788421926817;
        Thu, 03 Sep 2026 00:52:06 -0700 (PDT)
X-Received: by 2002:a05:620a:7002:b0:933:aa0:bb83 with SMTP id af79cd13be357-93960f69d21mr1174339185a.34.1788421926156;
        Thu, 03 Sep 2026 00:52:06 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72f02sm11588130f8f.3.2026.09.03.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:52:05 -0700 (PDT)
Date: Thu, 3 Sep 2026 09:52:04 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 3/5] PCI/pwrctrl: tc9563: add GPIO auxiliary device
 support
Message-ID: <apknJCMQEuBAQctQ@lore-desk>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
 <20260901-pci-tc9563-aux-v1-3-dd9b80738e70@oss.qualcomm.com>
 <CAMRc=Meajb919ZN4QYaW3E=4AktXNs1C7KPRGmkAPMrRSnPQiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C1uFe+ZBq5ukVGF+"
Content-Disposition: inline
In-Reply-To: <CAMRc=Meajb919ZN4QYaW3E=4AktXNs1C7KPRGmkAPMrRSnPQiQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX6o/jSpN4XsuY
 sOfVEbp6iUhNaDv+r+NxuVGsNFYGqF3WX39oRGjysmU/A28/X0dbNj6/SQybRgQwIuHe05/v4tc
 JIfgj+HkN4wuSrXnETS3FJ/51PccRGms//yrPDv93c/DQci2SPkNdCbnODk0LVp5oIIQr2cukma
 zYYqf+mLurS5+GQklM6MP/AAHkGFgHzDG4A/DwO3IPWrev+WWGpX3OPwN8c2pJwDPq1o9l0SLaQ
 36eLGiv1IwyOYU12XmLaHY+lpW1ejGMw0pbYX3HdS3vznmlibEHZkubnURtcinvYcdVEsgC3PXD
 CqCpWO78AQT8zE/QG6gqsy4dddjJEjOcOQe66m2lfw/ui3hrO06obpEggSgDBkte9jVt1hMqDqk
 PuQ21uZOaiEmR9lYHWHOy3f9qkgRBy9sV83VkRWRmI8XY7kP337ceYO54pQnYnlrp2qfPZwfgjx
 3sr9IWHgUvdZX1EkYvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX0WEYFdBQAkF2
 D+/LES2Z9dSTgwcB6yu4gU1T+NqfpUFby28EQgmttpTTaPG9kA1HK6AyUQ/B0E6cOHokZOKpcDA
 9Kxjg11LOAHwIxfSo/dwSljPrWmRmNs=
X-Proofpoint-GUID: ci0a7Az2lY7h8YqyCgH9De3Wd3o33cGl
X-Proofpoint-ORIG-GUID: ci0a7Az2lY7h8YqyCgH9De3Wd3o33cGl
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a992727 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lM7qx0wEhktSdUV_m9MA:9 a=CjuIK1q_8ugA:10 a=5Tv-uV9lO1Ep1sV-muIA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030069

--C1uFe+ZBq5ukVGF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 1 Sep 2026 12:27:55 +0200, Lorenzo Bianconi
> <lorenzo.bianconi@oss.qualcomm.com> said:
> > The TC9563 embeds a GPIO controller used for per-port reset signals.
> > Create an auxiliary device for it so the gpio-tc9563 driver can
> > register the GPIO chip and enable DT-based GPIO lookups. Pass the
> > tc9563 regmap to the auxiliary device as its platform data.
> >
> > The downstream port DT parsing loop gains an of_node_is_type() filter
> > to skip non-PCI child nodes such as the GPIO controller node.
> >
> > The pwrctrl driver does not wait for the GPIO chip to be probed. The
> > per-port reset GPIO lookup, returning -EPROBE_DEFER until the chip is
> > registered, is added in the next patch.
> >
> > Select AUXILIARY_BUS and GPIO_TC9563 in Kconfig.
> >
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> >  drivers/pci/pwrctrl/Kconfig              |  2 +
> >  drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 78 ++++++++++++++++++++++++=
++++++--
> >  2 files changed, 77 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> > index 1952ab4f29b6..a07694fae0c9 100644
> > --- a/drivers/pci/pwrctrl/Kconfig
> > +++ b/drivers/pci/pwrctrl/Kconfig
> > @@ -30,6 +30,8 @@ config PCI_PWRCTRL_TC9563
> >  	default m if ARCH_QCOM
> >  	depends on I2C
> >  	select REGMAP_I2C
> > +	select AUXILIARY_BUS
> > +	select GPIO_TC9563
>=20
> I think this should depend on it, not select it?

ack, I will fix it in v2.

>=20
> >  	help
> >  	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
> >  	  switch.
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwr=
ctrl/pci-pwrctrl-tc9563.c
> > index b0d8912690a2..ee9c26b8f5cb 100644
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > @@ -4,11 +4,13 @@
> >   */
> >
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
> >
> >  #include "../pci.h"
> >
> > -#define TC9563_GPIO_CONFIG		0x801208
> > -#define TC9563_RESET_GPIO		0x801210
> > -
> >  #define TC9563_PORT_L0S_DELAY		0x82496c
> >  #define TC9563_PORT_L1_DELAY		0x824970
> >
> > @@ -393,6 +393,71 @@ static int tc9563_pwrctrl_parse_device_dt(struct d=
evice_node *node,
> >  	return 0;
> >  }
> >
> > +static void tc9563_pwrctrl_adev_release(struct device *dev)
> > +{
> > +	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> > +
> > +	of_node_put(adev->dev.of_node);
> > +	kfree(adev);
> > +}
> > +
> > +static void tc9563_pwrctrl_adev_remove(void *data)
> > +{
> > +	struct auxiliary_device *adev =3D data;
> > +
> > +	auxiliary_device_delete(adev);
> > +	auxiliary_device_uninit(adev);
> > +}
> > +
> > +static int tc9563_pwrctrl_adev_add(struct device *dev, const char *nam=
e,
> > +				   u32 id, struct device_node *of_node,
> > +				   void *priv_data)
> > +{
> > +	struct auxiliary_device *adev;
> > +	int ret;
> > +
> > +	adev =3D kzalloc_obj(*adev);
> > +	if (!adev) {
> > +		of_node_put(of_node);
>=20
> This is a bit confusing. You get the node in tc9563_pwrctrl_add_gpio_adev=
() but
> you put it here. Please either do both here or there.

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> > +		return -ENOMEM;
> > +	}
> > +
> > +	adev->id =3D id;
> > +	adev->name =3D name;
> > +	adev->dev.parent =3D dev;
> > +	adev->dev.platform_data =3D priv_data;
> > +	adev->dev.release =3D tc9563_pwrctrl_adev_release;
> > +	adev->dev.of_node =3D of_node;
> > +
> > +	ret =3D auxiliary_device_init(adev);
> > +	if (ret) {
> > +		of_node_put(of_node);
> > +		kfree(adev);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D auxiliary_device_add(adev);
> > +	if (ret) {
> > +		auxiliary_device_uninit(adev);
> > +		return ret;
> > +	}
> > +
> > +	return devm_add_action_or_reset(dev, tc9563_pwrctrl_adev_remove, adev=
);
> > +}
> > +
> > +static int tc9563_pwrctrl_add_gpio_adev(struct tc9563_pwrctrl *tc9563)
> > +{
> > +	struct device *dev =3D tc9563->pwrctrl.dev;
> > +	struct device_node *node;
> > +
> > +	node =3D to_of_node(gpiochip_node_get_first(dev));
> > +	if (!node)
> > +		return 0;
> > +
> > +	return tc9563_pwrctrl_adev_add(dev, TC9563_GPIO_DEV_NAME, 0, node,
> > +				       tc9563->regmap);
> > +}
> > +
> >  static int tc9563_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
> >  {
> >  	struct tc9563_pwrctrl *tc9563 =3D container_of(pwrctrl,
> > @@ -565,6 +630,9 @@ static int tc9563_pwrctrl_probe(struct platform_dev=
ice *pdev)
> >  	 */
> >  	port =3D TC9563_USP;
> >  	for_each_child_of_node_scoped(node, child) {
> > +		if (!of_node_is_type(child, "pci"))
> > +			continue;
> > +
> >  		if (++port >=3D TC9563_MAX)
> >  			break;
> >
> > @@ -596,6 +664,10 @@ static int tc9563_pwrctrl_probe(struct platform_de=
vice *pdev)
> >  	tc9563->pwrctrl.power_on =3D tc9563_pwrctrl_power_on;
> >  	tc9563->pwrctrl.power_off =3D tc9563_pwrctrl_power_off;
> >
> > +	ret =3D tc9563_pwrctrl_add_gpio_adev(tc9563);
> > +	if (ret)
> > +		goto remove_i2c;
> > +
> >  	ret =3D devm_pci_pwrctrl_device_set_ready(dev, &tc9563->pwrctrl);
> >  	if (ret)
> >  		goto power_off;
> >
> > --
> > 2.55.0
> >
> >
>=20
> Bart

--C1uFe+ZBq5ukVGF+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapknJAAKCRA6cBh0uS2t
rCogAP4oNhM97wLi/RHNG1fo3TNyTqy2/f3NiiIJJPSz4udL2AEAsZpGs54+r2Tk
jPosRm/JCKaJgPbSKhe/ojsnQ6tipAo=
=a0la
-----END PGP SIGNATURE-----

--C1uFe+ZBq5ukVGF+--
