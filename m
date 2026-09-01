Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F7543744F
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276966; cv=pass; b=jwypmBCpOoJqY6ps0EFK2rxAVHKNG+uY6Z059IFmfmePRxcYptevvLITavoaf3jKpvQCxUhsTWJrzXA4kpDCSYIf2AL/yE55Dd70vJfrs+HV7IQgC2gN/CW0QiIwU/ok+ZIJf8b34dzF9SugTNOxSTRsxkaQfy/ZeCq9V1n16wY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276966; c=relaxed/simple;
	bh=c2tUgg4wBDmD4/wcjlpaTarOSXX4ze+3IyNN+IvUeMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QT75V0yqB2I9o9tDWWWBxhObUadhkC/OcbuGpXYjFxL1rxrIdyvL1dAfTY3WYq7BCqH4t61bZflfzVq1EOaTujdkemzODRe+wQrGp4eTRl6AEsVUqS36sFfZevL87ok9Z+XeHZbvjwK0ZtE4A7WnMEiy8fsyqARaI34siFq6fsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1Z/ZsVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zy0Gpp+r; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1Z/ZsVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zy0Gpp+r"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8jOp2825148
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 15:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=; b=o1Z/ZsVc8EwHXYoL
	N/X3jHclM9iGocpfX0fLEQm7rWjghERgVeEDRL2JdObPCQonTMvGo2VJNqRfmXz1
	zVmx0uD54G8lm6Kpbmlp26Ddp8whLa2aOM4/zdOUtSTw5GgDhdIMkXXCGajKUYe3
	YLp1WWYJOjx2XHEireOVzIBvS89PF/VIVXg3i7Ek3edaqx/BrGTxSnfuAABglWbn
	T9HxxiOv661pkDs9rfa55PMvrk4kljk258zvuHsylr8MDLwCw1JR+XT+L7oNQG7O
	JLNCR/EanM3qciuNT928O1/MN1b9RQZKyOegz59DaqtBhZhVUtVMdUCC7nEO836d
	x/2NmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7cbary-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 15:36:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1601431a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 08:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276963; cv=none;
        d=google.com; s=arc-20260327;
        b=oRTAW8ltf3wwcxkI+HaOewUKQkiZJt1lwBYR+Eo9HGMFwRM07g4GdaJCIw1klHzCQc
         MPVoDjuNtPxJiPdWlUxlJVsvCkh/MGsZKpXfALeYz0856gFaahFwp831uQeac8Sdsa0G
         SMhZ5ol6Y4T0dB0WfEi7NVFm9MgmIGuACJt0V48LKDy2LOcnFALiHlBRxX55Fkbdj4Vl
         bjuJG73EVLlbhhkawj8mduLFMTgD3VDNvD66U4Y/S+Z3ZFUdir1JsEuVcT+HVS4i45wn
         YXAHBoius2qrIln1V0X2eqm5oe21sui2ml6qVDdTjrtpMkTm2asf7y4a4GKarDkRhHJY
         35Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        fh=1H7Wc/WqKR/OkfWRsdzoPjJijGzs40vQWoYOfuXxF7g=;
        b=HRhAAMw7xtoh1hPqSnf5O6kavNqTOBmTMYALMXr1DU3Os9Jfpmq7vfoNC5b2swqXPy
         D6qEaeQn470PJDylVNsk+IXm1+lMTMkJN/Lehmei01Tn+pLl9CurdlzH21TBdc57YLjH
         tLXSG/8c8siOUbmBiS9XZZDnMDfIBsuoHkP/cdrLoS5recuuWKtzDxQs+6LBaS3beu2s
         D1hI3ettQqY58x2H9f/BllbtoeO4rhec23/DgxeN5NIZ7FNiWy6KTNpsu4UZYv2itSPr
         lwKvBmQMMl7QwTGl5uFp4f+esScR7/I+UwK53cziuAg2c4nvTBNdK2k/JHsJvnZ2/3BW
         AlqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788276963; x=1788881763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        b=Zy0Gpp+r4x7Ao+n22LT2+fxV2ToWveFfT//WUr6up15GO7qyDc1a/sRXMhSpZBnHrq
         sBEVhSHYPs7Pn/SQG1XCwMugL7cKD6m0BufJj/r0BlmgqLrOLuQsCI1EkUp6xx8jr+y8
         2Dj/yCA+52M/G4fr97LA8h9enyNPtKhGXQTHki6SosD5tOQytoIOTu5P0eoapavBJyjd
         2HH/aIWOiO9CrTw6+AGMWG70z1WodxtC0/bX6k1TpcH+GTg93HJrM1EheGUEROr76BAO
         ttcHwqxFVs9dkEq6ZKU54DgkWU4LTKE4Nbh53OHvrYGYiMMW7fp2kUXUxfh4ywojbqO2
         6Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276963; x=1788881763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        b=PzM8CVdS6weOOUaW7BVgT2IWBJLZeSbQTLvb8R4mtOvrPhmoRIzaCg74Rd618bgVar
         dBpa3CW/G22/T0bvp0rng2V6B/jbRBjpXs9wlhDNghU5aKw1vI5lgOibFKysCFA3FL2X
         4o1NpbL4Xvr//igkZlT6mFT39tG5n2cqgupdWWki+naSx2hwa1TNs+c/+Eiglgfcp5ez
         V8nUJ40/RghOUoi+nnEezwKJDfOC1YJtZWNOTq2JHRnG8rul0Jqkj+6n4q2N8HLuA5fn
         i4GU336GW6e0mhl/bqkbbeRrYA7HWD/JK+cJEIJ/IgpuPpel4ouGOWt+LzjzULlyF5gc
         oPtA==
X-Forwarded-Encrypted: i=1; AKwUvByT+ktjQ7X0WB1eo6qmZN2eD5r/wX9OubiSBNVotaogHmDS49g6/aPKW2prgUHGG9ZO8f74VlTMb8Wj@vger.kernel.org
X-Gm-Message-State: AFuF++nIilikCKBui6gEKF8Aw49vAeQFC2ht4AnUvqRRzrPmqHKs1ZVG
	B30mM+kil41yHnftHzjqL7V/8RsSs9X8u4FuqaW+b/K28Vxn65WKCg0lDInAq0p3yqjVfZBF066
	/DnDRQQzEDAg+G1NSgjEV4uzG3BiPUkZS+igOMS/lFsDXAKofPz15gyxHp8xt+ZF4tzFeg5aWzH
	P7fDsmhvdZf2+Ag+KZ1QtOLD/SlYrm/HtjTtZUKvE=
X-Gm-Gg: AYBFou3bfJBi8mirrJ8pMljA5NkjKDYsR8tsPagt4xd9kQK45Hoeb/NXUz2ATeIIR4r
	qm/89CQ9d7sG8zGL+RjvHxKv29aldi57lrkAZ6w/MBoWFwFFtn8m2nvU5LueaVAl1TgbtlCTTIO
	pREvGDL0EYeBoJRGLNdaNLxNE3AqeRFmAOSGv5mBfDojXYyXkyozHdywSLCg==
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-396d0e7255bmr53079245a91.8.1788276963067;
        Tue, 01 Sep 2026 08:36:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id
 98e67ed59e1d1-396d0e7255bmr53079149a91.8.1788276962567; Tue, 01 Sep 2026
 08:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com> <178822856270.1835959.15842744749902984423.b4-ty@kernel.org>
In-Reply-To: <178822856270.1835959.15842744749902984423.b4-ty@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:35:50 +0200
X-Gm-Features: AcwNN1XR_ENRcLXIDuE31pwfkZ-t4Y_ZQM0rZSm5dxDSS2r51n9kmCfdHTv7uZI
Message-ID: <CAPx+jO9ijNO7R=oOXs+yd-LaNaVAPwF1Rhh-xVGr-s1K1Fuw6w@mail.gmail.com>
Subject: Re: (subset) [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
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
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96f0e3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=elWi3GNyyhLokhY1Yp8A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 8VaLLEXpSWCSyIHoknBFfIjcPx91NA0l
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzNyBTYWx0ZWRfX1uLfTKaHCuSD
 zdBxfni5/oYUqP4HrfQV+D4HEPivvcdqBUNv5bDJY6bUQp888/rZcnA1EITJtpp22XMVkGDv1xs
 W1ByJW/fGD+nNPRcC/4Szu8v6FOmkzY=
X-Proofpoint-GUID: 8VaLLEXpSWCSyIHoknBFfIjcPx91NA0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzNyBTYWx0ZWRfX7CSEQXZS8Gvz
 nZwstjpP/dHwfmghBdY7BtfC+LIeXmLWWfq8vkN4rXfvnDin2ymya+GmotUbwDw5sQGuKU5wYaO
 BrVZoVrGq4x9oo6RxFBS381wxR+oZu4wjDXzVJOxMxF/YF209IJgFLBN2XftBoOa85ycguuZWNE
 gkTusgXHC0q0CUHOTPuZ53/cG8JclaXR187/wcFfi2XO+UlHDf48nJTW5eES5hppp4WC6mg35T1
 JF9PVzVJimiq5iVvLOMoh9M0TnUnFPgAO/EAD/HpvtGdJjjKdHud74BVHZ6kebAtHRtJvEbXE90
 wsfeKY7eABRDyAoyN8zwy508M7WcUK7BOvVbo+MrECwa8aft5ZNW1UCkayY/dGcthjO5WMsQlMn
 tF4Rfg0PwBcZOTvaE4qypy/s0w2ivZXBJV4PYXd/VCWJWibm262lifjBgauqEJ8kSamqk6/ot/e
 Fwl645WPNk8pjFOvZbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010137

On Tue, Sep 1, 2026 at 4:09=E2=80=AFAM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
>
> On Thu, 27 Aug 2026 23:21:03 +0530, Hardeep Sharma wrote:
> > This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> > IDP reference board.
> >
> > Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings =
up
> > the essential SoC infrastructure required to boot to a serial console:
> >
> >   - Global Clock Controller (GCC) and RPMh clock controller
> >   - RPMh power domains
> >   - Interconnect (NoC) provider
> >   - TLMM pin controller
> >   - PDC interrupt controller and SCM firmware interface
> >   - Devicetree for the SoC and the Kuno IDP board
> >
> > [...]
>
> Applied, thanks!
>
> [04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
>         commit: e304e8919043712191462224ce9d40bb5f5a6bc1
> [05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
>         commit: 12918d595ac96b819b9c3ba0df4c6a4bf50c43a9
> [11/15] clk: qcom: Add Global Clock Controller driver for Kuno
>         commit: 7db06b5f624b583fa2206f98de8437819acada9b
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

Bjorn, looks like patch1 is ready for you to pick as well.

Kind regards
Uffe
