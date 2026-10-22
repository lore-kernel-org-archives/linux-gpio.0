Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689944;
	b=SjycjISbKDFKwIYFOCBV+oLmZwWQ4jdyiOTKS4ESELo4w73p1+rvlYWkmyjyRlFyj5iV
	 bKqX5vOqfFF4Rl1yJiOA/ex2w5F2IjDa5kyLI8dP6kM00zdWdY6nwyg90rpXxr6y/PVKy
	 yWqEJ5P2GLzHWNXWf9MjzQ9H78M9ckWMJpFljGdsFyuG/k4Qe/u7ExkPdK8eK6FoIFx7M
	 ESRNZpu92VBrJr2mqx69yUoiJq0Zy4mRQDhJbuVelFCb13og7nupIJgBAZNiAhWQiYaA9
	 LfpF1VQVj6d+NbaSW0/cPzDfdRneXHBmW/5qRGPfgsGyvc/tiPvdn793NYIANrf15cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z6AktrNRc2FXQ2aAgAi4RpcR1aHmqBhSrhbs1Sqm0ko=;
	b=oDjisVI9yEuA8O5lPlwsDoA44WnCCq9qKtPmbaAWsjHZuXbTjUzjnbSl5n9WAX16Zb4a
	 BdrrpsQpovGKJpJfOACWdsioOIhAS4Gm4ccdSAkaldBva8A2/JqpaLy+wzJ3bR7xYEoHq
	 9rPch6ZrKzVkkep46OrdGqQYIEAUC9XFqPAwdD8qZ9cchkJQJna8mnphoFmkQujGbVG9s
	 4DQqV7yqkYd5Q0PwQqpLV4pbZTwoKY9tKWDmKZ9vmKORSMF+QT9Bmssnq7PrMOv8h/KTR
	 d0yGUTgLthEZhSeTK5lBJB3r3IwS+7p6GVu06Bixy9arZGfnKJ8sB2817yu5+1/1Nng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CWVb6AWS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfzXVGVJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A91606A31F
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 17:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A91606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CWVb6AWS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfzXVGVJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEF8QQ960649
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 17:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z6AktrNRc2FXQ2aAgAi4RpcR
	1aHmqBhSrhbs1Sqm0ko=; b=CWVb6AWSVmzhe1s1IEiTSHJAt5TbC5Fd9U2+RPS+
	JnmomB6jHHsWXmJce9U0I3dO8SR9Z726fBDPaUo0K6/inE0LsBOvrbEvFJ0IzbFa
	/EASM4VnVPXEoz8jb4SAQcU+Wm0nASBcW8AGtILybFMcHNEUj7Qd1upYAm1+XXc5
	2WUi76Ln4SCO5SgLlaZrK4T/LeaUwihuKYhbaJaCEn8G9UAoZenNIaxdKc7MIdQh
	0+JMTe9QnNbWHYLST+1TfBsZfpbuORYt/uLp00/0JY5A0nIK0fDNaMF2zVKDdHRN
	AZUPMG4x59TUf4Ldrf/nukMKEzn9NePnIalbRpk2YVbPmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93amv1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 17:25:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so768985a.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 10:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792689941; x=1793294741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6AktrNRc2FXQ2aAgAi4RpcR1aHmqBhSrhbs1Sqm0ko=;
        b=FfzXVGVJHBoXo7g611hnctNhOLrSjfw3dV6SOTnuepYkI8fYIpLC9jfFRLPDsUyu4W
         MPxIGTkxMOR/EhYFrwtRyp/fqsSgLYf3Z3wkkdeAkP12ujqflOdgbOjx7DI6z+6S0+H9
         ZDrN+ajJaxZ/o7J2Z2XlNQQfFP2wikUexoEbOykqlWOA+3ZyczsMbkisEwTkIDB8AbwV
         /pJlUWjCjxX5zVMbFv/FMSB4MrZmqHntoLMXgfpGUrnhDn5/8raBgfNpCj+hurqtgF2d
         i+qHMwMahuXpnBORydOUoXMOhUUzMMaQKgvmnmiLHHnw7NkrHaufIOq1B0d/IJphs+3Z
         taAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689941; x=1793294741;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6AktrNRc2FXQ2aAgAi4RpcR1aHmqBhSrhbs1Sqm0ko=;
        b=QFTNMeL5MalpQmCWs8aHjZqMmYoFyWtaHqBIk5SQYPi7mnncsm8XW1dM7xlK+I7FoJ
         2UGsNctyYpDolw2ZdQ2zaD4U9O42Lg1mUavP65vY05OYC7g5ZXDRPSj4BMedwLm9UaG9
         ItsuaKLzjvrGHhLfrTE7jEloEZRf9KKeh9A50DpRzZNdsGKaBFRnQU2iEI29/cUIX/3L
         JKnQ/yMHSDblVfSJwh1Zjr8x/w0Vpi9RzhZA25+PkMCfFdwWpE8a/ppOFm7ZABBsdDx/
         TTjI5YXwWNyTtD1XIGDNa/8Is4GGM+YDprziYx38OSZ1mRz8vpXgN9ASwxRvXZI2gAYZ
         KDNA==
X-Forwarded-Encrypted: i=1; AKwUvBzNm/f68Hd7jcqad0km9h7QyM+JMx8NczKnlv8ijzy3GHzZN6JPRMaxqd6vKcfyZHykFTIpnK9MtKXF@vger.kernel.org
X-Gm-Message-State: AFq9FYK//EPicW443rvRsRfw32gtuSnujTYxqPd1DKMUat7NjyP3Cvnp
	iJhSUNY734GW/QgmDENtzgZUCALo78kEEjXTwR1UYvVHfm1YFCv950ljIeMLeShzjQY0Lg4qRhM
	eNkJJ49Ea2zKNp8/8yFgNk/sP6flrOfwG8Z5CORTC0BGiEcwWIHRr1a6VO8UpyHpV
X-Gm-Gg: AYBFou1K1WtrW2tjgNZvQLWMVMS+rWn1fclF+ytzTKkWkHi7aWZPbGQJxRAmz330swv
	e/hbFJO+gExlH/URPyz+pMHvPbQswJ3XwUTv8LtZYSymYAXR7TOVjFU60TQJKD0j22AiLvudv7h
	0t7nHBXsZ+LpqFRWKczwtrDDW0T1Ys3fRjWFxQPtWDWtnTU3WgFZuW8nOgvNobfj/PgVK+mf1gl
	xTvHNYZRH2l0nv0BG9VDeo0JPF8j+d52DKuqXmEV+YO54qBddbUX7KeOutIhZDL0odmDYAT4GO6
	YVSaV6jPVIybytEroLbzCG/6FiqcVMVasLcLQbC29Gxu+klodQBUkxnsYREyJ26Vx5wITIOpakO
	Ob8xZtCNuLtPI6g==
X-Received: by 2002:a05:620a:17a1:b0:93c:80d8:57ec with SMTP id af79cd13be357-93f6f851357mr22883085a.64.1792689941007;
        Thu, 22 Oct 2026 10:25:41 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:93c:80d8:57ec with SMTP id af79cd13be357-93f6f851357mr22875785a.64.1792689940357;
        Thu, 22 Oct 2026 10:25:40 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm13786270f8f.8.2026.10.22.10.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:25:39 -0700 (PDT)
Date: Thu, 22 Oct 2026 19:25:38 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, Alex Elder <elder@riscstar.com>,
        Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563
 embedded GPIO controller
Message-ID: <atpHEpzw27_8wu7t@lore-desk>
References: <20261015172620.GA1780580@bhelgaas>
 <20261019220111.GA2271378@bhelgaas>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="THddspKwcrT7mb3a"
Content-Disposition: inline
In-Reply-To: <20261019220111.GA2271378@bhelgaas>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2OSBTYWx0ZWRfX8m0CqqUeCEtQ
 p0zPbZ8YZ6jtpT1D1jv38RUsCnZ/WNeoqwZ5oio2PtnGKY0CCqaaZoTO6F7MXT/m48+pVEDR/p6
 kB1uLnWZ0oCKoComakzn5++hvRPE39z4d8lDlA1mf7Jy2p9WGwtImCJd04MhVQXMs4NiWFOlIad
 2JtwthIijf5E4IY1UJcXNWkFVFwnoPfL5qJrEEq5RyjxhnHmRpZs1dxPS2+h/GgckiZ59xBpxxG
 86MmbUJUk+PMwr1AdtKoT4p5SD5e4A1xnF6OghdSCODbvsLZsZBu3xjUU9lRTE5BN0LG3Gr2/St
 UxF2cwKg0R+FKVc8lgB756VRwzQ/3s/6n7GF13cDj+25pLx7igYNYLiDzaC4eovc0Umdna4+JOn
 3o+kzpdAwNlQFuEHrRjC9hUbiyd3qh5mg2uoX/GN6TNbzHaxS7z9dp4dgVY8V1P585002SH7sJK
 zTsyGkya9iGmVg/AnPQ==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ada4716 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ee_2aqc6AAAA:8 a=tAtCrcrtAcaxr7tUyVkA:9 a=QEXdDO2ut3YA:10
 a=plpxFqqDF8Z-DRInVI0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: c0Bzj7mvk0hRE6XGpeLESalSyokb_-J_
X-Proofpoint-GUID: c0Bzj7mvk0hRE6XGpeLESalSyokb_-J_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2OSBTYWx0ZWRfX0Gjl4DVKvqnc
 IFOSAWxmii+pNZWhdP9+nY05LY36B22rgJg9he9lmhHRiNVofnnpu8WMm0QPFrttj3Vw5MVE+VK
 YQixg+H0yZNm3QeETI3KjBl4kCXRkJE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220069

--THddspKwcrT7mb3a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Oct 15, 2026 at 12:26:21PM -0500, Bjorn Helgaas wrote:
> > On Wed, Sep 09, 2026 at 04:55:57PM +0200, Lorenzo Bianconi wrote:
> > > The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 =
GPIO
> > > lines. The controller is registered as an auxiliary device by the TC9=
563
> > > power controller driver and accessed through the same i2c device.
> > >=20
> > > Describe the switch node itself as the embedded GPIO controller and us
> > > it to drive the PERST# reset lines of the two external downstream port
> > > (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller a=
fter
> > > switching to the GPIO descriptor API for per-port resets.
> > >=20
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > Reviewed-by: Alex Elder <elder@riscstar.com>
> > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> >=20
> > Bjorn A, I first applied this arch/arm64 DTS patch to the PCI tree
> > along with the rest of this series, but that was a mistake because=20
> > those changes should go through your tree instead.
> >=20
> > I dropped it from pci/pwrctrl.  Do you want to pick it up?
>=20
> Just following up to make sure this DTS patch gets merged somewhere...

Hi Bjorn A,

is this patch supposed to be applied to your tree?

Regards,
Lorenzo

>=20
> > > ---
> > >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm6=
4/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > index a13315bf0fb0..4da7342ca90d 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > @@ -867,7 +867,7 @@ &pcie1_phy {
> > >  &pcie1_port0 {
> > >  	reset-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> > > =20
> > > -	pcie@0,0 {
> > > +	tc9563: pcie@0,0 {
> > >  		compatible =3D "pci1179,0623";
> > >  		reg =3D <0x10000 0x0 0x0 0x0 0x0>;
> > >  		#address-cells =3D <3>;
> > > @@ -891,6 +891,9 @@ pcie@0,0 {
> > >  		pinctrl-0 =3D <&tc9563_resx_n>;
> > >  		pinctrl-names =3D "default";
> > > =20
> > > +		gpio-controller;
> > > +		#gpio-cells =3D <2>;
> > > +
> > >  		pcie1_switch0_dsp1: pcie@1,0 {
> > >  			reg =3D <0x20800 0x0 0x0 0x0 0x0>;
> > >  			#address-cells =3D <3>;
> > > @@ -899,6 +902,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
> > >  			device_type =3D "pci";
> > >  			ranges;
> > >  			bus-range =3D <0x3 0xff>;
> > > +			reset-gpios =3D <&tc9563 2 GPIO_ACTIVE_LOW>;
> > >  		};
> > > =20
> > >  		pcie@2,0 {
> > > @@ -909,6 +913,7 @@ pcie@2,0 {
> > >  			device_type =3D "pci";
> > >  			ranges;
> > >  			bus-range =3D <0x4 0xff>;
> > > +			reset-gpios =3D <&tc9563 3 GPIO_ACTIVE_LOW>;
> > > =20
> > >  			/* Renesas =CE=BCPD720201 PCIe USB3.0 Host Controller */
> > >  			usb-controller@0,0 {
> > >=20
> > > --=20
> > > 2.55.0
> > >=20

--THddspKwcrT7mb3a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatpHEgAKCRA6cBh0uS2t
rIAcAQD9XMFk9P0Wcr2AnQ1Vo7zfOmzMMBX19nW9jYUu4UxD3wD/b0ihb2VzRcme
Iwdwa1q9ZZQu+2CgZgGygpLAkLGRqQc=
=CJkx
-----END PGP SIGNATURE-----

--THddspKwcrT7mb3a--
