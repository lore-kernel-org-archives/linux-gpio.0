Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576201;
	b=NTc14Glj3Hn8sEQEk863n9LiYArrQ2GJN8Z4JAbsC6FYvLnq5IDj22iyk82pqQMVZeA0
	 XSYgL23PiFDV9qC8K6aYOSkv/nJy3nOpz+0l7ABxI1N3r1XcakhC9yV7LELpHUZynmM7/
	 BWGkd1A4G89pnYRmZsnk6NIjVp+ZV9C4dCL+6dRMpv9p+Qy15pww8+18qIhSbS67eB0Yw
	 b+lxo/aSRG8G3ppulG1hlOoNy1KmqdNgVASrfALwZCgnLfqfvZTb5jvoOvhuy6rYQKe4R
	 A/A+ZBAEW3K61O7jsXzoyaspCf3D2cOxS4s2EM+r55T3glW7gseLrPBgrKcflvewlGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ihxKxZB1ejaxXBRJKLhqkzrjcSqUhHkFQ90yxjQFTRM=;
	b=UeP14evsXsGCiKUy94QrHKvf2/52wBQDXS//yZFJknPAVLbXl0VfuLdwDP9nvtgRPFo+
	 +PRwbwu1Mu2AJWvlbFRZQBzF9slyEsA8xLH5HECQidOKLBx9FQRLk9XGW40oQkzKYvHKv
	 AzDd34wCP8UiX4n8Q3/nhPecEZJ4ZxclewfwqcXxo5/oSUFXhglMF40Ve3sYXvdN6CBY4
	 YLDrbdPGQRd0Pq0npXSI2q2rVzOC4s5vsTduwVvLUhGM0DY6qM88PR6ggJ18LVDnsoyKx
	 P7TOrTpUGNluqgoIGCOWkH3CU4aI18WUAexdxMzjhWX6S5yS1ZNLwsXznuMBve5/bhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RXWNXa0O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TaGF+pF+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013BC606A31B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 013BC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RXWNXa0O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TaGF+pF+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0Cc165032
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ihxKxZB1ejaxXBRJKLhqkzrj
	cSqUhHkFQ90yxjQFTRM=; b=RXWNXa0OlRHW8GfojSSbj0G3meelmRycN2rGORBG
	6DfnwTUFz5Nf49A5EUcMlRM78kWmj5Zbw6EKrtYoKLv+hhW5wn5lxYMwIYrW/jbc
	R0pWSfnG8FqyKBSgfdMvPpOwNPi1azCxkceL+w3b6n2VN87KpjexU4g/FB2P9ScR
	1TKRxlwxfiF+JkrCvZrN6jb+Dc+rmOJevR0G4fmWIKwAwp4e4wIOdurLxedyvbmr
	IUcQTfpXq7nR+WlclSY00KO9STcuv0N5WqHUrDLaaZG0tRESXjXP3lf9e6Y0m288
	uS/AlKsp2d6pK9vQ45EXhQ2ELd62zRhO3cyDIhrBL3RT3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02j4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:49:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so175614185a.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576199; x=1793180999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ihxKxZB1ejaxXBRJKLhqkzrjcSqUhHkFQ90yxjQFTRM=;
        b=TaGF+pF+mQvHPTr07KDd5GUm1MNZXWsalORndEL3+tPgg9A+Ap2zOdhSTcpo5PnsDJ
         noh21Ny+vnHP2SM5EGDDLXRB1NLseAAqSbBnyMnQxe2GkGv0rFfUd273MIyKgucgBF0b
         cY29mMrG0sC7GB2F5xsE92pyCXOX351l/x1wGtqDuuO/Lt8uSBN2a5dNYY3CCSsvv6Yy
         WzisdlC9rB/JCuKblwYgxo8boD58U0ucauXBN2jeX3K36s3VpkCF5PEFAFqYxlTlnE+f
         nj6T/LwcKdevyPZd0qfQVd3tmr/lEZIx0mz0i/ldOpK8F/rY3+BmaRn46zBINPjLtF5G
         cpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576199; x=1793180999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihxKxZB1ejaxXBRJKLhqkzrjcSqUhHkFQ90yxjQFTRM=;
        b=SiORTHx7l1RDAVsfZ56bfikmRTXM2XCRwQ04c+tww6M9UpdMLAjlt/dMlKD7ute0sX
         x3y2IJUUS4mTWpWzF7SH21W7Dis0oIgLMVC5QSbrnxilnTgD0/6HUlt00BI9LDWuUn37
         Z+VFRd7R00sTuUec+tGSSlx+BJuHdN/Zb7TSsoPbSGaK2vO+BcanksaHeZgIXxaLPaik
         VbrU5IUig/SPJRl4bhYIv9gV5ce9+VuviTeO73Mw0DmjZdMpy5uAs2IB05pL17ZrelSi
         gCDrkD2E9eN+w31bRBY01Pq1R3HvuuKKHA1RrGu8bNltwZm7+scwJyVi5zkrgcrLhytg
         vr8g==
X-Forwarded-Encrypted: i=1; AKwUvByXJrORWHFHluGGHeMd2XOUNSQco5VdU8iis9BGaTGZqQu8FCedFCEDk3TDAMmTkQrH3unC9y+afIDK@vger.kernel.org
X-Gm-Message-State: AFq9FYKsdt97OCXXbY4rKyKRm5uuq04WTRIbC0IcuwUHVTNsEAQtP6Ka
	JVUHXPsnOxO019zDGS3cJrt4GqRcWR4d4EAV7lGyKEyRMEbYyB+Zb6hVuLu1Mu/WB++kBi+mEvF
	psxTlS5gc3tK0nweDoeqvEENLD6XKho/HdvFSeJ0Q8kcqSBV/jUyOzwsvIQu023J4
X-Gm-Gg: AYBFou2jEL85WcVQPWE4Z5Y+QHA93hapVmUg5Ppzn+23wU/8twyKMGy7hbAonond9v9
	O2id5lutO/l+X4tS2MKsIX9QsBRQeWuYKgEJNY3GxjJKCIr91vuRCJtpriBoUORfxuPEcHVH7kp
	kltagdS2z4YA9II9istb3Vq2Ki5Zzk7Xwmhf/d+T/lcEWjolJOAfRF91arXtozI2+7cJXjbcQ15
	51yM5Z/Ec9ET6qGENdiSKQlXZV7rqEr0fcXEYB4MDGS0uIUIVHbaoi+pCLB+RdM0w/1f/cEXWGT
	Wkfc8wJ7zIpemfUqQWz60OkU8w4XM0vkTW0q9+a9owSRanqS7utXdp8BDtUUjkm0an95hInIk9A
	HQOeBvtUG/4FtGQ==
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr297090385a.81.1792576198971;
        Wed, 21 Oct 2026 02:49:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr297087385a.81.1792576198327;
        Wed, 21 Oct 2026 02:49:58 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm81479655e9.7.2026.10.21.02.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:49:57 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:49:56 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Alex Elder <elder@riscstar.com>,
        Daniel Thompson <daniel@riscstar.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-pci@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] PCI/pwrctrl/gpio: Correct GPIO_TC9563 /
 PCI_PWRCTRL_TC9563 dependency
Message-ID: <atiKxGuCC8961jL8@lore-desk>
References: <45484c37512a3102495d8b75b6e9f72a141ba42e.1792574560.git.geert+renesas@glider.be>
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
	protocol="application/pgp-signature"; boundary="i81LDSJ13peNYO7r"
Content-Disposition: inline
In-Reply-To: <45484c37512a3102495d8b75b6e9f72a141ba42e.1792574560.git.geert+renesas@glider.be>
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad88ac7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=DrrgTA9W1NqqBr-8W0gA:9 a=CjuIK1q_8ugA:10 a=HWeOJtvGEj_8LY2qVjsA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfXxIyEiXkYSax+
 tws4iJgWl/lxXOrkou3z2Xl+h5LFzzuR7tGN90m7teu0Lp8IDwuGxRNiGuy0ypIW2UkZp/YlO5D
 8wmhxkYEZxwTD4BIcj0/z3XO8oicB1RuKB/Ae2NiEODmMy10l6q0QqAFeqxDNrPSvpwhyHM1AuF
 UYyyFRDegk+tZFPsMSp3VICrtPN3EHvyFcYPLCkM78nkSm2yoyyV8lXyTJC+QoijkpaeaRxNXxS
 K7Pv/724sRXlb5ACrzizp3AMuBll4cV7ggRFSgtiRlwSw96vL99Qx/gJyzgRdgKfyVqQr1MaZJ1
 gXSjp1R8CuJ06UmBTCLU78Eq6I5OqZ4hRlLxN4jKJUHNAyPHYSmYDKnk6fQ/U4HnnYQtiYiWE6p
 ChDHdOjun6Z/OvbzH85uVePYnjA6Skyw3jw+0zf2k+rxV5/yYoCKBHA6gOVwrBoQf3Z1trXivAs
 8Ql8dKHwHNjmOk2SpIw==
X-Proofpoint-ORIG-GUID: CoPsd1JiaeJL977-3q4jypkXQ-2jnvA9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX79QjRIWHi1qS
 KJMeRdRzp/s+JF+0g/uFMfXchpXKpHLo2sFP1zue6HfvFEU+YtSW5G6tL4Rn4aGDsVsINFBm83l
 4AmoBMF1CqbNqe9qr9ALdYHZGRRWE28=
X-Proofpoint-GUID: CoPsd1JiaeJL977-3q4jypkXQ-2jnvA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210038

--i81LDSJ13peNYO7r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The Toshiba TC9563 GPIO controller is embedded in the Toshiba TC9563
> PCIe switch, and its auxiliary device is instantiated by the TC9563 PCI
> Power Control driver.  Hence make GPIO_TC9563 depend on
> PCI_PWRCTRL_TC9563, to prevent asking the user about the GPIO driver
> when configuring a kernel without TC9563 PCI Power Control support.
>=20
> Drop the dependency of PCI_PWRCTRL_TC9563 on GPIO_TC9563, which
> represents the inverse and wrong relationship.
> Let PCI_PWRCTRL_TC9563 select AUXILIARY_BUS, as this is no longer
> guaranteed through GPIO_TC9563.
>=20
> Fixes: eea9a072221d97ab ("PCI/pwrctrl: tc9563: Add GPIO auxiliary device =
support")
> Fixes: 81ec9c22d06aea92 ("gpio: tc9563: Add support for the embedded GPIO=
 controller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Let PCI_PWRCTRL_TC9563 select AUXILIARY_BUS.
> ---
>  drivers/gpio/Kconfig        | 1 +
>  drivers/pci/pwrctrl/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 5d3f076c539b3a64..c5556b1638b8c113 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1893,6 +1893,7 @@ endmenu
> =20
>  config GPIO_TC9563
>  	tristate "Toshiba TC9563 GPIO support"
> +	depends on PCI_PWRCTRL_TC9563 || COMPILE_TEST
>  	default m if ARCH_QCOM
>  	select AUXILIARY_BUS
>  	select GPIO_REGMAP
> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> index 38aab596aa04b8b1..a2fc2a359702e861 100644
> --- a/drivers/pci/pwrctrl/Kconfig
> +++ b/drivers/pci/pwrctrl/Kconfig
> @@ -29,7 +29,7 @@ config PCI_PWRCTRL_TC9563
>  	select PCI_PWRCTRL
>  	default m if ARCH_QCOM
>  	depends on I2C
> -	depends on GPIO_TC9563
> +	select AUXILIARY_BUS
>  	select REGMAP_I2C
>  	help
>  	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
> --=20
> 2.43.0
>=20

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

--i81LDSJ13peNYO7r
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatiKxAAKCRA6cBh0uS2t
rM8lAQDlwQYXTcfSyFQjMNNia/OzD6xyyy5hxoHYmoDszs3ydgD/cwDKu6iN/C+0
3FNo6XEKgZP3DSGm1nyZYNVjR/Bnfws=
=B1zP
-----END PGP SIGNATURE-----

--i81LDSJ13peNYO7r--
