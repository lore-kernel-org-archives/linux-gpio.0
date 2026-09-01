Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA0B43C048
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277589; cv=pass; b=qsv4qtHY5+QRAmg7I6iE+TZ5zxl8BlZ715GZWIVJctIuhWHa8BqFLBse+EVn36ONb5ixzezqPk8k227er+KyK/sI/5ru5JP69W9Zcgn+Glyq4fVaOAJ5lUfEpdDTNZOqR3I7Ggkc07o9qMjc/4nA8B5SB0FGVdjel3BDONvimT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277589; c=relaxed/simple;
	bh=XFUUQpQVjHmTX/OMS23vt6bYwXDq4wDECu8gMDnXyKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyDpX7FT1Dvg2sNOM0gO4CmsJPKc/G0ebABCXJRrZGzgRUjJyt9vwzN37qzeSM4/CKynoVEFcAp79uuKrtRJpMtBmwW49Me/k6Qm1aHhCk2qhol6U163+n1Yb43gg3iw/q+jafpQ3TvvpTwvce0nmpBbHXP+fGAFlfpqpDd423E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dn2uc+TX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgwOvbRo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dn2uc+TX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgwOvbRo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8oCB2646926
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 15:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=; b=dn2uc+TXd6LM8e5N
	jnnwjWOAapq/YOWMDaEoFrFOeBIDw9qcaF15/5VAmvOmGNMj66MbYV0ewcPRKZ79
	sbGACZ3oeO1OFMEmi9OwY9D9VnLExCHrvSRQF60SHV7whqMBhb4Y3eyOMQioBlJU
	vSHKPVsbSHUJ4VBy46m1vYsEY/GbkGTrUE7U3sa2vn9UGV+gDcYeQ7Cb4k/jnxHf
	eyfwOQcrcAfhaR5Lz/d7jIZ5PNctbJ6Y4Wd0AQ3TpgrivnL8mfG2r4ANoGujlQyK
	mD52DMquVUIMMAIxdpBS200NSUd+8D3eu+OmvNfqG5CkgfzxvbfGgs+9hdfEbblP
	lMRRCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fu5jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 15:46:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1847360a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 08:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277585; cv=none;
        d=google.com; s=arc-20260327;
        b=MQtBOrVQJsh9ugVJSwIvg7xrerjtTs1Ds12RtKbcGhLqJ9e8KB+q2dxCgabuE1AxEq
         pX8KNZyaGmdPWlVnW63lngydOG2+NdSMCPTex+Qk8vnNJmU+mlGEAwDK67oIC8v8WzPO
         vK+c1XDqrV074XjkN9OnvYCNACbT8kGKM14GK+BLIWEU5VW2pzL/xPLR0J+HA/xzBLTh
         gmB1JDAolzh4pXle7dvTaoWnGk1fSjrgqJVOlSbkDw0At4uyZcxbQYm2y3e+FFpGLJjA
         gs4KfBtFMSPZfY6fAxpc1m7dygKJuFVDv72E4dAdD6OypJ/JSvbXtCrYE34LI25A2ouH
         XrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        fh=vDuGXNJJ7ZeEihnLPx4nQQQDgrZVB+UCHb5+2v6KWOo=;
        b=Entn3Mxdr80+f284rJFxd2Lj4Lo8hGVNGCrs9bsrhvyXJYj3o+bwhyN54mo48KOS7V
         JWGdR8lRwdAhffx6ZRbNgmVdzohO0/k+yUmGcf9nlva4KUGogBr6vjfQUPS7HKz5X1p1
         G+ck8QguKyZG+rGA0/V/rxGNsDvL9O70lVEm37sDMuElfSE+wo8izYB3eWY9sYXNaxue
         vebw7lbaU3sa+6i+8KUY3XWfLPdcRS2BWVWn1dc8B7/qOJyj+xumm7lwGQ06UEUYpSgH
         OBwL4MQccBdriM2STxEFboXE+i2LdAjMSTHfJrrTxrBnRerJY892GGLtn7qMW/D2mIrh
         PYZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277585; x=1788882385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        b=XgwOvbRocPqmn76ECVRxcqzPALVTfG1nTnqOrifJjJfK/OPT0rTTmr6ZpSqpCiZcn6
         oBm+qVpzoJv4z2AH4pRT/UV459xtMpizc772YLtZVXT2Dc7swJAz58hgxv65o7r7v44H
         Zcft3lsX3S5PL6lG2O1r0cio2GdL4mq0lg6tYnOgnmnYdV7MfWFSHNIKcCEmQfaCRd+Q
         g7DqM6pDydZeKHjPgPKM8FrpjdgI4aHseLHwc0zk6CHDn584X6otDurKUXVLo6khCJFM
         y+AE6seuJ5/rVjUTu+oboFB2g9jnuT5CYWtVvEJk1cxPAp42Bi4lo8XdI4O2K3Iw6sWZ
         SRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277585; x=1788882385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        b=F0KU4WxsFUs6RTdyMUUvxl6Ed+b88GDw9nO3uQV6K2pE/8VPoJdDj6c8IEzHV3gAUZ
         hwVbWwe78nmQAK+amvUmoHeUuDoF7m1p2cERFHmpcpR36PLRCODqFR1UlZd79iVdtoyY
         umstdeL6Aigb0vTtPW3dT/k1n1Q05Sw8oNH6Bmxazu4WYxya7orS0SSeiyRBd09K+iI6
         VCQMY/gIbJoupD5pFzkt3z4SODUzy6ERrOkU1tTO8F34jminanwvg7r9jDr76CQ3Ljr4
         cQRv94Wny16DmyYs91AKhdGBSvCWtxmRfFMk6j7TXlbMj/SRs5VQ0U/ToZ4dLM3mjnMb
         GzPw==
X-Forwarded-Encrypted: i=1; AKwUvBxwRzCooJtEhuNMgTpAFY1MiONsdaE3AbFf1DiL/t+UFDst6rO9J2S4LjPWPBMaFqhO93B0NDKPzzer@vger.kernel.org
X-Gm-Message-State: AFuF++k+vOqVa56/XSLSiatMQAJ0z5YLziIe3LXEsjBFiYuWYYRLd6qS
	GklfQPu6PhF4JVqLX2JQ4xDDwdE/2u58bF4/b+FfJHGsxw57szix4UqM2iGgnFNeimPpj8R2yR+
	BrwTANZMOh6feAyeUGBXIauaUUgiGhMMPB8F5YrIDkvva5TDBej1vp10slB46xTTlhOnxhv4h+W
	Yk/iNCeLZCMO9JXqyXPPYVMrFVf0ZbmzSGDL13tCs=
X-Gm-Gg: AYBFou0N19wYo4UlIGd+ilMuaPQ6CiLSrDvyCLSmPyK7dkJMPc11kxQrZoxNktKepan
	2mMAl/zFgia1soAQ7jBeUkjxEPRly8TJ8D3CBTt+Gf8ypyWSA8b/x57OPzSnFZ4PS6x7P2L/mb/
	UR63YUFYV/UM/2JYKV34A4Dmoqb8RIG06ArJ98zZ/p3sIALPBKuO1rR0XTJg==
X-Received: by 2002:a17:90b:164c:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-3990f79ddfcmr3891994a91.5.1788277583846;
        Tue, 01 Sep 2026 08:46:23 -0700 (PDT)
X-Received: by 2002:a17:90b:164c:b0:398:baa7:4c2f with SMTP id
 98e67ed59e1d1-3990f79ddfcmr3891921a91.5.1788277583296; Tue, 01 Sep 2026
 08:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:11 +0200
X-Gm-Features: AcwNN1UOgtX_S0RX4JszYubxSoHCtUSFoVM1QL-GMxkUwhBphaMhOq7ZdQsciOw
Message-ID: <CAPx+jO8u_w417z-z_2fkQcody_sYbijHWTowZ-RsKH4Yw3xW5g@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: INJEe1DdtIWlA9J16UDM1ecU0SbQNbZI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX5Vm/3a9YTUTO
 1tabmJa7pBkgScLQqCiPQkCd46jUMUolzOsdB+sywE0oDMAu8PYWlVTARABWk5RD9pDxtN0ZGb3
 uxverzWmK77vgCkpZQDoyoK7eY9SHU4=
X-Proofpoint-ORIG-GUID: INJEe1DdtIWlA9J16UDM1ecU0SbQNbZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX9l+lIEw4CIeM
 Hm3yf4E3IYZSRckVujXMd39tyYIYGmGI9Tv5nwq+Ax1TQzB3lomvtosEygoUlDOyepJrVUzBmKE
 HKu4AHS7l1yA4b2fj227z45zCRiK17mAS66MK7IA/SDP44HYKTigG+FNX7h/IvTeKQoPibxnBHK
 Y1roNSwyzN77YQTTWkT5eXddqzeiaonDV6GgJOTwnU9j5XX06BBIbDojTGvHsWkbiXSjqObnCyn
 pbaqNAmDqh1rfOUwVx/dQGLPR/iK7kwsnacpORHgB0I36SkgR9X0JUz8ymnJ093h5mOn5C6qagH
 oYT28j6Rb+cS78oaxLhtPxufCIkXPSpSMGrjOYuULQOEaJT3YjwOadNoLXxC5l3OhYQPoCwn7AN
 O4NApNvhiPfsfo9tN7sUoEewpYdk7UHUNCCoyTQYLXG05IDX0GfdYpVWAuSVG4YMr9uYVn/meXj
 TpgG148U7J1mH7wlZeg==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96f352 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_uS-18hJZPm8K8KRSTQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010139

On Thu, Aug 27, 2026 at 7:51=E2=80=AFPM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:
>
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
>
>   - Global Clock Controller (GCC) and RPMh clock controller
>   - RPMh power domains
>   - Interconnect (NoC) provider
>   - TLMM pin controller
>   - PDC interrupt controller and SCM firmware interface
>   - Devicetree for the SoC and the Kuno IDP board
>
> The soc: qcom: geni-se patch allows the GENI serial engine driver to be
> selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
> depends on.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v5:
> - Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
>   (added in v4), so like the other Qualcomm GCC drivers it must select
>   QCOM_GDSC; otherwise, in a configuration where nothing else enables it
>   (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() retur=
ns
>   -ENOSYS and the clock controller fails to probe.
> - Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-=
dd34f235fc1a@oss.qualcomm.com/
>

Patch 2 and 3 applied for next, thanks!

[...]

Kind regards
Uffe
