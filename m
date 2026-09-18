Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26F5383316
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 01:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693888; cv=none; b=VEGcFpXXCbFcPD7ztmC9sqCp5kTWlPDapW7Kn4ME7e/TceyWLn0nxioy6cPkZoYDbFVYIJXwzqBgV4ESFBcxoVHo0NRQz7jgdNa/Wu4YVq9urunsarrcsUEalA+afUxyShg9G79IRkqRkV53n65tt+CJk3RBESIsdwOihGQz2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693888; c=relaxed/simple;
	bh=mJhIpcCPsqDqQ0u74wDgs2yC+8RTbFAPTEYWSK+egTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipLBvPeubBLfFIfoLGFc6AjOW/qTxYevUIAmN2KsjVd+o5JHz8WdG5nImh5HN+TRY8yCiyiyzuM7T3On3kmJjqNzhdIrl9F7FBMuUyqYG13hSUQc6YfInjafGf2QtW4Uce96JtQyuNolDDPENkp7K8yRtzHolsANdjK9Tc6R+4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaFQsLhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iRltMWpG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaFQsLhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iRltMWpG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLFfZC2178455
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 01:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wmysUVQXhmMNTq63fYjIpjKg
	r6wrwaa9V8vpQzC25KE=; b=CaFQsLhAfrMcy3KHgNuZSgNARpyrHczcppvYt1W5
	UJPqNqISbT1SY4EUE4sHXd621gzAflAEtfvBGQ1LgCEzu2dMqYpd0EWXvkcx+ATP
	qpVcEBQGrnSsl5RQYfpnunNLDifabrAH7cgF3UnbDWnL6m/HSIKrD43Sbd2l7yfL
	L7qhUpV2aYCmBM6O2cTh8CkfyLzLj5PAauAkzXrquK2CXOBcoZakZY5HjLPgVJIm
	awXcrBrw72YzYgts7LAeO/V+XpXRsQSjCG6eNP5xitp2PanRhj3vyDu780hwBG2V
	o/Wlb+qYOTaQhdUp50TfnOW2EBqPQaA3YcX/Dynb4W15eA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ks2k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 01:11:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so225747a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 18:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789693881; x=1790298681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wmysUVQXhmMNTq63fYjIpjKgr6wrwaa9V8vpQzC25KE=;
        b=iRltMWpGXgx/cZ6d0rMvgcfEVjNN8JKNVr/2uLo9EpwOOp2Dh5Gf/5okjC9UCYUZFa
         1uZIwukK8OGTKtean+gYw03Oy6cKZN+4B7IJCk635O9Oi8XqOUImC/5aOhV741BDknDd
         rTlJ1RvlKkjn8ArX+2xz7MaMAhD4Agfa0w0DEzuScgTxg1JuUrruPfk19Npa4oW85Jy3
         ZJbb4bKTgyhKA8O06IpgY9AkPDVaeBbgVOJrOEDc6+gzNOfzZJ7/V/cJ2ibFV21oRm5O
         fgE4u9QKozlJvYE0mmFqPnXd6sBRm0Qypa03fPdz2QPMI7b42bLc7/NNMCbr7fgBFOgl
         Cxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789693881; x=1790298681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmysUVQXhmMNTq63fYjIpjKgr6wrwaa9V8vpQzC25KE=;
        b=vQMWjPUu99hiS60GO6Hl4kENGId/C9Kt9rXOto3Zv8zohC9swLiED94sS5TxNFBbi1
         2m9krxkep5fajlNb9XcGaSXa8R3UtfTOV139v354yHyDy0mC1fH7IPlLH3nXihgxwtXW
         a2qGRxncBeNHRw5a7bJ6MCIGIny0GxS0a1tIXPZgI5reEcqgQYBFeSWbZnxISz6U1q9L
         qqfyBTOOT61uAMTMTA8buzDlx1sJgrRfTE1V1qqEIwTfGuDrjvzftieZQEkwiavE+qre
         ufuhHvG3XLHDUyx3ukk09XNiDGy6HMWV/zrLFJ/s3UKruCycx/cs06NpGL6mMuWhXWT/
         Yw5w==
X-Forwarded-Encrypted: i=1; AKwUvBzeQM5pnOJGYpz5L7psfwSb+m8mx0ek2tuQKwCGGZqt8Z9q3Il3p1pCnUzP176CGbDnmo+l4xUomDya@vger.kernel.org
X-Gm-Message-State: AFuF++mjd+/W2MJed+YpLBgNHfQpr/yAN53UDQgLTix9gBdoGTgxVqYp
	5KQsk2FCPiyH5MOVEsdN+uj41qWJf89Pw6sMm921PXGrjvxwF0QU5B0yqqaZ7+sNHFV82T/1U7M
	EIWyf3T4KBh9Je/QudvddzlzowFN5ItaNikQ7RL5OTB5dzUK6dJhPg7VNpTshAqUc
X-Gm-Gg: AYBFou2rqCrm1O6L/wg7SGT2SNuBscWN+4rRVqtW2PY0VhBeuhSw670PsJYpNlMCScE
	U7sIwtByVpIjxZ+XYJPDYAWJZyVEk6QuRPCzArgiZpZlx1/fwraqKTSBZjbLV0s8ouVhO/wcf9S
	RqlLThlMfMYkhriYH5UrpzyUqmQacA2yUQRzxG0FZgUxkpr860B6Y6HK0QrtiZULqph52Sykk3u
	D9XZfTtMxOsHfYWAthsdL7VVDXo6qRMCMJOfGdWVicag9LKmCKpsGq9K9PK24et1uCbgyGFm5o4
	YFDdjBC+cf0fU20N6zjQVny3VEyjIoMQonwRa1IGhh+byrbQDTNf2fr+mwcadrE+N711WWoje36
	PeJzpeJJxTOqA0zbfEcslE1Pj4spqHBHlnV6JmZv6uac=
X-Received: by 2002:a05:6a21:6e91:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3dd8c42864cmr1773053637.9.1789693880845;
        Thu, 17 Sep 2026 18:11:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e91:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3dd8c42864cmr1773007637.9.1789693880437;
        Thu, 17 Sep 2026 18:11:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a1a5sm19633819eec.5.2026.09.17.18.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:11:20 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:11:15 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
Message-ID: <aqyPs5d72s80G6b8@QCOM-aGQu4IUr3Y>
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com>
 <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAxMiBTYWx0ZWRfX7wQnvVfDXNUp
 KyPxyVwq5rW2lhd1KFU238CxNZVSdlRm6u2HckIDf8aIcHM9XkkKku3BU0148NcT2/NyCa8H+GI
 A6ur7ixAIRRMIcxvxJdMVJF+ZgRCK8KQpUVyuHsi9s7ElJZUhZgijxt/5iXCdTsqwQJ0/BWd283
 dFbRi8G/ew2+AjoziTWMTpbvfksKpSxZYY4lJ8dTSkohoOqoculX+2sBVHE8lw9Dgn6xtkDdTvz
 +PdO2yFtnboIdBkKVLFSrG0Lt7v93Fex+QIYWMQCjrud84Xe0d9/9aXl1+50kaiXvY6DSIwbg0/
 3itmhTmQq35Qxay5tHlPof2tQ4zvMs3qi7m3tpyo6ACP8eqkJcJr44ejU57/gBlPvP9unbAZPFi
 KpnKycAa/Pqsz9MLiT44G8Prbwy7Gk1OjC1e/YIDAkjYjIutL6JwbAZaMvAPCLysvRAvQ0yCP7c
 PeZztolY7uT/G8hYx7w==
X-Proofpoint-GUID: N0VMi1Lo_VLsFx-a9T8rW_PHeAv6kmce
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aac8fba cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=HOgYhUj95sWBd04HZmAA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAxMiBTYWx0ZWRfXyUOk4DxhtdLo
 MPiYvrucSFlC1kghPX4DKptP2hirdLfxDxAbLuu1aH2Dg3mm3xxc2adfBni9BItWd2KH9f6Nbam
 5WOUOwigR55My1bsUrOSjba51RFB8rQ=
X-Proofpoint-ORIG-GUID: N0VMi1Lo_VLsFx-a9T8rW_PHeAv6kmce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180012

On Tue, Sep 15, 2026 at 03:11:48PM +0200, Neil Armstrong wrote:
> On 9/15/26 03:44, Shawn Guo wrote:
> > pmic_gpio_populate() seeds pad->input_enabled and pad->output_enabled from
> > the hardware MODE_CTL register, so a pad left in DIGITAL_INPUT or
> > DIGITAL_INPUT_OUTPUT mode by the bootloader starts out with the input
> > buffer enabled.  Neither direction callback clears the opposite buffer:
> > .direction_output() only packs PIN_CONFIG_LEVEL, which sets
> > output_enabled, and .direction_input() only packs PIN_CONFIG_INPUT_ENABLE,
> > which sets input_enabled.  Requesting either direction on such a pad
> > therefore programs MODE_DIGITAL_INPUT_OUTPUT rather than the requested
> > direction.
> > 
> > That silently breaks both directions.  After gpiod_direction_input() the
> > pad keeps driving the line, since the output buffer is never disabled.
> > And after gpiod_direction_output() pmic_gpio_get_direction() still reports
> > GPIO_LINE_DIRECTION_IN, because it cannot tell plain input from
> > input+output, which makes gpiolib consider the line an input while the
> > driver is driving it.  On a board where several regulator-fixed nodes
> > share one PMIC GPIO the shared GPIO proxy reads that direction back and
> > rejects every consumer after the first:
> > 
> >    reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
> >    reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
> > 
> > Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
> > direction so that the resulting MODE_CTL is DIGITAL_INPUT or
> > DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the registers
> > once after walking all configs, so this stays a single register write.
> > 
> > Pads that are genuinely bidirectional can still be described that way
> > through pinconf, which is the interface that has always been able to
> > express it; the gpiolib direction callbacks now mean what gpiolib says
> > they mean.
> > 
> > Assisted-by: LLM
> > Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
> 
> You should add:
> Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
> 
> Since my change added the get_direction callback.

Indeed!

> 
> Personally I would prefer patch 1 instead of this change.

As I mentioned in the cover letter, both patches are fixing real bugs
existing at different level. So I prefer to merge both. But it's a call
up to Bartosz.

Shawn
