Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848B4343E7
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457240; cv=none; b=Bp5cisS+0U8gpZ4372yr/x17WnNwrYDRYl+xePhYiS5N1JRldif/GHXade4eH/HaoB45kxclByfdyxDqrnVuZgitpBdCdslN8T0y2fgTtMCviVEUvBJ33GZkRs7c+a/zpadLVRRdjYc83W7P6o5OpPBa5Q5ejs8MJnfDD3CO59E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457240; c=relaxed/simple;
	bh=teMokuG5eAWz337OsbJemBey333F13RFcsDFNyApnuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbdeTvsISd/LSXKyg6ddR5mB3hF+bkgyaaJ6Nvn2KLPofpgMYNoCh+MMiKA3FDtQe4CvqG9A6bZq0x26kdUwomUgIvx/Cen9bB+XtN4iaMq0kr9CnoOXXKgV/vr+zS/Ylcqg46mNBb/xwOWFnaJNar33IC6dHojRkY4vVGWLhzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa/G3Nnt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3U5bquE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pa/G3Nnt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3U5bquE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWa85453535
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vB+L8IQzMVlUf6Dw8qOqlWDCsl3ywdbDtRCKTwpuefs=; b=pa/G3NntkkJH6Hr7
	EZXyeb37cBrycJ/zEXuxp0UQGPD3NwKZ6PkjwKPDos4cNaxJ9PpfG6xsgoLKPsjD
	iB5ggGJaJxhSAlsNrt3CNL88Z3gbiRyFA3FFb1XUKdW2sL0lXIEkpiUm3sFe47Ld
	I/VoJgvhbTspEptjFpqdbRoZtqaifNAISGAnPibEIVU55moA5+Q7Yf4nCDiPd/qG
	Fz9uC6vihrrHAYG/4vj6ndKO/xHkRBcChnMR/Ap37KkiNSiguewDOWx4Zba6z73J
	PtRWCZUQnfArmjgldOexsn0SJZRe2PgaiaVS/tR/sdqXaYjUCVXaQoB0/Z0jIVHF
	QYQCUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kg9u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:07:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso10079391cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786457236; x=1787062036; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vB+L8IQzMVlUf6Dw8qOqlWDCsl3ywdbDtRCKTwpuefs=;
        b=g3U5bquEWoJ5rXW7/5pjCpXPubIUuKAjmLXbil37wr6gPLxA5qV7zPBDxEVjzMmOmX
         4Wjrd+6SxJur8N/jjaJ/wFhoqaS0OhlkWQreDhlgs/8RI0j+JnKMaN6yNpOOcn8jUlW1
         vb3i7reWXLS+Fa8DyHNDHmxM+zogyhwjQf20PutquHXuQwPZujhHmj/dsqONhcRyZog4
         xBNLgcMMQZ+zp1LOfyNtBOxn8/AYrIsS0ujNk2R9M9gp6UiJZZRQRnB0CEfBCePHu9AA
         +VwTrjihH/xXwKVdRmk78fbK00M2D53WT1pF6P1hN+2d4wV1v7mwF1r5wnmebcDxsKok
         P/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457236; x=1787062036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vB+L8IQzMVlUf6Dw8qOqlWDCsl3ywdbDtRCKTwpuefs=;
        b=HbstJ4hnQ3z2QXXds2Be+xybDFPrd6tfdQmiVA+YACl5ZZu9A1z1t63iJ/akkQFK4M
         V3vvIFiNts0t3SIv6Fqx/bxYx5nGAkkiQzK/D7Nfcklgb3j8L+XejADyp71fASc8gUSw
         AxP3kJgBh3FcMY7ZnX5ORLTRVqjNPaa1UZ7Lnlfc9pEs3xsnSCXbmpa+xhEHvilp/z/O
         GRQFUtdz7rMTv/PohShHXl1/tktB74gQsvsYE7042DWH02Y/6C+n/P329yTjcy60IdCX
         XO0a59PfmzFcVLITsNkC21xqNsB1HV3I23cNsEYPZjzKVJfoodCh8TNwKPn0AMwg8JXw
         69+A==
X-Forwarded-Encrypted: i=1; AHgh+RoAdSMIq021V8TY4xIEen7YrilwhMXrXFzb2dF2aUIF2KcMs3jEO7uPZywvgfOL6Iq51/y5G+btz1sd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpyy4S1H0XYDVepNezZNGCZGF7uzQJLRKAPa4pAOZcwBC+8gSW
	mJZhmkI6kh9QhPI5bgX/omGmqbcBIvGPaUFQGjCVKI/BZbS5ZTmNrDF0de2/gaWCLhftvYj+FR+
	CQckclfZ2uh2lM4iiAfuCD5AuVmKcr0wuIEZ9CKkQ27r/O2gqz9xbOYul/YprKGaZ
X-Gm-Gg: AR+sD10C556BksGlEwHkESdLy7Xxk+x9qui5p6zv7stqByZzcn0cTF5quaK/UgAeh0v
	YdO9MbQBFTEM67TPd2q8xZ5XfzpqWSLjMD1SlxZ76ge81rwURWQytYfaBAUHLHGc/AvwjQGbjw6
	RJ+Nfcwm03nSg1B3yF7f+VnDYX9b3AtLC+y2To5vBucniQ/HI7ghqVaklS7BnueHcnonlTgN1V+
	hrmGGsiZpEiltiBRmZq6fyXvmhwCAgJYRT+5NVuIuZHhA0+RmsRa7En71IGinlAPOPJpRdG8ZDm
	Q0UWGem0G8B1wEoTh2xxh9Ju/RsBOznieYQkIGHIKf0V5IgQqnD/IXLcx80Py7VFktYCdl5lTF+
	YLzdox8o/TBIve6ewEg9Yq9ovjkiszwpEccvyWPuZD59QW5dTngECxq947Wn8HKJrvhwAY+/g8W
	Ec2zbYnx+qwXzK9g==
X-Received: by 2002:a05:622a:1dca:b0:528:317d:eaf3 with SMTP id d75a77b69052e-52d60204d8cmr4447141cf.6.1786457235767;
        Tue, 11 Aug 2026 07:07:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1dca:b0:528:317d:eaf3 with SMTP id d75a77b69052e-52d60204d8cmr4445721cf.6.1786457235149;
        Tue, 11 Aug 2026 07:07:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa3fbca3sm2995831fa.11.2026.08.11.07.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:07:13 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:07:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
Message-ID: <lpzyzjmnhofp6plxscqsuisoujfdviry6xy6poghyltqtm5ean@dum5bcc3ffqx>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
 <xmj3xhnvdixooy3l6wro5f7eeehlrlrq44y2mwojzzeb3yjdjf@e3eo2772qctz>
 <f7a76790-0e7f-4c4c-bb33-36134a0f3e29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7a76790-0e7f-4c4c-bb33-36134a0f3e29@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2bbodEQRwAdAz5U_cDPjrbiTDWQHX_P8
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7b2c94 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ixw1xMl1IcNJksMvGswA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfXwwq9YmfBQTec
 dSizCReW8cIbmgT+C+jtxfqWYo/sL7GP1x1Be1ThA4EqJ5Pj4tcH+jZ/QQfTC+xywPA47QvNRiU
 cYYY+Mj4M4zwUR79SbwPlo5RsXoy+pxxA0PPXFfzMMWDgSttgxXnts8BdziBOb2Mr4nlR82hR3K
 krlxmpdnnd+nt7hZBuvHgSRVXSGOz266+ctsefrxHaew7WRQtjfpF8D6PiNWC7cKwACSrSf6d+a
 Vmh2sWv67Jq2n431eBX+u7dFyIet+nJFp/l2JnL4Z3kZJtKiAFrRVkjv+SoRmukdop8hyqddvZz
 yrZpYzACNySPcpxQ4M5j88vmLpOMUan5Dr9uufuoYkUERBrUhWePmIjpsYVB/21SqCwcKlQW51M
 THL1YefHU0yOVr4bN6ZfdR4IqgOS54MeNBNQtSeTaT18IvEAMR6c1JDp/oi/19xFODLPVRkag5y
 jxadpz0eAjrMtVdUVmQ==
X-Proofpoint-GUID: 2bbodEQRwAdAz5U_cDPjrbiTDWQHX_P8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX1ikWCuRLAR+F
 CN53LwZk6iHKCKc7fFGLZ9DjXst8RFGkru9upNHsiCxcBgUVE+U+Zr/KX2f5idgCZ9l1ssj5I+K
 KrkvsTbfLsrKa8qRfcgzmx5BLTHTSFE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110118

On Tue, Aug 11, 2026 at 09:17:08AM +0530, Hardeep Sharma wrote:
> 
> On 8/11/2026 6:30 AM, Dmitry Baryshkov wrote:
> > On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
> > > Add the interconnect provider driver for the Qualcomm Kuno SoC to
> > > enable bus bandwidth voting on the platform. This includes the
> > > aggre-noc and cnoc-main NoC instances with their associated BCM
> > > nodes.
> > > 
> > > Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> > > ---
> > >   drivers/interconnect/qcom/Kconfig  |  13 +
> > >   drivers/interconnect/qcom/Makefile |   2 +
> > >   drivers/interconnect/qcom/kuno.c   | 978 +++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 993 insertions(+)
> > Please add QoS settings.
> > 
> Thanks for review.
> 
> Kuno's NoC QoS is provisioned by RPMh/boot firmware, the same as its SDX75
> baseline.
> 
> The upstream sdx75 interconnect driver programs no AP-side QoS and only
> issues BCM bandwidth votes; Kuno follows that precedent.
> 
> Hence no qcom_icc_qosbox settings and no QoS clocks in the binding —
> matching qcom,sdx75-*.

The QoS-related clocks are a part of the hardware description. Even if
they are not neccessary now, please add them to prevent future schema /
DT changes. See how it was happening to other (mobile) chips.

-- 
With best wishes
Dmitry
