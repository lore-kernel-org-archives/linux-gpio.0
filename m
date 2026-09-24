Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B24233D6F0
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 03:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219894; cv=none; b=Dqcb5Tz3a3QLwoGtZRReerRfaaNHvZo9KZ8rVq3l3JHTmYokymyzdL5TaYGAjMwKJ6CHiG1KzdHeeGogs74b4ARt9FZiXy2F5PX8FCo1Hu4yHoh15a+Uab7R5HSlBPKKAO/gVZg7xHOAiGYnN2Lq+t2fFnTn7vDVvoK4hXNXikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219894; c=relaxed/simple;
	bh=dBCzhl1X4q92qBGwn2pQvyx5Z8dLZ3uL6KEhFDZ9iIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx84ZGrkKSg+qt6sSoBPdM5L/OQa/YNR0ddabNLiNncAYXXg2BZ21JFe7HdD+MPIYXrtZEibB8Dta5HkF4LPxvGNOMpuZ14SiDESnco7kL7+4qU6CxQ+fNBK7GBbdfUJE/vCusl+8ZilIfvPd8l+loZnL6GekkSmiteqTo/w5ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZsupzY4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8O+tE8e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZsupzY4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8O+tE8e"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36o8c1101485
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 03:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tHodOW1NuMAhQ2hihU1WLFCt
	BxwYsw6uUKaSj/sBdIk=; b=ZsupzY4eFlIZg9YdMGv+d3x62kLNgU1Vw2JenSW+
	DNJ9VdU5f0xHu5mAZUdjt9nN+UBEoy8bUXBfy1/UPWnnpfkTRqSIiwRtwa0oMSAa
	6CGCsZIP8c+07kxdsh+YRagDbJ2DJKWPn1p3EB+g4qb7WNOrrQ+8KXQfvHXYAeNi
	Lv9PMyBmcomGIdFqmm5yqvND/dLjuf9xhhr3Sc4VmlDnFHxCKbpJz0Uso0tHnQl6
	Shq7VuW5am/BX9SdNjYZQHomsC2JyYm8jbZrN6gZq8ORD5r3+aqZ7Mrn+IlVcQ+S
	8kckK8BTydB6wPk9r4XPTqDfeYncTkqIeVv1M/sA125e2Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwmc1hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 03:18:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1384427c3efso2730345c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 20:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790219892; x=1790824692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHodOW1NuMAhQ2hihU1WLFCtBxwYsw6uUKaSj/sBdIk=;
        b=K8O+tE8eJLcfPq41KlUYBOkG7SJdoDmBK5IvkROXqpVtB5dEeYY4mZyEVOPb/Ahtya
         YbR1eZNeRfDMZgwI0OuDiXwlXJzWhiOhBeJ/2bO0CTnE5z3a5wf6+kDSV6srKWOImBaK
         vp0MYkTQQLBizdSzaVcYx3itkf8dYHYHGfyp2hi8gccHq3acNXyqf5/kKUv8+Rt1zWul
         0aE/Tu7QxUcjl8e+WrtuKfkPZ6AxnJD7BbHUpr68npFVbZcFrUTno7xw5Ta2JhWugGad
         i2BgOm/WaUoV9qxQ3xEKYfcfwTMCYruxDCs3mxlXlRRM3rYl1RDeq9EJw/UD64jQG51e
         mq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790219892; x=1790824692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHodOW1NuMAhQ2hihU1WLFCtBxwYsw6uUKaSj/sBdIk=;
        b=xyR+fo82ka6i9exlcBxyN27B1LfUe8SPV79z9Ag0b0BD4nRd3LMGIb9E/WMWDalWUC
         S0Iw1Lw6PLRNgpw86bRYq+gwpT805w1kp0KZl8NZcDc9XW1sN2paYFEvE+ZrceyTGnJN
         /9mXBuGYETGL3p71RGYRHU44CVfpbFdwCbU1t74IbdPjDuZ9UzScqhiszYJ4sUYFdQyc
         Am3BQe4+AoP9Hbb0x2rm3btDstZPqniJWO9JqrzrmvXSTbzlEqUX4mhYll2JnbV0ZA2C
         K0/DEFMaBoIBjl1nQNjkAq3o+ludZyTPm9NAfNwNPDWPIkiAj17m76oSyo8Q2O1vcb5b
         UPvQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9CVNZCTgkrFqBZ8LvbufL9yVYwIh/lDB4mzeugPtVI/GPh/D3TUdFymnHV1KuURBs6rL+/M9PV7b0@vger.kernel.org
X-Gm-Message-State: AFuF++lwctNUI+/HP/cDdeBQEk5bUPDCgIhiSt3vm1F4+CRmwfTNaBsO
	NT9On4TPLDv05ZyhKA759htgO1BDRYNEec1VJbrLrWM/C9M346btooeL2/q+ACh+pPEjvq0ChhE
	KNQqj62dIfhkX8jGgoA5RE3nyZSyeBEt/hY/VFaHKAXul+5yn/APX/H75QUhSYORp
X-Gm-Gg: AYBFou2f62u40jJJEAwdBxqMXw0/p+5Ujys6w72+El/843u7X+n3e6BAgPsJscagrWa
	i4S5b3pybb/Cc8fSLu3H9SlhzcbnxHktSladvzokDlxkGqNP/H+2V6VN9kDHm+ZXdMcRx9v3mnI
	ddD1I1xTaL/UZZangYWPqLTJQCBSkKxsYa4MWYrhvIhbYCLe2OgzT44CPqhZSw8ntDFnx+xJcCe
	DtFdRonzgf33smrrOiKMAZZA2u5tzsKDnrJ3gOkQZzUX9qX/ZzrmWK63rpWkzh1ixddJElzDZST
	s7vM1Czr6x1sMMgd0KlYTm6Rfnc5i2OsGlGg36f651pOwDki9i2sTazOa6UiPV1a5nXGkFaOftM
	W3eE+TETerS2YUH0ZDiOsjw9sxFq55FfKUINBevWNPQ==
X-Received: by 2002:a05:7022:c4d:b0:143:8829:5fb9 with SMTP id a92af1059eb24-14503f3c3fdmr785067c88.16.1790219891758;
        Wed, 23 Sep 2026 20:18:11 -0700 (PDT)
X-Received: by 2002:a05:7022:c4d:b0:143:8829:5fb9 with SMTP id a92af1059eb24-14503f3c3fdmr785041c88.16.1790219891200;
        Wed, 23 Sep 2026 20:18:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm9861844eec.12.2026.09.23.20.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:18:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 11:18:05 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
Message-ID: <arSWbexBeEYgBY_x@QCOM-aGQu4IUr3Y>
References: <20260922065908.477523-1-shengchao.guo@oss.qualcomm.com>
 <CAMRc=MfrBwqdMnT5TynJ0NVBf3OWKF7BSGr1cy4YjyCVrZdX1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfrBwqdMnT5TynJ0NVBf3OWKF7BSGr1cy4YjyCVrZdX1A@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxNCBTYWx0ZWRfX0ueF8Fl/Tm4C
 spmHN4oYf315xITTWwoq0nKFrQnp/0GnQAwveIYeeUSW6KoBBunEvVFpDXH2IPXMTxq/jfU8fT3
 XxHDECGIPoH/2j5seGSc/VhcB0yP2qw=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab49674 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uQBmt4c_HcPZFEdrNxwA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: nedZZbI74JwYMTTXLB9fEdJT1kd9uSP2
X-Proofpoint-ORIG-GUID: nedZZbI74JwYMTTXLB9fEdJT1kd9uSP2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxNCBTYWx0ZWRfXzoyfqggBA99m
 xXvSzPl8WR3X1J5nDa0mJ4C8xguWUcfOgec2S0kUgIWxnn8A4XqYtPtnvSYeASqgUl04mHnsY+G
 W8G5hCVN4UUyqn1gQhR6OCT6ZQkK/ogpJzwLGNh5ZXxvnjmdN4nd9/tsNukxGMAGa42BKfNnJbP
 V41x+GXke34knVUV90wjxmz2ahNxk8aSXvbTaWlX0+Mg35aKcHL0EwzkVZxPYbbn/nP2OZ+53Dk
 Glpj9FTideeIYndXlAvy/4+RCPA4jJN8saR0IOeYb9fyZyOx2YXFHrroFVddRjgMmJNNp2FAtsC
 ckq10f5Xa2C0P0jaNtF5kkq3Qzk4suaA1IAzukCIbsWpRqY7biGwQ3T86Y2I2UFiyULXVaqJcYP
 MM/ZI720MiOAfF//qIFYKDizIPme4uZV6ET8vJ51kcQUAb3aTsOqjJvl7n32KbJch55mnZe45t6
 KiMOu3g32MxqgYTiZEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240014

On Wed, Sep 23, 2026 at 02:07:56AM -0700, Bartosz Golaszewski wrote:
> On Tue, 22 Sep 2026 08:59:08 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
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
> >   reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
> >   reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
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
> > Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Changes for v2:
> > - Drop GPIO shared-proxy patch
> > - Update Fixes tag (Thanks Neil!)
> > - Link to v1: https://lore.kernel.org/all/20260915014447.282121-1-shengchao.guo@oss.qualcomm.com/
> >
> >  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > index f6dc43e27b38..eb4431591331 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > @@ -741,22 +741,26 @@ static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
> >  static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
> >  {
> >  	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> > -	unsigned long config;
> > +	unsigned long configs[2];
> >
> > -	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
> > +	configs[0] = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
> > +	configs[1] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
> >
> > -	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
> > +	return pmic_gpio_config_set(state->ctrl, pin, configs,
> > +				    ARRAY_SIZE(configs));
> >  }
> >
> >  static int pmic_gpio_direction_output(struct gpio_chip *chip,
> >  				      unsigned pin, int val)
> >  {
> >  	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> > -	unsigned long config;
> > +	unsigned long configs[2];
> >
> > -	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
> > +	configs[0] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 0);
> 
> Sashiko's comment basically says that for open-drain GPIOs, if we set direction
> to output via GPIOLIB and disable the input buffer, then later call
> gpiod_get_value() on that GPIO, we'll never read what's really on the wire. Can
> we not disable the input buffer for open-drain pins?

Yes, that is the better fix -- thanks, I will do that in v3.

Shawn
